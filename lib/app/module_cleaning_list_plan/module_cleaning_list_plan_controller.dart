import 'dart:async';

import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/module_cleaning_list_plan/module_cleaning_list_plan_presenter.dart';
import 'package:cmms/domain/models/facility_model.dart';
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

  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  RxList<ModuleCleaningListPlanModel> moduleCleaningListPlan =
      <ModuleCleaningListPlanModel>[].obs;
  // var moduleCleaningList = <ModuleCleaningListPlanModel>[];

  RxList<String> moduleCleaningListPlanTableColumns = <String>[].obs;
  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  Rx<String> selectedBlock = ''.obs;
  ModuleCleaningListPlanModel? moduleCleaningListPlanModel;
  final columnVisibility = ValueNotifier<Map<String, bool>>({
    'Plan Id': true,
    'Plan Title': true,
    'No of Days': true,
    'Created By': true,
    'frequency': true,
    // 'Action': true,
  });
  final columnSearchText = ValueNotifier<Map<String, String>>({
    'planId': '',
    'title': '',
    'noOfCleaningDays': '',
    'createdBy': '',
    'frequency': '',
  });
  List<ModuleCleaningListPlanModel> get filteredData {
    final visibilityMap = columnVisibility.value;
    final searchTextMap = columnSearchText.value;

    return moduleCleaningListPlan.value.where((row) {
      return visibilityMap.entries.every((entry) {
        final columnName = entry.key;
        final columnVisible = entry.value;
        final searchValue = searchTextMap[columnName]?.toLowerCase() ?? '';
        if (!columnVisible || searchValue.isEmpty) {
          return true; // Skip the check if the column is hidden or search text is empty
        }
        final cellValue = row.columnByName(columnName)?.toLowerCase() ?? '';
        return cellValue.contains(searchValue);
      });
    }).toList();
  }

  void setColumnVisibility(String columnName, bool isVisible) {
    final newVisibility = Map<String, bool>.from(columnVisibility.value)
      ..[columnName] = isVisible;
    columnVisibility.value = newVisibility;
  }

  void setSearchText(String columnName, String searchText) {
    final newSearchText = Map<String, String>.from(columnSearchText.value)
      ..[columnName] = searchText;
    columnSearchText.value = newSearchText;
  }

  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  @override
  void onInit() async {
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      getModuleCleaningListPlan(facilityId, true);
      super.onInit();
    });
  }

  Future<void> getFacilityList({bool? isLoading}) async {
    facilityList.value = <FacilityModel>[];
    List<FacilityModel?>? _facilityList = <FacilityModel?>[];

    _facilityList = await moduleCleaningListPlanPresenter.getFacilityList();
    if (_facilityList != null && _facilityList.isNotEmpty) {
      facilityList.value = _facilityList;
    }
    if (facilityList.isNotEmpty) {
      selectedBlock.value = facilityList[0]?.name ?? '';
    }
  }

  Future<void> getModuleCleaningListPlan(int facilityId, bool isLoading) async {
    moduleCleaningListPlan.value = <ModuleCleaningListPlanModel>[];
    final _moduleCleaningListPlan = await moduleCleaningListPlanPresenter
        .getModuleCleaningListPlan(isLoading: true, facility_id: facilityId);
    if (_moduleCleaningListPlan != null) {
      moduleCleaningListPlan.value = _moduleCleaningListPlan;
      paginationController = PaginationController(
        rowCount: moduleCleaningListPlan.length,
        rowsPerPage: 10,
      );

      update(['module_plan_list']);
    }
  }
}

extension DataRowModelExtensions on ModuleCleaningListPlanModel {
  String? columnByName(String name) {
    switch (name) {
      case 'Plan Id':
        return planId.toString();
      case 'Plan Title':
        return title;
      case 'No of Days':
        return noOfCleaningDays.toString();
      case 'Created By':
        return createdBy;
      case 'frequency':
        return frequency;
      case 'Plan Id':
        return status_short.toString();
      default:
        return null;
    }
  }
}
