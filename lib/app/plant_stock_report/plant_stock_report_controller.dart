// ignore_for_file: invalid_use_of_protected_member

import 'dart:async';

import 'package:cmms/app/plant_stock_report/plant_stock_report_presenter.dart';
import 'package:cmms/domain/models/get_asset_data_list_model.dart';
import 'package:cmms/domain/models/get_plant_Stock_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../home/home_controller.dart';

class PlantStockReportController extends GetxController {
  ///
  PlantStockReportController(
    this.pantStockReportPresenter,
  );
  PlantStockReportPresenter pantStockReportPresenter;
  final HomeController homecontroller = Get.find();
  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  RxList<PlantStockListModel?>plantStockList = <PlantStockListModel?>[].obs;
  RxList<StockDetails?> StockDetailsList = <StockDetails?>[].obs;
  RxList<StockDetails?> filteredData = <StockDetails?>[].obs;
  // For sorting
  RxString currentSortColumn = ''.obs;
  RxBool isAscending = true.obs;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  RxList<GetAssetDataModel?> assetList = <GetAssetDataModel>[].obs;

  StockDetails? plantStockListModel;
  PlantStockListModel? selectedItem;
  RxList<String> plantStockTableColumns = <String>[].obs;
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

  RxString assetNameFilterText = ''.obs;
  RxString assetsCodeFilterText = ''.obs;
  RxString assetTypeFilterText = ''.obs;

  RxString openingFilterText = ''.obs;
  RxString inwardFilterText = ''.obs;
  RxString outwardFilterText = ''.obs;
  RxString balanceFilterText = ''.obs;
  RxString actionFilterText = ''.obs;

  final columnVisibility = ValueNotifier<Map<String, bool>>({
    "Assets Name": true,
    "Assets Code": true,
    "Assets Type": true,
    "Opening": true,
    "Inward": true,
    "Outward": true,
    "Balance": true,
    "Action": true,
  });
  final Map<String, double> columnwidth = {
    "Assets Name": 350,
    "Assets Code": 150,
    "Assets Type": 180,
    "Opening": 150,
    "Inward": 150,
    "Outward": 150,
    "Balance": 150,
    "Action": 100,
  };
  Map<String, RxString> filterText = {};
  void setColumnVisibility(String columnName, bool isVisible) {
    final newVisibility = Map<String, bool>.from(columnVisibility.value)
      ..[columnName] = isVisible;
    columnVisibility.value = newVisibility;
    // print({"updated columnVisibility": columnVisibility});
  }

  void search(String keyword) {
    print('Keyword: $keyword');
    if (keyword.isEmpty) {
      StockDetailsList.value = filteredData;
      return;
    }
    List<StockDetails?> filteredList = filteredData
        .where((item) =>
            (item?.name
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.asset_code
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.asset_type
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.opening
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.inward?.toString().toLowerCase().contains(keyword.toLowerCase()) ??
                false) ||
            (item?.outward
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.balance
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false))
        .toList();

    StockDetailsList.value = filteredList;
  }

  ///
  Rx<bool> isLoading = true.obs;
  @override
  void onInit() async {
    this.filterText = {
      "Assets Name": assetNameFilterText,
      "Assets Code": assetsCodeFilterText,
      "Assets Type": assetTypeFilterText,
      "Opening": openingFilterText,
      "Inward": inwardFilterText,
      "Outward": outwardFilterText,
      "Balance": balanceFilterText,
      "Action": actionFilterText,
    };
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 1), () {
        getPlantStockList(facilityId, formattedTodate1, formattedFromdate1,
            false, selectedAssetsNameIdList.value);
      });
      Future.delayed(Duration(seconds: 1), () {
        getAssetList(facilityId);
      });
    });
    super.onInit();
  }

  Future<void> getAssetList(int _facilityId) async {
    assetList.clear();
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

  void export() {
    
    getPlantStockList(facilityId, formattedTodate1, formattedFromdate1, true,
        selectedAssetsNameIdList.value,
        isExportOnly: true);
  }

  Future<void> getPlantStockList(int facilityId, dynamic startDate,
      dynamic endDate, bool? isExport, List<int>? selectedAssetsNameIdList,
      {bool isExportOnly = false}) async {
    if (!isExportOnly) {
      plantStockList!.clear();
      plantStockList?.value = <PlantStockListModel>[];
      StockDetailsList.value = <StockDetails>[];
    }

    final _plantStockList = await pantStockReportPresenter.getPlantStockList(
        facilityId: facilityId,
        isLoading: isLoading.value,
        isExport: isExport,
        startDate: startDate,
        endDate: endDate,
        selectedAssetsNameIdList: selectedAssetsNameIdList);

    if (_plantStockList != null && !isExportOnly) {
      plantStockList?.value = _plantStockList;
      isLoading.value = false;

      for (var facility in _plantStockList) {
        for (var stockDetail in facility!.stockDetails) {
          StockDetailsList.add(stockDetail);
        }
      }

      filteredData.value = StockDetailsList.toList();

      paginationController = PaginationController(
        rowCount: StockDetailsList.length,
        rowsPerPage: 10,
      );
    }
  }

  void getPlantStockListByDate() {
    getPlantStockList(facilityId, formattedTodate1, formattedFromdate1, false,
        selectedAssetsNameIdList.value);
  }

  void onValueChanged(dynamic list, dynamic value) {
    print({"valuevaluevaluevalue": value});
    switch (list.runtimeType) {
      case const (RxList<GetAssetDataModel>):
        {
          if (value != "Please Select") {
            if (value != null) {
              for (var selectedItem in value) {
                int equipCatIndex =
                    assetList.indexWhere((x) => x?.name == selectedItem);
                if (equipCatIndex >= 0) {
                  selectedAssetsNameIdList
                      .add(assetList[equipCatIndex]?.id ?? 0);
                }
              }
            }

            print('First Category Id:$selectedAssetsNameIdList');
            plantStockList?.value = <PlantStockListModel>[];

            getPlantStockList(facilityId, formattedTodate1, formattedFromdate1,
                false, selectedAssetsNameIdList.value);
          } else {
            // selectedAssetsNameIdList=0;
          }
        }
        break;
    }
    // print({"selectedfrequency": selectedfrequency});
  }

  void clearStoreData() {
    pantStockReportPresenter.clearValue();
  }

  void clearStorestartData() {
    pantStockReportPresenter.clearstartValue();
  }

  void clearStoreendData() {
    pantStockReportPresenter.clearendValue();
  }
  void sortData(String columnName) {
    if (currentSortColumn.value == columnName) {
      isAscending.value = !isAscending.value;
    } else {
      currentSortColumn.value = columnName;
      isAscending.value = true;
    }
    switch (columnName) {
      case 'Assets Name':
        StockDetailsList.sort((a, b) => isAscending.value
            ? (a?.name ?? '').compareTo(b?.name ?? '')
            : (b?.name ?? '').compareTo(a?.name ?? ''));
        break;
      case 'Assets Code':
        StockDetailsList.sort((a, b) => isAscending.value
            ? (a?.asset_code ?? '').compareTo(b?.asset_code ?? '')
            : (b?.asset_code ?? '').compareTo(a?.asset_code ?? ''));
        break;
      case 'Assets Type':
        StockDetailsList.sort((a, b) => isAscending.value
            ? (a?.asset_type ?? '').compareTo(b?.asset_type ?? '')
            : (b?.asset_type ?? '').compareTo(a?.asset_type ?? ''));
        break;
      case 'Opening':
        StockDetailsList.sort((a, b) => isAscending.value
            ? (a?.opening ?? 0)
                .compareTo(b?.opening ?? 0)
            : (b?.opening ?? 0)
                .compareTo(a?.opening ?? 0));
        break;
      case 'Inward':
        StockDetailsList.sort((a, b) => isAscending.value
            ? (a?.inward ?? 0).compareTo(b?.inward ?? 0)
            : (b?.inward ?? 0).compareTo(a?.inward ?? 0));
        break;

      case 'Outward':
        StockDetailsList.sort((a, b) => isAscending.value
            ? (a?.outward ?? 0).compareTo(b?.outward ?? 0)
            : (b?.outward ?? 0).compareTo(a?.outward ?? 0));
        break;
      case 'Balance':
        StockDetailsList.sort((a, b) => isAscending.value
            ? (a?.balance ?? 0).compareTo(b?.balance ?? 0)
            : (b?.balance ?? 0).compareTo(a?.balance ?? 0));
        break;
      default:
        break;
    }
    update();
  }
}
