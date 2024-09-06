import 'dart:async';

import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/module_cleaning_execution/module_cleaning_list_execution_presenter.dart';
import 'package:cmms/domain/models/comment_model.dart';
import 'package:cmms/domain/models/mc_task_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class ModuleCleaningListExecutionController extends GetxController {
  ModuleCleaningListExecutionController(
    this.moduleCleaningListExecutionPresenter,
  );
  ModuleCleaningListExecutionPresenter moduleCleaningListExecutionPresenter;
  final HomeController homecontroller = Get.find();
  TextEditingController commentTextFieldCtrlr = TextEditingController();
  RxList<MCTaskListModel?> mcTaskList = <MCTaskListModel?>[].obs;
  RxList<MCTaskListModel?> filteredData = <MCTaskListModel>[].obs;

  Rx<DateTime> fromDate = DateTime.now().subtract(Duration(days: 7)).obs;
  Rx<DateTime> toDate = DateTime.now().obs;
  MCTaskListModel? mcTaskModelList;
  RxList<String> mcTaskListTableColumns = <String>[].obs;
  RxString mcExecutionFilterText = ''.obs;
  String get formattedFromdate =>
      DateFormat('dd/MM/yyyy').format(fromDate.value);
  String get formattedTodate => DateFormat('dd/MM/yyyy').format(toDate.value);
  String get formattedTodate1 => DateFormat('yyyy-MM-dd').format(toDate.value);
  String get formattedFromdate1 =>
      DateFormat('yyyy-MM-dd').format(fromDate.value);

  RxList<String> goodsOrdersListTableColumns = <String>[].obs;
  bool openFromDateToStartDatePicker = false;

  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  Rx<int> Id = 0.obs;
  RxString IDFilterText = ''.obs;
  RxString titleFilterText = ''.obs;

  RxString planIDFilterText = ''.obs;
  RxString responsibilityFilterText = ''.obs;
  RxString frequencyFilterText = ''.obs;
  RxString noOfDaysFilterText = ''.obs;
  RxString startDateFilterText = ''.obs;
  RxString doneDateFilterText = ''.obs;
  RxString statusFilterText = ''.obs;

  final columnVisibility = ValueNotifier<Map<String, bool>>({
    "ID": true,
    "Title": true,
    "Plan ID": true,

    // "Responsibility": true,
    "Frequency": true,
    "No Of Days": true,
    "Start Date": true,
    "Done Date": true,
    // "Status": true,

    // "search": true,
  });
  final Map<String, double> columnwidth = {
    "ID": 200,
    "Title": 200,
    "Plan ID": 100,
    // "Responsibility": 200,
    "Frequency": 163,
    "No Of Days": 153,
    "Start Date": 130,
    "Done Date": 120,
    // "Status": 100
  };
  Map<String, RxString> filterText = {};
  void setColumnVisibility(String columnName, bool isVisible) {
    final newVisibility = Map<String, bool>.from(columnVisibility.value)
      ..[columnName] = isVisible;
    columnVisibility.value = newVisibility;
    print({"updated columnVisibility": columnVisibility});
  }

  void getMcExcustionListByDate() {
    getMCTaskList(facilityId, formattedFromdate1, formattedTodate1, false);
  }

  Rx<bool> isLoading = true.obs;
  @override
  void onInit() async {
    this.filterText = {
      "ID": IDFilterText,
      "Title": titleFilterText,
      "Plan ID": planIDFilterText,
      // "Responsibility": responsibilityFilterText,
      "Frequency": frequencyFilterText,
      "No Of Days": noOfDaysFilterText,
      "Start Date": startDateFilterText,
      "Done Date": doneDateFilterText,
      // "Status": statusFilterText,
    };
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 1), () async {
        await getMCTaskList(
            facilityId, formattedTodate1, formattedFromdate1, false);
      });
    });
    super.onInit();
  }

  void search(String keyword) {
    if (keyword.isEmpty) {
      mcTaskList.value = filteredData;
      return;
    }

    List<MCTaskListModel?> filteredList = filteredData
        .where((item) =>
            (item?.executionId
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.planId?.toString().toLowerCase().contains(keyword.toLowerCase()) ??
                false) ||
            (item?.title?.toString().toLowerCase().contains(keyword.toLowerCase()) ??
                false) ||
            (item?.responsibility
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.frequency
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.noOfDays?.toString().toLowerCase().contains(keyword.toLowerCase()) ??
                false) ||
            (item?.startDate
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.doneDate?.toString().toLowerCase().contains(keyword.toLowerCase()) ??
                false) ||
            (item?.status?.toString().toLowerCase().contains(keyword.toLowerCase()) ?? false))
        .toList();
    mcTaskList.value = filteredList;

    // mcTaskList.value = filteredData
    //     .where((item) =>
    //         item!.responsibility!.toLowerCase().contains(keyword.toLowerCase()))
    //     .toList();
    // update(['mc_task_list']);
  }

  Future<void> abandonExecutionButton({int? id}) async {
    String _Comment = commentTextFieldCtrlr.text.trim();

    CommentModel commentAbandonModel = CommentModel(id: id, comment: _Comment);

    var abandoneJsonString = commentAbandonModel.toJson();

    final _abandonExecutionBtn =
        await moduleCleaningListExecutionPresenter.abandonExecutionButton(
            abandoneJsonString: abandoneJsonString,
            isLoading: true,
            facility_id: facilityId);
    // showAlertPermitApproveDialog();
    // print('abandon Button Data:${_Comment}');
    // print('abandon id Button Data:${id}');
  }

  void export() {
    getMCTaskList(facilityId, formattedFromdate1, formattedTodate1, true,
        isExportOnly: true);
  }

  Future<void> getMCTaskList(
      int facilityId, dynamic startDate, dynamic endDate, bool isExport,
      {bool isExportOnly = false}) async {
    if (!isExportOnly) {
      mcTaskList.value = <MCTaskListModel>[];
    }

    final list = await moduleCleaningListExecutionPresenter.getMCTaskList(
        isLoading: isLoading.value,
        isExport: isExport,
        start_date: startDate,
        end_date: endDate,
        facility_id: facilityId);

    isLoading.value = false;

    if (!isExportOnly) {
      for (var mc_task_list in list) {
        mcTaskList.add(mc_task_list);
      }

      mcTaskList.value = list;
      filteredData.value = mcTaskList.value;

      paginationController = PaginationController(
        rowCount: mcTaskList.length,
        rowsPerPage: 10,
      );

      if (filteredData.isNotEmpty) {
        mcTaskModelList = filteredData[0];
        var mcTaskListJson = mcTaskModelList?.toJson();
        mcTaskListTableColumns.value = <String>[];
        for (var key in mcTaskListJson?.keys.toList() ?? []) {
          mcTaskListTableColumns.add(key);
        }
      }
    }

    update(['mc_task_list']);
  }

  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {}
  }

  void clearStoreDataMcid() {
    moduleCleaningListExecutionPresenter.clearValueMcId();
  }

  void clearStoreDataPlanid() {
    moduleCleaningListExecutionPresenter.clearValuePlanId();
  }
}
