

import 'dart:async';

import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/list_of_plantation/plantation_list_presenter.dart';
import 'package:cmms/domain/models/get_plantation_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class PlantationListController extends GetxController {
  PlantationListController(
    this.plantationlistPresenter,
  );
  PlantationListPresenter plantationlistPresenter;
  final HomeController homecontroller = Get.find();
  RxList<GetPlantationList> plantationList = <GetPlantationList>[].obs;
  RxList<GetPlantationList> filteredData = <GetPlantationList>[].obs;
  Rx<DateTime> fromDate = DateTime.now().subtract(Duration(days: 7)).obs;
  Rx<DateTime> toDate = DateTime.now().obs;

  String get formattedFromdate =>
      DateFormat('dd/MM/yyyy').format(fromDate.value);
  String get formattedTodate => DateFormat('dd/MM/yyyy').format(toDate.value);
  String get formattedTodate1 => DateFormat('yyyy-MM-dd').format(toDate.value);
  String get formattedFromdate1 =>
      DateFormat('yyyy-MM-dd').format(fromDate.value);
 GetPlantationList? selectedItem;
  GetPlantationList? getplantationlist;
  RxList<String> plantationListListTableColumns = <String>[].obs;
  bool openFromDateToStartDatePicker = false;

  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  Rx<int> planatationId = 0.obs;
   RxString idFilterText = ''.obs;
   RxString saplingsPlantedFilterText = ''.obs;
  RxString saplingsSurvivedFilterText = ''.obs;
  RxString saplingsDiedFilterText = ''.obs;
  RxString monthnameFilterText = ''.obs;
  RxString createdbyFilterText = ''.obs;
  RxString createdatFilterText = ''.obs;
  RxString actionFilterText = ''.obs;


  RxString userDateFilterText = ''.obs;

  final columnVisibility = ValueNotifier<Map<String, bool>>({
    "Id":true,
    "Saplings Planted": true,
    "Saplings Survived": true,
    "Saplings Died": true,
    "Month name": true,
    "Created At": true,
  });
  final Map<String, double> columnwidth = {
    "Id":100,
      "Saplings Planted": 250,
    "Saplings Survived": 250,
    "Saplings Died": 250,
    "Month name": 200,
    "Created At": 200,
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
      "Id":idFilterText,
         "Saplings Planted": saplingsPlantedFilterText,
    "Saplings Survived": saplingsSurvivedFilterText,
    "Saplings Died": saplingsDiedFilterText,
    "Month name": monthnameFilterText,
    "Created At": createdatFilterText,

      "Action": actionFilterText,
      // "Status": statusFilterText,
    };
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 2), () async {
        getplantationdata(false);
      });
    });
    super.onInit();
  }

  void search(String keyword) {
    print('Keyword: $keyword');
    if (keyword.isEmpty) {
      plantationList.value = filteredData.value;
      return;
    }
    List<GetPlantationList> filteredList = filteredData
        .where((item) =>
            (item.saplingsPlanted
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) 
       
            )
        .toList();
    plantationList.value = filteredList;
  }

  Future<void> getplantationdata(
     bool isExport) async {
    plantationList.value = <GetPlantationList>[];
    filteredData.value = <GetPlantationList>[];

    final _goodsordersList =
        await plantationlistPresenter.getplantationdata(
            isLoading: isLoading.value,
            // start_date: startDate,
            // end_date: endDate,
            // facility_id: facilityId,
            isExport: isExport);
    plantationList.value = _goodsordersList;
    isLoading.value = false;
    paginationController = PaginationController(
      rowCount: plantationList.length,
      rowsPerPage: 10,
    );
    if (plantationList.isNotEmpty) {
      filteredData.value = plantationList.value;
      getplantationlist = plantationList[0];
      var newOccupationalListJson = getplantationlist?.toJson();
      plantationListListTableColumns.value = <String>[];
      for (var key in newOccupationalListJson?.keys.toList() ?? []) {
        plantationListListTableColumns.add(key);
      }
    }
  }

  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {}
  }



  void clearStoreData() {
    plantationlistPresenter.clearValue();
  }

  
}
