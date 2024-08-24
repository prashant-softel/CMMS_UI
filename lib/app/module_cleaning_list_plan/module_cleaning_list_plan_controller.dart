import 'dart:async';

import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/module_cleaning_list_plan/module_cleaning_list_plan_presenter.dart';
import 'package:cmms/domain/models/module_cleaning_list_plan_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class ModuleCleaningListPlanController extends GetxController {
  ModuleCleaningListPlanController(
    this.moduleCleaningListPlanPresenter,
  );
  ModuleCleaningListPlanPresenter moduleCleaningListPlanPresenter;
  final HomeController homecontroller = Get.find();
  RxList<ModuleCleaningListPlanModel> moduleCleaningListPlan =
      <ModuleCleaningListPlanModel>[].obs;
  RxList<ModuleCleaningListPlanModel> filteredData =
      <ModuleCleaningListPlanModel>[].obs;
  // Rx<int> Plan Id = 0.obs;
  Rx<int> PlanId = 0.obs;
  RxString planIdFilterText = ''.obs;
  RxString planTitleFilterText = ''.obs;
  RxString noOfDaysFilterText = ''.obs;
  RxString createdByFilterText = ''.obs;
  RxString frequencyFilterText = ''.obs;
  RxString statusFilterText = ''.obs;

  //Start DateTime
  bool openStartDatePicker = false;
  var startDateTimeCtrlr = TextEditingController();

  Rx<DateTime> fromDate = DateTime.now().subtract(Duration(days: 7)).obs;
  Rx<DateTime> toDate = DateTime.now().obs;
  final columnVisibility = ValueNotifier<Map<String, bool>>({
    'Plan Id': true,
    'Plan Title': true,
    'No of Days': true,
    'Created By': true,
    'Frequency': true,

    // "search": true,
  });
  final Map<String, double> columnwidth = {
    'Plan Id': 153,
    'Plan Title': 320,
    'No of Days': 220,
    'Created By': 200,
    'Frequency': 250,
  };
  Map<String, RxString> filterText = {};
  void setColumnVisibility(String columnName, bool isVisible) {
    final newVisibility = Map<String, bool>.from(columnVisibility.value)
      ..[columnName] = isVisible;
    columnVisibility.value = newVisibility;
    print({"updated columnVisibility": columnVisibility});
  }

  // String get formattedFromdate =>
  //     DateFormat('dd/MM/yyyy').format(fromDate.value);
  // String get formattedTodate => DateFormat('dd/MM/yyyy').format(toDate.value);
  // String get formattedTodate1 => DateFormat('yyyy-MM-dd').format(toDate.value);
  // String get formattedFromdate1 =>
  //     DateFormat('yyyy-MM-dd').format(fromDate.value);

  ModuleCleaningListPlanModel? moduleCleaningListModel;
  RxList<String> moduleCleaningListTableColumns = <String>[].obs;
  bool openFromDateToStartDatePicker = false;

  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;

  Rx<bool> isLoading = true.obs;
  @override
  void onInit() async {
    this.filterText = {
      'Plan Id': planIdFilterText,
      'Plan Title': planTitleFilterText,
      'No of Days': noOfDaysFilterText,
      'Created By': createdByFilterText,
      'Frequency': frequencyFilterText,
      "Status": statusFilterText,
    };
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 2), () async {
        getModuleCleaningListPlan(facilityId, false);
      });
    });
    super.onInit();
  }

  Future<void> getModuleCleaningListPlan(int facilityId, bool isExport) async {
    moduleCleaningListPlan.value = <ModuleCleaningListPlanModel>[];
    filteredData.value = <ModuleCleaningListPlanModel>[];

    final _moduleCleaningListPlan =
        await moduleCleaningListPlanPresenter.getModuleCleaningListPlan(
            isLoading: isLoading.value,
            facility_id: facilityId,
            isExport: isExport);
    moduleCleaningListPlan.value = _moduleCleaningListPlan;
    isLoading.value = false; 
  paginationController = PaginationController(
    rowCount: moduleCleaningListPlan.length,
    rowsPerPage: 10,
  );

  if (moduleCleaningListPlan.isNotEmpty) {
    filteredData.value = moduleCleaningListPlan.value;

    moduleCleaningListModel = moduleCleaningListPlan[0];
    var newPermitListJson = moduleCleaningListModel?.toJson();
    moduleCleaningListTableColumns.value = <String>[];
    for (var key in newPermitListJson?.keys.toList() ?? []) {
      moduleCleaningListTableColumns.add(key);
    }
  }
    }

  void mcPlanListByDate() {
    getModuleCleaningListPlan(facilityId, false);
  }

  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {}
  }

  void search(String keyword) {
    print('Keyword: $keyword');
    if (keyword.isEmpty) {
      moduleCleaningListPlan.value = filteredData.value;
      return;
    }
    List<ModuleCleaningListPlanModel> filteredList = filteredData
        .where((item) =>
            (item.title
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.noOfCleaningDays
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.createdBy
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.frequency
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.planId
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false))
        .toList();
    moduleCleaningListPlan.value = filteredList;
  }

  void clearStoreDataMcid() {
    moduleCleaningListPlanPresenter.clearValueMcId();
  }

  void clearStoreDataPlanid() {
    moduleCleaningListPlanPresenter.clearValuePlanId();
  }

  void clearStoreData() {
    clearStoreDataMcid();
    clearStoreDataPlanid();
  }

  void export() {
    getModuleCleaningListPlan(facilityId, true);
  }
}
