import 'dart:async';
import 'package:cmms/app/Statutory/statutory_presenter.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/domain/models/get_statutory_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class StatutoryController extends GetxController {
  StatutoryController(
    this.statutoryPresenter,
  );
  StatutoryPresenter statutoryPresenter;
  final HomeController homecontroller = Get.find();
  RxList<GetStatutoryList> getStatutoryList = <GetStatutoryList>[].obs;
  RxList<GetStatutoryList> filteredData = <GetStatutoryList>[].obs;
  Rx<DateTime> fromDate = DateTime.now().subtract(Duration(days: 7)).obs;
  Rx<DateTime> toDate = DateTime.now().obs;

  String get formattedFromdate =>
      DateFormat('dd/MM/yyyy').format(fromDate.value);
  String get formattedTodate => DateFormat('dd/MM/yyyy').format(toDate.value);
  String get formattedTodate1 => DateFormat('yyyy-MM-dd').format(toDate.value);
  String get formattedFromdate1 =>
      DateFormat('yyyy-MM-dd').format(fromDate.value);

  GetStatutoryList? getStatutoryListModel;
  RxList<String> getStatutoryListTableColumns = <String>[].obs;
  bool openFromDateToStartDatePicker = false;

  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  Rx<int> StatutoryId = 0.obs;
  RxString idFilterText = ''.obs;
  RxString complianceFilterText = ''.obs;
  RxString statusOFApplicationFilterText = ''.obs;
  RxString dateofReceivedFilterText = ''.obs;
  RxString validityFilterText = ''.obs;
  RxString daysLeftFilterText = ''.obs;
  RxString expiresOnFilterText = ''.obs;
  RxString statusCodeFilterText = ''.obs;

  // RxString vendorFilterText = ''.obs;

  RxString userDateFilterText = ''.obs;

  final columnVisibility = ValueNotifier<Map<String, bool>>({
    "ID": true,
    "Compliance": true,
    "Status Of Application": true,
    "Date of received": true,
    "Validity (Month)": true,
    "Days Left": true,
    "Expires on": true,
    // "Status Code": true,

    // "search": true,
  });
  final Map<String, double> columnwidth = {
    "ID": 150,
    "Compliance": 150,
    "Status Of Application": 250,
    "Date of received": 200,
    "Validity (Month)": 183,
    "Days Left": 120,
    "Expires on": 140,
    // "Status Code": 150
  };
  Map<String, RxString> filterText = {};
  void setColumnVisibility(String columnName, bool isVisible) {
    final newVisibility = Map<String, bool>.from(columnVisibility.value)
      ..[columnName] = isVisible;
    columnVisibility.value = newVisibility;
    print({"updated columnVisibility": columnVisibility});
  }

  Rx<bool> isLoading = true.obs;
  @override
  void onInit() async {
    this.filterText = {
      "ID": idFilterText,
      "Compliance": complianceFilterText,
      "Status Of Application": statusOFApplicationFilterText,
      "Date of received": dateofReceivedFilterText,
      "Validity (Month)": validityFilterText,
      "Days Left": daysLeftFilterText,
      "Expires on": expiresOnFilterText,
      // "Status Code": statusCodeFilterText,
    };
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      if (facilityId > 0) {
        Future.delayed(Duration(seconds: 2), () async {
          await getStatutoryDataList(
              facilityId, formattedTodate1, formattedFromdate1, false);
        });
      }
    });
    super.onInit();
  }
  void getstatutorylistbydate() {
    getStatutoryDataList(
              facilityId, formattedTodate1, formattedFromdate1, false);
  }

  void search(String keyword) {
    print('Keyword: $keyword');
    if (keyword.isEmpty) {
      getStatutoryList.value = filteredData.value;
      return;
    }
    List<GetStatutoryList> filteredList = filteredData
        .where((item) =>
            (item.id?.toString().toLowerCase().contains(keyword.toLowerCase()) ?? false) ||
            (item.id?.toString().toLowerCase().contains(keyword.toLowerCase()) ??
                false) ||
            (item.activation_status?.toString().toLowerCase().contains(keyword.toLowerCase()) ??
                false) ||
            (item.activation_status
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.activation_status
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.activation_status
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.activation_status
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.id?.toString().toLowerCase().contains(keyword.toLowerCase()) ??
                false) ||
            (item.activation_status
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.activation_status?.toString().toLowerCase().contains(keyword.toLowerCase()) ?? false) ||
            (item.activation_status?.toString().toLowerCase().contains(keyword.toLowerCase()) ?? false))
        .toList();
    getStatutoryList.value = filteredList;
  }

  Future<void> getStatutoryDataList(
      int facilityId, dynamic startDate, dynamic endDate, bool isExport) async {
    getStatutoryList.value = <GetStatutoryList>[];
    filteredData.value = <GetStatutoryList>[];

    final _getStatutoryList = await statutoryPresenter.getStatutoryDataList(
        isLoading: isLoading.value,
        start_date: startDate,
        end_date: endDate,
        facility_id: facilityId,
        isExport: isExport);
    getStatutoryList.value = _getStatutoryList;
    isLoading.value = false;
    paginationController = PaginationController(
      rowCount: getStatutoryList.length,
      rowsPerPage: 10,
    );
    if (getStatutoryList.isNotEmpty) {
      filteredData.value = getStatutoryList.value;
      getStatutoryListModel = getStatutoryList[0];
      var getStatutoryListJson = getStatutoryListModel?.toJson();
      getStatutoryListTableColumns.value = <String>[];
      for (var key in getStatutoryListJson?.keys.toList() ?? []) {
        getStatutoryListTableColumns.add(key);
      }
    }
  }

  void clearStoreData() {
    statutoryPresenter.clearValue();
    statutoryPresenter.clearComplianceValue();
  }

  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {}
  }

  void export() {
    getStatutoryDataList(
        facilityId, formattedTodate1, formattedFromdate1, true);
  }
}
