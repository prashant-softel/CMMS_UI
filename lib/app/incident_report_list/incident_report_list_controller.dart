import 'dart:async';
import 'dart:convert';

import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/incident_report_list/incident_report_list_presenter.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/incident_report_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/subjects.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/facility_model.dart';
import '../../domain/models/user_access_model.dart';

class IncidentReportListController extends GetxController {
  IncidentReportListController(this.incidentReportPresenter);
  IncidentReportListPresenter incidentReportPresenter;

  final HomeController homeController = Get.find();

  //Additional Email work
  var rowList = <String>[].obs;
  var rowList2 = <String>[].obs;
  var rowList3 = <String>[].obs;

  bool openFromDateToStartDatePicker = false;

  

  ///Failure Date Time For Web
  var failureDateTimeCtrlrWeb = TextEditingController();
  var failureDateTimeCtrlrWebBuffer;
  Rx<DateTime> selectedFailureDateTimeWeb = DateTime.now().obs;

  ///Incident Report List Date Time For Web
  var incidentReportListDateTimeCtrlrWeb = TextEditingController();
  var incidentReportListDateTimeCtrlrWebBuffer;
  Rx<DateTime> selectedIncidentReportListDateTimeWeb = DateTime.now().obs;

  ///Reject Incident Report Controller

  final TextEditingController rejectCommentTextFieldCtrlr =
      TextEditingController();

  var inventoryList = <InventoryModel>[];
  var blockList = <BlockModel>[];
  var equipmentList = <EquipmentModel>[];

  ///Text Editing Controller
  final warrantyClaimTitleTextController = TextEditingController();
  final warrantyClaimBriefDescTextController = TextEditingController();
  final immediateCorrectiveActionTextController = TextEditingController();
  final requestManufactureTextController = TextEditingController();
  final costOfReplacementTextController = TextEditingController();
  final orderReferenceNoTextController = TextEditingController();
  final affectedSerialNoTextController = TextEditingController();
  final manufacturerNameTextController = TextEditingController();

  final blockTextController = TextEditingController();
  final parentEquipmentTextController = TextEditingController();

  ///Incident Report List
  // RxList<IncidentReportListModel?> incidentReportModelList = <IncidentReportListModel?>[].obs;
  RxList<IncidentReportListModel?> incidentReportList =
      <IncidentReportListModel?>[].obs;
  RxList<IncidentReportListModel?> filteredData =
      <IncidentReportListModel>[].obs;

  IncidentReportListModel? incidentReportModelList;
  RxList<String> incidentListTableColumns = <String>[].obs;

//Incident Report List
  // var incidentReportList = <IncidentReportListModel>[];

  var selectedBlock = BlockModel();
  var selectedEquipment = EquipmentModel();
  //int facilityId = 45;
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

  Rx<DateTime> fromDate = DateTime.now().obs;
  Rx<DateTime> toDate = DateTime.now().obs;
  String get formattedFromdate =>
      DateFormat('dd/MM/yyyy').format(fromDate.value);
  String get formattedTodate => DateFormat('dd/MM/yyyy').format(toDate.value);

  BehaviorSubject<int> _facilityId = BehaviorSubject.seeded(0);
  Stream<int> get facilityId$ => _facilityId.stream;
  int get facilityId1 => _facilityId.value;

  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;

  @override
  void onInit() async {
    // wc_id = Get.arguments;
    // print('WC_Id:$wc_id');
    facilityIdStreamSubscription = homeController.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 2), () {
        getIncidentReportList(
            facilityId, formattedTodate, formattedFromdate, false);
      });
    });

    Future.delayed(Duration(seconds: 1), () {
      getFacilityList();
    });
   

    super.onInit();
  }

  Future<void> getFacilityList() async {
    final _facilityList = await incidentReportPresenter.getFacilityList();
    //print('Facility25:$_facilityList');
    if (_facilityList != null) {
      for (var facility in _facilityList) {
        facilityList.add(facility);
      }

      selectedFacility.value = facilityList[0]?.name ?? '';
      _facilityId.sink.add(facilityList[0]?.id ?? 0);
    }
  }

 

  Future<void> incidentReportRejectButton({String? id}) async {
    String _rejectComment = rejectCommentTextFieldCtrlr.text.trim();

    final _incidentReportRejectBtn =
        await incidentReportPresenter.incidentReportRejectButton(
      comment: _rejectComment,
      id: id,
    );
    // showAlertPermitApproveDialog();
    print('Incident Report Reject Button Data:${_rejectComment}');
    print('Incident Report Reject Button Data:${id}');
  }

  Future<void> incidentReportApproveButton({String? incidentId}) async {
    // String _rejectComment = rejectCommentTextFieldCtrlr.text.trim();

    final _incidentReportApproveBtn =
        await incidentReportPresenter.incidentReportApproveButton(
      // comment: _rejectComment,
      incidentId: incidentId,
    );
    // showAlertPermitApproveDialog();
    print('Incident Report Approve Button Data:${incidentId}');
  }

  void search(String keyword) {
    if (keyword.isEmpty) {
      incidentReportList.value = filteredData;
      return;
    }

    incidentReportList.value = filteredData
        .where((item) =>
            item!.description!.toLowerCase().contains(keyword.toLowerCase()))
        .toList();
    update(['incident_report_list']);
  }

  Future<void> getIncidentReportList(int facilityId, dynamic startDate,
      dynamic endDate, bool isLoading) async {
    incidentReportList.value = <IncidentReportListModel>[];

    final list = await incidentReportPresenter.getIncidentReportList(
        isLoading: isLoading,
        start_date: startDate, //// "2020-01-01",
        end_date: endDate, ////   "2023-12-31",
        facility_id: facilityId);
    // print('incidentReportFacilityId$facilityId');
    // print('Incident Report List:$list');
    for (var incident_list in list) {
      incidentReportList.add(incident_list);
    }

    if (list != null) {
      incidentReportList.value = list;
      filteredData.value = incidentReportList.value;
      // print('Filtered data:${filteredData.value}');
      paginationIncidentReportController = PaginationController(
        rowCount: incidentReportList.length,
        rowsPerPage: 10,
      );
      if (filteredData != null && filteredData.isNotEmpty) {
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
      case RxList<FacilityModel>:
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

  Future<void> viewIncidentReport({int? id}) async {
    Get.toNamed(Routes.viewIncidentReportScreen, arguments: id);
    print('Argument$id');
  }

  Future<void> editIncidentReport({int? id}) async {
    Get.toNamed(Routes.addIncidentReportContentWeb, arguments: id);
    print('Argument$id');
  }
}
