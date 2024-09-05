import 'dart:async';

import 'package:cmms/app/mrs/mrs_list_presenter.dart';
import 'package:cmms/domain/models/get_mrs_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../home/home_controller.dart';

class MrsListController extends GetxController {
  ///
  MrsListController(
    this.mrsListPresenter,
  );
  MrsListPresenter mrsListPresenter;
  final HomeController homecontroller = Get.find();
  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  RxList<MrsListModel?> mrsList = <MrsListModel?>[].obs;
  RxList<MrsListModel?> filteredData = <MrsListModel>[].obs;

  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );

  MrsListModel? mrsListModel;
  MrsListModel? selectedItem;
  RxList<String> mrsTableColumns = <String>[].obs;
  Rx<DateTime> fromDate = DateTime.now().subtract(Duration(days: 7)).obs;
  Rx<DateTime> toDate = DateTime.now().obs;
  bool openFromDateToStartDatePicker = false;
  String get formattedFromdate =>
      DateFormat('dd/MM/yyyy').format(fromDate.value);
  String get formattedTodate => DateFormat('dd/MM/yyyy').format(toDate.value);
  String get formattedTodate1 => DateFormat('yyyy-MM-dd').format(toDate.value);
  String get formattedFromdate1 =>
      DateFormat('yyyy-MM-dd').format(fromDate.value);

  RxString idFilterText = ''.obs;
  RxString mrsDetailFilterText = ''.obs;
  RxString orderDateFilterText = ''.obs;
  RxString activityFilterText = ''.obs;
  RxString whereusedFilterText = ''.obs;

  Rx<int> MrsId = 0.obs;

  final columnVisibility = ValueNotifier<Map<String, bool>>({
    "MRS ID": true,
    "MRS Details": true,
    "Order Date": true,
    "Activity": true,
    "Where Used": true,
  });
  final Map<String, double> columnwidth = {
    "MRS ID": 200,
    "MRS Details": 400,
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

  ///
  Rx<bool> isLoading = true.obs;
  @override
  void onInit() async {
    this.filterText = {
      "MRS ID": idFilterText,
      "MRS Details": mrsDetailFilterText,
      "Order Date": orderDateFilterText,
      "Activity": activityFilterText,
      "Where Used": whereusedFilterText
    };
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      if (facilityId > 0) {
        //Future.delayed(Duration(seconds: 1), () {
        getMrsList(facilityId, formattedTodate1, formattedFromdate1, false);
        // });
      }
    });
    super.onInit();
  }

  void search(String keyword) {
    print('Keyword: $keyword');
    if (keyword.isEmpty) {
      mrsList.value = filteredData;
      return;
    }

    List<MrsListModel?> filteredList = filteredData
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
            (item?.activity
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

  Future<void> getMrsList(int facilityId, dynamic startDate, dynamic endDate,
      bool? isExport) async {
    mrsList.value = <MrsListModel>[];
    filteredData.value = <MrsListModel>[];

    final _mrsList = await mrsListPresenter.getMrsList(
        facilityId: facilityId,
        isLoading: isLoading.value,
        isExport: isExport,
        startDate: startDate,
        endDate: endDate);

    if (_mrsList != null) {
      mrsList.value = _mrsList;
      filteredData.value = _mrsList;
      isLoading.value = false;
      paginationController = PaginationController(
        rowCount: mrsList.length,
        rowsPerPage: 10,
      );

      if (mrsList.isNotEmpty) {
        //  filteredData.value = mrsList!.value;
        mrsListModel = mrsList[0];
        var mrsListJson = mrsListModel?.toJson();
        mrsTableColumns.value = <String>[];
        for (var key in mrsListJson?.keys.toList() ?? []) {
          mrsTableColumns.add(key);
        }
      }
    }
  }

  void getMrsListByDate() {
    getMrsList(facilityId, formattedTodate1, formattedFromdate1, false);
  }

  void clearStoreData() {
    mrsListPresenter.clearValue();
  }

  void clearJobIdStoreData() {
    mrsListPresenter.clearJobIdStoreData();
  }

  void clearpmTaskValue() {
    mrsListPresenter.clearpmTaskValue();
  }

  void clearStoreTaskData() {
    mrsListPresenter.clearStoreTaskData();
  }

  void clearStoreTaskActivityData() {
    mrsListPresenter.clearStoreTaskActivityData();
  }

  void clearStoreTaskfromActorData() {
    mrsListPresenter.clearStoreTaskfromActorData();
  }

  void clearStoreTasktoActorData() {
    mrsListPresenter.clearStoreTasktoActorData();
  }

  void clearStoreTaskWhereUsedData() {
    mrsListPresenter.clearStoreTaskWhereUsedData();
  }

  void clearTypeValue() async => mrsListPresenter.clearTypeValue();

  void export() {
    getMrsList(facilityId, formattedTodate1, formattedFromdate1, true);
  }
}
