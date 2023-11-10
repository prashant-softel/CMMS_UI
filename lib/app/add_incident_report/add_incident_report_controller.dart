import 'dart:async';
import 'dart:convert';

import 'package:cmms/app/add_incident_report/add_incident_report_presenter.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/create_incident_report_model.dart';
import 'package:cmms/domain/models/employee_list_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/incident_report_details_model.dart';
import 'package:cmms/domain/models/incident_report_list_model.dart';
import 'package:cmms/domain/models/risk_type_list_model.dart';
import 'package:cmms/domain/models/type_permit_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/subjects.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/facility_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddIncidentReportController extends GetxController {
  AddIncidentReportController(this.incidentReportPresenter);
  AddIncidentReportPresenter incidentReportPresenter;

  final HomeController homeController = Get.find();

  //Additional Email work
  var rowList = <String>[].obs;
  var rowList2 = <String>[].obs;
  var rowList3 = <String>[].obs;

  ///Incident Report History
  RxList<HistoryModel?>? historyList = <HistoryModel?>[].obs;

  ///Radio
  RxString selectedSeverity = RxString('');
  void setSelectedSeverity(String severity) {
    selectedSeverity.value = severity;
  }

  ///Gender Radio
  RxString selectedGender = RxString('');
  void setSelectedGender(String gender) {
    selectedGender.value = gender;
  }

  // void addRow(String rowData) {
  //   rowList.add(rowData);
  //   // rowList2.add(rowData);
  //   // rowList3.add(rowData);

  // }

  final TextEditingController investigationTeamNameTextFieldController =
      TextEditingController();
  final TextEditingController investigationTeamSrNumberTextFieldController =
      TextEditingController();
  final TextEditingController investigationTeamDesignationTextFieldController =
      TextEditingController();

  /// Incident Investigation Done By List
  RxList<EmployeeListModel> incidentInvestigationDoneByList =
      <EmployeeListModel>[].obs;
  Rx<bool> isincidentInvestigationDoneByListSelected = true.obs;
  Rx<String> selectedIncidentInvestigationDoneByList = ''.obs;
  RxList<String?> selectedIncidentInvestigationDoneByDataList = <String>[].obs;
  RxList<int?> selectedIncidentInvestigationDoneByIdList = <int>[].obs;
  int selectedIncidentInvestigationDoneById = 0;

  /// Incident Investigation Verification Done By List
  RxList<EmployeeListModel> incidentInvestigationVerificationDoneByList =
      <EmployeeListModel>[].obs;
  Rx<bool> isincidentInvestigationVerificationDoneByListSelected = true.obs;
  Rx<String> selectedIncidentInvestigationVerificationDoneByList = ''.obs;
  RxList<String?> selectedIncidentInvestigationVerificationDoneByDataList =
      <String>[].obs;
  RxList<int?> selectedIncidentInvestigationVerificationDoneByIdList =
      <int>[].obs;
  int selectedIncidentInvestigationVerificationDoneById = 0;

  /// Victim Name List
  RxList<EmployeeListModel> victimNameList = <EmployeeListModel>[].obs;
  Rx<bool> isVictimNameListSelected = true.obs;
  Rx<String> selectedVictimNameList = ''.obs;
  RxList<String?> selectedVictimNameDataList = <String>[].obs;
  RxList<int?> selectedVictimNameIdList = <int>[].obs;
  int selectedVictimNameId = 0;

  ///Risk Type List
  RxList<RiskTypeModel> riskTypeList = <RiskTypeModel>[].obs;
  Rx<bool> isRiskTypeListSelected = true.obs;
  Rx<String> selectedRiskTypeList = ''.obs;
  int selectedRiskTypeId = 0;

  /// Asset Restoration Action taken By List
  RxList<EmployeeListModel> assetRestorationActionTakenByList =
      <EmployeeListModel>[].obs;
  Rx<bool> isAssetRestorationActionTakenByListSelected = true.obs;
  Rx<String> selectedAssetRestorationActionTakenByList = ''.obs;
  RxList<String?> selectedAssetRestorationActionTakenByDataList =
      <String>[].obs;
  RxList<int?> selectedAssetRestorationActionTakenByIdList = <int>[].obs;
  int selectedAssetRestorationActionTakenById = 0;

  ///Permit Type
  RxList<TypePermitModel?> typePermitList = <TypePermitModel>[].obs;
  Rx<bool> isTypePermitSelected = true.obs;
  Rx<String> selectedTypePermit = ''.obs;
  Rx<String> selectedTypeOfPermit = ''.obs;
  Rx<bool> isTypePermit = true.obs;
  Rx<String> selectedStartDate = ''.obs;
  Rx<bool> isStartdate = true.obs;
  Rx<bool> isEnddate = true.obs;

  final TextEditingController serialNoTextFieldController =
      TextEditingController();
  final TextEditingController nameTextFieldController = TextEditingController();
  final TextEditingController emailTextFieldController =
      TextEditingController();

  ///Failure Date Time For Web
  var failureDateTimeCtrlrWeb = TextEditingController();
  var failureDateTimeCtrlrWebBuffer;
  Rx<DateTime> selectedFailureDateTimeWeb = DateTime.now().obs;

  ///Incident Report List Date Time For Web
  var incidentReportListDateTimeCtrlrWeb = TextEditingController();
  var incidentReportListDateTimeCtrlrWebBuffer;
  Rx<DateTime> selectedIncidentReportListDateTimeWeb = DateTime.now().obs;

  //Incident Report Details
  Rx<IncidentReportDetailsModel?> incidentReportDetailsModel =
      IncidentReportDetailsModel().obs;
  RxList<IncidentReportDetailsModel?>? incidentReportDetailsList =
      <IncidentReportDetailsModel?>[].obs;

//Incident Report List
  var incidentReportList = <IncidentReportListModel>[];

  var inventoryList = <InventoryModel>[];
  // var blockList = <BlockModel>[];
  var equipmentList = <EquipmentModel>[];

  ///Incident Report List
  RxList<IncidentReportListModel?> incidentReportModelList =
      <IncidentReportListModel>[].obs;
//
  // var selectedBlock = BlockModel();
  var selectedEquipment = EquipmentModel();
  //int facilityId = 45;
  String categoryIds = '';
  Rx<bool> isFormInvalid = false.obs;

  // Rx<String> selectedFacility = ''.obs;
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

  ///Block
  RxList<BlockModel?> blockList = <BlockModel>[].obs;
  Rx<bool> isBlockSelected = true.obs;
  Rx<String> selectedBlock = ''.obs;
  Rx<bool> isstartdateFieldSelected = true.obs;
  int selectedBlockId = 0;
  Rx<String> selectedFacility = ''.obs;
  int? selectedFacilityId = 0;

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

  ///target date
  var targetDateTimeCtrlr = TextEditingController();
  Rx<DateTime> selectedtargetDateTime = DateTime.now().obs;

  var incidentreportDescriptionCtrlr = TextEditingController();
  Rx<bool> isIncidentDescriptionInvalid = false.obs;

  var titleTextCtrlr = TextEditingController();
  var correctiveActionTextCtrlr = TextEditingController();
  Rx<bool> isCorrectiveTextInvalid = false.obs;

  var verifiedApprovedTextCtrlr = TextEditingController();
  Rx<bool> isVerifiedApprovedextInvalid = false.obs;

  Rx<DateTime> selectedBreakdownTime = DateTime.now().obs;
  Rx<DateTime> selectedValidTillTime = DateTime.now().obs;
  // Rx<bool> isJobDescriptionInvalid = false.obs;
  Rx<bool> isTitleTextInvalid = false.obs;

  Rx<bool> isInsuranceAvailableInvalid = false.obs;
  var insuranceAvailableTextCtrlr = TextEditingController();

//Address textfield
  Rx<bool> isAddressInvalid = false.obs;
  var addressTextCtrlr = TextEditingController();

  //Exact location textfield
  Rx<bool> isExactLoactionInvalid = false.obs;
  var exactLocationTextCtrlr = TextEditingController();

  ///Supplier Action Part
  var investigationTeam = <InvestigationTeam>[].obs;
  void updateInvestigationTeamText(
      String srNumber,
      String name,
      // String required_by_data,

      String designation) {
    investigationTeam.add(InvestigationTeam(
        srNumber: srNumber,
        name: name,
        // required_by_date: required_by_data,
        // is_required: is_required

        designation: designation));
  }

//RCA text
  Rx<bool> isRCAInvalid = false.obs;
  var rcaTextCtrlr = TextEditingController();

  ///Root cause textfields
  var rootCause1TextCtrlr = TextEditingController();
  var rootCause2TextCtrlr = TextEditingController();
  var rootCause3TextCtrlr = TextEditingController();

  ///Immediate Corection textfields
  var immediateCorrection1TextCtrlr = TextEditingController();
  var immediateCorrection2TextCtrlr = TextEditingController();
  var immediateCorrection3TextCtrlr = TextEditingController();

  ///action plan
  var actionPlanTextCtrlr = TextEditingController();

  ///remark textfield
  var remarkTextCtrlr = TextEditingController();

  ///Textfields for Investigation Blocks

  ////1
  Rx<bool> isTypeOfJobInvalid = false.obs;
  var typeOfJbTextCtrlr = TextEditingController();

  ///2
  Rx<bool> isPersonInvolvedInvalid = false.obs;
  var personInvolvedTextCtrlr = TextEditingController();

  ///3
  Rx<bool> isPersonAuthorizedInvolvedInvalid = false.obs;
  var personAuthorizedInvolvedTextCtrlr = TextEditingController();

  ///4
  Rx<bool> isInstructionsInvalid = false.obs;
  var instructionsTextCtrlr = TextEditingController();

  ///5
  Rx<bool> isSafetyEquipmentsInvalid = false.obs;
  var SafetyEquipmetsTextCtrlr = TextEditingController();

  ///6
  Rx<bool> isCorrectSafeInvalid = false.obs;
  var correctSafeTextCtrlr = TextEditingController();

  ///7
  Rx<bool> isUnsafeConditionsInvalid = false.obs;
  var unsafeConditionsTextCtrlr = TextEditingController();

  ///8
  Rx<bool> isUnsafeIncidentInvalid = false.obs;
  var unsafeIncidentTextCtrlr = TextEditingController();

  ///Legal Applicability Remark Textfield
  Rx<bool> isLegalApplicabilityInvalid = false.obs;
  var legalApplicabilityRemarkTextCtrlr = TextEditingController();

  ///ESI Applicability Remark Textfield
  Rx<bool> isESIApplicabilityInvalid = false.obs;
  var ESIApplicabilityRemarkTextCtrlr = TextEditingController();

  ///damaged Asset Cost
  Rx<bool> isDamagedAssetCostTextInvalid = false.obs;
  var damagedAssetCostTextCtrlr = TextEditingController();

  ///work experience
  Rx<bool> isWorkExperienceInvalid = false.obs;
  var workExperienceTextCtrlr = TextEditingController();

  ////Why Why analysis textfields
  var why1TextCtrlr = TextEditingController();
  var cause1TextCtrlr = TextEditingController();

  var why2TextCtrlr = TextEditingController();
  var cause2TextCtrlr = TextEditingController();

  var why3TextCtrlr = TextEditingController();
  var cause3TextCtrlr = TextEditingController();

  var why4TextCtrlr = TextEditingController();
  var cause4TextCtrlr = TextEditingController();

  var why5TextCtrlr = TextEditingController();
  var cause5TextCtrlr = TextEditingController();

  ///Gen Loss Due To Asset Loss
  Rx<bool> isGenLossAssetDamageTextInvalid = false.obs;
  var genLossAssetDamageTextCtrlr = TextEditingController();

  ///Gen Loss Due To Asset Loss
  Rx<bool> isInsuranceRemarkTextInvalid = false.obs;
  var insuranceRemarkTextCtrlr = TextEditingController();

  ///Action Taken date Time
  var actionTakenDateTimeCtrlr = TextEditingController();
  Rx<DateTime> selectedActionTakenTime = DateTime.now().obs;
  var actionTakenDateTimeCtrlrBuffer;

  ///For Switch case
  RxBool esiApplicabilityValue = false.obs;
  RxBool rCAUploadRequiredValue = false.obs;
  RxBool legalApplicabilityValue = false.obs;
  RxBool insuranceApplicableValue = false.obs;

  ///For Detail Switch
  RxBool esiApplicabilityDetailValue = true.obs;
  RxBool rCAUploadRequiredDetailValue = true.obs;
  RxBool legalApplicabilityDetailValue = true.obs;
  RxBool insuranceApplicableDetailValue = true.obs;

  ///For Why Why analysis switch
  RxBool whyWhyAnalysisRequiredValue = true.obs;
  RxBool whyWhyAnalysisValue = false.obs;

  ///For Why Why analysis false switch
  RxBool whyWhyAnalysisFalseValue = false.obs;

  ///For False Detail Switch
  RxBool legalApplicabilityDetailFalseValue = false.obs;
  RxBool esiApplicabilityDetailFalseValue = false.obs;
  RxBool rCAUploadRequiredDetailFalseValue = false.obs;

  ////Reporting Date and Time
  Rx<DateTime> selectedReportingDateTime = DateTime.now().obs;
  var reportingDateTimeCtrlr = TextEditingController();
  var reportingDateTimeCtrlrBuffer;

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
    print('Edit Incident Report Id:$id');

    facilityIdStreamSubscription = homeController.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 1), () {
        getFacilityList();
      });
    });
    Future.delayed(Duration(seconds: 1), () {
      getBlocksList(facilityId);
    });

    if (id != null) {
      Future.delayed(Duration(seconds: 1), () {
        getIncidentReportDetail(id: id!);
      });
    }

    if (id != null) {
      Future.delayed(Duration(seconds: 1), () {
        getIncidentReportHistory(id: id!);
      });
    }

    Future.delayed(Duration(seconds: 1), () {
      getFacilityPlantList();
    });
    // Future.delayed(Duration(seconds: 1), () {
    //   getuserAccessData();
    // });
    Future.delayed(Duration(seconds: 1), () {
      getTypePermitList();
    });
    Future.delayed(Duration(seconds: 1), () {
      getInventoryList();
    });
    Future.delayed(Duration(seconds: 1), () {
      getIncidentInvestigationDoneByList();
    });
    Future.delayed(Duration(seconds: 1), () {
      getIncidentInvestigationVerificationDoneByList();
    });
    Future.delayed(Duration(seconds: 1), () {
      getVictimNameList();
    });
    Future.delayed(Duration(seconds: 1), () {
      getAssetRestorationActionTakenByList();
    });
    Future.delayed(Duration(seconds: 1), () {
      getRiskTypeList();
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

  Future<void> getBlocksList(int _facilityId) async {
    blockList.value = <BlockModel>[];
    final _blockList =
        await incidentReportPresenter.getBlocksList(facilityId: _facilityId);

    if (_blockList != null) {
      for (var block in _blockList) {
        blockList.add(block!);
      }
      update(["blockList"]);
    }
  }

  Future<void> getIncidentReportDetail({required int id}) async {
    // newPermitDetails!.value = <NewPermitListModel>[];
    incidentReportDetailsList?.value = <IncidentReportDetailsModel>[];

    final _incidentReportDetails =
        await incidentReportPresenter.getIncidentReportDetail(id: id);
    print('Incident Report Detail:$_incidentReportDetails');

    if (_incidentReportDetails != null) {
      incidentReportDetailsModel.value = _incidentReportDetails;

      selectedBlock.value = incidentReportDetailsModel.value?.block_name ?? '';
      selectedEquipmentName.value =
          incidentReportDetailsModel.value?.equipment_name ?? '';

      startDateTimeCtrlr.text =
          '${DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.parse('${incidentReportDetailsModel.value?.incident_datetime}'))}';
      reportingDateTimeCtrlr.text =
          '${DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.parse('${incidentReportDetailsModel.value?.reporting_datetime}'))}';
      titleTextCtrlr.text = incidentReportDetailsModel.value?.title ?? '';
      incidentreportDescriptionCtrlr.text =
          incidentReportDetailsModel.value?.description ?? '';
      selectedVictimNameList.value =
          incidentReportDetailsModel.value?.victim_name ?? '';
      selectedIncidentInvestigationDoneByList.value =
          incidentReportDetailsModel.value?.inverstigated_by_name ?? '';
      actionTakenDateTimeCtrlr.text =
          '${DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.parse('${incidentReportDetailsModel.value?.action_taken_datetime}'))}';
      selectedIncidentInvestigationVerificationDoneByList.value =
          incidentReportDetailsModel.value?.verified_by_name ?? '';
      damagedAssetCostTextCtrlr.text =
          '${int.tryParse('${incidentReportDetailsModel.value?.damaged_cost ?? 0}')}';
      selectedAssetRestorationActionTakenByList.value =
          incidentReportDetailsModel.value?.action_taken_by_name ?? '';
      insuranceAvailableTextCtrlr.text =
          incidentReportDetailsModel.value?.insurance_name ?? '';
      insuranceRemarkTextCtrlr.text =
          incidentReportDetailsModel.value?.insurance_remark ?? '';
      genLossAssetDamageTextCtrlr.text =
          '${int.tryParse('${incidentReportDetailsModel.value?.generation_loss ?? 0}')}';
      print('genLossAssetDamageTextCtrlr:${genLossAssetDamageTextCtrlr.text}');

      ///For Update
      selectedBlockId = incidentReportDetailsModel.value?.block_id ?? 0;
      selectedEquipmentnameId =
          incidentReportDetailsModel.value?.equipment_id ?? 0;
      selectedVictimNameId = incidentReportDetailsModel.value?.victim_id ?? 0;
      selectedAssetRestorationActionTakenById =
          incidentReportDetailsModel.value?.action_taken_by ?? 0;
      selectedIncidentInvestigationDoneById =
          incidentReportDetailsModel.value?.inverstigated_by ?? 0;
      selectedIncidentInvestigationVerificationDoneById =
          incidentReportDetailsModel.value?.verified_by ?? 0;
      startDateTimeCtrlrBuffer =
          '${DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(DateTime.parse('${incidentReportDetailsModel.value?.incident_datetime}'))}';
      reportingDateTimeCtrlrBuffer =
          '${DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(DateTime.parse('${incidentReportDetailsModel.value?.reporting_datetime}'))}';
      actionTakenDateTimeCtrlrBuffer =
          '${DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(DateTime.parse('${incidentReportDetailsModel.value?.action_taken_datetime}'))}';
      insuranceAvailableTextCtrlr.text =
          incidentReportDetailsModel.value?.insurance_name ?? '';
      titleTextCtrlr.text = incidentReportDetailsModel.value?.title ?? '';
      incidentreportDescriptionCtrlr.text =
          incidentReportDetailsModel.value?.description ?? '';
      insuranceRemarkTextCtrlr.text =
          incidentReportDetailsModel.value?.insurance_remark ?? '';
      damagedAssetCostTextCtrlr.text =
          '${incidentReportDetailsModel.value?.damaged_cost ?? 0}';
      genLossAssetDamageTextCtrlr.text =
          '${incidentReportDetailsModel.value?.generation_loss ?? 0}';
      selectedSeverity.value =
          '${incidentReportDetailsModel.value?.severity ?? ''}';
      selectedRiskTypeId = incidentReportDetailsModel.value?.risk_type ?? 0;
      selectedRiskTypeList.value =
          incidentReportDetailsModel.value?.risk_type_name ?? '';
    }
  }

  void getIncidentInvestigationDoneByList() async {
    incidentInvestigationDoneByList.value = <EmployeeListModel>[];
    final _incidentInvestigationDoneByList =
        await incidentReportPresenter.getIncidentInvestigationDoneByList(
      isLoading: true,
      // categoryIds: categoryIds,
      facility_id: facilityId,
    );
    print(
        'incident Investigation Done By List:$incidentInvestigationDoneByList');
    for (var incidentInvestigationDoneBy_list
        in _incidentInvestigationDoneByList) {
      incidentInvestigationDoneByList.add(incidentInvestigationDoneBy_list);
    }

    update(['incidentInvestigationDoneBy_list']);
  }

  void getIncidentInvestigationVerificationDoneByList() async {
    incidentInvestigationVerificationDoneByList.value = <EmployeeListModel>[];
    final _incidentInvestigationVerificationDoneByList =
        await incidentReportPresenter
            .getIncidentInvestigationVerificationDoneByList(
      isLoading: true,
      // categoryIds: categoryIds,
      facility_id: facilityId,
    );
    print(
        'incident Investigation Verification Done By List:$incidentInvestigationVerificationDoneByList');
    for (var incidentInvestigationVerificationDoneBy_list
        in _incidentInvestigationVerificationDoneByList) {
      incidentInvestigationVerificationDoneByList
          .add(incidentInvestigationVerificationDoneBy_list);
    }

    update(['incidentInvestigationVerificationDoneBy_list']);
  }

  Future<void> getIncidentReportHistory({required int id}) async {
    /// TODO: CHANGE THESE VALUES
    int moduleType = 131;
    // int tempModuleType = 21;
    int id = Get.arguments;
    //
    historyList?.value = await incidentReportPresenter.getIncidentReportHistory(
          // tempModuleType,
          // tempJobCardId,
          moduleType,
          id,
          true,
        ) ??
        [];
    update(["historyList"]);
  }

  void getVictimNameList() async {
    victimNameList.value = <EmployeeListModel>[];
    final _victimNameList = await incidentReportPresenter.getVictimNameList(
      isLoading: true,
      // categoryIds: categoryIds,
      facility_id: facilityId,
    );
    print('victim Name List:$incidentInvestigationVerificationDoneByList');
    for (var victim_name_list in _victimNameList) {
      victimNameList.add(victim_name_list);
    }

    update(['victim_name_list']);
  }

  void getRiskTypeList() async {
    riskTypeList.value = <RiskTypeModel>[];
    final _riskTypeList = await incidentReportPresenter.getRiskTypeList(
      isLoading: true,
      // categoryIds: categoryIds,
      facility_id: facilityId,
    );
    print('Risk Type List:$_riskTypeList');
    for (var riskType_list in _riskTypeList) {
      riskTypeList.add(riskType_list);
    }

    update(['riskType_list']);
  }

  void getAssetRestorationActionTakenByList() async {
    assetRestorationActionTakenByList.value = <EmployeeListModel>[];
    final _assetRestorationActionTakenByList =
        await incidentReportPresenter.getAssetRestorationActionTakenByList(
      isLoading: true,
      // categoryIds: categoryIds,
      facility_id: facilityId,
    );
    print(
        'Asset Restoration Action Taken By List:$incidentInvestigationVerificationDoneByList');
    for (var victim_name_list in _assetRestorationActionTakenByList) {
      assetRestorationActionTakenByList.add(victim_name_list);
    }

    update(['asset_restoration_action_taken_by_list']);
  }

  Future<void> getFacilityPlantList() async {
    final _facilityPlantList =
        await incidentReportPresenter.getFacilityPlantList();
    //print('Facility25:$_facilityList');
    if (_facilityPlantList != null) {
      for (var facility in _facilityPlantList) {
        facilityPlantList.add(facility);
      }

      // selectedPlantFacility.value = facilityPlantList[0]?.name ?? '';
      _facilityId.sink.add(facilityPlantList[0]?.id ?? 0);
    }
  }

  Future<void> getTypePermitList() async {
    final _permitTypeList =
        await incidentReportPresenter.getTypePermitList(facility_id: 45);

    if (_permitTypeList != null) {
      for (var permitType in _permitTypeList) {
        typePermitList.add(permitType);
      }
      // selectedTypePermit.value = typePermitList[0]?.name ?? '';
    }
  }

  void getInventoryList() async {
    eqipmentNameList.value = <InventoryModel>[];
    final _inventoryList = await incidentReportPresenter.getInventoryList(
      isLoading: true,
      categoryIds: categoryIds,
      facilityId: facilityId,
    );
    //  print('equipment Name List:$inventoryNameList');
    for (var inventory_list in _inventoryList) {
      eqipmentNameList.add(inventory_list);
    }
    inventoryList = _inventoryList;
    paginationController = PaginationController(
      rowCount: eqipmentNameList.length,
      rowsPerPage: 10,
    );
    update(['inventory_list']);
  }

  // Future<void> getuserAccessData() async {
  //   final _userAccessList = await incidentReportPresenter.getUserAccessList();

  //   if (_userAccessList != null) {
  //     final userAccessModelList = jsonDecode(_userAccessList);
  //     var userAccess = AccessListModel.fromJson(userAccessModelList);
  //     varUserAccessModel.value = userAccess;
  //     varUserAccessModel.value.access_list = userAccess.access_list;
  //   }
  // }

  // void getIncidentReportList() async {
  //   incidentReportModelList.value = <IncidentReportListModel>[];

  //   final list = await incidentReportPresenter.getIncidentReportList(
  //       isLoading: true,
  //       start_date: '2020-01-01',
  //       end_date: '2023-12-31',
  //       facility_id: facilityId
  //       );
  //       print('incidentReportFacilityId$facilityId');
  //   print('Incident Report List:$list');
  //   for (var incident_list in list) {
  //     incidentReportModelList.add(incident_list);
  //   }
  //   incidentReportList = list;
  //   paginationIncidentReportController = PaginationController(
  //     rowCount: incidentReportList.length,
  //     rowsPerPage: 10,
  //   );
  //   update(['incident_report_list']);
  // }

  void onValueChanged(dynamic list, dynamic value) {
    print('Valuesd:${value}');
    switch (list.runtimeType) {
      case RxList<FacilityModel>:
        {
          int facilityIndex = facilityList.indexWhere((x) => x?.name == value);

          _facilityId.add(facilityList[facilityIndex]?.id ?? 0);
          if (selectedFacilityId != 0) {
            isFacilitySelected.value = true;
          }
          selectedFacility.value = value;
          getBlocksList(selectedFacilityId!);
        }
        break;
      case RxList<InventoryModel>:
        {
          // for (var workAreaName in selectedWorkAreaNameList) {
          int equipmentNameIndex =
              eqipmentNameList.indexWhere((x) => x?.name == value);
          selectedEquipmentnameId =
              eqipmentNameList[equipmentNameIndex]?.id ?? 0;
          // getInventoryDetail();

          if (selectedEquipmentnameId > 0) {
            isEquipmentNameSelected.value = true;
          }
          selectedEquipmentName.value = value;

          print('Equipment name Id: $selectedEquipmentnameId');

          // }
        }
        break;
      case RxList<BlockModel>:
        {
          int blockIndex = blockList.indexWhere((x) => x?.name == value);
          selectedBlockId = blockList[blockIndex]?.id ?? 0;
          if (selectedBlockId > 0) {
            isBlockSelected.value = true;
          }
          selectedBlock.value = value;
          // getInventoryCategoryList(facilityId: selectedBlockId.toString());
        }
        break;
      // case RxList<InventoryCategoryModel2>:
      //   {
      //     // for (var workAreaName in selectedWorkAreaNameList) {
      //     int affectedPartIndex =
      //         affectedPartEqipmentNameList.indexWhere((x) => x?.name == value);
      //     selectedAffectedPartId =
      //         affectedPartEqipmentNameList[affectedPartIndex]?.id ?? 0;
      //     selectedAffectedPartName =
      //         affectedPartEqipmentNameList[affectedPartIndex]?.name ?? '';

      //     if (selectedAffectedPartId > 0) {
      //       isAffectedPartSelected.value = true;
      //     }
      //     selectedAffectedPart.value = value;
      //     print('Affected part Id: $selectedAffectedPartId');
      //     print('Affected part name : $selectedAffectedPartName');

      //     // }
      //   }
      //   break;
      case RxList<EmployeeListModel>:
        {
          int incidentInvestigationDoneByListIndex =
              incidentInvestigationDoneByList
                  .indexWhere((x) => x.name == value);
          selectedIncidentInvestigationDoneById =
              incidentInvestigationDoneByList[
                          incidentInvestigationDoneByListIndex]
                      .id ??
                  0;
          selectedIncidentInvestigationVerificationDoneById =
              incidentInvestigationDoneByList[
                          incidentInvestigationDoneByListIndex]
                      .id ??
                  0;

          if (selectedIncidentInvestigationDoneById > 0) {
            isincidentInvestigationDoneByListSelected.value = true;
          }
          selectedIncidentInvestigationDoneByList.value = value;
          print(
              'Incident Investigation Done By Id: $selectedIncidentInvestigationDoneById');
        }
        break;
      case RxList<RiskTypeModel>:
        {
          int riskTypeListIndex =
              riskTypeList.indexWhere((x) => x.name == value);
          selectedRiskTypeId = riskTypeList[riskTypeListIndex].id ?? 0;
          print('Risk Type id: $selectedRiskTypeId');
        }
        break;

      default:
        {
          //statements;
        }
        break;
    }
  }

  void onValueIncidentVerificationChanged(dynamic list, dynamic value) {
    print('Value Verification:${value}');

    int incidentInvestigationVerificationDoneByListIndex =
        incidentInvestigationVerificationDoneByList
            .indexWhere((x) => x.name == value);
    selectedIncidentInvestigationVerificationDoneById =
        incidentInvestigationVerificationDoneByList[
                    incidentInvestigationVerificationDoneByListIndex]
                .id ??
            0;

    if (selectedIncidentInvestigationVerificationDoneById > 0) {
      isincidentInvestigationVerificationDoneByListSelected.value = true;
    }
    selectedIncidentInvestigationVerificationDoneByList.value = value;
    print(
        'Incident Investigation Verification Done By Id: $selectedIncidentInvestigationVerificationDoneById');
  }

  void onValueVictimNameChanged(dynamic list, dynamic value) {
    print('Value Victim Name:${value}');

    int victimNameListIndex = victimNameList.indexWhere((x) => x.name == value);
    selectedVictimNameId = victimNameList[victimNameListIndex].id ?? 0;

    if (selectedVictimNameId > 0) {
      isVictimNameListSelected.value = true;
    }
    selectedVictimNameList.value = value;
    print('Victim name Id: $selectedVictimNameId');
  }

  void onValueAssetRestorationActionTakenByChanged(
      dynamic list, dynamic value) {
    print('Value Asset Restoration Action Taken By:${value}');

    int assetRestorationActionTakenByListIndex =
        assetRestorationActionTakenByList.indexWhere((x) => x.name == value);
    selectedAssetRestorationActionTakenById = assetRestorationActionTakenByList[
                assetRestorationActionTakenByListIndex]
            .id ??
        0;

    if (selectedAssetRestorationActionTakenById > 0) {
      isAssetRestorationActionTakenByListSelected.value = true;
    }
    selectedAssetRestorationActionTakenByList.value = value;
    print(
        'Asset Restoration Action Taken By Id: $selectedAssetRestorationActionTakenById');
  }

  void checkForm() {
    if (selectedBlock.value == '') {
      isBlockSelected.value = false;
    }
    if (selectedEquipmentName.value == '') {
      isEquipmentNameSelected.value = false;
    }
    if (startDateTimeCtrlr.text == '') {
      Fluttertoast.showToast(
          msg: 'Incident Date & Time Field cannot be empty',
          timeInSecForIosWeb: 5);
    }
    if (reportingDateTimeCtrlr.text == '') {
      Fluttertoast.showToast(
          msg: 'Reporting Date & Time Field cannot be empty',
          timeInSecForIosWeb: 5);
    }
    if (selectedVictimNameList.value == '') {
      isVictimNameListSelected.value = false;
    }
    if (actionTakenDateTimeCtrlr.text == '') {
      Fluttertoast.showToast(
          msg: 'Action Taken By Date & Time Field cannot be empty',
          timeInSecForIosWeb: 5);
    }
    if (selectedAssetRestorationActionTakenByList.value == '') {
      isAssetRestorationActionTakenByListSelected.value = false;
    }
    if (selectedIncidentInvestigationVerificationDoneByList.value == '') {
      isincidentInvestigationVerificationDoneByListSelected.value = false;
    }
    if (damagedAssetCostTextCtrlr.text == '') {
      Fluttertoast.showToast(
          msg: 'Damaged cost Field cannot be empty', timeInSecForIosWeb: 5);
    }
    if (genLossAssetDamageTextCtrlr.text == '') {
      Fluttertoast.showToast(
          msg: 'Generation Loss Field cannot be empty', timeInSecForIosWeb: 5);
    }
    if (titleTextCtrlr.text == '') {
      Fluttertoast.showToast(
          msg: 'Title Field cannot be empty', timeInSecForIosWeb: 5);
    }
    if (incidentreportDescriptionCtrlr.text == '') {
      Fluttertoast.showToast(
          msg: 'Incident Description Field cannot be empty',
          timeInSecForIosWeb: 5);
    }
    if (insuranceAvailableTextCtrlr.text == '') {
      Fluttertoast.showToast(
          msg: 'Insurance Available Field cannot be empty',
          timeInSecForIosWeb: 5);
    }
    if (insuranceRemarkTextCtrlr.text == '') {
      Fluttertoast.showToast(
          msg: 'Insurance Remark Field cannot be empty', timeInSecForIosWeb: 5);
    }
    // if (immediateCorrectiveActionTextController.text == '') {
    //   Fluttertoast.showToast(
    //       msg: 'Corrective Action Field cannot be empty',
    //       timeInSecForIosWeb: 5);
    // }
    // if (requestManufactureTextController.text == '') {
    //   Fluttertoast.showToast(
    //       msg: 'Request Field cannot be empty', timeInSecForIosWeb: 5);
    // }
    if (isBlockSelected.value == false ||
        isEquipmentNameSelected.value == false ||
        isVictimNameListSelected.value == false ||
        isAssetRestorationActionTakenByListSelected.value == false ||
        isincidentInvestigationDoneByListSelected.value == false ||
        isincidentInvestigationVerificationDoneByListSelected.value == false) {
      isFormInvalid.value = true;
    } else {
      isFormInvalid.value = false;
    }
  }

  ///Create Incident Report
  void createIncidentReport() async {
    {
      checkForm();
      if (isFormInvalid.value) {
        return;
      }
      String _title = htmlEscape.convert(titleTextCtrlr.text.trim());
      String _incidentDescription =
          htmlEscape.convert(incidentreportDescriptionCtrlr.text.trim());
      String _insuranceRemark =
          htmlEscape.convert(insuranceRemarkTextCtrlr.text.trim());
      String _insuranceAvailable =
          htmlEscape.convert(insuranceAvailableTextCtrlr.text.trim());
      // // String _costOfReplacement =
      // //     htmlEscape.convert(costOfReplacementTextController.text.trim());
      // String _orderReferenceNo =
      //     htmlEscape.convert(orderReferenceNoTextController.text.trim());
      // String _affectedSerialNo =
      //     htmlEscape.convert(affectedSerialNoTextController.text.trim());

      // int costOfReplacement =
      //     int.parse(costOfReplacementTextController.text.trim());

      // int? sopFileId = createSOPModel2.sop_fileId;
      // // int? jsaFileId = data.jsa_fileId;
      // print('SOPFileId:$sopFileId');
      // late List<ExternalEmails> external_emails_list = [];

      // externalEmails.forEach((e) {
      //   external_emails_list.add(ExternalEmails(name: e.name, email: e.email));
      // });

      // late List<SupplierActions> supplier_action_list = [];

      // supplierActions.forEach((e) {
      //   supplier_action_list.add(SupplierActions(
      //     name: e.name,
      //     required_by_date: e.required_by_date,
      //     // is_required: e.is_required
      //   ));
      // });

      CreateIncidentReportModel createIncidentReportModel =
          CreateIncidentReportModel(
              id: 0,
              facility_id: facilityId,
              block_id: selectedBlockId,
              equipment_id: selectedEquipmentnameId,
              risk_level: 1,
              incident_datetime: startDateTimeCtrlrBuffer,
              reporting_datetime: reportingDateTimeCtrlrBuffer,
              victim_id: selectedVictimNameId,
              action_taken_by: selectedAssetRestorationActionTakenById,
              action_taken_datetime: actionTakenDateTimeCtrlrBuffer,
              inverstigated_by: selectedIncidentInvestigationDoneById,
              verified_by: selectedIncidentInvestigationVerificationDoneById,
              risk_type: selectedRiskTypeId,
              esi_applicability: esiApplicabilityValue.value,
              legal_applicability: legalApplicabilityValue.value,
              rca_required: rCAUploadRequiredValue.value,
              damaged_cost:
                  int.tryParse('${damagedAssetCostTextCtrlr.text}') ?? 0,
              generation_loss:
                  int.tryParse('${genLossAssetDamageTextCtrlr.text}') ?? 0,
              job_id: 2061,
              title: _title,
              description: _incidentDescription,
              is_insurance_applicable: insuranceApplicableValue.value,
              insurance: _insuranceAvailable,
              insurance_status: 2,
              insurance_remark: _insuranceRemark,
              severity: selectedSeverity.value);

      var incidentReportJsonString = createIncidentReportModel.toJson();
      Map<String, dynamic>? responseCreateIncidentReport =
          await incidentReportPresenter.createIncidentReport(
        createIncidentReport: incidentReportJsonString,
        isLoading: true,
      );

      if (responseCreateIncidentReport == null) {
        //  CreateNewPermitDialog();
        // showAlertDialog();
      }
      print('Create Incident Report data: $incidentReportJsonString');
    }
  }

  ///Update Incident Report
  void updateIncidentReport() async {
    {
      checkForm();
      if (isFormInvalid.value) {
        return;
      }
      String _title = htmlEscape.convert(titleTextCtrlr.text.trim());
      String _incidentDescription =
          htmlEscape.convert(incidentreportDescriptionCtrlr.text.trim());
      String _insuranceRemark =
          htmlEscape.convert(insuranceRemarkTextCtrlr.text.trim());
      String _insuranceAvailable =
          htmlEscape.convert(insuranceAvailableTextCtrlr.text.trim());
      // // String _costOfReplacement =
      // //     htmlEscape.convert(costOfReplacementTextController.text.trim());
      // String _orderReferenceNo =
      //     htmlEscape.convert(orderReferenceNoTextController.text.trim());
      // String _affectedSerialNo =
      //     htmlEscape.convert(affectedSerialNoTextController.text.trim());

      // int costOfReplacement =
      //     int.parse(costOfReplacementTextController.text.trim());

      // int? sopFileId = createSOPModel2.sop_fileId;
      // // int? jsaFileId = data.jsa_fileId;
      // print('SOPFileId:$sopFileId');
      // late List<ExternalEmails> external_emails_list = [];

      // externalEmails.forEach((e) {
      //   external_emails_list.add(ExternalEmails(name: e.name, email: e.email));
      // });

      // late List<SupplierActions> supplier_action_list = [];

      // supplierActions.forEach((e) {
      //   supplier_action_list.add(SupplierActions(
      //     name: e.name,
      //     required_by_date: e.required_by_date,
      //     // is_required: e.is_required
      //   ));
      // });

      CreateIncidentReportModel updateIncidentReportModel =
          CreateIncidentReportModel(
              id: id,
              facility_id: facilityId,
              block_id: selectedBlockId,
              equipment_id: selectedEquipmentnameId,
              risk_level: 2,
              victim_id: selectedVictimNameId,
              action_taken_by: selectedAssetRestorationActionTakenById,
              inverstigated_by: selectedIncidentInvestigationDoneById,
              verified_by: selectedIncidentInvestigationVerificationDoneById,
              risk_type: selectedRiskTypeId,
              legal_applicability: incidentReportDetailsModel
                          .value?.legal_applicability_name ==
                      "YES"
                  ? legalApplicabilityDetailValue.value
                  : legalApplicabilityDetailFalseValue.value,
              esi_applicability: incidentReportDetailsModel
                          .value?.esi_applicability_name ==
                      "YES"
                  ? esiApplicabilityDetailValue.value
                  : esiApplicabilityDetailFalseValue.value,
              incident_datetime: startDateTimeCtrlrBuffer,
              action_taken_datetime: actionTakenDateTimeCtrlrBuffer,
              reporting_datetime: reportingDateTimeCtrlrBuffer,
              insurance: _insuranceAvailable,
              title: _title,
              rca_required:
                  incidentReportDetailsModel.value?.rca_required_name ==
                          "YES"
                      ? rCAUploadRequiredDetailValue.value
                      : rCAUploadRequiredDetailFalseValue.value,
              damaged_cost:
                  int.tryParse('${damagedAssetCostTextCtrlr.text}') ?? 0,
              generation_loss:
                  int.tryParse('${genLossAssetDamageTextCtrlr.text}') ?? 0,
              job_id: 2061,
              description: _incidentDescription,
              is_insurance_applicable: true,
              insurance_status: 2,
              insurance_remark: _insuranceRemark,
              severity: selectedSeverity.value);

      var updateIncidentReportJsonString = updateIncidentReportModel.toJson();
      Map<String, dynamic>? responseUpdateIncidentReport =
          await incidentReportPresenter.updateIncidentReport(
        updateIncidentReport: updateIncidentReportJsonString,
        isLoading: true,
      );

      if (responseUpdateIncidentReport == null) {
        // showAlertDialog();
      }
      print('Update Incident Report data: $updateIncidentReportJsonString');
    }
  }
}
