import 'dart:async';

import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/stock_managment_goods_list_orders.dart/stock_management_goods_list_orders_presenter.dart';

import 'package:cmms/domain/models/stock_management_update_goods_orders_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class StockManagementGoodsOrdersController extends GetxController {
  StockManagementGoodsOrdersController(
    this.stockManagementGoodsOrdersPresenter,
  );
  StockManagementGoodsOrdersPresenter stockManagementGoodsOrdersPresenter;
  final HomeController homecontroller = Get.find();
  RxList<GoodsOrdersListModel> goodsOrdersList = <GoodsOrdersListModel>[].obs;
  RxList<GoodsOrdersListModel> filteredData = <GoodsOrdersListModel>[].obs;
  Rx<DateTime> fromDate = DateTime.now().subtract(Duration(days: 7)).obs;
  Rx<DateTime> toDate = DateTime.now().obs;

  String get formattedFromdate =>
      DateFormat('dd/MM/yyyy').format(fromDate.value);
  String get formattedTodate => DateFormat('dd/MM/yyyy').format(toDate.value);
  String get formattedTodate1 => DateFormat('yyyy-MM-dd').format(toDate.value);
  String get formattedFromdate1 =>
      DateFormat('yyyy-MM-dd').format(fromDate.value);

  GoodsOrdersListModel? goodsOrdersListModel;
  RxList<String> goodsOrdersListTableColumns = <String>[].obs;
  bool openFromDateToStartDatePicker = false;

  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  Rx<int> GoodsOrderId = 0.obs;
  RxString orderIdFilterText = ''.obs;
  RxString challanNoFilterText = ''.obs;
  RxString generatedByFilterText = ''.obs;
  RxString orderDateFilterText = ''.obs;
  RxString costFilterText = ''.obs;
  RxString currencyFilterText = ''.obs;
  RxString statusFilterText = ''.obs;

  RxString vendorFilterText = ''.obs;

  RxString userDateFilterText = ''.obs;

  final columnVisibility = ValueNotifier<Map<String, bool>>({
    "Order ID": true,
    "Vendor": true,
    "Challan No": true,
    "Generated By": true,
    "Order Date": true,
    "Cost": true,
    "Currency": true,
    "Status": true,

    // "search": true,
  });
  final Map<String, double> columnwidth = {
    "Order ID": 153,
    "Vendor": 220,
    "Challan No": 120,
    "Generated By": 200,
    "Order Date": 223,
    "Cost": 153,
    "Currency": 130,
    "Status": 100
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
      "Order ID": orderIdFilterText,
      "Vendor": vendorFilterText,
      "Challan No": challanNoFilterText,
      "Generated By": generatedByFilterText,
      "Order Date": orderDateFilterText,
      "Cost": costFilterText,
      "Currency": currencyFilterText,
      "Status": statusFilterText,
    };
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 2), () async {
        await getGoodsOrdersList(
          facilityId,
          formattedTodate1,
          formattedFromdate1,
          false,
          false
        );
      });
    });
    super.onInit();
  }

  void search(String keyword) {
    print('Keyword: $keyword');
    if (keyword.isEmpty) {
      goodsOrdersList.value = filteredData.value;
      return;
    }
    List<GoodsOrdersListModel> filteredList = filteredData
        .where((item) =>
            (item.vendor_name
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.challan_no
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.generatedBy
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.purchaseDate
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.cost?.toString().toLowerCase().contains(keyword.toLowerCase()) ??
                false) ||
            (item.currency
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.status
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false))
        .toList();
    goodsOrdersList.value = filteredList;
  }

  Future<void> getGoodsOrdersList(int facilityId, dynamic startDate,
      dynamic endDate, bool isLoading, bool isExport) async {
    goodsOrdersList.value = <GoodsOrdersListModel>[];
    filteredData.value = <GoodsOrdersListModel>[];

    final _goodsordersList =
        await stockManagementGoodsOrdersPresenter.getGoodsOrdersList(
      isLoading: true,
      start_date: startDate,
      end_date: endDate,
      facility_id: facilityId,
      isExport: isExport
    );
    goodsOrdersList.value = _goodsordersList;
    paginationController = PaginationController(
      rowCount: goodsOrdersList.length,
      rowsPerPage: 10,
    );

    if (goodsOrdersList.isNotEmpty) {
      filteredData.value = goodsOrdersList.value;
      goodsOrdersListModel = goodsOrdersList[0];
      var newPermitListJson = goodsOrdersListModel?.toJson();
      goodsOrdersListTableColumns.value = <String>[];
      for (var key in newPermitListJson?.keys.toList() ?? []) {
        goodsOrdersListTableColumns.add(key);
      }
    }
  }

  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {}
  }

  void showAddGoodsOrdersDetails({int? id}) {
    Get.toNamed(Routes.updateGoodsOrdersDetailsScreen, arguments: id);
    print('Argument5:$id');
  }

  void viewAddGoodsOrdersDetails({int? id}) {
    Get.toNamed(Routes.viewGoodsOrders, arguments: id);
    print('Argument5:$id');
  }

  void getPmTaskListByDate() {
    getGoodsOrdersList(facilityId, formattedFromdate1, formattedTodate1, false,false);
  }

  Future<void> deleteGoodsOrders(String? id) async {
    await stockManagementGoodsOrdersPresenter.deleteFacility(
      id,
      isLoading: true,
    );
  }

  void clearStoreData() {
    stockManagementGoodsOrdersPresenter.clearValue();
  }

  void clearTypeStoreData() {
    stockManagementGoodsOrdersPresenter.clearTypeValue();
  }
  void export() {
    getGoodsOrdersList(
      facilityId,
      formattedTodate1,
      formattedFromdate1,
      true,
      true
    );
  }
}
