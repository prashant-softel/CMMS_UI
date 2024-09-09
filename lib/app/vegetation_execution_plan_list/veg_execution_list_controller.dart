import 'dart:async';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/vegetation_execution_plan_list/veg_execution_list_presenter.dart';
import 'package:cmms/domain/models/veg_task_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class VegExecutionListController extends GetxController {
  VegExecutionListController(
    this.vegExecutionListPresenter,
  );

  VegExecutionListPresenter vegExecutionListPresenter;
  final HomeController homecontroller = Get.find();
  RxString currentSortColumn = ''.obs;
  RxBool isAscending = true.obs;
  TextEditingController commentTextFieldCtrlr = TextEditingController();
  RxList<VegTaskListModel?> vegTaskList = <VegTaskListModel?>[].obs;
  RxList<VegTaskListModel?> filteredData = <VegTaskListModel>[].obs;

  Rx<DateTime> fromDate = DateTime.now().subtract(Duration(days: 7)).obs;
  Rx<DateTime> toDate = DateTime.now().obs;
  VegTaskListModel? vegTaskListModel;
  RxList<String> vegTaskListTableColumns = <String>[].obs;
  RxString vegExecutionFilterText = ''.obs;
  String get formattedFromdate =>
      DateFormat('dd/MM/yyyy').format(fromDate.value);
  String get formattedTodate => DateFormat('dd/MM/yyyy').format(toDate.value);
  String get formattedTodate1 => DateFormat('yyyy-MM-dd').format(toDate.value);
  String get formattedFromdate1 =>
      DateFormat('yyyy-MM-dd').format(fromDate.value);

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
    "Responsibility": true,
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
    "Plan ID": 105,
    "Responsibility": 200,
    "Frequency": 163,
    "No Of Days": 153,
    "Start Date": 130,
    "Done Date": 140,
    // "Status": 100
  };

  Map<String, RxString> filterText = {};
  void setColumnVisibility(String columnName, bool isVisible) {
    final newVisibility = Map<String, bool>.from(columnVisibility.value)
      ..[columnName] = isVisible;
    columnVisibility.value = newVisibility;
    print({"updated columnVisibility": columnVisibility});
  }

  void getVegExcustionListByDate() {
    getVegTaskList(facilityId, formattedFromdate1, formattedTodate1, false);
  }

  Rx<bool> isLoading = true.obs;
  @override
  void onInit() async {
    this.filterText = {
      "ID": IDFilterText,
      "Title": titleFilterText,
      "Plan ID": planIDFilterText,
      "Responsibility": responsibilityFilterText,
      "Frequency": frequencyFilterText,
      "No Of Days": noOfDaysFilterText,
      "Start Date": startDateFilterText,
      "Done Date": doneDateFilterText,
      // "Status": statusFilterText,
    };
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 2), () async {
        await getVegTaskList(
          facilityId,
          formattedFromdate1,
          formattedTodate1,
          false,
        );
      });
    });
    super.onInit();
  }

  void search(String keyword) {
    if (keyword.isEmpty) {
      vegTaskList.value = filteredData;
      return;
    }

    List<VegTaskListModel?> filteredList = filteredData
        .where((item) =>
            (item?.id?.toString().toLowerCase().contains(keyword.toLowerCase()) ?? false) ||
            (item?.planId?.toString().toLowerCase().contains(keyword.toLowerCase()) ??
                false) ||
            (item?.title?.toString().toLowerCase().contains(keyword.toLowerCase()) ??
                false) ||
            (item?.responsibility
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.frequency?.toString().toLowerCase().contains(keyword.toLowerCase()) ??
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
            (item?.status?.toString().toLowerCase().contains(keyword.toLowerCase()) ??
                false) ||
            (item?.status_short
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false))
        .toList();
    vegTaskList.value = filteredList;
  }

  // Future<void> abandonExecutionButton({int? id}) async {
  //   String _Comment = commentTextFieldCtrlr.text.trim();

  //   CommentModel commentAbandonModel = CommentModel(id: id, comment: _Comment);

  //   var abandoneJsonString = commentAbandonModel.toJson();

  //   final _abandonExecutionBtn =
  //       await vegExecutionListPresenter.abandonExecutionButton(
  //     abandoneJsonString: abandoneJsonString,
  //     isLoading: true,
  //   );
  //   // showAlertPermitApproveDialog();
  //   // print('abandon Button Data:${_Comment}');
  //   // print('abandon id Button Data:${id}');
  // }

  void export() {
    getVegTaskList(facilityId, formattedFromdate1, formattedTodate1, true,
        isExportOnly: true);
  }

  Future<void> getVegTaskList(
      int facilityId, dynamic startDate, dynamic endDate, bool isExport,
      {bool isExportOnly = false}) async {
    if (!isExportOnly) {
      vegTaskList.value = <VegTaskListModel>[];
    }

    final list = await vegExecutionListPresenter.getVegTaskList(
        isLoading: isLoading.value,
        startDate: startDate,
        endDate: endDate,
        facility_id: facilityId,
        isExport: isExport);

    if (!isExportOnly) {
      for (var veg_task_list in list) {
        vegTaskList.add(veg_task_list);
      }

      vegTaskList.value = list;
      filteredData.value = vegTaskList.value;
      isLoading.value = false;

      paginationController = PaginationController(
        rowCount: vegTaskList.length,
        rowsPerPage: 10,
      );

      if (filteredData.isNotEmpty) {
        vegTaskListModel = filteredData[0];
        var vegTaskListJson = vegTaskListModel?.toJson();
        vegTaskListTableColumns.value = <String>[];
        for (var key in vegTaskListJson?.keys.toList() ?? []) {
          vegTaskListTableColumns.add(key);
        }
      }
    }

    isLoading.value = false;
    update(['veg_task_list']);
  }

  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {}
  }

  void clearStoreData() {
    vegExecutionListPresenter.clearExecutionId();
    vegExecutionListPresenter.clearPlanId();
  }

  void viewVegetation(int executionId, int planId) {
    clearStoreData();
    Get.toNamed(
      Routes.viewVegExecutionPlanScreen,
      arguments: {
        "vegexe": executionId,
        "vegid": planId,
      },
    );
  }

  void executeVegetation(int executionId, int planId) {
    clearStoreData();
    Get.toNamed(
      Routes.vegExecutionScreen,
      arguments: {
        "vegexe": executionId,
        "vegid": planId,
      },
    );
  }

  void sortData(String columnName) {
    if (currentSortColumn.value == columnName) {
      isAscending.value = !isAscending.value;
    } else {
      currentSortColumn.value = columnName;
      isAscending.value = true;
    }

    switch (columnName) {
      case 'ID':
        vegTaskList.sort((a, b) => isAscending.value
            ? a!.id!.compareTo(b!.id!)
            : b!.id!.compareTo(a!.id!));
        break;
      case 'Title':
        vegTaskList.sort((a, b) => isAscending.value
            ? a!.title!.compareTo(b!.title!)
            : b!.title!.compareTo(a!.title!));
        break;
      case 'Plan ID':
        vegTaskList.sort((a, b) => isAscending.value
            ? a!.planId!.compareTo(b!.planId!)
            : b!.planId!.compareTo(a!.planId!));
        break;
      case 'Responsibility':
        vegTaskList.sort((a, b) => isAscending.value
            ? a!.responsibility!.compareTo(b!.responsibility!)
            : b!.responsibility!.compareTo(a!.responsibility!));
        break;
      case 'Frequency':
        vegTaskList.sort((a, b) => isAscending.value
            ? a!.frequency!.compareTo(b!.frequency!)
            : b!.frequency!.compareTo(a!.frequency!));
        break;
      case 'No Of Days':
        vegTaskList.sort((a, b) => isAscending.value
            ? a!.noOfDays!.compareTo(b!.noOfDays!)
            : b!.noOfDays!.compareTo(a!.noOfDays!));
        break;
      case 'Start Date':
        vegTaskList.sort((a, b) => isAscending.value
            ? a!.startDate!.compareTo(b!.startDate!)
            : b!.startDate!.compareTo(a!.startDate!));
        break;
      case 'Done Date':
        vegTaskList.sort((a, b) => isAscending.value
            ? a!.doneDate!.compareTo(b!.doneDate!)
            : b!.doneDate!.compareTo(a!.doneDate!));
        break;
      default:
        break;
    }

    update(['veg_task_list']); // Trigger UI update after sorting
  }
}
