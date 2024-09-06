import 'dart:async';

import 'package:cmms/app/audit_task/audit_task_presenter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

import '../../domain/models/new_permit_list_model.dart';
import '../../domain/models/pm_task_model.dart';
import '../home/home_controller.dart';

class AuditTaskController extends GetxController {
  ///
  AuditTaskController(
    this.auditTaskPresenter,
  );
  AuditTaskPresenter auditTaskPresenter;
  final HomeController homecontroller = Get.find();

  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  RxList<PmTaskListModel?> pmTaskList = <PmTaskListModel?>[].obs;
  RxList<PmTaskListModel?> filteredData = <PmTaskListModel>[].obs;
  bool openFromDateToStartDatePicker = false;
  RxList<NewPermitModel?>? permitList = <NewPermitModel>[].obs;
  var permitDropdownValues = <String?>[].obs;

  final selectedPermit = Rx<NewPermitModel?>(null);
  Rx<int?> selectedPermitId = 0.obs;
  Rx<bool> isPermitLinked = false.obs;
  int permitValuesCount = 6;
  var permitValues;
  late List<TextEditingController> textControllers;
  RxString responseMessage = ''.obs;
  int permitscheduleId = 0;
  PmTaskListModel? pmTaskListModel;
  RxList<String> pmTaskListTableColumns = <String>[].obs;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  Rx<DateTime> fromDate = DateTime.now().subtract(Duration(days: 7)).obs;
  Rx<DateTime> toDate = DateTime.now().obs;
  String get formattedFromdate =>
      DateFormat('dd/MM/yyyy').format(fromDate.value);
  String get formattedTodate => DateFormat('dd/MM/yyyy').format(toDate.value);
  String get formattedTodate1 => DateFormat('yyyy-MM-dd').format(toDate.value);
  String get formattedFromdate1 =>
      DateFormat('yyyy-MM-dd').format(fromDate.value);
  PmTaskListModel? selectedItem;
  RxString idFilterText = ''.obs;
  RxString titleFilterText = ''.obs;
  RxString lastDoneDateFilterText = ''.obs;
  RxString dueDateFilterText = ''.obs;
  RxString doneDateFilterText = ''.obs;

  RxString frequencyFilterText = ''.obs;
  RxString assignFilterText = ''.obs;
  RxString ptwFilterText = ''.obs;

  final columnVisibility = ValueNotifier<Map<String, bool>>({
    "Task Id": true,
    "Task Title": true,
    "Last Done Date": true,
    "Due Date": true,
    "Done Date": true,
    "Order Frequency": true,
    "Assigned To": true,
    "PTW": true,
  });
  Rx<int> pmTaskId = 0.obs;

  final Map<String, double> columnwidth = {
    "Task Id": 150,
    "Task Title": 300,
    "Last Done Date": 200,
    "Due Date": 200,
    "Done Date": 200,
    "Order Frequency": 200,
    "Assigned To": 150,
    "PTW": 150,
  };
  Map<String, RxString> filterText = {};
  void setColumnVisibility(String columnName, bool isVisible) {
    final newVisibility = Map<String, bool>.from(columnVisibility.value)
      ..[columnName] = isVisible;
    columnVisibility.value = newVisibility;
    // print({"updated columnVisibility": columnVisibility});
  }

  Rx<bool> isLoading = true.obs;
  Rx<int> type = 0.obs;

  @override
  void onInit() async {
    await setType();

    this.filterText = {
      "Task Id": idFilterText,
      "Task Title": titleFilterText,
      "Last Done Date": lastDoneDateFilterText,
      "Due Date": dueDateFilterText,
      "Done Date": doneDateFilterText,
      "Order Frequency": frequencyFilterText,
      "Assigned To": assignFilterText,
      "PTW": ptwFilterText,
    };
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 2), () async {
        getAuditTaskList(facilityId, formattedTodate1, formattedFromdate1,
            false, type.value);
      });
      // isDataLoading.value = false;

      // Future.delayed(Duration(seconds: 2), () async {
      // });
    });

    super.onInit();
  }

  Future<void> setType() async {
    try {
      // Read jobId
      String? _type = await auditTaskPresenter.getValue();
      if (_type == null || _type == '' || _type == "null") {
        var dataFromPreviousScreen = Get.arguments;

        type.value = dataFromPreviousScreen['type'];
        auditTaskPresenter.saveValue(type: type.value.toString());
      } else {
        type.value = int.tryParse(_type) ?? 0;
      }
    } catch (e) {
      print(e.toString() + 'type');
      //  Utility.showDialog(e.toString() + 'type');
    }
  }

  void search(String keyword) {
    if (keyword.isEmpty) {
      pmTaskList.value = filteredData;
      return;
    }

    // pmTaskList.value = filteredData
    //     .where((item) => item!.maintenance_order_number!
    //         .toLowerCase()
    //         .contains(keyword.toLowerCase()))
    //     .toList();
  }

  void export() {
    getAuditTaskList(
        facilityId, formattedTodate1, formattedFromdate1, true, type.value,
        isExportOnly: true);
  }

  Future<void> getAuditTaskList(int facilityId, dynamic startDate,
      dynamic endDate, bool isExport, int? type,
      {bool isExportOnly = false}) async {
    if (!isExportOnly) {
      pmTaskList.value = <PmTaskListModel>[];
    }

    final _pmTaskList = await auditTaskPresenter.getAuditTaskList(
        facilityId: facilityId,
        isLoading: isLoading.value,
        isExport: isExport,
        startDate: startDate,
        endDate: endDate,
        type: type);

    if (_pmTaskList != null && !isExportOnly) {
      pmTaskList.value = _pmTaskList;
      filteredData.value = pmTaskList.value;
      isLoading.value = false;
    }
  }

  void getPmTaskListByDate() {
    getAuditTaskList(
        facilityId, formattedTodate1, formattedFromdate1, false, type.value);
  }

  void clearStoreData() {
    auditTaskPresenter.clearValue();
  }

  void clearTypeValue() async => auditTaskPresenter.clearTypeValue();
}
