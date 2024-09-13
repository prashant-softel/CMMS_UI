import 'dart:async';

import 'package:cmms/app/faulty_material_report/faulty_material_report_presenter.dart';
import 'package:cmms/domain/models/get_plant_Stock_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/get_faulty_material_report_model.dart';
import '../home/home_controller.dart';

class FaultyMaterialReportController extends GetxController {
  ///
  FaultyMaterialReportController(
    this.faultyMaterialReportPresenter,
  );
  FaultyMaterialReportPresenter faultyMaterialReportPresenter;
  final HomeController homecontroller = Get.find();
  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  RxList<FaultyMaterialReportModel?> faultyMaterialReportList =
      <FaultyMaterialReportModel?>[].obs;
  RxList<FaultyMaterialReportModel?> filteredData =
      <FaultyMaterialReportModel?>[].obs;
       // For sorting
  RxString currentSortColumn = ''.obs;
  RxBool isAscending = true.obs;

  FaultyMaterialReportModel? faultyMaterialReportModel;

  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );

  StockDetails? plantStockListModel;
  PlantStockListModel? selectedItem;
  RxList<String> faultyMaterialReportTableColumns = <String>[].obs;
  Rx<DateTime> fromDate = DateTime.now().subtract(Duration(days: 7)).obs;
  Rx<DateTime> toDate = DateTime.now().obs;
  bool openFromDateToStartDatePicker = false;
  String get formattedFromdate =>
      DateFormat('dd/MM/yyyy').format(fromDate.value);
  String get formattedTodate => DateFormat('dd/MM/yyyy').format(toDate.value);
  String get formattedTodate1 => DateFormat('yyyy-MM-dd').format(toDate.value);
  String get formattedFromdate1 =>
      DateFormat('yyyy-MM-dd').format(fromDate.value);
  RxString assetNameFilterText = ''.obs;
  RxString serialNoFilterText = ''.obs;
  RxString replaceFilterText = ''.obs;
  RxString insetedFilterText = ''.obs;
 // RxString quantityFilterText = ''.obs;
  RxString remarkFilterText = ''.obs;
  RxString createdByNameFilterText = ''.obs;

  final columnVisibility = ValueNotifier<Map<String, bool>>({
    "Assets Name": true,
    "Serial Number": true,
    // "Replace Serial No.": true,
    "Inserted DateTime": true,
   // "quantity": true,
    "Remark": true,
    "Returned By": true
  });
  final Map<String, double> columnwidth = {
    "Assets Name": 350,
    "Serial Number": 200,
    // "Replace Serial No.": 250,
    "Inserted DateTime": 225,
   // "quantity": 100,
    "Remark": 150,
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
      "Assets Name": assetNameFilterText,
      "Serial Number": serialNoFilterText,
      // "Replace Serial No.": replaceFilterText,
      "Inserted DateTime": insetedFilterText,
     // "quantity": quantityFilterText,
      "Remark": remarkFilterText,
      "Returned By": createdByNameFilterText,
    };
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 2), () {
        getFaultyMaterialReportList(
            facilityId, formattedTodate1, formattedFromdate1);
      });
    });
    super.onInit();
  }

  Future<void> getFaultyMaterialReportList(
      int facilityId, dynamic startDate, dynamic endDate) async {
    faultyMaterialReportList.value = <FaultyMaterialReportModel>[];
    final _preventiveCheckList =
        await faultyMaterialReportPresenter.getFaultyMaterialReportList(
            facilityId: facilityId,
            isLoading: isLoading.value,
            startDate: startDate,
            endDate: endDate);

    if (_preventiveCheckList != null) {
      faultyMaterialReportList.value = _preventiveCheckList;
      filteredData.value = _preventiveCheckList;
      isLoading.value = false;
      paginationController = PaginationController(
        rowCount: faultyMaterialReportList.length ?? 0,
        rowsPerPage: 10,
      );

      if (faultyMaterialReportList.isNotEmpty) {
        faultyMaterialReportModel = faultyMaterialReportList[0];
        var preventiveCheckListJson = faultyMaterialReportModel?.toJson();
        faultyMaterialReportTableColumns.value = <String>[];
        for (var key in preventiveCheckListJson?.keys.toList() ?? []) {
          faultyMaterialReportTableColumns.add(key);
        }
      }
    }
  }

  void search(String keyword) {
    if (keyword.isEmpty) {
      faultyMaterialReportList.value = filteredData;
      return;
    }
    List<FaultyMaterialReportModel?> filteredList = filteredData
        .where((item) =>
            (item?.asset_name
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.serial_number
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.replaceSerialNo
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.lastInsetedDateTime
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.qty
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.remarks
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.createdByName
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase())?? false))
        .toList();
    faultyMaterialReportList.value = filteredList;
  }

  void getPlantStockListByDate() {
    getFaultyMaterialReportList(
        facilityId, formattedTodate1, formattedFromdate1);
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
        faultyMaterialReportList.sort((a, b) => isAscending.value
            ? (a?.asset_name ?? '').compareTo(b?.asset_name ?? '')
            : (b?.asset_name ?? '').compareTo(a?.asset_name ?? ''));
        break;
      case 'Serial Number':
        faultyMaterialReportList.sort((a, b) => isAscending.value
            ? (a?.serial_number ?? '').compareTo(b?.serial_number ?? '')
            : (b?.serial_number ?? '').compareTo(a?.serial_number ?? ''));
        break;
      case 'Inserted DateTime':
        faultyMaterialReportList.sort((a, b) => isAscending.value
            ? (a?.lastInsetedDateTime ?? '').compareTo(b?.lastInsetedDateTime ?? '')
            : (b?.lastInsetedDateTime ?? '').compareTo(a?.lastInsetedDateTime ?? ''));
        break;
      case 'Remark':
        faultyMaterialReportList.sort((a, b) => isAscending.value
            ? (a?.remarks ?? '')
                .compareTo(b?.remarks ?? '')
            : (b?.remarks ?? '')
                .compareTo(a?.remarks ?? ''));
        break;
      case 'Returned By':
        faultyMaterialReportList.sort((a, b) => isAscending.value
            ? (a?.createdByName ?? '').compareTo(b?.createdByName ?? '')
            : (b?.createdByName ?? '').compareTo(a?.createdByName ?? ''));
        break;
      default:
        break;
    }
    update();
  }
}
