import 'dart:async';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/mis_list_of_observation/observation_list_presenter.dart';
import 'package:cmms/domain/models/get_observation_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class ObservationListController extends GetxController {
  ObservationListController(
    this.observationListPresenter,
  );
  ObservationListPresenter observationListPresenter;
  final HomeController homecontroller = Get.find();
  RxList<GetObservationList> getObservationList = <GetObservationList>[].obs;
  RxList<GetObservationList> filteredData = <GetObservationList>[].obs;
  Rx<DateTime> fromDate = DateTime.now().subtract(Duration(days: 7)).obs;
  Rx<DateTime> toDate = DateTime.now().obs;

  String get formattedFromdate =>
      DateFormat('dd/MM/yyyy').format(fromDate.value);
  String get formattedTodate => DateFormat('dd/MM/yyyy').format(toDate.value);
  String get formattedTodate1 => DateFormat('yyyy-MM-dd').format(toDate.value);
  String get formattedFromdate1 =>
      DateFormat('yyyy-MM-dd').format(fromDate.value);

  GetObservationList? getObservationListModel;
  RxList<String> getObservationListTableColumns = <String>[].obs;
  bool openFromDateToStartDatePicker = false;
  // For sorting
  RxString currentSortColumn = ''.obs;
  RxBool isAscending = true.obs;

  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  Rx<int> ObservationId = 0.obs;
  RxString idFilterText = ''.obs;
  RxString monthFilterText = ''.obs;
  RxString contractorNameFilterText = ''.obs;
  RxString dateofObservationFilterText = ''.obs;
  RxString locationFilterText = ''.obs;
  RxString typeFilterText = ''.obs;
  RxString sourceFilterText = ''.obs;
  RxString riskTypeFilterText = ''.obs;
  RxString correctiveFilterText = ''.obs;
  RxString responsibleFilterText = ''.obs;
  RxString targetDateFilterText = ''.obs;
  RxString actionTakenFilterText = ''.obs;

  RxString closerDateFilterText = ''.obs;
  RxString costTypeFilterText = ''.obs;
  RxString statusFilterText = ''.obs;
  RxString remainingdaysFilterText = ''.obs;

  // RxString vendorFilterText = ''.obs;

  RxString userDateFilterText = ''.obs;

  final columnVisibility = ValueNotifier<Map<String, bool>>({
    "Id": true,
    "Month": true,
    "Date of Obs": true,
    "Contractor Name": true,
    "Location": true,
    "Type": true,
    "Source": true,
    "Risk Type": true,
    "Description": true,
    "Responsible": true,
    "Target Date": true,
    "created by": true,
    "Closed Date": true,
    "Cost type": true,
    "Remaining days": true,
    // "Status": true,
  });
  final Map<String, double> columnwidth = {
    "Id": 120,
    "Month": 100,
    "Observation Date": 295,
    "Contractor Name": 200,
    "Location": 150,
    "Type": 100,
    "Source": 120,
    "Risk Type": 150,
    "Description": 200,
    "Responsible": 150,
    "Target Date": 150,
    "created by": 180,
    "Closed Date": 150,
    "Cost type": 150,
    "Remaining days": 190,
    // "Status": 150,
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
      "Id": idFilterText,
      "Month": monthFilterText,
      "Date of Obs": dateofObservationFilterText,
      "Contractor Name": contractorNameFilterText,
      "Location": locationFilterText,
      "Type": typeFilterText,
      "Source": sourceFilterText,
      "Risk Type": riskTypeFilterText,
      "Description": correctiveFilterText,
      "Responsible": responsibleFilterText,
      "Target Date": targetDateFilterText,
      "created by": actionTakenFilterText,
      "Closed Date": closerDateFilterText,
      "Cost type": costTypeFilterText,
      "Remaining days": remainingdaysFilterText,
      // "Status": statusFilterText,
    };
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      if (facilityId > 0) {
        Future.delayed(Duration(seconds: 1), () async {
          await getObservationDataList(
              facilityId, formattedTodate1, formattedFromdate1, false);
        });
      }
    });
    super.onInit();
  }

  void clearValue() {
    observationListPresenter.clearValue();
  }

  void search(String keyword) {
    print('Keyword: $keyword');
    if (keyword.isEmpty) {
      getObservationList.value = filteredData.value;
      return;
    }
    List<GetObservationList> filteredList = filteredData
        .where((item) =>
            (item.id?.toString().toLowerCase().contains(keyword.toLowerCase()) ?? false) ||
            (item.id?.toString().toLowerCase().contains(keyword.toLowerCase()) ??
                false) ||
            (item.contact_number?.toString().toLowerCase().contains(keyword.toLowerCase()) ??
                false) ||
            (item.corrective_action
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.contractor_name?.toString().toLowerCase().contains(keyword.toLowerCase()) ??
                false) ||
            (item.corrective_action
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.cost_name?.toString().toLowerCase().contains(keyword.toLowerCase()) ??
                false) ||
            (item.id?.toString().toLowerCase().contains(keyword.toLowerCase()) ??
                false) ||
            (item.remaining_days?.toString().toLowerCase().contains(keyword.toLowerCase()) ??
                false) ||
            (item.location_of_observation
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.observation_description?.toString().toLowerCase().contains(keyword.toLowerCase()) ?? false))
        .toList();
    getObservationList.value = filteredList;
  }

  Future<void> getObservationDataList(
      int facilityId, dynamic startDate, dynamic endDate, bool isExport) async {
    getObservationList.value = <GetObservationList>[];
    filteredData.value = <GetObservationList>[];

    final _getObservationList =
        await observationListPresenter.getObservationDataList(
            isLoading: isLoading.value,
            start_date: startDate,
            end_date: endDate,
            facility_id: facilityId,
            isExport: isExport);
    getObservationList.value = _getObservationList;
    isLoading.value = false;
    paginationController = PaginationController(
      rowCount: getObservationList.length,
      rowsPerPage: 10,
    );
    if (getObservationList.isNotEmpty) {
      filteredData.value = getObservationList.value;
      getObservationListModel = getObservationList[0];
      var getObservationListJson = getObservationListModel?.toJson();
      getObservationListTableColumns.value = <String>[];
      for (var key in getObservationListJson?.keys.toList() ?? []) {
        getObservationListTableColumns.add(key);
      }
    }
  }

  // void clearStoreData() {
  //   observationListPresenter.clearValue();
  //   observationListPresenter.clearComplianceValue();
  // }

  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {}
  }

  void export() {
    getObservationDataList(
        facilityId, formattedTodate1, formattedFromdate1, true);
  }

  void getobslistbydate() {
    getObservationDataList(
        facilityId, formattedTodate1, formattedFromdate1, true);
  }

  void sortData(String columnName) {
    if (currentSortColumn.value == columnName) {
      isAscending.value = !isAscending.value;
    } else {
      currentSortColumn.value = columnName;
      isAscending.value = true;
    }
    switch (columnName) {
      case 'Id':
        getObservationList.sort((a, b) => isAscending.value
            ? (a.id ?? 0).compareTo(b.id ?? 0)
            : (b.id ?? 0).compareTo(a.id ?? 0));
        break;
      case 'Month':
        getObservationList.sort((a, b) => isAscending.value
            ? (a.month_of_observation ?? '')
                .compareTo(b.month_of_observation ?? '')
            : (b.month_of_observation ?? '')
                .compareTo(a.month_of_observation ?? ''));
        break;
      case 'Observation Date':
        getObservationList.sort((a, b) => isAscending.value
            ? (a.date_of_observation ?? '')
                .compareTo(b.date_of_observation ?? '')
            : (b.date_of_observation ?? '')
                .compareTo(a.date_of_observation ?? ''));
        break;
      case 'Contractor Name':
        getObservationList.sort((a, b) => isAscending.value
            ? (a.contractor_name ?? '').compareTo(b.contractor_name ?? '')
            : (b.contractor_name ?? '').compareTo(a.contractor_name ?? ''));
        break;
      case 'Location':
        getObservationList.sort((a, b) => isAscending.value
            ? (a.location_of_observation ?? '')
                .compareTo(b.location_of_observation ?? '')
            : (b.location_of_observation ?? '')
                .compareTo(a.location_of_observation ?? ''));
        break;

      case 'Type':
        getObservationList.sort((a, b) => isAscending.value
            ? (a.type_of_observation ?? 0).compareTo(b.type_of_observation ?? 0)
            : (b.type_of_observation ?? 0)
                .compareTo(a.type_of_observation ?? 0));
        break;
      case 'Source':
        getObservationList.sort((a, b) => isAscending.value
            ? (a.source_of_observation ?? 0)
                .compareTo(b.source_of_observation ?? 0)
            : (b.source_of_observation ?? 0)
                .compareTo(a.source_of_observation ?? 0));
        break;
      case 'Risk Type':
        getObservationList.sort((a, b) => isAscending.value
            ? (a.risk_type ?? '').compareTo(b.risk_type ?? '')
            : (b.risk_type ?? '').compareTo(a.risk_type ?? ''));
        break;
      case 'Description':
        getObservationList.sort((a, b) => isAscending.value
            ? (a.type_of_observation_name ?? '')
                .compareTo(b.type_of_observation_name ?? '')
            : (b.type_of_observation_name ?? '')
                .compareTo(a.type_of_observation_name ?? ''));
        break;
      // case 'Responsible':
      //   getObservationList.sort((a, b) => isAscending.value
      //       ? (a.responsible_person ?? '').compareTo(b.responsible_person ?? '')
      //       : (b.responsible_person ?? '').compareTo(a.responsible_person ?? ''));
      //   break;
      case 'Target Date':
        getObservationList.sort((a, b) => isAscending.value
            ? (a.target_date ?? '').compareTo(b.target_date ?? '')
            : (b.target_date ?? '').compareTo(a.target_date ?? ''));
        break;
      case 'created by':
        getObservationList.sort((a, b) => isAscending.value
            ? (a.action_taken ?? '').compareTo(b.action_taken ?? '')
            : (b.action_taken ?? '').compareTo(a.action_taken ?? ''));
        break;
      case 'Closed Date':
        getObservationList.sort((a, b) => isAscending.value
            ? (a.closed_date ?? '').compareTo(b.closed_date ?? '')
            : (b.closed_date ?? '').compareTo(a.closed_date ?? ''));
        break;
      case 'Cost type':
        getObservationList.sort((a, b) => isAscending.value
            ? (a.cost_name ?? '').compareTo(b.cost_name ?? '')
            : (b.cost_name ?? '').compareTo(a.cost_name ?? ''));
        break;
      default:
        break;
    }
    update();
  }
}



// import 'dart:async';

// import 'package:cmms/app/app.dart';
// import 'package:cmms/app/navigators/app_pages.dart';
// import 'package:cmms/domain/models/facility_model.dart';
// import 'package:get/get.dart';
// import 'observation_list_presenter.dart';

// class ObservationListController extends GetxController {
//   ///
//   ObservationListController(
//     this.observationListPresenter,
//   );
//   ObservationListPresenter observationListPresenter;
//   HomeController homeController = Get.find();

//   ///

//   RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;

//   Rx<String> selectedBlock = ''.obs;

//   ///
//   // final excel = Excel.createExcel();
//   // int facilityId = 0;
//   // int userId = 0;
//   // String? facilityName;
//   // JobModel? jobModel;
//   // PaginationController paginationController = PaginationController(
//   //   rowCount: 0,
//   //   rowsPerPage: 10,
//   // );
//   StreamSubscription<int>? facilityIdStreamSubscription;
//   StreamSubscription<String>? facilityNameStreamSubscription;

//   ///
//   @override
//   void onInit() async {
//     // facilityIdStreamSubscription = homeController.facilityId$.listen((event) {
//     //   facilityId = event;
//     //   // Future.delayed(Duration(seconds: 1), () {
//     //   // userId = varUserAccessModel.value.user_id ?? 0;
//     //   // if (userId != null) {

//     //   // }
//     //   // });
//     // });
//     // facilityNameStreamSubscription =
//     //     homeController.facilityName$.listen((event) {
//     //   facilityName = event;

//     //   // });
//     // });
//     super.onInit();
//   }

//   Future<void> getFacilityList({bool? isLoading}) async {
//     facilityList.value = <FacilityModel>[];
//     List<FacilityModel?>? _facilityList = <FacilityModel?>[];

//     _facilityList = await observationListPresenter.getFacilityList();
//     if (_facilityList != null && _facilityList.isNotEmpty) {
//       facilityList.value = _facilityList;
//     }
//     if (facilityList.isNotEmpty) {
//       selectedBlock.value = facilityList[0]?.name ?? '';
//     }
//   }

//   void goToCreateObservation() {
//     Get.toNamed(Routes.createObservation);
//   }
// }
