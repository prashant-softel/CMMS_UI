
import 'dart:async';

import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/list_of_kaizensdata/kaizensdata_list_presenter.dart';
import 'package:cmms/domain/models/get_kaizensdata_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class KaizensDataListController extends GetxController {
  KaizensDataListController(
    this.kaizensdataListPresenter,
  );
  KaizensDataListPresenter kaizensdataListPresenter;
  final HomeController homecontroller = Get.find();
  RxList<GetKaizensDataList> kaizensdataList = <GetKaizensDataList>[].obs;
  RxList<GetKaizensDataList> filteredData = <GetKaizensDataList>[].obs;
  Rx<DateTime> fromDate = DateTime.now().subtract(Duration(days: 7)).obs;
  Rx<DateTime> toDate = DateTime.now().obs;

  String get formattedFromdate =>
      DateFormat('dd/MM/yyyy').format(fromDate.value);
  String get formattedTodate => DateFormat('dd/MM/yyyy').format(toDate.value);
  String get formattedTodate1 => DateFormat('yyyy-MM-dd').format(toDate.value);
  String get formattedFromdate1 =>
      DateFormat('yyyy-MM-dd').format(fromDate.value);

  GetKaizensDataList? getkaizensList;
  RxList<String> kaizensListListTableColumns = <String>[].obs;
  bool openFromDateToStartDatePicker = false;

  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  Rx<int> kaizensId = 0.obs;

   RxString idFilterText = ''.obs;
   RxString kaizensImplementedFilterText = ''.obs;
  RxString costForImplementationFilterText = ''.obs;
  RxString costSavedFromImplementationFilterText = ''.obs;
  RxString monthnameFilterText = ''.obs;
  RxString createdbyFilterText = ''.obs;
  RxString createdatFilterText = ''.obs;
  RxString actionFilterText = ''.obs;


  RxString userDateFilterText = ''.obs;

  final columnVisibility = ValueNotifier<Map<String, bool>>({
    "Id":true,
    "Kaizens Implemented": true,
    "Cost For Implementation": true,
    "Cost Saved From Implementation": true,
    "Month name": true,
    "Created At": true,
  });
  final Map<String, double> columnwidth = {
    "Id":100,
   "Kaizens Implemented": 250,
    "Cost For Implementation": 250,
    "Cost Saved From Implementation": 300,
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
      "Id":idFilterText,
     "Kaizens Implemented": kaizensImplementedFilterText,
    "Cost For Implementation": costForImplementationFilterText,
    "Cost Saved From Implementation": costSavedFromImplementationFilterText,
    "Month name": monthnameFilterText,
    "Created At": createdatFilterText,
      "Action": actionFilterText,
      // "Status": statusFilterText,
    };
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 2), () async {
        getkaizensdata(false);
      });
    });
    super.onInit();
  }

  void search(String keyword) {
    print('Keyword: $keyword');
    if (keyword.isEmpty) {
      kaizensdataList.value = filteredData.value;
      return;
    }
    List<GetKaizensDataList> filteredList = filteredData
        .where((item) =>
            (item.costForImplementation
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) 
       
            )
        .toList();
    kaizensdataList.value = filteredList;
  }

  Future<void> getkaizensdata(
     bool isExport) async {
    kaizensdataList.value = <GetKaizensDataList>[];
    filteredData.value = <GetKaizensDataList>[];

    final _goodsordersList =
        await kaizensdataListPresenter.getkaizensdata(
            isLoading: isLoading.value,
            // start_date: startDate,
            // end_date: endDate,
            // facility_id: facilityId,
            isExport: isExport);
    kaizensdataList.value = _goodsordersList;
    isLoading.value = false;
    paginationController = PaginationController(
      rowCount: kaizensdataList.length,
      rowsPerPage: 10,
    );
    if (kaizensdataList.isNotEmpty) {
      filteredData.value = kaizensdataList.value;
      getkaizensList = kaizensdataList[0];
      var newOccupationalListJson = getkaizensList?.toJson();
      kaizensListListTableColumns.value = <String>[];
      for (var key in newOccupationalListJson?.keys.toList() ?? []) {
        kaizensListListTableColumns.add(key);
      }
    }
  }

  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {}
  }



  void clearStoreData() {
    kaizensdataListPresenter.clearValue();
  }

  
}
