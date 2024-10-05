import 'dart:async';
import 'package:cmms/app/IR_list/ir_list_presenter.dart';
import 'package:cmms/app/app.dart';

import 'package:cmms/domain/models/incident_report_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/subjects.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/facility_model.dart';

class IRListController extends GetxController {
  IRListController(this.irPresenter);
  IRListPresenter irPresenter;

  final HomeController homeController = Get.find();

  bool openFromDateToStartDatePicker = false;

  RxString currentSortColumn = ''.obs;
  RxBool isAscending = true.obs;

  RxList<IncidentReportListModel?> incidentReportList =
      <IncidentReportListModel?>[].obs;
  RxList<IncidentReportListModel?> filteredData =
      <IncidentReportListModel>[].obs;

  IncidentReportListModel? incidentReportModelList;
  RxList<String> incidentListTableColumns = <String>[].obs;


  
  String categoryIds = '';
  Rx<bool> isFormInvalid = false.obs;

  Rx<String> selectedFacility = ''.obs;
  String username = '';

  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  Rx<bool> isFacilitySelected = true.obs;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  PaginationController paginationIncidentReportController =
      PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );


  final columnVisibility = ValueNotifier<Map<String, bool>>({
    "IR": true,
    "Title": true,
    "Block Name": true,
    "Equipment Name": true,
    "Approved By": true,
    "Approved At": true,
    "Reported By": true,
    "Reported At": true,
    // "Status": true,

    // "search": true,
  });
  final Map<String, double> columnwidth = {
    "IR": 153,
    "Title": 220,
    "Block Name": 200,
    "Equipment Name": 200,
    "Approved By": 170,
    "Approved At": 150,
    "Reported By": 150,
    "Reported At": 150,
    // "Status": 150,
  };
  Map<String, RxString> filterText = {};
  void setColumnVisibility(String columnName, bool isVisible) {
    final newVisibility = Map<String, bool>.from(columnVisibility.value)
      ..[columnName] = isVisible;
    columnVisibility.value = newVisibility;
    print({"updated columnVisibility": columnVisibility});
  }

  RxString incidentReportIdFilterText = ''.obs;
  RxString descriptionFilterText = ''.obs;
  RxString block_nameFilterText = ''.obs;
  RxString equipment_nameFilterText = ''.obs;
  RxString approved_byFilterText = ''.obs;
  RxString approved_atFilterText = ''.obs;
  RxString reported_by_nameFilterText = ''.obs;
  RxString reported_atFilterText = ''.obs;
  RxString statusFilterText = ''.obs;
  RxString actionFilterText = ''.obs;
  Rx<int> id = 0.obs;

  Rx<DateTime> fromDate = DateTime.now().subtract(Duration(days: 7)).obs;
  Rx<DateTime> toDate = DateTime.now().obs;
  String get formattedFromdate =>
      DateFormat('dd/MM/yyyy').format(fromDate.value);
  String get formattedTodate => DateFormat('dd/MM/yyyy').format(toDate.value);
  String get formattedTodate1 => DateFormat('yyyy-MM-dd').format(toDate.value);
  String get formattedFromdate1 =>
      DateFormat('yyyy-MM-dd').format(fromDate.value);
  BehaviorSubject<int> _facilityId = BehaviorSubject.seeded(0);
  Stream<int> get facilityId$ => _facilityId.stream;
  int get facilityId1 => _facilityId.value;

  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;

  Rx<bool> isLoading = true.obs;
  @override
  void onInit() async {
    this.filterText = {
      "IR": incidentReportIdFilterText,
      "Title": descriptionFilterText,
      "Block Name": block_nameFilterText,
      "Equipment Name": equipment_nameFilterText,
      "Approved By": approved_byFilterText,
      "Approved At": approved_atFilterText,
      "Reported By": reported_by_nameFilterText,
      "Reported At": reported_atFilterText,
      // "Status": statusFilterText
    };
    // wc_id = Get.arguments;
    // print('WC_Id:$wc_id');
    facilityIdStreamSubscription = homeController.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 2), () {
        getIncidentReportList(
            facilityId, formattedFromdate, formattedTodate, false);
      });
    });

    Future.delayed(Duration(seconds: 1), () {
      getFacilityList();
    });

    super.onInit();
  }

  Future<void> getFacilityList() async {
    final _facilityList = await irPresenter.getFacilityList();
    //print('Facility25:$_facilityList');
    if (_facilityList != null) {
      for (var facility in _facilityList) {
        facilityList.add(facility);
      }

      selectedFacility.value = facilityList[0]?.name ?? '';
      _facilityId.sink.add(facilityList[0]?.id ?? 0);
    }
  }




  void search(String keyword) {
    if (keyword.isEmpty) {
      incidentReportList.value = filteredData;
      return;
    }
    List<IncidentReportListModel?> filteredList = filteredData
        .where((item) =>
            (item?.id?.toString().toLowerCase().contains(keyword.toLowerCase()) ?? false) ||
            (item?.title?.toString().toLowerCase().contains(keyword.toLowerCase()) ??
                false) ||
            (item?.description
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.block_name?.toString().toLowerCase().contains(keyword.toLowerCase()) ??
                false) ||
            (item?.equipment_name
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.approved_by
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.approved_at
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.reported_by_name
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.reported_at?.toString().toLowerCase().contains(keyword.toLowerCase()) ?? false) ||
            (item?.status?.toString().toLowerCase().contains(keyword.toLowerCase()) ?? false))
        .toList();
    incidentReportList.value = filteredList;
    // incidentReportList.value = filteredData
    //     .where((item) =>
    //         item!.description!.toLowerCase().contains(keyword.toLowerCase()))
    //     .toList();
    update(['incident_report_list']);
  }

  void export() {
    // Call the export logic without clearing the existing data
    getIncidentReportList(facilityId, formattedFromdate, formattedTodate, true,
        isExportOnly: true);
  }

  Future<void> getIncidentReportList(
      int facilityId, dynamic startDate, dynamic endDate, bool isExport,
      {bool isExportOnly = false}) async {
    if (!isExportOnly) {
      incidentReportList.value = <IncidentReportListModel>[];
    }

    final list = await irPresenter.getIncidentReportList(
        isLoading: isLoading.value,
        isExport: isExport,
        start_date: formattedFromdate1,
        end_date: formattedTodate1,
        facility_id: facilityId);

    if (!isExportOnly) {
      for (var incident_list in list) {
        incidentReportList.add(incident_list);
      }

      incidentReportList.value = list;
      filteredData.value = incidentReportList.value;
      isLoading.value = false;

      paginationIncidentReportController = PaginationController(
        rowCount: incidentReportList.length,
        rowsPerPage: 10,
      );

      if (filteredData.isNotEmpty) {
        incidentReportModelList = filteredData[0];
        var incidentListJson = incidentReportModelList?.toJson();
        incidentListTableColumns.value = <String>[];
        for (var key in incidentListJson?.keys.toList() ?? []) {
          incidentListTableColumns.add(key);
        }
      }
    }

    update(['incident_report_list']);
  }

  void onValueChanged(dynamic list, dynamic value) {
    print('Valuesd:${value}');
    switch (list.runtimeType) {
      case const (RxList<FacilityModel>):
        {
          int facilityIndex = facilityList.indexWhere((x) => x?.name == value);

          _facilityId.add(facilityList[facilityIndex]?.id ?? 0);
        }
        break;

      default:
        {
          //statements;
        }
        break;
    }
  }

  void getIncidentReportListByDate() {
    getIncidentReportList(
        facilityId, formattedFromdate, formattedTodate, false);
  }


  void clearStoreData() {
    irPresenter.clearValue();
  }


  void sortData(String columnName) {
    if (currentSortColumn.value == columnName) {
      isAscending.value = !isAscending.value;
    } else {
      currentSortColumn.value = columnName;
      isAscending.value = true;
    }

    switch (columnName) {
      case 'IR':
        incidentReportList.sort((a, b) => isAscending.value
            ? (a?.id ?? 0).compareTo(b?.id ?? 0)
            : (b?.id ?? 0).compareTo(a?.id ?? 0));
        break;
      case 'Title':
        incidentReportList.sort((a, b) => isAscending.value
            ? (a?.title ?? '').compareTo(b?.title ?? '')
            : (b?.title ?? '').compareTo(a?.title ?? ''));
        break;
      case 'Block Name':
        incidentReportList.sort((a, b) => isAscending.value
            ? (a?.block_name ?? '').compareTo(b?.block_name ?? '')
            : (b?.block_name ?? '').compareTo(a?.block_name ?? ''));
        break;
      case 'Equipment Name"':
        incidentReportList.sort((a, b) => isAscending.value
            ? (a?.equipment_name ?? '').compareTo(b?.equipment_name ?? '')
            : (b?.equipment_name ?? '').compareTo(a?.equipment_name ?? ''));
        break;
      case 'Approved By':
        incidentReportList.sort((a, b) => isAscending.value
            ? (a?.approved_by ?? '').compareTo(b?.approved_by ?? '')
            : (b?.approved_by ?? '').compareTo(a?.approved_by ?? ''));
        break;
      case 'Approved At':
        incidentReportList.sort((a, b) => isAscending.value
            ? (a?.approved_at ?? '').compareTo(b?.approved_at ?? '')
            : (b?.approved_at ?? '').compareTo(a?.approved_at ?? ''));
        break;
      case 'Reported By':
        incidentReportList.sort((a, b) => isAscending.value
            ? (a?.reported_by_name ?? '').compareTo(b?.reported_by_name ?? '')
            : (b?.reported_by_name ?? '').compareTo(a?.reported_by_name ?? ''));
        break;
      case 'Reported At':
        incidentReportList.sort((a, b) => isAscending.value
            ? (a?.reported_at ?? '').compareTo(b?.reported_at ?? '')
            : (b?.reported_at ?? '').compareTo(a?.reported_at ?? ''));
        break;
      default:
        break;
    }
    update();
  }
}
