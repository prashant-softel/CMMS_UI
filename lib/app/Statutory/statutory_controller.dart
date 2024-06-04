import 'dart:async';

import 'package:cmms/app/Statutory/statutory_presenter.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/domain/models/get_statutory_list_model.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class StatutoryController extends GetxController {
  StatutoryController(
    this.statutoryPresenter,
  );
  StatutoryPresenter statutoryPresenter;
  final HomeController homecontroller = Get.find();
  RxList<GetStatutoryList> getStatutoryList = <GetStatutoryList>[].obs;
  RxList<GetStatutoryList> filteredData = <GetStatutoryList>[].obs;
  Rx<DateTime> fromDate = DateTime.now().subtract(Duration(days: 7)).obs;
  Rx<DateTime> toDate = DateTime.now().obs;

  String get formattedFromdate =>
      DateFormat('dd/MM/yyyy').format(fromDate.value);
  String get formattedTodate => DateFormat('dd/MM/yyyy').format(toDate.value);
  String get formattedTodate1 => DateFormat('yyyy-MM-dd').format(toDate.value);
  String get formattedFromdate1 =>
      DateFormat('yyyy-MM-dd').format(fromDate.value);

  GetStatutoryList? getStatutoryListModel;
  RxList<String> getStatutoryListTableColumns = <String>[].obs;
  bool openFromDateToStartDatePicker = false;

  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  Rx<int> StatutoryId = 0.obs;
  RxString idFilterText = ''.obs;
  RxString complianceFilterText = ''.obs;
  RxString statusOFApplicationFilterText = ''.obs;
  RxString dateofReceivedFilterText = ''.obs;
  RxString validityFilterText = ''.obs;
  RxString daysLeftFilterText = ''.obs;
  RxString expiresOnFilterText = ''.obs;
  RxString statusCodeFilterText = ''.obs;

  // RxString vendorFilterText = ''.obs;

  RxString userDateFilterText = ''.obs;

  final columnVisibility = ValueNotifier<Map<String, bool>>({
    "ID": true,
    "Compliance": true,
    "Status OF Application": true,
    "Date of received": true,
    "Validity": true,
    "Days Left": true,
    "Expires on": true,
    "Status Code": true,

    // "search": true,
  });
  final Map<String, double> columnwidth = {
    "ID": 153,
    "Compliance": 220,
    "Status OF Application": 120,
    "Date of received": 200,
    "Validity": 223,
    "Days Left": 153,
    "Expires on": 130,
    "Status Code": 100
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
      "ID": idFilterText,
      "Compliance": complianceFilterText,
      "Status OF Application": statusOFApplicationFilterText,
      "Date of received": dateofReceivedFilterText,
      "Validity": validityFilterText,
      "Days Left": daysLeftFilterText,
      "Expires on": expiresOnFilterText,
      "Status Code": statusCodeFilterText,
    };
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 2), () async {
        await getStatutoryDataList(
            facilityId, formattedTodate1, formattedFromdate1, false);
      });
    });
    super.onInit();
  }

  void search(String keyword) {
    print('Keyword: $keyword');
    if (keyword.isEmpty) {
      getStatutoryList.value = filteredData.value;
      return;
    }
    List<GetStatutoryList> filteredList = filteredData
        .where((item) =>
            (item.id?.toString().toLowerCase().contains(keyword.toLowerCase()) ?? false) ||
            (item.complianceId
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.approvedAt?.toString().toLowerCase().contains(keyword.toLowerCase()) ??
                false) ||
            (item.approvedBy?.toString().toLowerCase().contains(keyword.toLowerCase()) ??
                false) ||
            (item.createdAt?.toString().toLowerCase().contains(keyword.toLowerCase()) ??
                false) ||
            (item.createdBy?.toString().toLowerCase().contains(keyword.toLowerCase()) ??
                false) ||
            (item.expiresOn?.toString().toLowerCase().contains(keyword.toLowerCase()) ??
                false) ||
            (item.id?.toString().toLowerCase().contains(keyword.toLowerCase()) ??
                false) ||
            (item.issueDate?.toString().toLowerCase().contains(keyword.toLowerCase()) ??
                false) ||
            (item.renewFrom
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.renewFromId
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false))
        .toList();
    getStatutoryList.value = filteredList;
  }

  Future<void> getStatutoryDataList(
      int facilityId, dynamic startDate, dynamic endDate, bool isExport) async {
    getStatutoryList.value = <GetStatutoryList>[];
    filteredData.value = <GetStatutoryList>[];

    final _getStatutoryList = await statutoryPresenter.getStatutoryDataList(
        isLoading: isLoading.value,
        // start_date: startDate,
        // end_date: endDate,
        facility_id: facilityId,
        isExport: isExport);
    getStatutoryList.value = _getStatutoryList;
    isLoading.value = false;
    paginationController = PaginationController(
      rowCount: getStatutoryList.length,
      rowsPerPage: 10,
    );
    if (getStatutoryList.isNotEmpty) {
      filteredData.value = getStatutoryList.value;
      getStatutoryListModel = getStatutoryList[0];
      var getStatutoryListJson = getStatutoryListModel?.toJson();
      getStatutoryListTableColumns.value = <String>[];
      for (var key in getStatutoryListJson?.keys.toList() ?? []) {
        getStatutoryListTableColumns.add(key);
      }
    }
  }

  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {}
  }

  // void showAddGoodsOrdersDetails({int? id}) {
  //   Get.toNamed(Routes.updateGoodsOrdersDetailsScreen, arguments: id);
  //   print('Argument5:$id');
  // }

  // void viewAddGoodsOrdersDetails({int? id}) {
  //   Get.toNamed(Routes.viewGoodsOrders, arguments: id);
  //   print('Argument5:$id');
  // }

  // void getPmTaskListByDate() {
  //   getStatutoryDataList(facilityId, formattedFromdate1, formattedTodate1, false);
  // }

  // Future<void> deleteGoodsOrders(String? id) async {
  //   await statutoryPresenter.deleteFacility(
  //     id,
  //     isLoading: true,
  //   );
  // }

  // void clearStoreData() {
  //   statutoryPresenter.clearValue();
  // }

  // void clearTypeStoreData() {
  //   statutoryPresenter.clearTypeValue();
  // }

  void export() {
    getStatutoryDataList(
        facilityId, formattedTodate1, formattedFromdate1, true);
  }
}



// import 'dart:async';

// import 'package:cmms/app/Statutory/statutory_presenter.dart';
// import 'package:cmms/app/app.dart';

// import 'package:cmms/domain/models/business_list_model.dart';
// import 'package:cmms/domain/models/business_type_model.dart';
// import 'package:cmms/domain/models/facility_model.dart';
// import 'package:get/get.dart';

// class StatutoryController extends GetxController {
//   StatutoryController(
//     this.statutoryPresenter,
//   );
//   StatutoryPresenter statutoryPresenter;
//   HomeController homeController = Get.find();
//   RxList<BusinessListModel?> ownerList = <BusinessListModel>[].obs;
//   Rx<bool> isSelectedBusinessType = true.obs;

//   int selectedBusinessTypeId = 1;
//   Rx<String> selectedBusinessType = ''.obs;
//   RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;

//   Rx<String> selectedBlock = ''.obs;

//   StreamSubscription<int>? facilityIdStreamSubscription;
//   StreamSubscription<String>? facilityNameStreamSubscription;

//   ///
//   @override
//   void onInit() async {
//     super.onInit();
//   }

//   Future<void> getFacilityList({bool? isLoading}) async {
//     facilityList.value = <FacilityModel>[];
//     List<FacilityModel?>? _facilityList = <FacilityModel?>[];

//     _facilityList = await statutoryPresenter.getFacilityList();
//     if (_facilityList != null && _facilityList.isNotEmpty) {
//       facilityList.value = _facilityList;
//     }
//     if (facilityList.isNotEmpty) {
//       selectedBlock.value = facilityList[0]?.name ?? '';
//     }
//   }

//   void onValueChanged(dynamic list, dynamic value) {
//     switch (list.runtimeType) {
//       case RxList<BusinessTypeModel>:
//         {
//           if (value != "Please Select") {
//             int equipmentIndex = ownerList.indexWhere((x) => x?.name == value);
//           selectedBusinessTypeId = ownerList[equipmentIndex]?.id ?? 0;
            
//           }else{
//             selectedBusinessTypeId=0;

//           }
//         }
//         break;
//     }
//   }
// }
