import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/view_escalation_matrix/view_escalation_matrix_presenter.dart';
import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/get_asset_data_list_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/incident_report_details_model.dart';
import 'package:cmms/domain/models/incident_report_list_model.dart';
import 'package:cmms/domain/models/paiyed_model.dart';
import 'package:cmms/domain/models/type_permit_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import 'package:rxdart/subjects.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/facility_model.dart';
import '../../domain/models/user_access_model.dart';

class ViewEscalationMatrixController extends GetxController {
  ViewEscalationMatrixController(this.viewIncidentReportPresenter);
  ViewEscalationMatrixPresenter viewIncidentReportPresenter;

  final HomeController homeController = Get.find();

  //Additional Email work
  var rowList = <String>[].obs;
  var rowList2 = <String>[].obs;
  var rowList3 = <String>[].obs;

  ///Print Global key
  final GlobalKey<State<StatefulWidget>> printKey = GlobalKey();

  // final TextEditingController supplierActionTextFieldController =
  //     TextEditingController();
  // final TextEditingController supplierActionSrNumberTextFieldController =
  //     TextEditingController();

  Rx<List<List<Map<String, String>>>> rowItem =
      Rx<List<List<Map<String, String>>>>([]);
  Map<String, GetAssetDataModel> dropdownMapperData = {};
  Map<String, PaiedModel> paiddropdownMapperData = {};

  void addRowItem() {
    rowItem.value.add([
      {"key": "Duration (Days)", "value": 'Please Select'},
      {'key': "Escalation Roles and Levels", "value": 'Please Select'},
    ]);
  }

  ///Checkbox
  ////
  // RxBool isCheckedRequire = false.obs;
  // RxBool isCheckedDataRequire = false.obs;

  // void requireToggleCheckbox() {
  //   isCheckedRequire.value = !isCheckedRequire.value;
  //   isCheckedDataRequire.value = isCheckedRequire.value;
  //   print('Checkbox value ${isCheckedRequire.value}');
  //   print(
  //       'Checkbox Data value ${isCheckedDataRequire.value}'); // Toggle the checkbox state
  //   // Toggle the checkbox state
  // }

  ///Permit Type
  // RxList<TypePermitModel?> typePermitList = <TypePermitModel>[].obs;
  // Rx<bool> isTypePermitSelected = true.obs;
  // Rx<String> selectedTypePermit = ''.obs;
  // Rx<String> selectedTypeOfPermit = ''.obs;
  // Rx<bool> isTypePermit = true.obs;
  // Rx<String> selectedStartDate = ''.obs;
  // Rx<bool> isStartdate = true.obs;
  // Rx<bool> isEnddate = true.obs;

  // final TextEditingController serialNoTextFieldController =
  //     TextEditingController();
  // final TextEditingController nameTextFieldController = TextEditingController();
  // final TextEditingController emailTextFieldController =
  //     TextEditingController();

  //   ///Failure Date Time For Web
  // var failureDateTimeCtrlrWeb = TextEditingController();
  // var failureDateTimeCtrlrWebBuffer;
  // Rx<DateTime> selectedFailureDateTimeWeb = DateTime.now().obs;

  ///Incident Date Time For Web
  var incidentDateTimeCtrlrWeb = TextEditingController();
  var incidentReportListDateTimeCtrlrWebBuffer;
  Rx<DateTime> selectedIncidentReportListDateTimeWeb = DateTime.now().obs;

  ///Action Taken Date & Time
  var actionTakenDateTimeCtrlrWeb = TextEditingController();

  ///Reporting Date & Time
  var reportingDateTimeCtrlrWeb = TextEditingController();

//Incident Report List
  var incidentReportList = <IncidentReportListModel>[];

  ///Incident Report Details
  Rx<IncidentReportDetailsModel?> incidentReportDetailsModel =
      IncidentReportDetailsModel().obs;
  RxList<IncidentReportDetailsModel?>? incidentReportDetailsList =
      <IncidentReportDetailsModel?>[].obs;

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
  RxList<IncidentReportListModel?> incidentReportModelList =
      <IncidentReportListModel>[].obs;

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

  ///Plant Name
  RxList<FacilityModel?> facilityPlantList = <FacilityModel>[].obs;
  Rx<bool> isFacilityPlantSelected = true.obs;
  Rx<String> selectedPlantFacility = ''.obs;

  ///Equipment name List
  RxList<InventoryModel?> eqipmentNameList = <InventoryModel>[].obs;
  Rx<String> selectedEquipmentName = ''.obs;
  Rx<bool> isEquipmentNameSelected = true.obs;
  int selectedEquipmentnameId = 0;

  var startDateTimeCtrlr = TextEditingController();
  var validTillTimeCtrlr = TextEditingController();
  var validTillTimeCtrlrBuffer;
  var startDateTimeCtrlrBuffer;

  var incidentreportDescriptionCtrlr = TextEditingController();
  var titleTextCtrlr = TextEditingController();

  Rx<DateTime> selectedBreakdownTime = DateTime.now().obs;
  Rx<DateTime> selectedValidTillTime = DateTime.now().obs;
  Rx<bool> isJobDescriptionInvalid = false.obs;
  Rx<bool> isTitleTextInvalid = false.obs;

  Rx<bool> isVictimNameTextInvalid = false.obs;
  var victimNameTextCtrlr = TextEditingController();

  ///damaged Asset Cost
  Rx<bool> isDamagedAssetCostTextInvalid = false.obs;
  var damagedAssetCostTextCtrlr = TextEditingController();

  ///Gen Loss Due To Asset Loss
  Rx<bool> isGenLossAssetDamageTextInvalid = false.obs;
  var genLossAssetDamageTextCtrlr = TextEditingController();

  ///Gen Loss Due To Asset Loss
  Rx<bool> isInsuranceRemarkTextInvalid = false.obs;
  var insuranceRemarkTextCtrlr = TextEditingController();

  ///Incident Reporting date Time
  var actionTakenDateTimeCtrlr = TextEditingController();
  Rx<DateTime> selectedActionTakenTime = DateTime.now().obs;

  ///Incident Report History
  RxList<HistoryModel?>? historyList = <HistoryModel?>[].obs;

  ///For Switch case
  RxBool switchValue = false.obs;
  RxBool switchValue2 = false.obs;
  RxBool switchValue3 = false.obs;
  RxBool switchValue4 = false.obs;

  // PaginationController paginationBusinessListController = PaginationController(
  //   rowCount: 0,
  //   rowsPerPage: 10,
  // );
  BehaviorSubject<int> _facilityId = BehaviorSubject.seeded(0);
  Stream<int> get facilityId$ => _facilityId.stream;
  int get facilityId1 => _facilityId.value;

  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;

  ///
  int? id = 0;
  @override
  void onInit() async {
    id = Get.arguments;
    print('IncidentReport_Id:$id');
    facilityIdStreamSubscription = homeController.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 1), () {
        getFacilityList();
      });
    });

    // if(id != null){
    //   Future.delayed(Duration(seconds: 1), () {
    //   getIncidentReportDetail(id: id!);
    // });

    // }
    // Future.delayed(Duration(seconds: 1), () {
    //   getFacilityPlantList();
    // });
    Future.delayed(Duration(seconds: 1), () {
      getuserAccessData();
    });

    super.onInit();
  }

  //  Future <void> getIncidentReportDetail({required int id}) async{
  //  // newPermitDetails!.value = <NewPermitListModel>[];
  //     incidentReportDetailsList?.value = <IncidentReportDetailsModel>[];

  //   final _incidentReportDetails = await viewIncidentReportPresenter.getIncidentReportDetail(
  //       id: id
  //       );
  //       print('Incident Report Detail:$_incidentReportDetails');

  //       if(_incidentReportDetails != null ){
  //     incidentReportDetailsModel.value = _incidentReportDetails;

  //     incidentDateTimeCtrlrWeb.text = '${DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.parse('${incidentReportDetailsModel.value?.incident_datetime}'))}';
  //     actionTakenDateTimeCtrlrWeb.text = '${DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.parse('${incidentReportDetailsModel.value?.action_taken_datetime}'))}';
  //     reportingDateTimeCtrlrWeb.text = '${DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.parse('${incidentReportDetailsModel.value?.reporting_datetime}'))}';

  //       }

  // }

  // Future<void> getIncidentReportHistory({required int id}) async {
  //   /// TODO: CHANGE THESE VALUES
  //   int moduleType = 131;
  //   // int tempModuleType = 21;
  //   int id = Get.arguments;
  //   //
  //   historyList?.value =
  //       await viewIncidentReportPresenter.getIncidentReportHistory(
  //             // tempModuleType,
  //             // tempJobCardId,
  //             moduleType,
  //             id,
  //             true,
  //           ) ??
  //           [];
  //   update(["historyList"]);
  // }

  Future<void> getFacilityList() async {
    final _facilityList = await viewIncidentReportPresenter.getFacilityList();
    //print('Facility25:$_facilityList');
    if (_facilityList != null) {
      for (var facility in _facilityList) {
        facilityList.add(facility);
      }

      selectedFacility.value = facilityList[0]?.name ?? '';
      _facilityId.sink.add(facilityList[0]?.id ?? 0);
    }
  }

  Future<void> getuserAccessData() async {
    final _userAccessList =
        await viewIncidentReportPresenter.getUserAccessList();

    if (_userAccessList != null) {
      final userAccessModelList = jsonDecode(_userAccessList);
      var userAccess = AccessListModel.fromJson(userAccessModelList);
      varUserAccessModel.value = userAccess;
      varUserAccessModel.value.access_list = userAccess.access_list;
    }
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

  Future<void> editIncidentReport({int? id}) async {
    Get.toNamed(Routes.addIncidentReportContentWeb, arguments: id);
    print('Argument$id');
  }
}
