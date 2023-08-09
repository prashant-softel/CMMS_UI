import 'package:cmms/app/pm_task_view/pm_task_view_presenter.dart';
import 'package:cmms/app/pm_task_view/view/permit_list_table.dart';
import 'package:cmms/app/utils/utility.dart';
import 'package:cmms/domain/models/new_permit_list_model.dart';
import 'package:cmms/domain/models/pm_task_view_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

import 'dart:ui';

import 'package:flutter/rendering.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'package:printing/printing.dart';

class PreventiveMaintenanceTaskViewController extends GetxController {
  ///
  PreventiveMaintenanceTaskViewController(
    this.preventiveMaintenanceTaskViewPresenter,
  );
  PreventiveMaintenanceTaskViewPresenter preventiveMaintenanceTaskViewPresenter;
  Rx<int> scheduleId = 0.obs;
  Rx<PmtaskViewModel?> pmtaskViewModel = PmtaskViewModel().obs;
  RxList<ScheduleCheckPoint?>? scheduleCheckPoint = <ScheduleCheckPoint?>[].obs;
  ScheduleCheckPoint? scheduleCheckPointModel;
  PaginationController schedulePaginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  RxList<String> scheduleCheckPointTableColumns = <String>[].obs;
  RxList<HistoryLog?>? historyLog = <HistoryLog?>[].obs;
  HistoryLog? historyLogModel;
  final GlobalKey<State<StatefulWidget>> printKey = GlobalKey();
  RxList<NewPermitModel?>? permitList = <NewPermitModel>[].obs;
  var permitDropdownValues = <String?>[].obs;

  final selectedPermit = Rx<NewPermitModel?>(null);
  Rx<int?> selectedPermitId = 0.obs;
  Rx<bool> isPermitLinked = false.obs;
  int permitValuesCount = 6;
  var permitValues;
  late List<TextEditingController> textControllers;
  RxString responseMessage = ''.obs;

  @override
  void onInit() async {
    try {
      await setScheduleId();

      if (scheduleId != 0) {
        await getPmtaskViewList(scheduleId: scheduleId.value, isloading: true);
      }
      textControllers =
          List.generate(permitValuesCount, (_) => TextEditingController());
      permitValues = RxList<String>.filled(permitValuesCount, '');

      super.onInit();
    } catch (e) {
      print(e);
    }
  }

  Future<void> setScheduleId() async {
    try {
      final _flutterSecureStorage = const FlutterSecureStorage();
      // Read jobId
      String? _scheduleId = await _flutterSecureStorage.read(key: "scheduleId");
      if (_scheduleId == null || _scheduleId == '' || _scheduleId == "null") {
        var dataFromPreviousScreen = Get.arguments;

        scheduleId.value = dataFromPreviousScreen['scheduleId'];
        await _flutterSecureStorage.write(
          key: "scheduleId",
          value: scheduleId.value == null ? '' : scheduleId.value.toString(),
        );
      } else {
        scheduleId.value = int.tryParse(_scheduleId) ?? 0;
      }
      //  await _flutterSecureStorage.delete(key: "scheduleId");
    } catch (e) {
      Utility.showDialog(e.toString() + 'scheduleId');
    }
  }

  Future<void> getPmtaskViewList({int? scheduleId, bool? isloading}) async {
//scheduleId = 5326;
    final _permitDetails = await preventiveMaintenanceTaskViewPresenter
        .getPmtaskViewList(scheduleId: scheduleId, isloading: isloading);
    if (_permitDetails != null) {
      pmtaskViewModel.value = _permitDetails;
      scheduleCheckPoint!.value = _permitDetails.schedule_check_points ?? [];
      historyLog!.value = _permitDetails.history_log ?? [];

      schedulePaginationController = PaginationController(
        rowCount: scheduleCheckPoint?.length ?? 0,
        rowsPerPage: 10,
      );
      if (scheduleCheckPoint != null && scheduleCheckPoint!.isNotEmpty) {
        scheduleCheckPointModel = scheduleCheckPoint![0];
        var scheduleCheckPointJson = scheduleCheckPointModel?.toJson();
        scheduleCheckPointTableColumns.value = <String>[];
        for (var key in scheduleCheckPointJson?.keys.toList() ?? []) {
          scheduleCheckPointTableColumns.add(key);
        }
      }
    }
  }

  Future<void> printScreen() async {
    try {
      final RenderRepaintBoundary boundary =
          printKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      final imageBytes = await boundary
          .toImage(pixelRatio: 3.0)
          .then((image) => image.toByteData(format: ImageByteFormat.png));

      if (imageBytes != null) {
        Printing.layoutPdf(onLayout: (PdfPageFormat format) async {
          final doc = pw.Document();
          doc.addPage(
            pw.Page(
              build: (pw.Context context) {
                return pw.Image(
                    pw.MemoryImage(imageBytes.buffer.asUint8List()));
              },
            ),
          );
          return doc.save();
        });
      }
    } catch (e) {
      print('Error printing: $e');
    }
  }

  void showPermitsDialog() {
    getPermitList();
    showAlertDialog();
  }

  static void showAlertDialog({
    int? jobId,
    String? message,
    String? title,
    Function()? onPress,
  }) async {
    await Get.dialog<void>(SchedulePermitListTableDialog());
  }

  Future<List<NewPermitModel?>?> getPermitList() async {
    permitList?.value = <NewPermitModel>[];

    // facilityId = jobDetailsModel.value?.facilityId ?? 0;
    final _permitList =
        await preventiveMaintenanceTaskViewPresenter.getPermitList(
            facilityId: pmtaskViewModel.value?.facility_id,
            selfView: false,
            isLoading: false);
    if (_permitList != null) {
      permitList?.value = _permitList;
    }
    return _permitList;
  }

  onPermitSelected(NewPermitModel? newPermitModel) {
    if (newPermitModel != null) {
      selectedPermit.value = newPermitModel;
      // Get the selected permitId
      selectedPermitId.value = newPermitModel.permitId;
      // convert status to string
      final _status =
          PermitStatusData.getStatusStringFromInt(newPermitModel.ptwStatus);
      // Set the values of the permitValues list based on the selected permit
      permitValues[0] = newPermitModel.permitSiteNo.toString();
      permitValues[1] = newPermitModel.permitId.toString();
      permitValues[2] = newPermitModel.permitTypeName ?? '';
      permitValues[3] = newPermitModel.requestByName ?? '';
      permitValues[4] = _status;
      permitValues[5] = DateFormat('yyyy-MM-dd').format(
          newPermitModel.requestDatetime ??
              DateTime.now()); // Format date as needed
    } else {
      permitValues.fillRange(0, permitValuesCount,
          ''); // Clear the values if no permit is selected
    }
  }

  void linkToPermit() async {
    Map<String, dynamic>? responseMapPermitLinked =
        await preventiveMaintenanceTaskViewPresenter.scheduleLinkToPermit(
      permitId: selectedPermitId.value,
      scheduleId: scheduleId.value,
      isLoading: false,
    );
    if (responseMapPermitLinked != null && responseMapPermitLinked.length > 0) {
      // var _jobId = responseMapPermitLinked["id"][0];
      responseMessage.value = responseMapPermitLinked["message"];
      isPermitLinked.value = true;
    }
  }

  void setPmTask() async {
    Map<String, dynamic>? responseMapStart =
        await preventiveMaintenanceTaskViewPresenter.setPmTask(
      scheduleId: scheduleId.value,
      isLoading: false,
    );
    if (responseMapStart != null && responseMapStart.length > 0) {
      getPmtaskViewList(scheduleId: scheduleId.value, isloading: true);
      responseMessage.value = responseMapStart["message"];
      isPermitLinked.value = true;
    }
  }
}
