import 'dart:async';

import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/module_cleaning_list_plan/module_cleaning_list_plan_presenter.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/domain/models/module_cleaning_list_plan_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class ModuleCleaningListPlanController extends GetxController {
  ModuleCleaningListPlanController(this.moduleCleaningListPlanPresenter);
  ModuleCleaningListPlanPresenter moduleCleaningListPlanPresenter;
  final HomeController homecontroller = Get.find();
  RxList<ModuleCleaningListPlanModel> moduleCleaningListPlan =
      <ModuleCleaningListPlanModel>[].obs;
  RxList<ModuleCleaningListPlanModel> filteredData =
      <ModuleCleaningListPlanModel>[].obs;
  Rx<int> PlanId = 0.obs;
  RxString planIdFilterText = ''.obs;
  RxString planTitleFilterText = ''.obs;
  RxString noOfDaysFilterText = ''.obs;
  RxString createdByFilterText = ''.obs;
  RxString frequencyFilterText = ''.obs;
  RxString statusFilterText = ''.obs;

  // For sorting
  RxString currentSortColumn = ''.obs;
  RxBool isAscending = true.obs;

  // Start DateTime
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
  }

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
        getModuleCleaningListPlan(facilityId, false,false);
      });
    });
    super.onInit();
  }

  void export() {
    getModuleCleaningListPlan(facilityId, true,true, isExportOnly: true);
  }

  Future<void> getModuleCleaningListPlan(int facilityId, bool isExport,bool self_view,
      {bool isExportOnly = false}) async {
    if (!isExportOnly) {
      moduleCleaningListPlan.value = <ModuleCleaningListPlanModel>[];
      filteredData.value = <ModuleCleaningListPlanModel>[];
    }

       bool selfview = varUserAccessModel.value.access_list!
            .where((e) =>
                e.feature_id == UserAccessConstants.kModuleCleaningplanFeatureId &&
                e.selfView == UserAccessConstants.kHaveSelfViewAccess)
            .length >
        0;

    final _moduleCleaningListPlan =
        await moduleCleaningListPlanPresenter.getModuleCleaningListPlan(
            isLoading: isLoading.value,
            facility_id: facilityId,
             self_view: selfview,
            isExport: isExport);

    if (!isExportOnly) {
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
  }

  void mcPlanListByDate() {
    getModuleCleaningListPlan(facilityId, false,false);
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

  void sortData(String columnName) {
    if (currentSortColumn.value == columnName) {
      isAscending.value = !isAscending.value;
    } else {
      currentSortColumn.value = columnName;
      isAscending.value = true;
    }

    switch (columnName) {
      case 'Plan Id':
        moduleCleaningListPlan.sort((a, b) => isAscending.value
            ? a.planId!.compareTo(b.planId!)
            : b.planId!.compareTo(a.planId!));
        break;
      case 'Plan Title':
        moduleCleaningListPlan.sort((a, b) => isAscending.value
            ? a.title!.compareTo(b.title!)
            : b.title!.compareTo(a.title!));
        break;
      case 'No of Days':
        moduleCleaningListPlan.sort((a, b) => isAscending.value
            ? a.noOfCleaningDays!.compareTo(b.noOfCleaningDays!)
            : b.noOfCleaningDays!.compareTo(a.noOfCleaningDays!));
        break;
      case 'Created By':
        moduleCleaningListPlan.sort((a, b) => isAscending.value
            ? a.createdBy!.compareTo(b.createdBy!)
            : b.createdBy!.compareTo(a.createdBy!));
        break;
      case 'Frequency':
        moduleCleaningListPlan.sort((a, b) => isAscending.value
            ? a.frequency!.compareTo(b.frequency!)
            : b.frequency!.compareTo(a.frequency!));
        break;
      default:
        break;
    }
    update();
  }

}
