import 'dart:async';
import 'package:cmms/app/return_mrs/return_mrs_presenter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/get_return_mrs_list.dart';
import '../home/home_controller.dart';

class ReturnMrsListController extends GetxController {
  ///
  ReturnMrsListController(
    this.returnmrsListPresenter,
  );
  ReturnMrsListPresenter returnmrsListPresenter;
  final HomeController homecontroller = Get.find();
  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  RxList<ReturnMrsListModel?> mrsList = <ReturnMrsListModel?>[].obs;
  RxList<ReturnMrsListModel?> filteredData = <ReturnMrsListModel?>[].obs;
  bool openFromDateToStartDatePicker = false;

  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  ReturnMrsListModel? returnMrsListModel;
  // ReturnMrsListModel? selectedItem;
  RxList<String> mrsTableColumns = <String>[].obs;
  Rx<DateTime> fromDate = DateTime.now().obs;
  Rx<DateTime> toDate = DateTime.now().obs;
  String get formattedFromdate =>
      DateFormat('yyyy-MM-dd').format(fromDate.value);
  String get formattedTodate => DateFormat('yyyy-MM-dd').format(toDate.value);

  ///
  RxString idFilterText = ''.obs;
  RxString mrsDetailFilterText = ''.obs;
  RxString orderDateFilterText = ''.obs;
  RxString activityFilterText = ''.obs;
  RxString whereusedFilterText = ''.obs;
  Rx<int> MrsId = 0.obs;

  final columnVisibility = ValueNotifier<Map<String, bool>>({
    "RMRS ID": true,
    "RMRS Details": true,
    "Order Date": true,
    "Activity": true,
    "Where Used": true,
  });
  final Map<String, double> columnwidth = {
    "RMRS ID": 200,
    "RMRS Details": 400,
    "Order Date": 200,
    "Activity": 200,
    "Where Used": 200,
  };
  Map<String, RxString> filterText = {};
  void setColumnVisibility(String columnName, bool isVisible) {
    final newVisibility = Map<String, bool>.from(columnVisibility.value)
      ..[columnName] = isVisible;
    columnVisibility.value = newVisibility;
    // print({"updated columnVisibility": columnVisibility});
  }

  Rx<bool> isLoading = true.obs;
  @override
  void onInit() async {
    this.filterText = {
      "RMRS ID": idFilterText,
      "RMRS Details": mrsDetailFilterText,
      "Order Date": orderDateFilterText,
      "Activity": activityFilterText,
      "Where Used": whereusedFilterText
    };
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      if (facilityId > 0) {
        Future.delayed(Duration(seconds: 2), () {
          getReturnMrsList(
              facilityId, formattedTodate, formattedFromdate, false);
        });
      }
    });
    super.onInit();
  }

  void getReturnMrsListByDate() {
    getReturnMrsList(facilityId, formattedTodate, formattedFromdate, false);
  }

  void export() {
    getReturnMrsList(facilityId, formattedTodate, formattedFromdate, true,
        isExportOnly: true);
  }

  Future<void> getReturnMrsList(
      int facilityId, dynamic startDate, dynamic endDate, bool isExport,
      {bool isExportOnly = false}) async {
    if (!isExportOnly) {
      mrsList.value = <ReturnMrsListModel>[];
      filteredData.value = <ReturnMrsListModel>[];
    }

    final _mrsList = await returnmrsListPresenter.getReturnMrsList(
        facilityId: facilityId, isLoading: isLoading.value, isExport: isExport);

    if (_mrsList != null && !isExportOnly) {
      mrsList.value = _mrsList;
      filteredData.value = _mrsList;
      isLoading.value = false;

      paginationController = PaginationController(
        rowCount: mrsList.length ?? 0,
        rowsPerPage: 10,
      );

      if (mrsList.isNotEmpty) {
        returnMrsListModel = mrsList[0];
        var mrsListJson = returnMrsListModel?.toJson();
        mrsTableColumns.value = <String>[];
        for (var key in mrsListJson?.keys.toList() ?? []) {
          mrsTableColumns.add(key);
        }
      }
    }
  }

  void search(String keyword) {
    print('Keyword: $keyword');
    if (keyword.isEmpty) {
      mrsList.value = filteredData.value;
      return;
    }
    List<ReturnMrsListModel?> filteredList = filteredData
        .where((item) =>
            (item?.id
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.requested_by_name
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.approver_name
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.requestd_date
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.activity?.toString().toLowerCase().contains(keyword.toLowerCase()) ??
                false) ||
            (item?.whereUsedType
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.whereUsedTypeId
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false))
        .toList();
    mrsList.value = filteredList;
  }

  void clearStoreData() {
    returnmrsListPresenter.clearValue();
  }
}
