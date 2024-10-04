// ignore_for_file: invalid_use_of_protected_member

import 'dart:async';

import 'package:cmms/app/plant_stock_report/plant_stock_report_presenter.dart';
import 'package:cmms/app/sm_report/sm_report_list_presenter.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/get_asset_data_list_model.dart';
import 'package:cmms/domain/models/get_plant_Stock_list.dart';
import 'package:cmms/domain/models/sm_report_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../home/home_controller.dart';

class SmReportController extends GetxController {
  ///
  SmReportController(
    this.smReportPresenter,
  );
  SmReportPresenter smReportPresenter;
  final HomeController homecontroller = Get.find();
  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  RxList<int> selectedFacilityIdList = <int>[].obs;
  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;

  RxList<SmReportListModel?> smReportList = <SmReportListModel?>[].obs;
  RxList<SmReportListModel?> filteredData = <SmReportListModel?>[].obs;
  // For sorting
  RxString currentSortColumn = ''.obs;
  RxBool isAscending = true.obs;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  // RxList<GetAssetDataModel?> assetList = <GetAssetDataModel>[].obs;

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
  RxList<int> selectedFacilities = <int>[].obs;
  RxList<FacilityModel?> facilityNameList = <FacilityModel>[].obs;

  RxString materialCodeFilterText = ''.obs;
  RxString materialcategoryFilterText = ''.obs;
  RxString materialdesFilterText = ''.obs;

  RxString companyCodeFilterText = ''.obs;
  RxString plantCodeFilterText = ''.obs;
  RxString plantNameFilterText = ''.obs;
  RxString inwardFilterText = ''.obs;
  RxString outwardFilterText = ''.obs;
  RxString MinQntyFilterText = ''.obs;
  RxString actQntyFilterText = ''.obs;
  RxString deviationFilterText = ''.obs;
  RxString amountFilterText = ''.obs;
  RxString consumptionFilterText = ''.obs;
  RxString quantityFilterText = ''.obs;

  final columnVisibility = ValueNotifier<Map<String, bool>>({
    "Material code": true,
    "Material category": true,
    "Material Description": true,
    "Company Code": true,

    // "Plant code": true,
    // "Plant Name": true,
    "Inward": true,
    "Outward": true,
    "Min Available Qnty": true,
    "Act Available Qnty": true,
    "Deviation": true, "Consumption date": true,
    "Quantity": true,
    "Amount": true,
  });
  final Map<String, double> columnwidth = {
    "Material code": 200,
    "Material category": 200,
    "Material Description": 200,
    "Company Code": 200,
    // "Plant code": 200,
    // "Plant Name": 200,
    "Inward": 200,
    "Outward": 200,
    "Min Available Qnty": 200,
    "Act Available Qnty": 200,
    "Deviation": 200, "Consumption date": 200,
    "Quantity": 200,

    "Amount": 200,
  };
  Map<String, RxString> filterText = {};
  void setColumnVisibility(String columnName, bool isVisible) {
    final newVisibility = Map<String, bool>.from(columnVisibility.value)
      ..[columnName] = isVisible;
    columnVisibility.value = newVisibility;
    // print({"updated columnVisibility": columnVisibility});
  }

  // void search(String keyword) {
  //   print('Keyword: $keyword');
  //   if (keyword.isEmpty) {
  //     StockDetailsList.value = filteredData;
  //     return;
  //   }
  //   List<StockDetails?> filteredList = filteredData
  //       .where((item) =>
  //           (item?.name
  //                   ?.toString()
  //                   .toLowerCase()
  //                   .contains(keyword.toLowerCase()) ??
  //               false) ||
  //           (item?.asset_code
  //                   ?.toString()
  //                   .toLowerCase()
  //                   .contains(keyword.toLowerCase()) ??
  //               false) ||
  //           (item?.asset_type
  //                   ?.toString()
  //                   .toLowerCase()
  //                   .contains(keyword.toLowerCase()) ??
  //               false) ||
  //           (item?.opening
  //                   ?.toString()
  //                   .toLowerCase()
  //                   .contains(keyword.toLowerCase()) ??
  //               false) ||
  //           (item?.inward?.toString().toLowerCase().contains(keyword.toLowerCase()) ??
  //               false) ||
  //           (item?.outward
  //                   ?.toString()
  //                   .toLowerCase()
  //                   .contains(keyword.toLowerCase()) ??
  //               false) ||
  //           (item?.balance
  //                   ?.toString()
  //                   .toLowerCase()
  //                   .contains(keyword.toLowerCase()) ??
  //               false))
  //       .toList();

  //   StockDetailsList.value = filteredList;
  // }

  var isToggleOn = false.obs;

  void toggle() {
    isToggleOn.value = !isToggleOn.value;
    smReportList.value = <SmReportListModel>[];
  }

  ///
  Rx<bool> isLoading = true.obs;
  @override
  void onInit() async {
    this.filterText = {
      "Material code": materialCodeFilterText,
      "Material category": materialcategoryFilterText,
      "Material Description": materialdesFilterText,
      "Company Code": companyCodeFilterText,
      // "Plant code": plantCodeFilterText,
      // "Plant Name": plantNameFilterText,
      "Inward": inwardFilterText,
      "Outward": outwardFilterText,
      "Min Available Qnty": MinQntyFilterText,
      "Act Available Qnty": actQntyFilterText,
      "Deviation": deviationFilterText,
      "Consumption date": consumptionFilterText,
      "Quantity": quantityFilterText,
      "Amount": amountFilterText,
    };
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      // Future.delayed(Duration(seconds: 1), () {
      //   getPlantStockList(facilityId, formattedTodate1, formattedFromdate1,
      //       false, selectedAssetsNameIdList.value);
      // });
      // Future.delayed(Duration(seconds: 1), () {
      //   getAssetList(facilityId);
      // });
      getFacilityList();
    });
    super.onInit();
  }

  Future<void> getFacilityList() async {
    facilityNameList.value = <FacilityModel>[];
    final _facilityNameList = await smReportPresenter.getFacilityList(
        // categoryIds: categoryIds,
        );
    for (var facility_list in _facilityNameList!) {
      facilityNameList.add(facility_list);
    }
    update(['facility-list']);
  }

  Future<void> getAssetList() async {
    // selectedAssetsNameList.clear();
    selectedAssetsNameList.value = <GetAssetDataModel>[];
    String lststrFacilityIds = selectedFacilities.join(',');

    final _assetList =
        await smReportPresenter.getAssetList(facilityId: lststrFacilityIds);

    if (_assetList != null) {
      for (var asset in _assetList) {
        selectedAssetsNameList.add(asset);
      }
      print(selectedAssetsNameList); // Debugging: Check if this has data
      update(["AssetList"]); // Update the GetX controller to refresh the UI
    }
  }

  // void export() {
  //   getPlantStockList(facilityId, formattedTodate1, formattedFromdate1, true,
  //       selectedAssetsNameIdList.value,
  //       isExportOnly: true);
  // }

  Future<void> getAvailbleSmReportList() async {
    String lststrAssetsIds = selectedAssetsNameIdList.join(',');
    String lststrFacilityIds = selectedFacilities.join(',');

    smReportList.value = <SmReportListModel>[];
    filteredData.value = <SmReportListModel>[];

    final _smReportList = await smReportPresenter.getAvailbleSmReportList(
      facilityId: lststrFacilityIds,
      isLoading: isLoading.value,
      startDate: formattedTodate1,
      endDate: formattedFromdate1,
      selectedAssetsNameIdList: lststrAssetsIds,
    );

    if (_smReportList != null) {
      smReportList.value = _smReportList;
      isLoading.value = false;

      filteredData.value = smReportList.toList();
    }
  }

  Future<void> getCansumeSmReportList() async {
    String lststrAssetsIds = selectedAssetsNameIdList.join(',');
    String lststrFacilityIds = selectedFacilities.join(',');

    smReportList.value = <SmReportListModel>[];
    filteredData.value = <SmReportListModel>[];

    final _smReportList = await smReportPresenter.getCansumeSmReportList(
        facilityId: lststrFacilityIds,
        isLoading: isLoading.value,
        startDate: formattedTodate1,
        endDate: formattedFromdate1,
        selectedAssetsNameIdList: lststrAssetsIds);

    if (_smReportList != null) {
      smReportList.value = _smReportList;
      isLoading.value = false;

      filteredData.value = smReportList.toList();
    }
  }
  // void getPlantStockListByDate() {
  //   getPlantStockList(facilityId, formattedTodate1, formattedFromdate1, false,
  //       selectedAssetsNameIdList.value);
  // }

  void onValueChanged(dynamic list, dynamic value) {
    print({"valuevaluevaluevalue": value});
    switch (list.runtimeType) {
      case const (RxList<GetAssetDataModel>):
        {
          if (value != "Please Select") {
            if (value != null) {
              for (var selectedItem in value) {
                int equipCatIndex = selectedAssetsNameList
                    .indexWhere((x) => x?.name == selectedItem);
                if (equipCatIndex >= 0) {
                  selectedAssetsNameIdList
                      .add(selectedAssetsNameList[equipCatIndex]?.id ?? 0);
                }
              }
            }

            print('First Category Id:$selectedAssetsNameIdList');
          } else {
            // selectedAssetsNameIdList=0;
          }
        }
        break;
    }
    // print({"selectedfrequency": selectedfrequency});
  }

  void sortData(String columnName) {
    if (currentSortColumn.value == columnName) {
      isAscending.value = !isAscending.value;
    } else {
      currentSortColumn.value = columnName;
      isAscending.value = true;
    }
    switch (columnName) {
      case 'Material code':
        smReportList.sort((a, b) => isAscending.value
            ? (a?.asset_code ?? '').compareTo(b?.asset_code ?? '')
            : (b?.asset_code ?? '').compareTo(a?.asset_code ?? ''));
        break;
      case 'Material category':
        smReportList.sort((a, b) => isAscending.value
            ? (a?.material_Category ?? '').compareTo(b?.material_Category ?? '')
            : (b?.material_Category ?? '')
                .compareTo(a?.material_Category ?? ''));
        break;
      case 'Material Description':
        smReportList.sort((a, b) => isAscending.value
            ? (a?.asset_type ?? '').compareTo(b?.asset_type ?? '')
            : (b?.asset_type ?? '').compareTo(a?.asset_type ?? ''));
        break;
      case 'Company Code':
        smReportList.sort((a, b) => isAscending.value
            ? (a?.opening ?? 0).compareTo(b?.opening ?? 0)
            : (b?.opening ?? 0).compareTo(a?.opening ?? 0));
        break;
      case 'Plant Name':
        smReportList.sort((a, b) => isAscending.value
            ? (a?.facility_Name ?? "").compareTo(b?.facility_Name ?? "")
            : (b?.facility_Name ?? "").compareTo(a?.facility_Name ?? ""));
        break;
      case 'Inward':
        smReportList.sort((a, b) => isAscending.value
            ? (a?.inward ?? 0).compareTo(b?.inward ?? 0)
            : (b?.inward ?? 0).compareTo(a?.inward ?? 0));
        break;

      case 'Outward':
        smReportList.sort((a, b) => isAscending.value
            ? (a?.outward ?? 0).compareTo(b?.outward ?? 0)
            : (b?.outward ?? 0).compareTo(a?.outward ?? 0));
        break;
      case 'Min Available Qnty':
        smReportList.sort((a, b) => isAscending.value
            ? (a?.min_available_qty ?? 0).compareTo(b?.min_available_qty ?? 0)
            : (b?.min_available_qty ?? 0).compareTo(a?.min_available_qty ?? 0));
        break;
      case 'Act Available Qnty':
        smReportList.sort((a, b) => isAscending.value
            ? (a?.act_available_qty ?? 0).compareTo(b?.act_available_qty ?? 0)
            : (b?.act_available_qty ?? 0).compareTo(a?.act_available_qty ?? 0));
        break;
      case 'Deviation':
        smReportList.sort((a, b) => isAscending.value
            ? (a?.outward ?? 0).compareTo(b?.outward ?? 0)
            : (b?.outward ?? 0).compareTo(a?.outward ?? 0));
        break;
      case 'Amount':
        smReportList.sort((a, b) => isAscending.value
            ? (a?.outward ?? 0).compareTo(b?.outward ?? 0)
            : (b?.outward ?? 0).compareTo(a?.outward ?? 0));
        break;
      default:
        break;
    }
    update();
  }

  void facilitySelected(_facilities) {
    selectedFacilities.value = <int>[];
    for (var _selectedFacility in _facilities) {
      selectedFacilities.add(_selectedFacility);
    }
    getAssetList();
    print("${selectedFacilities}");
  }

  void materialSelected(_selectedMaterialIds) {
    selectedAssetsNameIdList.value = <int>[];
    for (var _selectedId in _selectedMaterialIds) {
      selectedAssetsNameIdList.add(_selectedId);
    }
  }
}
