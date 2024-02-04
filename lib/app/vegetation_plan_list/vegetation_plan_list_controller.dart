import 'dart:async';

import 'package:cmms/app/app.dart';
import 'package:cmms/app/vegetation_plan_list/vegetation_plan_list_presenter.dart';
import 'package:cmms/domain/models/vegetation_list_plan_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class VegetationPlanListController extends GetxController {
  VegetationPlanListController(this.vegetationPlanListPresenter);

  VegetationPlanListPresenter vegetationPlanListPresenter;
  final HomeController homeController = Get.find();

  RxList<VegetationPlanListModel> vegetationPlanList =
      <VegetationPlanListModel>[].obs;
  RxList<VegetationPlanListModel> filteredData =
      <VegetationPlanListModel>[].obs;

  Rx<int> PlanId = 0.obs;
  RxString planIdFilterText = ''.obs;
  RxString planTitleFilterText = ''.obs;
  RxString noOfDaysFilterText = ''.obs;
  RxString createdByFilterText = ''.obs;
  RxString frequencyFilterText = ''.obs;
  RxString statusFilterText = ''.obs;

  bool openStartDatePicker = false;
  var startDateTimeCtrlr = TextEditingController();

  Rx<DateTime> fromDate = DateTime.now().subtract(Duration(days: 7)).obs;
  Rx<DateTime> toDate = DateTime.now().obs;
  final columnVisibility = ValueNotifier<Map<String, bool>>({
    'Plan Id': true,
    'Plan Title': true,
    'No of Days': true,
    'Created By': true,
    'frequency': true,

    // "search": true,
  });

  final Map<String, double> columnwidth = {
    'Plan Id': 153,
    'Plan Title': 320,
    'No of Days': 220,
    'Created By': 200,
    'frequency': 250,
  };

  Map<String, RxString> filterText = {};
  void setColumnVisibility(String columnName, bool isVisible) {
    final newVisibility = Map<String, bool>.from(columnVisibility.value)
      ..[columnName] = isVisible;
    columnVisibility.value = newVisibility;
    print({"updated columnVisibility": columnVisibility});
  }

  VegetationPlanListModel? vegetationPlanListModel;
  RxList<String> vegetationPlanListTableColumns = <String>[].obs;
  bool openFromDateToStartDatePicker = false;

  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;

  @override
  void onInit() async {
    this.filterText = {
      'Plan Id': planIdFilterText,
      'Plan Title': planTitleFilterText,
      'No of Days': noOfDaysFilterText,
      'Created By': createdByFilterText,
      'frequency': frequencyFilterText,
      "Status": statusFilterText,
    };
    facilityIdStreamSubscription = homeController.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 2), () async {
        getVegetationPlanList(facilityId, true);
      });
    });
    super.onInit();
  }

  Future<void> getVegetationPlanList(int facilityId, bool isLoading) async {
    vegetationPlanList.value = <VegetationPlanListModel>[];
    filteredData.value = <VegetationPlanListModel>[];

    final _vegetationPlanList =
        await vegetationPlanListPresenter.getVegetationPlanList(
      isLoading: true,
      facility_id: facilityId,
    );
    vegetationPlanList.value = _vegetationPlanList;
    paginationController = PaginationController(
      rowCount: vegetationPlanList.length,
      rowsPerPage: 10,
    );

    if (vegetationPlanList.isNotEmpty) {
      filteredData.value = vegetationPlanList.value;

      vegetationPlanListModel = vegetationPlanList[0];
      var newPermitListJson = vegetationPlanListModel?.toJson();
      vegetationPlanListTableColumns.value = <String>[];
      for (var key in newPermitListJson?.keys.toList() ?? []) {
        vegetationPlanListTableColumns.add(key);
      }
    }
  }

  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {}
  }

  void search(String keyword) {
    print('Keyword: $keyword');
    if (keyword.isEmpty) {
      vegetationPlanList.value = filteredData.value;
      return;
    }
    List<VegetationPlanListModel> filteredList = filteredData
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
    vegetationPlanList.value = filteredList;
  }
}
