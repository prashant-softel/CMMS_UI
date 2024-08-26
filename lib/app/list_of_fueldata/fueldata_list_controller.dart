
import 'dart:async';

import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/list_of_fueldata/fueldata_list_presenter.dart';
import 'package:cmms/domain/models/get_fueldata_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class FuelDataListController extends GetxController {
  FuelDataListController(
    this.fueldataListPresenter,
  );
  FuelDataListPresenter fueldataListPresenter;
  final HomeController homecontroller = Get.find();
  RxList<GetFuelDataList> fueldataList = <GetFuelDataList>[].obs;
  RxList<GetFuelDataList> filteredData = <GetFuelDataList>[].obs;
  Rx<DateTime> fromDate = DateTime.now().subtract(Duration(days: 7)).obs;
  Rx<DateTime> toDate = DateTime.now().obs;

  String get formattedFromdate =>
      DateFormat('dd/MM/yyyy').format(fromDate.value);
  String get formattedTodate => DateFormat('dd/MM/yyyy').format(toDate.value);
  String get formattedTodate1 => DateFormat('yyyy-MM-dd').format(toDate.value);
  String get formattedFromdate1 =>
      DateFormat('yyyy-MM-dd').format(fromDate.value);

  GetFuelDataList? getoccupationaList;
  RxList<String> occupationalListListTableColumns = <String>[].obs;
  bool openFromDateToStartDatePicker = false;

  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  Rx<int> fuelId = 0.obs;
   RxString dieselConsumedFilterText = ''.obs;
  RxString petrolConsumedFilterText = ''.obs;
  RxString petrolConsumedForGrassCuttingFilterText = ''.obs;
  RxString dieselConsumedAtSiteFilterText = ''.obs;
  RxString petrolConsumedAtSiteFilterText = ''.obs;
  RxString monthFilterText = ''.obs;
  RxString createdbyFilterText = ''.obs;
  RxString createdatFilterText = ''.obs;
  RxString actionFilterText = ''.obs;


  RxString userDateFilterText = ''.obs;

  final columnVisibility = ValueNotifier<Map<String, bool>>({
    "Diesel Consumed For Vehicles": true,
    "Petrol Consumed For Vehicles": true,
    "Petrol Consumed For Grass Cutting And Movers": true,
    "Diesel Consumed At Site": true,
    "Petrol Consumed At Site": true,
    "Month name": true,
    "Created At": true,
  });
  final Map<String, double> columnwidth = {
   "Diesel Consumed For Vehicles": 250,
    "Petrol Consumed For Vehicles": 250,
    "Petrol Consumed For Grass Cutting And Movers": 300,
    "Diesel Consumed At Site": 200,
    "Petrol Consumed At Site": 200,
    "Month name": 150,
    "Created At": 150,
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
       "Diesel Consumed For Vehicles": dieselConsumedFilterText,
    "Petrol Consumed For Vehicles": petrolConsumedFilterText,
    "Petrol Consumed For Grass Cutting And Movers": petrolConsumedForGrassCuttingFilterText,
    "Diesel Consumed At Site": dieselConsumedAtSiteFilterText,
    "Petrol Consumed At Site": petrolConsumedAtSiteFilterText,
    "Month name": monthFilterText,
    "Created At": createdatFilterText,

      "Action": actionFilterText,
      // "Status": statusFilterText,
    };
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 2), () async {
        getFuelConsumption(false);
      });
    });
    super.onInit();
  }

  void search(String keyword) {
    print('Keyword: $keyword');
    if (keyword.isEmpty) {
      fueldataList.value = filteredData.value;
      return;
    }
    List<GetFuelDataList> filteredList = filteredData
        .where((item) =>
            (item.dieselConsumedForVehicles
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) 
       
            )
        .toList();
    fueldataList.value = filteredList;
  }

  Future<void> getFuelConsumption(
     bool isExport) async {
    fueldataList.value = <GetFuelDataList>[];
    filteredData.value = <GetFuelDataList>[];

    final _goodsordersList =
        await fueldataListPresenter.getFuelConsumption(
            isLoading: isLoading.value,
            // start_date: startDate,
            // end_date: endDate,
            // facility_id: facilityId,
            isExport: isExport);
    fueldataList.value = _goodsordersList;
    isLoading.value = false;
    paginationController = PaginationController(
      rowCount: fueldataList.length,
      rowsPerPage: 10,
    );
    if (fueldataList.isNotEmpty) {
      filteredData.value = fueldataList.value;
      getoccupationaList = fueldataList[0];
      var newOccupationalListJson = getoccupationaList?.toJson();
      occupationalListListTableColumns.value = <String>[];
      for (var key in newOccupationalListJson?.keys.toList() ?? []) {
        occupationalListListTableColumns.add(key);
      }
    }
  }

  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {}
  }



  void clearStoreData() {
    fueldataListPresenter.clearValue();
  }

  
}