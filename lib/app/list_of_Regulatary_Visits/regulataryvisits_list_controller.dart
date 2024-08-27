import 'dart:async';

import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/list_of_Regulatary_Visits/regulataryvisits_list_presenter.dart';
import 'package:cmms/domain/models/get_visitandnotice_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class RegulataryDataListController extends GetxController {
  RegulataryDataListController(
    this.regulataryListPresenter,
  );
  RegulataryListPresenter regulataryListPresenter;
  final HomeController homecontroller = Get.find();
  // getVisitsAndNoticesDatalist

  RxList<GetVisitAndNoticeList> visitandnoticeList =
      <GetVisitAndNoticeList>[].obs;
  RxList<GetVisitAndNoticeList> filteredData = <GetVisitAndNoticeList>[].obs;
  Rx<DateTime> fromDate = DateTime.now().subtract(Duration(days: 7)).obs;
  Rx<DateTime> toDate = DateTime.now().obs;
  String get formattedFromdate =>
      DateFormat('dd/MM/yyyy').format(fromDate.value);
  String get formattedTodate => DateFormat('dd/MM/yyyy').format(toDate.value);
  String get formattedTodate1 => DateFormat('yyyy-MM-dd').format(toDate.value);
  String get formattedFromdate1 =>
      DateFormat('yyyy-MM-dd').format(fromDate.value);

  GetVisitAndNoticeList? getvisitandnoticeList;
  RxList<String> visitandnoticeListTableColumns = <String>[].obs;
  bool openFromDateToStartDatePicker = false;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  Rx<int> VisitAndNoticeId = 0.obs;

  RxString idFilterText = ''.obs;
  RxString monthnameFilterText = ''.obs;
  RxString govtAuthVisitsFilterText = ''.obs;
  RxString noOfFineByThirdPartyFilterText = ''.obs;
  RxString noOfShowCauseNoticesFilterText = ''.obs;
  RxString noticesToContractorFilterText = ''.obs;
  RxString amountOfPenaltiesFilterText = ''.obs;
  RxString anyOtherFilterText = ''.obs;
  RxString createdByFilterText = ''.obs;
  RxString createdAtFilterText = ''.obs;
  RxString actionFilterText = ''.obs;

  RxString userDateFilterText = ''.obs;

 final columnVisibility = ValueNotifier<Map<String, bool>>({
  "Id":true,
    "Govt. authorities visited": true,
    "Penalties third parties": true,
    "Cause notices third parties": true,
    "Notices issued by HFE to contractor": true,
    "Penalties contractor by HFE in Amount": true,
    "Any other": true,
    "Month name": true,
    "Created At": true,
  });
    final Map<String, double> columnwidth = {
      "Id":100,
    "Govt. authorities visited":100,
    "Penalties third parties": 200,
    "Cause notices third parties": 200,
    "Notices issued by HFE to contractor": 200,
    "Penalties contractor by HFE in Amount": 200,
    "Any other": 100,
    "Month name": 100,
    "Created At": 100,
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
     "Govt. authorities visited":govtAuthVisitsFilterText,
    "Penalties third parties": noOfFineByThirdPartyFilterText,
    "Cause notices third parties": noOfShowCauseNoticesFilterText,
    "Notices issued by HFE to contractor": noticesToContractorFilterText,
    "Penalties contractor by HFE in Amount": amountOfPenaltiesFilterText,
    "Any other": anyOtherFilterText,
    "Month name": monthnameFilterText,
    "Created At": createdAtFilterText,
    "Action":actionFilterText
    };
        facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 2), () async {
        getVisitsAndNoticesDatalist(false);
      });
    });
    super.onInit();

}
void search(String keyword) {
    print('Keyword: $keyword');
    if (keyword.isEmpty) {
      visitandnoticeList.value = filteredData.value;
      return;
    }
    List<GetVisitAndNoticeList> filteredList = filteredData
        .where((item) =>
            (item.govtAuthVisits
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) 
       
            )
        .toList();
    visitandnoticeList.value = filteredList;
  }
  Future<void> getVisitsAndNoticesDatalist(
     bool isExport) async {
    visitandnoticeList.value = <GetVisitAndNoticeList>[];
    filteredData.value = <GetVisitAndNoticeList>[];

    final _goodsordersList =
        await regulataryListPresenter.getVisitsAndNoticesDatalist(
            isLoading: isLoading.value,
            // start_date: startDate,
            // end_date: endDate,
            // facility_id: facilityId,
            isExport: isExport);
    visitandnoticeList.value = _goodsordersList;
    isLoading.value = false;
    paginationController = PaginationController(
      rowCount: visitandnoticeList.length,
      rowsPerPage: 10,
    );
    if (visitandnoticeList.isNotEmpty) {
      filteredData.value = visitandnoticeList.value;
      getvisitandnoticeList = visitandnoticeList[0];
      var newvisitandnoticeListJson = getvisitandnoticeList?.toJson();
      visitandnoticeListTableColumns.value = <String>[];
      for (var key in newvisitandnoticeListJson?.keys.toList() ?? []) {
        visitandnoticeListTableColumns.add(key);
      }
    }
  }
    void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {}
  }


 void clearStoreData() {
    regulataryListPresenter.clearValue();
  }
}

