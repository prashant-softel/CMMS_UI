import 'dart:async';

import 'package:cmms/app/transaction_report/transaction_report_presenter.dart';
import 'package:cmms/domain/models/get_asset_data_list_model.dart';
import 'package:cmms/domain/models/get_plant_Stock_list.dart';
import 'package:cmms/domain/models/get_transction_report_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../home/home_controller.dart';

class TransactionStockReportController extends GetxController {
  ///
  TransactionStockReportController(
    this.pantStockReportPresenter,
  );
  TransactionStockReportPresenter pantStockReportPresenter;
  final HomeController homecontroller = Get.find();
  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  RxList<TransactionStockReportListModel?>? transactionStockList =
      <TransactionStockReportListModel?>[].obs;

  RxList<GetAssetDataModel?> assetList = <GetAssetDataModel>[].obs;

  Rx<DateTime> fromDate = DateTime.now().subtract(Duration(days: 7)).obs;
  Rx<DateTime> toDate = DateTime.now().obs;
  bool openFromDateToStartDatePicker = false;
  String get formattedFromdate =>
      DateFormat('dd/MM/yyyy').format(fromDate.value);
  String get formattedTodate => DateFormat('dd/MM/yyyy').format(toDate.value);
  String get formattedTodate1 => DateFormat('yyyy-MM-dd').format(toDate.value);
  String get formattedFromdate1 =>
      DateFormat('yyyy-MM-dd').format(fromDate.value);
  RxList<GetAssetDataModel?> selectedAssetsNameList = <GetAssetDataModel>[].obs;
  RxList<int> selectedAssetsNameIdList = <int>[].obs;

  RxString assetsIdFilterText = ''.obs;
  RxString assetNameFilterText = ''.obs;

  RxString fromActorFilterText = ''.obs;

  RxString toActorFilterText = ''.obs;
  RxString quntityFilterText = ''.obs;

  final columnVisibility = ValueNotifier<Map<String, bool>>({
    "Assets ID": true,
    "Assets Name": true,
    "From Actor Name": true,
    "To Actor Name": true,
    "Quntity": true,
  });
  final Map<String, double> columnwidth = {
    "Assets ID": 150,
    "Assets Name": 300,
    "From Actor Name": 250,
    "To Actor Name": 250,
    "Quntity": 200,
  };
  Map<String, RxString> filterText = {};
  void setColumnVisibility(String columnName, bool isVisible) {
    final newVisibility = Map<String, bool>.from(columnVisibility.value)
      ..[columnName] = isVisible;
    columnVisibility.value = newVisibility;
    // print({"updated columnVisibility": columnVisibility});
  }

  ///
  @override
  void onInit() async {
    this.filterText = {
      "Assets ID": assetsIdFilterText,
      "Assets Name": assetNameFilterText,
      "From Actor Name": fromActorFilterText,
      "To Actor Name": toActorFilterText,
      "Quntity": quntityFilterText,
    };
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 2), () {
        gettransactionStockList(facilityId, formattedTodate1,
            formattedFromdate1, true, selectedAssetsNameIdList.value);
      });
      Future.delayed(Duration(seconds: 2), () {
        getAssetList(facilityId);
      });
    });
    super.onInit();
  }

  Future<void> getAssetList(int _facilityId) async {
    assetList.value = <GetAssetDataModel>[];
    final _assetList =
        await pantStockReportPresenter.getAssetList(facilityId: facilityId);
    // print('jkncejknce:$facilityId');
    if (_assetList != null) {
      for (var asset in _assetList) {
        assetList.add(asset);
      }
      update(["AssetList"]);
    }
  }

  Future<void> gettransactionStockList(
      int facilityId,
      dynamic startDate,
      dynamic endDate,
      bool isLoading,
      List<int>? selectedAssetsNameIdList) async {
    transactionStockList?.value = <TransactionStockReportListModel>[];
    final _transactionStockList =
        await pantStockReportPresenter.getTransactionStockList(
            facilityId: facilityId,
            isLoading: isLoading,
            startDate: startDate,
            endDate: endDate,
            selectedAssetsNameIdList: selectedAssetsNameIdList);

    if (_transactionStockList != null) {
      for (var transaction in _transactionStockList) {
        transactionStockList!.add(transaction);
      }
      //   paginationController = PaginationController(
      //     rowCount: StockDetailsList?.length ?? 0,
      //     rowsPerPage: 10,
      //   );
      //   if (StockDetailsList != null && StockDetailsList!.isNotEmpty) {
      //     transactionStockListModel = StockDetailsList![0];
      //     var transactionStockListJson = transactionStockListModel?.toJson();
      //     plantStockTableColumns.value = <String>[];
      //     for (var key in transactionStockListJson?.keys.toList() ?? []) {
      //       plantStockTableColumns.add(key);
      //     }
      //   }
    }
  }

  void gettransactionStockListByDate() {
    gettransactionStockList(facilityId, formattedTodate1, formattedFromdate1,
        true, selectedAssetsNameIdList.value);
  }
}
