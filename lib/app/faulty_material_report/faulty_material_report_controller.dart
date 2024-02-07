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
  RxString quantityFilterText = ''.obs;
  RxString remarkFilterText = ''.obs;

  final columnVisibility = ValueNotifier<Map<String, bool>>({
    "Assets Name": true,
    "Serial Number": true,
    "Replace Serial No.": true,
    "Inseted DateTime": true,
    "quantity": true,
    "Remark": true
  });
  final Map<String, double> columnwidth = {
    "Assets Name": 300,
    "Serial Number": 250,
    "Replace Serial No.": 250,
    "Inseted DateTime": 200,
    "quantity": 100,
    "Remark": 300,
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
      "Assets Name": assetNameFilterText,
      "Serial Number": serialNoFilterText,
      "Replace Serial No.": replaceFilterText,
      "Inseted DateTime": insetedFilterText,
      "quantity": quantityFilterText,
      "Remark": remarkFilterText,
    };
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 2), () {
        getFaultyMaterialReportList(
            facilityId, formattedTodate1, formattedFromdate1, true);
      });
    });
    super.onInit();
  }

  Future<void> getFaultyMaterialReportList(int facilityId, dynamic startDate,
      dynamic endDate, bool isLoading) async {
    faultyMaterialReportList.value = <FaultyMaterialReportModel>[];
    final _preventiveCheckList =
        await faultyMaterialReportPresenter.getFaultyMaterialReportList(
            facilityId: facilityId,
            isLoading: isLoading,
            startDate: startDate,
            endDate: endDate);

    if (_preventiveCheckList != null) {
      faultyMaterialReportList.value = _preventiveCheckList;
      filteredData.value = _preventiveCheckList;
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
                false))
        .toList();
    faultyMaterialReportList.value = filteredList;
  }

  void getPlantStockListByDate() {
    getFaultyMaterialReportList(
        facilityId, formattedTodate1, formattedFromdate1, true);
  }
}
