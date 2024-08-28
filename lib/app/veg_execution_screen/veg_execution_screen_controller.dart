// ignore_for_file: unused_local_variable

import 'dart:async';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/utils/save_file_web.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/utils/utility.dart';
import 'package:cmms/app/veg_execution_screen/veg_execution_screen_presenter.dart';
import 'package:cmms/domain/models/close_permit_model.dart';
import 'package:cmms/domain/models/comment_model.dart';
import 'package:cmms/domain/models/employee_model.dart';
import 'package:cmms/domain/models/end_mc_execution_detail_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/job_details_model.dart';
import 'package:cmms/domain/models/pm_task_view_list_model.dart';
import 'package:cmms/domain/models/update_vegetation_execution_model.dart';
import 'package:cmms/domain/models/veg_execution_details_model.dart';
import 'package:cmms/domain/models/veg_task_equipment_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class VegExecutionController extends GetxController {
  VegExecutionController(
    this.vegExecutionPresenter,
  );
  VegExecutionPresenter vegExecutionPresenter;
  final HomeController homecontroller = Get.find();

  StreamSubscription<int>? facilityIdStreamSubscription;
  RxInt facilityId = 0.obs;
  RxInt vegexe = 0.obs;
  RxInt vegid = 0.obs;
  TextEditingController commentCtrlr = TextEditingController();
  Rx<VegExecutionDetailsModel?> vegExecutionDetailsModel =
      VegExecutionDetailsModel().obs;
  RxList<VegTaskEquipmentList?> vegTaskEquipment = <VegTaskEquipmentList>[].obs;
  Rx<List<List<Map<String, String>>>> rowItem =
      Rx<List<List<Map<String, String>>>>([]);
  Map<String, VegSchedules> dropdownMapperData = {};
  RxList<VegSchedules?>? schedules = <VegSchedules?>[].obs;
  RxList<VegSchedules?>? listSchedules = <VegSchedules?>[].obs;
  RxList<int> scheduleId = <int>[].obs;
  RxInt scheduledId = 0.obs;
  Map<String, dynamic> data = {};
  RxList<HistoryModel?>? historyList = <HistoryModel?>[].obs;
  final TextEditingController commentTextFieldCtrlr = TextEditingController();
  final TextEditingController scheduleExecutionTextFieldCtrlr =
      TextEditingController();
  TextEditingController remarkTextFieldCtrlr = TextEditingController();
  TextEditingController remarkCtrlrWeb = TextEditingController();
  Map<String, String> check = <String, String>{};
  int count = 0;
  Rx<bool> allScheduleTrue = false.obs;
  Rx<JobDetailsModel?> jobDetailsModel = JobDetailsModel().obs;
  Rx<PmtaskViewModel?> pmtaskViewModel = PmtaskViewModel().obs;

  Rx<EndMCExecutionDetailsModel?> mcExecutionDetailsModel =
      EndMCExecutionDetailsModel().obs;
  RxList<EmployeeModel?> assignedToList = <EmployeeModel>[].obs;
  Rx<String> selectedAssignedTo = ''.obs;
  Rx<bool> isAssignedToSelected = true.obs;
  int selectedAssignedToId = 0;

  @override
  void onInit() async {
    try {
      await setVegId();
      facilityIdStreamSubscription =
          homecontroller.facilityId$.listen((event) async {
        facilityId.value = event;
        await getVegExecutionDetail(
          executionId: vegexe.value,
          facilityId: facilityId.value,
        );
        await getVegTaskEquipmentList(
            executionId: vegexe.value,
            facilityId: facilityId.value,
            isLoading: true);
        await getAssignedToList();
        getHistory(facilityId.value);
      });
    } catch (e) {
      print(e);
    }
    super.onInit();
  }

  Future<void> setVegId() async {
    try {
      final _vegexe = await vegExecutionPresenter.getExecutionId();
      final _vegid = await vegExecutionPresenter.getPlanId();
      if (_vegexe == null || _vegexe == '' || _vegexe == "null") {
        var dataFromPreviousScreen = Get.arguments;
        vegid.value = dataFromPreviousScreen['vegid'];
        vegexe.value = dataFromPreviousScreen['vegexe'];
        vegExecutionPresenter.savePlanId(vegid: vegid.value.toString());
        vegExecutionPresenter.saveExecutionId(vegexe: vegexe.value.toString());
        print("Execution Id: ${vegexe.value}");
        print("Plan Id: ${vegid.value}");
      } else {
        vegexe.value = int.tryParse(_vegexe) ?? 0;
        vegid.value = int.tryParse(_vegid.toString()) ?? 0;
        print("Execution Id: ${vegexe.value}");
        print("Plan Id: ${vegid.value}");
      }
    } catch (e) {
      Utility.showDialog(e.toString(), 'vegid');
    }
  }

  Future<void> getHistory(int facilityId) async {
    int moduleType = 311;

    historyList?.value = await vegExecutionPresenter.getHistory(
          moduleType,
          vegexe.value,
          facilityId,
          true,
        ) ??
        [];
    update(["historyList"]);
  }

  Future<void> getVegExecutionDetail({
    required int executionId,
    required int facilityId,
  }) async {
    final _vegExecutionDetails =
        await vegExecutionPresenter.getVegExecutionDetail(
      executionId: executionId,
      facilityId: facilityId,
    );
    rowItem.value = [];
    if (_vegExecutionDetails != null) {
      vegExecutionDetailsModel.value = _vegExecutionDetails;
      listSchedules?.value = vegExecutionDetailsModel.value?.schedules ?? [];
      scheduleId.value =
          listSchedules!.map((element) => element?.scheduleId ?? 0).toList();
      // vegid.value = vegExecutionDetailsModel.value?.id ?? 0;
      bool allStatus383 =
          listSchedules!.every((element) => element?.status == 731);

      allScheduleTrue.value = allStatus383;
      vegExecutionDetailsModel.value?.schedules?.forEach((element) {
        rowItem.value.add([
          {"key": "Schedule Id", "value": '${element.scheduleId}'},
          {"key": "Days", "value": '${element.cleaningDay}'},
          {"key": "Scheduled Module", "value": '${element.scheduled}'},
          {"key": "Cleaned", "value": '${element.cleaned}'},
          {"key": "Abandoned", "value": '${element.abandoned}'},
          {"key": "Pending", "value": '${element.pending}'},
          {"key": "Remark", "value": '${element.remark_of_schedule}'},
          {"key": "Permit_code", "value": '${element.permit_code}'},
          {"key": "Permit_status", "value": '${element.status_short_ptw}'},
          {"key": "Status", "value": '${element.status_short}'},
          {'key': "Actions", "value": ''},
        ]);
      });
    }
  }

  Future<void> getAssignedToList() async {
    assignedToList.clear();
    final _assignedToList = await vegExecutionPresenter.getAssignedToList(
      facilityId: facilityId.value,
      featureId: UserAccessConstants.kVegetationControlFeatureId,
    );

    if (_assignedToList != null) {
      for (var assignedTo in _assignedToList) {
        assignedToList.add(assignedTo);
      }
    }
  }

  Future<void> getVegTaskEquipmentList(
      {required int executionId,
      required int facilityId,
      required bool isLoading}) async {
    final _vegTaskEquipmentList =
        await vegExecutionPresenter.getVegTaskEquipmentList(
      isLoading: isLoading,
      executionId: executionId,
      facilityId: facilityId,
    );
    if (_vegTaskEquipmentList.isNotEmpty) {
      vegTaskEquipment.value = _vegTaskEquipmentList;
      check.clear();

      for (var equipment in vegTaskEquipment) {
        for (var smb in equipment?.smbs ?? []) {
          if (smb.isAbandonSmbCheck) {
            check["${smb.smbName}"] = "abandon";
            count++;
          } else if (smb.isCleanedSmbCheck) {
            check["${smb.smbName}"] = "cleaned";
            count++;
          } else {
            print("${smb.smbName} execution remaining");
          }
        }
        if (count == 0) {
          check["${equipment?.invName}"] = "remaining";
        }
        count = 0;
      }
    }
  }

  Future<void> startVegExecutionButton() async {
    final _startVegExecutionBtn =
        await vegExecutionPresenter.startVegExecutionButton(
            executionId: vegexe.value, facilityId: facilityId.value);
  }

  Future<void> endVegExecutionButton() async {
    final _endVegExecutionBtn =
        await vegExecutionPresenter.endVegExecutionButton(
            executionId: vegexe.value, facilityId: facilityId.value);
  }

  void abandonVegExecutionButton({int? id}) async {
    {
      if (commentTextFieldCtrlr.text == '') {
        Fluttertoast.showToast(msg: "Please Enter Comment!");
        return;
      }
      String _comment = commentTextFieldCtrlr.text.trim();
      CommentModel commentAbandonModel = CommentModel(
        id: id,
        comment: _comment,
      );
      var abandoneJsonString = commentAbandonModel.toJson();
      Map<String, dynamic>? response =
          await vegExecutionPresenter.abandonVegExecutionButton(
              abandoneJsonString: abandoneJsonString,
              isLoading: true,
              facilityId: facilityId.value);
    }
  }

  Future<void> startVegExecutionScheduleButton({int? scheduleID}) async {
    final _startVegScheduleExecutionBtn =
        await vegExecutionPresenter.startVegExecutionScheduleButton(
            scheduleId: scheduleID, facilityId: facilityId.value);
  }

  Future<void> endVegScheduleExecutionButton(
      {int? scheduleID, int? ptw_id}) async {
    var _comment = remarkTextFieldCtrlr.text.trim();
    ClosePermitModel ptwClose = ClosePermitModel(
        id: ptw_id, comment: _comment, conditionIds: [1, 2, 3, 4], fileIds: []);
    var closePtwJsonString = ptwClose.toJson();

    final _endVegScheduleExecutionBtn =
        await vegExecutionPresenter.endVegScheduleExecutionButton(
            scheduleId: scheduleID,
            closePtwJsonString: closePtwJsonString,
            facilityId: facilityId.value);
  }

  void abandonVegScheduleButton({int? id}) async {
    String _comment = scheduleExecutionTextFieldCtrlr.text.trim();
    CommentModel commentAbandonScheduleModel = CommentModel(
      id: id,
      comment: _comment,
    );
    var abandoneScheduleJsonString = commentAbandonScheduleModel.toJson();
    Map<String, dynamic>? response =
        await vegExecutionPresenter.abandonVegScheduleButton(
      abandoneScheduleJsonString: abandoneScheduleJsonString,
      isLoading: true,
    );
    if (response == true) {}
  }

  void clearStoreData() {
    vegExecutionPresenter.clearExecutionId();
    vegExecutionPresenter.clearPlanId();
    clearPermitStoreData();
  }

  void updateVegScheduleExecution({
    int? scheduleId,
    int? cleaningDay,
    String? remark,
  }) async {
    {
      rowItem.value.forEach((element) {});
      print('data${rowItem.value}');
      List<int> cleanedEquipmentIds = [];
      List<int> abandonedEquipmentIds = [];
      vegTaskEquipment.forEach((e) {
        e?.smbs?.forEach((element) {
          if (element.isAbandonSmbCheck!) {
            abandonedEquipmentIds.add(element.smbId ?? 0);
          }
          if (element.isCleanedSmbCheck!) {
            cleanedEquipmentIds.add(element.smbId!);
          }
        });
      });
      print('cleaned:$cleanedEquipmentIds');

      UpdateVegExecution updateVegScheduleExecutionModel = UpdateVegExecution(
        scheduleId: scheduleId ?? 0,
        executionId: vegexe.value,
        cleaningDay: cleaningDay ?? 0,
        remark: remark == null ? "" : remark,
        cleanedEquipmentIds: cleanedEquipmentIds,
        abandonedEquipmentIds: abandonedEquipmentIds,
      );
      var updateVegJson = updateVegScheduleExecutionModel.toJson();
      Map<String, dynamic>? responseVegScheduleExecution =
          await vegExecutionPresenter.updateVegScheduleExecution(
              updateVegJson: updateVegJson,
              isLoading: true,
              facilityId: facilityId.value);
      print('Update MC Schedule Execution data: $updateVegJson');
    }
  }

  approveShecduleExecution(int id) async {
    {
      String _comment = commentCtrlr.text.trim();

      CommentModel commentModel = CommentModel(id: id, comment: _comment);

      var approvetoJsonString = commentModel.toJson();
      final response = await vegExecutionPresenter.vegapproveShecduleExecution(
          approvetoJsonString: approvetoJsonString,
          isLoading: true,
          facilityId: facilityId.value);
      if (response == true) {
        Get.offAllNamed(Routes.vegExecutionListScreen);
      }
    }
  }

  rejectShecduleExecution(int id) async {
    {
      String _comment = commentCtrlr.text.trim();

      CommentModel commentModel = CommentModel(id: id, comment: _comment);

      var rejecttoJsonString = commentModel.toJson();
      final response = await vegExecutionPresenter.vegrejectShecduleExecution(
          rejecttoJsonString: rejecttoJsonString,
          isLoading: true,
          facilityId: facilityId.value);
      if (response == true) {
        Get.offAllNamed(Routes.vegExecutionListScreen);
      }
    }
  }

  endApproveExecution(int id) async {
    {
      String _comment = commentCtrlr.text.trim();

      CommentModel commentModel = CommentModel(id: id, comment: _comment);

      var approvetoJsonString = commentModel.toJson();
      final response = await vegExecutionPresenter.endApproveExecution(
          approvetoJsonString: approvetoJsonString,
          isLoading: true,
          facilityId: facilityId.value);
      if (response == true) {
        Get.offAllNamed(Routes.vegExecutionListScreen);
      }
    }
  }

  endRejectExecution(int id) async {
    {
      String _comment = commentCtrlr.text.trim();

      CommentModel commentModel = CommentModel(id: id, comment: _comment);

      var rejecttoJsonString = commentModel.toJson();
      final response = await vegExecutionPresenter.endRejectExecution(
          rejecttoJsonString: rejecttoJsonString,
          isLoading: true,
          facilityId: facilityId.value);
      if (response == true) {
        Get.offAllNamed(Routes.vegExecutionListScreen);
      }
    }
  }

  abandonedApproveExecution(int id) async {
    {
      String _comment = commentCtrlr.text.trim();

      CommentModel commentModel = CommentModel(id: id, comment: _comment);

      var approvetoJsonString = commentModel.toJson();
      final response = await vegExecutionPresenter.abandonedApproveExecution(
          approvetoJsonString: approvetoJsonString,
          isLoading: true,
          facilityId: facilityId.value);
      if (response == true) {
        Get.offAllNamed(Routes.vegExecutionListScreen);
      }
    }
  }

  abandoneRejectExecution(int id) async {
    {
      String _comment = commentCtrlr.text.trim();

      CommentModel commentModel = CommentModel(id: id, comment: _comment);

      var rejecttoJsonString = commentModel.toJson();
      final response = await vegExecutionPresenter.abandoneRejectExecution(
          rejecttoJsonString: rejecttoJsonString,
          isLoading: true,
          facilityId: facilityId.value);
      if (response == true) {
        Get.offAllNamed(Routes.vegExecutionListScreen);
      }
    }
  }

  assignToVeg({required int id}) async {
    {
      final response = await vegExecutionPresenter.assignToVeg(
          assignId: selectedAssignedToId,
          taskId: id,
          isLoading: true,
          facilityId: facilityId.value);
    }
  }

  void clearPermitStoreData() {
    vegExecutionPresenter.clearPermitStoreData();
  }

  createNewPermit({int? scheduleID}) {
    clearStoreData();
    clearJobDetailStoreData();
    clearTypeStoreData();
    clearisCheckedtoreData();
    clearpmTaskValue();
    clearPermitStoreData();
    clearmcDetailsStoreData();
    Get.offNamed(
      Routes.createPermit,
      arguments: {
        "jobModel": jobDetailsModel.value,
        "permitId": 0,
        "isChecked": false,
        "type": 5,
        "isFromJobDetails": true,
        "pmTaskModel": pmtaskViewModel.value,
        "mcModel": mcExecutionDetailsModel.value,
        "vegModel": vegExecutionDetailsModel.value,
        "scheduleID": scheduleID
      },
    );
  }

  Future<void> editNewPermit({int? permitId, bool? isChecked}) async {
    clearStoreData();
    clearJobDetailStoreData();
    clearTypeStoreData();
    clearisCheckedtoreData();
    clearpmTaskValue();
    clearPermitStoreData();
    clearmcDetailsStoreData();
    Get.toNamed(Routes.createPermit, arguments: {
      "jobModel": jobDetailsModel.value,
      "permitId": permitId,
      "isChecked": isChecked,
      "type": 5,
      "isFromJobDetails": true,
      "pmTaskModel": pmtaskViewModel.value,
      "mcModel": mcExecutionDetailsModel.value,
      "vegModel": vegExecutionDetailsModel.value,
      "scheduleID": 0
    });
    print('PermitIDForTBt:$permitId');
    print('PermitIdArgument:$isChecked');
  }

  void clearmcDetailsStoreData() {
    vegExecutionPresenter.clearmcDetailsStoreData();
  }

  void clearJobDetailStoreData() {
    vegExecutionPresenter.clearJobDetailStoreData();
  }

  void clearTypeStoreData() {
    vegExecutionPresenter.clearTypeValue();
  }

  void clearisCheckedtoreData() {
    vegExecutionPresenter.clearisCheckedValue();
  }

  void clearpmTaskValue() {
    vegExecutionPresenter.clearpmTaskValue();
  }

  Future<void> viewNewPermitList({
    int? permitId,
    int? jobId,
  }) async {
    Get.toNamed(Routes.viewPermitScreen, arguments: {
      "permitId": permitId,
      "jobId": jobId,
      "type": 5,
    });
  }

  void onValueChanged(dynamic list, dynamic value) {
    print('Valuesd:${value}');
    switch (list.runtimeType) {
      case const (RxList<EmployeeModel>):
        {
          int assignedToIndex =
              assignedToList.indexWhere((x) => x?.name == value);
          selectedAssignedToId = assignedToList[assignedToIndex]?.id ?? 0;
          if (selectedAssignedToId != 0) {
            isAssignedToSelected.value = true;
          }
          selectedAssignedTo.value = value;
        }
        break;
      default:
        {}
        break;
    }
  }

  Future<void> generateInvoice() async {
    try {
      final PdfDocument document = PdfDocument();

      final PdfPage page = document.pages.add();

      final Size pageSize = page.getClientSize();

      var url = "assets/assets/files/HFE Logo.png";
      var response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        var data = response.bodyBytes;

        PdfBitmap image = PdfBitmap(data);

        final PdfLayoutResult result =
            drawHeader(page, pageSize, document, image);

        final List<int> bytes = await document.save();

        document.dispose();

        await saveAndLaunchFile(bytes, 'Veg Task Report.pdf');
      } else {
        print("Error fetching the image: ${response.statusCode}");
      }
    } catch (e) {
      print("Error generating invoice: $e");
    }
  }

  PdfLayoutResult drawHeader(
    PdfPage page,
    Size pageSize,
    PdfDocument document,
    PdfBitmap image,
  ) {
    final PdfPen borderPen = PdfPen(PdfColor(142, 180, 219), width: 1.0);
    final PdfBrush backgroundBrush = PdfSolidBrush(PdfColor(217, 226, 243));
    final PdfFont headerFont =
        PdfStandardFont(PdfFontFamily.helvetica, 10, style: PdfFontStyle.bold);
    final PdfFont contentFont = PdfStandardFont(PdfFontFamily.helvetica, 9);

    double margin = 10; // Margin from all sides
    double currentY =
        100; // Start position for the first section below the image
    double sectionHeight = 20; // Height for each section header
    double pageWidth = pageSize.width - 2 * margin;

    // Draw image
    page.graphics.drawImage(image, Rect.fromLTWH(margin, 10, 100, 80));

    final String centerText = 'Veg Task Report';
    final PdfFont centerTextFont =
        PdfStandardFont(PdfFontFamily.helvetica, 12, style: PdfFontStyle.bold);
    final Size centerTextSize = centerTextFont.measureString(centerText);

    // Calculate the X position to center the text
    double centerX = (pageSize.width - centerTextSize.width) / 2;

    // Draw the center text after the image
    page.graphics.drawString(
      centerText,
      centerTextFont,
      bounds: Rect.fromLTWH(
          centerX, 60, centerTextSize.width, centerTextSize.height),
    );

    // Site name section
    page.graphics.drawRectangle(
        pen: borderPen,
        bounds: Rect.fromLTWH(margin, currentY, pageWidth, sectionHeight));
    page.graphics.drawString(
        'Site name : ${mcExecutionDetailsModel.value?.site_name ?? ''}',
        headerFont,
        bounds: Rect.fromLTWH(margin + 5, currentY + 5, 0, 0));
    currentY += sectionHeight;

    // MC Information section
    page.graphics.drawRectangle(
        pen: borderPen,
        brush: backgroundBrush,
        bounds: Rect.fromLTWH(margin, currentY, pageWidth, sectionHeight));
    page.graphics.drawString('MC Information', headerFont,
        bounds: Rect.fromLTWH(margin + 5, currentY + 5, 0, 0));
    currentY += sectionHeight;

    // Draw MC Information Details (Left Side)
    double labelWidth = 80;
    double valueWidth = 120;
    double labelX = margin + 5;
    double valueX = labelX + labelWidth + 5;

    List<String> mcInfoLabelsLeft = [
      'Plan ID',
      'Task ID',
      'Plan Title',
      'Frequency',
    ];

    List<String> mcInfoValuesLeft = [
      'VCP${vegid}',
      'VET${vegExecutionDetailsModel.value?.executionId}',
      '${vegExecutionDetailsModel.value?.title ?? ''}',
      '${vegExecutionDetailsModel.value?.frequency ?? ''}',
    ];

    double rowHeight = 15;

    for (int i = 0; i < mcInfoLabelsLeft.length; i++) {
      page.graphics.drawString(mcInfoLabelsLeft[i], contentFont,
          bounds: Rect.fromLTWH(labelX, currentY + 5, labelWidth, rowHeight));
      page.graphics.drawString(mcInfoValuesLeft[i], contentFont,
          bounds: Rect.fromLTWH(valueX, currentY + 5, valueWidth, rowHeight));
      currentY += rowHeight;
    }

    // Draw MC Information Details (Right Side)
    double labelWidthRight = 80;
    double valueWidthRight = 120;
    double labelXRight = pageWidth / 2 + margin; // Position on the right side
    double valueXRight = labelXRight + labelWidthRight + 5;

    List<String> mcInfoLabelsRight = [
      'Planned By',
      'Start Date Time',
      'Planning Date Time',
      'Execution started by'
    ];
    List<String> mcInfoValuesRight = [
      '${vegExecutionDetailsModel.value?.plannedBy}',
      '${vegExecutionDetailsModel.value?.status != 360 ? vegExecutionDetailsModel.value?.startDate : ''}',
      '${vegExecutionDetailsModel.value?.plannedAt}',
      '${vegExecutionDetailsModel.value?.startedBy ?? ''}',
    ];

    currentY -= mcInfoLabelsLeft.length *
        rowHeight; // Reset currentY to align with left side

    for (int i = 0; i < mcInfoLabelsRight.length; i++) {
      page.graphics.drawString(mcInfoLabelsRight[i], contentFont,
          bounds: Rect.fromLTWH(
              labelXRight, currentY + 5, labelWidthRight, rowHeight));
      page.graphics.drawString(mcInfoValuesRight[i], contentFont,
          bounds: Rect.fromLTWH(
              valueXRight, currentY + 5, valueWidthRight, rowHeight));
      currentY += rowHeight;
    }

    // Add "Schedule Execution" header before the table
    currentY += 15;
    double tableWidth =
        pageWidth; // Ensure the header width matches the table width
    page.graphics.drawRectangle(
        pen: borderPen,
        bounds: Rect.fromLTWH(margin, currentY, tableWidth, sectionHeight));
    page.graphics.drawString('Schedule Execution', headerFont,
        bounds: Rect.fromLTWH(margin + 5, currentY + 5, 0, 0));

    currentY += sectionHeight;

    // Calculate column widths proportionally
    double totalColWidth = pageWidth - 2 * margin;
    double colWidthSchId = totalColWidth * 0.06;
    double colWidthDays = totalColWidth * 0.06;
    double colWidthScheduled = totalColWidth * 0.12;
    double colWidthCleaned = totalColWidth * 0.10;
    double colWidthAbandoned = totalColWidth * 0.12;
    double colWidthPending = totalColWidth * 0.10;
    double colWidthWaterUsed = totalColWidth * 0.00;
    double colWidthPermitID = totalColWidth * 0.12;
    double colWidthPermitStatus = totalColWidth * 0.12;
    double colWidthStatus = totalColWidth * 0.15;

    // Draw table header
    page.graphics.drawRectangle(
        pen: borderPen,
        brush: backgroundBrush,
        bounds: Rect.fromLTWH(margin, currentY, tableWidth, 25));
    page.graphics.drawString('Id', headerFont,
        bounds: Rect.fromLTWH(margin, currentY, colWidthSchId, 25),
        format: PdfStringFormat(
            alignment: PdfTextAlignment.center,
            lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString('Days', headerFont,
        bounds:
            Rect.fromLTWH(margin + colWidthSchId, currentY, colWidthDays, 25),
        format: PdfStringFormat(
            alignment: PdfTextAlignment.center,
            lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString('Scheduled', headerFont,
        bounds: Rect.fromLTWH(margin + colWidthSchId + colWidthDays, currentY,
            colWidthScheduled, 25),
        format: PdfStringFormat(
            alignment: PdfTextAlignment.center,
            lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString('Cleaned', headerFont,
        bounds: Rect.fromLTWH(
            margin + colWidthSchId + colWidthDays + colWidthScheduled,
            currentY,
            colWidthCleaned,
            25),
        format: PdfStringFormat(
            alignment: PdfTextAlignment.center,
            lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString('Abandoned', headerFont,
        bounds: Rect.fromLTWH(
            margin +
                colWidthSchId +
                colWidthDays +
                colWidthScheduled +
                colWidthCleaned,
            currentY,
            colWidthAbandoned,
            25),
        format: PdfStringFormat(
            alignment: PdfTextAlignment.center,
            lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString('Pending', headerFont,
        bounds: Rect.fromLTWH(
            margin +
                colWidthSchId +
                colWidthDays +
                colWidthScheduled +
                colWidthCleaned +
                colWidthAbandoned,
            currentY,
            colWidthPending,
            25),
        format: PdfStringFormat(
            alignment: PdfTextAlignment.center,
            lineAlignment: PdfVerticalAlignment.middle));

    ;
    page.graphics.drawString('Permit ID', headerFont,
        bounds: Rect.fromLTWH(
            margin +
                colWidthSchId +
                colWidthDays +
                colWidthScheduled +
                colWidthCleaned +
                colWidthAbandoned +
                colWidthPending +
                colWidthWaterUsed,
            currentY,
            colWidthPermitID,
            25),
        format: PdfStringFormat(
            alignment: PdfTextAlignment.center,
            lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString('Permit Status', headerFont,
        bounds: Rect.fromLTWH(
            margin +
                colWidthSchId +
                colWidthDays +
                colWidthScheduled +
                colWidthCleaned +
                colWidthAbandoned +
                colWidthPending +
                colWidthWaterUsed +
                colWidthPermitID,
            currentY,
            colWidthPermitStatus,
            25),
        format: PdfStringFormat(
            alignment: PdfTextAlignment.center,
            lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString('Status', headerFont,
        bounds: Rect.fromLTWH(
            margin +
                colWidthSchId +
                colWidthDays +
                colWidthScheduled +
                colWidthCleaned +
                colWidthAbandoned +
                colWidthPending +
                colWidthWaterUsed +
                colWidthPermitID +
                colWidthPermitStatus,
            currentY,
            colWidthStatus,
            25),
        format: PdfStringFormat(
            alignment: PdfTextAlignment.center,
            lineAlignment: PdfVerticalAlignment.middle));

    currentY += 25;

    // Draw table rows
    for (var schedule in vegExecutionDetailsModel.value?.schedules ?? []) {
      page.graphics.drawRectangle(
          pen: borderPen,
          bounds: Rect.fromLTWH(margin, currentY, tableWidth, 25));
      page.graphics.drawString('${schedule.scheduleId}', contentFont,
          bounds: Rect.fromLTWH(margin, currentY, colWidthSchId, 25),
          format: PdfStringFormat(
              alignment: PdfTextAlignment.center,
              lineAlignment: PdfVerticalAlignment.middle));
      page.graphics.drawString('${schedule.cleaningDay}', contentFont,
          bounds:
              Rect.fromLTWH(margin + colWidthSchId, currentY, colWidthDays, 25),
          format: PdfStringFormat(
              alignment: PdfTextAlignment.center,
              lineAlignment: PdfVerticalAlignment.middle));
      page.graphics.drawString('${schedule.scheduled}', contentFont,
          bounds: Rect.fromLTWH(margin + colWidthSchId + colWidthDays, currentY,
              colWidthScheduled, 25),
          format: PdfStringFormat(
              alignment: PdfTextAlignment.center,
              lineAlignment: PdfVerticalAlignment.middle));
      page.graphics.drawString('${schedule.cleaned}', contentFont,
          bounds: Rect.fromLTWH(
              margin + colWidthSchId + colWidthDays + colWidthScheduled,
              currentY,
              colWidthCleaned,
              25),
          format: PdfStringFormat(
              alignment: PdfTextAlignment.center,
              lineAlignment: PdfVerticalAlignment.middle));
      page.graphics.drawString('${schedule.abandoned}', contentFont,
          bounds: Rect.fromLTWH(
              margin +
                  colWidthSchId +
                  colWidthDays +
                  colWidthScheduled +
                  colWidthCleaned,
              currentY,
              colWidthAbandoned,
              25),
          format: PdfStringFormat(
              alignment: PdfTextAlignment.center,
              lineAlignment: PdfVerticalAlignment.middle));
      page.graphics.drawString('${schedule.pending}', contentFont,
          bounds: Rect.fromLTWH(
              margin +
                  colWidthSchId +
                  colWidthDays +
                  colWidthScheduled +
                  colWidthCleaned +
                  colWidthAbandoned,
              currentY,
              colWidthPending,
              25),
          format: PdfStringFormat(
              alignment: PdfTextAlignment.center,
              lineAlignment: PdfVerticalAlignment.middle));

      page.graphics.drawString(
          'PTW${schedule.permit_id}', contentFont, // New Permit ID column
          bounds: Rect.fromLTWH(
              margin +
                  colWidthSchId +
                  colWidthDays +
                  colWidthScheduled +
                  colWidthCleaned +
                  colWidthAbandoned +
                  colWidthPending +
                  colWidthWaterUsed,
              currentY,
              colWidthPermitID,
              25),
          format: PdfStringFormat(
              alignment: PdfTextAlignment.center,
              lineAlignment: PdfVerticalAlignment.middle));
      page.graphics.drawString('${schedule.status_short_ptw}', contentFont,
          bounds: Rect.fromLTWH(
              margin +
                  colWidthSchId +
                  colWidthDays +
                  colWidthScheduled +
                  colWidthCleaned +
                  colWidthAbandoned +
                  colWidthPending +
                  colWidthWaterUsed +
                  colWidthPermitID,
              currentY,
              colWidthPermitStatus,
              25),
          format: PdfStringFormat(
              alignment: PdfTextAlignment.center,
              lineAlignment: PdfVerticalAlignment.middle));
      page.graphics.drawString('${schedule.status_short}', contentFont,
          bounds: Rect.fromLTWH(
              margin +
                  colWidthSchId +
                  colWidthDays +
                  colWidthScheduled +
                  colWidthCleaned +
                  colWidthAbandoned +
                  colWidthPending +
                  colWidthWaterUsed +
                  colWidthPermitID +
                  colWidthPermitStatus,
              currentY,
              colWidthStatus,
              25),
          format: PdfStringFormat(
              alignment: PdfTextAlignment.center,
              lineAlignment: PdfVerticalAlignment.middle));
      currentY += 25;
    }

    // MC History Section
    currentY += rowHeight * 2;

    double pageHeight = pageSize.height;
    double columnWidth = pageWidth / 4;

    page.graphics.drawRectangle(
        pen: borderPen,
        brush: backgroundBrush,
        bounds: Rect.fromLTWH(margin, currentY, pageWidth, sectionHeight));
    page.graphics.drawString('MC History', headerFont,
        bounds: Rect.fromLTWH(margin + 5, currentY + 5, 0, 0));
    currentY += sectionHeight;

    List<String> historyHeaders = [
      'Time Stamp',
      'Posted By',
      'Comments',
      'Status'
    ];

    for (int i = 0; i < historyHeaders.length; i++) {
      page.graphics.drawString(historyHeaders[i], contentFont,
          bounds: Rect.fromLTWH(margin + (i * columnWidth), currentY + 5,
              columnWidth, rowHeight));
    }

    currentY += rowHeight;

    for (var history in historyList!.value) {
      // Check if we need to add a new page
      if (currentY + rowHeight > pageHeight - margin) {
        // Add a new page and reset the currentY
        page = document.pages.add();
        currentY = margin; // Reset Y position for the new page

        // Re-draw the "PM History" header on the new page
        page.graphics.drawRectangle(
            pen: borderPen,
            brush: backgroundBrush,
            bounds: Rect.fromLTWH(margin, currentY, pageWidth, sectionHeight));
        page.graphics.drawString('MC History', headerFont,
            bounds: Rect.fromLTWH(margin + 5, currentY + 5, 0, 0));
        currentY += sectionHeight;

        // Draw column headers for "PM History"
        for (int i = 0; i < historyHeaders.length; i++) {
          page.graphics.drawString(historyHeaders[i], contentFont,
              bounds: Rect.fromLTWH(margin + (i * columnWidth), currentY + 5,
                  columnWidth, rowHeight));
        }

        currentY += rowHeight; // Move down after drawing headers
      }

      // Render the history items
      if (history != null) {
        String timeStamp = history.createdAt?.result != null
            ? history.createdAt!.result
                .toString()
                .substring(0, 16)
                .replaceFirst('T', ' ')
            : 'N/A';
        String postedBy = history.createdByName ?? 'Unknown';
        String comments = history.comment ?? 'No comments';
        String status = history.status_name ?? 'Unknown status';

        page.graphics.drawString(timeStamp, contentFont,
            bounds:
                Rect.fromLTWH(margin, currentY + 5, columnWidth, rowHeight));
        page.graphics.drawString(postedBy, contentFont,
            bounds: Rect.fromLTWH(
                margin + columnWidth, currentY + 5, columnWidth, rowHeight));
        page.graphics.drawString(comments, contentFont,
            bounds: Rect.fromLTWH(margin + 2 * columnWidth, currentY + 5,
                columnWidth, rowHeight));
        page.graphics.drawString(status, contentFont,
            bounds: Rect.fromLTWH(margin + 3 * columnWidth, currentY + 5,
                columnWidth, rowHeight));

        currentY += rowHeight;
      }
    }

    final String signatureText = 'Signature';
    final Size signatureSize = contentFont.measureString(signatureText);
    return PdfTextElement(text: signatureText, font: contentFont).draw(
        page: page,
        bounds: Rect.fromLTWH(pageWidth - (signatureSize.width + margin),
            currentY + 20, signatureSize.width, signatureSize.height))!;
  }
}
