import 'dart:async';

import 'package:cmms/app/preventive_maintenance_task/preventive_maintenance_task_presenter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

import '../../domain/models/new_permit_list_model.dart';
import '../../domain/models/pm_task_model.dart';
import '../home/home_controller.dart';

class PreventiveMaintenanceTaskController extends GetxController {
  ///
  PreventiveMaintenanceTaskController(
    this.preventiveMaintenanceTaskPresenter,
  );
  PreventiveMaintenanceTaskPresenter preventiveMaintenanceTaskPresenter;
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
    "PM Plan Id": true,
    "PM Plan Title": true,
    "Last Done Date": true,
    "Due Date": true,
    "Done Date": true,
    "Order Frequency": true,
    "Assigned To": true,
    "PTW": true,
  });
  Rx<int> pmTaskId = 0.obs;

  final Map<String, double> columnwidth = {
    "PM Plan Id": 150,
    "PM Plan Title": 300,
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

  @override
  void onInit() async {
    this.filterText = {
      "PM Plan Id": idFilterText,
      "PM Plan Title": titleFilterText,
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
        getPmTaskList(facilityId, formattedTodate1, formattedFromdate1, false);
      });
      // isDataLoading.value = false;

      // Future.delayed(Duration(seconds: 2), () async {
      // });
    });

    super.onInit();
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

  Future<void> getPmTaskList(int facilityId, dynamic startDate, dynamic endDate,
      bool isLoading) async {
    pmTaskList.value = <PmTaskListModel>[];
    // pmTaskList?.clear();
    final _pmTaskList = await preventiveMaintenanceTaskPresenter.getPmTaskList(
        facilityId: facilityId,
        isLoading: isLoading,
        startDate: startDate,
        endDate: endDate);
    if (_pmTaskList != null) {
      pmTaskList.value = _pmTaskList;
      filteredData.value = pmTaskList.value;
    }
  }

  void getPmTaskListByDate() {
    getPmTaskList(facilityId, formattedTodate1, formattedFromdate1, false);
  }

  void clearStoreData() {
    preventiveMaintenanceTaskPresenter.clearValue();
  }
}
