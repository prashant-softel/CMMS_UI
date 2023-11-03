import 'dart:async';

import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/transaction_report/transaction_report_list_presenter.dart';
import 'package:cmms/domain/models/%20%20transaction_report_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class TransactionReportListController extends GetxController {
  TransactionReportListController(
    this.transactionReportListPresenter,
  );
  TransactionReportListPresenter transactionReportListPresenter;
  final HomeController homecontroller = Get.find();
  RxList<TransactionReportListModel?> transactionReportList =
      <TransactionReportListModel?>[].obs;
  RxList<TransactionReportListModel> filteredData =
      <TransactionReportListModel>[].obs;
  Rx<DateTime> fromDate = DateTime.now().subtract(Duration(days: 7)).obs;
  Rx<DateTime> toDate = DateTime.now().obs;

  String get formattedFromdate =>
      DateFormat('dd/MM/yyyy').format(fromDate.value);
  String get formattedTodate => DateFormat('dd/MM/yyyy').format(toDate.value);
  String get formattedTodate1 => DateFormat('yyyy-MM-dd').format(toDate.value);
  String get formattedFromdate1 =>
      DateFormat('yyyy-MM-dd').format(fromDate.value);

  TransactionReportListModel? transactionReportListModel;
  RxList<String> transactionReportListTableColumns = <String>[].obs;
  bool openFromDateToStartDatePicker = false;

  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;

  Rx<int> fromActorID = 0.obs;

  RxString fromActorIDFilterText = ''.obs;
  RxString fromActorTypeFilterText = ''.obs;
  RxString fromActorNameFilterText = ''.obs;
  RxString toActorTypeFilterText = ''.obs;
  RxString toActorNameFilterText = ''.obs;
  RxString assetItemNameFilterText = ''.obs;
  RxString qtyFilterText = ''.obs;
  RxString lastUpdatedFilterText = ''.obs;
  RxString statusFilterText = ''.obs;

  RxString vendorFilterText = ''.obs;

  RxString userDateFilterText = ''.obs;

  final columnVisibility = ValueNotifier<Map<String, bool>>({
    "From Actor ID": true,
    "From Actor Type": true,
    "From Actor Name": true,
    "To Actor Type": true,
    "To Actor Name": true,
    "Asset Item Name": true,
    "Qty": true,
    "Last Updated": true,
    // "Status": true

    // "search": true,
  });
  final Map<String, double> columnwidth = {
    "From Actor ID": 153,
    "From Actor Type": 220,
    "From Actor Name": 120,
    "To Actor Type": 200,
    "To Actor Name": 223,
    "Asset Item Name": 153,
    "Qty": 130,
    "Last Updated": 120,
    // "Status": 100
  };
  Map<String, RxString> filterText = {};
  void setColumnVisibility(String columnName, bool isVisible) {
    final newVisibility = Map<String, bool>.from(columnVisibility.value)
      ..[columnName] = isVisible;
    columnVisibility.value = newVisibility;
    print({"updated columnVisibility": columnVisibility});
  }

  @override
  void onInit() async {
    this.filterText = {
      "From Actor ID": fromActorIDFilterText,
      "From Actor Type": fromActorTypeFilterText,
      "From Actor Name": fromActorNameFilterText,
      "To Actor Type": toActorTypeFilterText,
      "To Actor Name": toActorNameFilterText,
      "Asset Item Name": assetItemNameFilterText,
      "Qty": qtyFilterText,
      "Last Updated": lastUpdatedFilterText,
      // "Status": statusFilterText
    };
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 2), () async {
        await transactionReport(
            facilityId: facilityId,
            startDate: formattedTodate1,
            // actorType: actorType,
            actorID: facilityId,
            endDate: formattedFromdate1,
            isLoading: false);
      });
    });
    super.onInit();
  }

  void search(String keyword) {
    if (keyword.isEmpty) {
      transactionReportList.value = filteredData;
      return;
    }

    transactionReportList.value = filteredData
        .where((item) =>
            item.assetItemName!.toLowerCase().contains(keyword.toLowerCase()))
        .toList();
    update(['stock_Mangement_Date']);
  }

  Future<void> transactionReport(
      {int? facilityId,
      dynamic startDate,
      int? actorType,
      int? actorID,
      dynamic endDate,
      bool? isLoading}) async {
    transactionReportList.value = <TransactionReportListModel>[];
    final _goodsordersList =
        await transactionReportListPresenter.transactionReport(
      isLoading: true,
      start_date: startDate,
      end_date: endDate,
      actorID: actorID,
      actorType: actorType,
      facility_id: facilityId,
    );
    transactionReportList.value = _goodsordersList;
    paginationController = PaginationController(
      rowCount: transactionReportList.length,
      rowsPerPage: 10,
    );

    if (transactionReportList.isNotEmpty) {
      transactionReportListModel = transactionReportList[0];
      var newPermitListJson = transactionReportListModel?.toJson();
      transactionReportListTableColumns.value = <String>[];
      for (var key in newPermitListJson?.keys.toList() ?? []) {
        transactionReportListTableColumns.add(key);
      }
    }
  }

  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {}
  }

  void getTransactionListByDate() {
    transactionReport(
        facilityId: facilityId,
        startDate: formattedTodate1,
        // actorType: actorType,
        actorID: facilityId,
        endDate: formattedFromdate1,
        isLoading: false);
  }
}
