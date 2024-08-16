import 'dart:async';
import 'dart:convert';

import 'package:cmms/app/add_incident_report/add_incident_report_presenter.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/body_injured_model.dart';
import 'package:cmms/domain/models/business_list_model.dart';
import 'package:cmms/domain/models/create_incident_report_model.dart';
import 'package:cmms/domain/models/designation_model.dart';
import 'package:cmms/domain/models/employee_list_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/incident_report_details_model.dart';
import 'package:cmms/domain/models/incident_report_list_model.dart';
import 'package:cmms/domain/models/risk_type_list_model.dart';
import 'package:cmms/domain/models/type_model.dart';
import 'package:cmms/domain/models/type_permit_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/subjects.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/facility_model.dart';

import 'package:cmms/domain/models/incident_risk_type_model.dart';

class AddIncidentReportController extends GetxController {
  AddIncidentReportController(this.incidentReportPresenter);
  AddIncidentReportPresenter incidentReportPresenter;

  final HomeController homeController = Get.find();
  FocusNode typeOfJbFocusNode = FocusNode();
  FocusNode personInvolvedFocusNode = FocusNode();
  FocusNode personAuthorizedInvolvedFocusNode = FocusNode();
  FocusNode instructionsFocusNode = FocusNode();
  FocusNode safetyEquipmentsFocusNode = FocusNode();
  FocusNode correctSafeFocusNode = FocusNode();
  FocusNode unsafeConditionsFocusNode = FocusNode();
  FocusNode unsafeActCauseFocusNode = FocusNode();
  ScrollController typeOfJbScrollController = ScrollController();
  ScrollController personInvolvedScrollController = ScrollController();
  ScrollController personAuthorizedInvolvedScrollController =
      ScrollController();
  ScrollController instructionsScrollController = ScrollController();
  ScrollController safetyEquipmentsScrollController = ScrollController();
  ScrollController correctSafeScrollController = ScrollController();
  ScrollController unsafeConditionsScrollController = ScrollController();
  ScrollController unsafeActCauseScrollController = ScrollController();

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
  RxInt counter = 0.obs;
  void incrementCounter() {
    counter++;
  }

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
  RxList<DesignationModel?> responsbilityList = <DesignationModel>[].obs;
  // var blockList = <BlockModel>[];
  ///Business List
  RxMap<dynamic, dynamic> dropdownMapperData = {}.obs;
  RxList<BusinessListModel> businessList = <BusinessListModel>[].obs;
  RxList<BodyInjuredModel?> bodyinjuredList = <BodyInjuredModel>[].obs;

  Map<String, BusinessListModel> dropdownBusinessListMapperData = {};
  Map<String, BodyInjuredModel> dropdownBodyinjuredListMapperData = {};

  Rx<bool> isBusinessListSelected = true.obs;
  Rx<String> selectedIBusinessList = ''.obs;
  Rx<bool> isBodyinjuredListSelected = true.obs;
  Rx<String> selectedIBodyinjuredList = ''.obs;
  RxBool isDateInvalid = false.obs;

  int selectedBusinessListId = 0;
  int selectedBodyinjuredListId = 0;

  // ///Dropdown testing
  RxList<String> dataList = <String>['Data 1', 'Data 2'].obs;

  // void addData(String newData) {
  //   victimNameList.add(EmployeeListModel(name: newData));
  // }

  // Example of adding one more data
  void addOneMoreData() {
    victimNameList.add(EmployeeListModel(name: "Other"));
    victimNameList.reversed.toList();
  }

  RxString selectedOption = ''.obs;
  void updateSelectedOption(String newValue) {
    selectedOption.value = newValue;
  }

  /// Victim Name List
  RxList<EmployeeListModel> victimNameList = <EmployeeListModel>[].obs;
  RxMap<dynamic, dynamic> dropdownVictimNameMapperData = {}.obs;

  RxList<EmployeeListModel?> filteredVictimNameList = <EmployeeListModel>[].obs;
  Map<dynamic, dynamic> employee_map = {};

  Rx<bool> isVictimNameListSelected = true.obs;
  Rx<String> selectedVictimNameList = ''.obs;
  RxList<String?> selectedVictimNameDataList = <String>[].obs;
  RxList<int?> selectedVictimNameIdList = <int>[].obs;
  int selectedVictimNameId = 0;
  RxList<int?> selectedVictimIdList = <int>[2].obs;

  ///Risk Type List
  RxList<RiskTypeModel> riskTypeList = <RiskTypeModel>[].obs;
  RxList<IncidentRiskTypeModell> incidentrisktypeList =
      <IncidentRiskTypeModell>[].obs;
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
  int incidenttypeId = 0;

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
  var isToggleOn = false.obs;
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
  //switch toggle
  final isSuccess = false.obs;
  void toggle() {
    isToggleOn.value = !isToggleOn.value;
  }

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
  Map<String, InventoryModel> dropdownEquipmentNameMapperData = {};

  Map<String, GenderModel> dropdownGenderMapperData = {};
  // Map<String, GenderModel> dropdownStatusMapperData = {};

  RxList<GenderModel> genderList = <GenderModel>[
    GenderModel(name: 'Male', id: 1),
    GenderModel(name: 'Female', id: 2),
    GenderModel(name: 'TransGender', id: 3),
  ].obs;

  Map<String, StatusModel> statusDropDownMapperData = {};

  RxList<StatusModel> statusList = <StatusModel>[
    StatusModel(name: 'Open', id: 1),
    StatusModel(name: 'Close', id: 2),
  ].obs;

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

  final Rx<DateTime?> selectedDate = DateTime.now().obs;

  Rx<bool> isInsuranceAvailableInvalid = false.obs;
  var insuranceAvailableTextCtrlr = TextEditingController();
  var testDataTextCtrlr = TextEditingController();

  bool openbreaketimeDatePicker = false;

  Rx<bool> isOtherVictimNameInvalid = false.obs;
  var otherVictimNameTextCtrlr = TextEditingController();

  Rx<bool> isTradeDesignationInvalid = false.obs;
  var tradeDesignationTextCtrlr = TextEditingController();

  ///Propsed Row item
  RxList<List<Map<String, String>>> rowItem = <List<Map<String, String>>>[].obs;

  ///Details of njured Person
  RxList<List<Map<String, String>>> rowInjuredPersonItem =
      <List<Map<String, String>>>[].obs;
  // Details of other injured person
  RxList<List<Map<String, String>>> rowOtherInjuredPersonItem =
      <List<Map<String, String>>>[].obs;

  //why why analysis
  RxList<List<Map<String, String>>> rowWhyWhyAnalysisItem =
      <List<Map<String, String>>>[].obs;

  ///Root cause
  RxList<List<Map<String, String>>> rowRootCauseItem =
      <List<Map<String, String>>>[].obs;

  //immediate correction
  RxList<List<Map<String, String>>> rowImmediateCorrectionItem =
      <List<Map<String, String>>>[].obs;

//Address textfield
  Rx<bool> isAddressInvalid = false.obs;
  var addressTextCtrlr = TextEditingController();

  //Exact location textfield
  Rx<bool> isExactLoactionInvalid = false.obs;
  var exactLocationTextCtrlr = TextEditingController();
  List<dynamic>? files = [];

  RxList<FileList?>? fileList = <FileList>[].obs;

  ///Investigation Team Part
  RxList<InvestigationTeamUpdate?>? investigationTeamList =
      <InvestigationTeamUpdate?>[].obs;

  var investigationTeam = <InvestigationTeam>[].obs;
  void updateInvestigationTeamText(
      String srNumber, String name, String designation) {
    investigationTeam.add(InvestigationTeam(
        srNumber: '${investigationTeam.length + 1}.',
        name: name,
        designation: designation));
  }

  void clearTextFields() {
    investigationTeamSrNumberTextFieldController.clear();
    investigationTeamNameTextFieldController.clear();
    investigationTeamDesignationTextFieldController.clear();
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
  var unsafeActCauseTextCtrlr = TextEditingController();

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

  RxBool esiText = false.obs;

  ///For Detail Switch
  RxBool esiApplicabilityDetailValue = true.obs;
  RxBool rCAUploadRequiredDetailValue = true.obs;
  RxBool legalApplicabilityDetailValue = true.obs;
  RxBool insuranceApplicableDetailValue = true.obs;

  ///For Why Why analysis switch
  RxBool whyWhyAnalysisRequiredValue = true.obs;
  RxBool whyWhyAnalysisValue = false.obs;
  RxBool detailInvestigationTeamValue = false.obs;

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

  ///Gender
  var gender = 'Select Gender'.obs;
  void updateGender(String value) {
    gender.value = value;
  }

  ///
  Rx<int> irId = 0.obs;

  @override
  void onInit() async {
    try {
      await setUserId();
      facilityIdStreamSubscription = homeController.facilityId$.listen((event) {
        facilityId = event;
        if (facilityId > 0) {
          Future.delayed(Duration(seconds: 1), () {
            getFacilityList();
          });
          Future.delayed(Duration(seconds: 1), () {
            getBlocksList(facilityId);
            getIncidentRiskType(facilityId);
          });
        }
      });
      if (irId.value != 0) {
        Future.delayed(Duration(seconds: 1), () async {
          await getIncidentReportDetail(id: irId.value); //code
          await getIncidentReportHistory(id: irId.value);
        });
      }
      if (irId != 0) {
        Future.delayed(Duration(seconds: 1), () {});
      }
      Future.delayed(Duration(seconds: 1), () async {
        await getFacilityPlantList();
      });

      // Future.delayed(Duration(seconds: 1), () {
      //   getuserAccessData();
      // });
      Future.delayed(Duration(seconds: 1), () async {
        await getResponsibilityList(facilityId);
      });
      ;
      Future.delayed(Duration(seconds: 1), () async {
        getTypePermitList(facilityId);
      });
      Future.delayed(Duration(seconds: 1), () async {
        // getInventoryList();
      });
      Future.delayed(Duration(seconds: 1), () async {
        // getIncidentInvestigationDoneByList();
      });
      Future.delayed(Duration(seconds: 1), () async {
        getIncidentInvestigationVerificationDoneByList();
      });

      Future.delayed(Duration(seconds: 1), () async {
        getAssetRestorationActionTakenByList();
      });
      Future.delayed(Duration(seconds: 1), () async {
        getRiskTypeList();
      });
      Future.delayed(Duration(seconds: 1), () async {
        getBusinessList(facilityId);
      });
      Future.delayed(Duration(seconds: 1), () async {
        addOneMoreData();
      });
      Future.delayed(Duration(seconds: 1), () async {
        getBodyInjuredData();
        getVictimNameList();
        getInventoryList();
      });
    } catch (e) {}

    // typeOfJbFocusNode.addListener(() {
    //   if (!typeOfJbFocusNode.hasFocus) {
    //     typeOfJbScrollController.jumpTo(0.0);
    //   }
    // });
    // personInvolvedFocusNode.addListener(() {
    //   if (!personInvolvedFocusNode.hasFocus) {
    //     personInvolvedScrollController.jumpTo(0.0);
    //   }
    // });
    // personAuthorizedInvolvedFocusNode.addListener(() {
    //   if (!personAuthorizedInvolvedFocusNode.hasFocus) {
    //     personAuthorizedInvolvedScrollController.jumpTo(0.0);
    //   }
    // });
    // instructionsFocusNode.addListener(() {
    //   if (!instructionsFocusNode.hasFocus) {
    //     instructionsScrollController.jumpTo(0.0);
    //   }
    // });
    // safetyEquipmentsFocusNode.addListener(() {
    //   if (!safetyEquipmentsFocusNode.hasFocus) {
    //     safetyEquipmentsScrollController.jumpTo(0.0);
    //   }
    // });
    // correctSafeFocusNode.addListener(() {
    //   if (!correctSafeFocusNode.hasFocus) {
    //     correctSafeScrollController.jumpTo(0.0);
    //   }
    // });
    // unsafeConditionsFocusNode.addListener(() {
    //   if (!unsafeConditionsFocusNode.hasFocus) {
    //     unsafeConditionsScrollController.jumpTo(0.0);
    //   }
    // });
    // unsafeActCauseFocusNode.addListener(() {
    //   if (!unsafeActCauseFocusNode.hasFocus) {
    //     unsafeActCauseScrollController.jumpTo(0.0);
    //   }
    // });
    super.onInit();
  }

  Future<void> setUserId() async {
    try {
      final _irId = await incidentReportPresenter.getValue();
      if (_irId == null || _irId == '' || _irId == "null") {
        var dataFromPreviousScreen = Get.arguments;
        irId.value = dataFromPreviousScreen['irId'];
        incidentReportPresenter.saveValue(irId: irId.value.toString());
      } else {
        irId.value = int.tryParse(_irId) ?? 0;
      }
    } catch (e) {
      print(e.toString() + 'userId');
      //  Utility.showDialog(e.toString() + 'userId');
    }
  }

  // void onInit() async {
  //   irId = Get.arguments;
  //   print('Edit Incident Report Id:$irId');

  //   facilityIdStreamSubscription = homeController.facilityId$.listen((event) {
  //     facilityId = event;

  //     getFacilityList();
  //   });
  //   Future.delayed(Duration(seconds: 1), () {
  //     getBlocksList(facilityId);
  //   });

  //   if (irId != null) {
  //     Future.delayed(Duration(seconds: 1), () {
  //       getIncidentReportDetail(id: irId.value!);
  //     });
  //   }

  //   if (irId != null) {
  //     Future.delayed(Duration(seconds: 1), () {
  //       getIncidentReportHistory(id: irId.value!);
  //     });
  //   }

  //   Future.delayed(Duration(seconds: 1), () {
  //     getFacilityPlantList();
  //   });
  //   // Future.delayed(Duration(seconds: 1), () {
  //   //   getuserAccessData();
  //   // });
  //   Future.delayed(Duration(seconds: 1), () {
  //     getTypePermitList();
  //   });
  //   Future.delayed(Duration(seconds: 1), () {
  //     getInventoryList();
  //   });
  //   Future.delayed(Duration(seconds: 1), () {
  //     getIncidentInvestigationDoneByList();
  //   });
  //   Future.delayed(Duration(seconds: 1), () {
  //     getIncidentInvestigationVerificationDoneByList();
  //   });
  //   Future.delayed(Duration(seconds: 1), () {
  //     getVictimNameList();
  //   });
  //   Future.delayed(Duration(seconds: 1), () {
  //     getAssetRestorationActionTakenByList();
  //   });
  //   Future.delayed(Duration(seconds: 1), () {
  //     getRiskTypeList();
  //   });
  //   Future.delayed(Duration(seconds: 1), () {
  //     getBusinessList();
  //   });
  //   Future.delayed(Duration(seconds: 1), () {
  //     addOneMoreData();
  //   });

  //   super.onInit();
  // }

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

  Future<void> getResponsibilityList(int _facilityId) async {
    responsbilityList.value = <DesignationModel>[];
    final _responsbilityList =
        await incidentReportPresenter.getResponsibilityList();
    // print('jkncejknce:$facilityId');
    if (_responsbilityList != null) {
      for (var asset in _responsbilityList) {
        responsbilityList.add(asset);
      }
      update(["Respon"]);
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
      setSelectedSeverity(_incidentReportDetails.severity ?? '');

      startDateTimeCtrlr.text =
          '${DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.parse('${incidentReportDetailsModel.value?.incident_datetime}'))}';
      reportingDateTimeCtrlr.text =
          '${DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.parse('${incidentReportDetailsModel.value?.reporting_datetime}'))}';
      titleTextCtrlr.text = incidentReportDetailsModel.value?.title ?? '';
      personInvolvedTextCtrlr.text =
          incidentReportDetailsModel.value?.is_person_involved ?? '';
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
      incidenttypeId = incidentReportDetailsModel.value?.risk_type ?? 0;
      selectedRiskTypeList.value =
          incidentReportDetailsModel.value?.risk_type_name ?? '';
      detailInvestigationTeamValue.value =
          incidentReportDetailsModel.value?.is_investigation_required == 1
              ? true
              : false;
      whyWhyAnalysisValue.value =
          incidentReportDetailsModel.value?.is_why_why_required == 1
              ? true
              : false;
      insuranceApplicableValue.value =
          incidentReportDetailsModel.value?.insurance_name != null
              ? true
              : false;
      if (whyWhyAnalysisValue == true) {
        // addWhyWhyAnalysisRowItem();
        // addWhyWhyAnalysisRowItem();
        // addWhyWhyAnalysisRowItem();
      }

      ///new Data

      ESIApplicabilityRemarkTextCtrlr.text =
          incidentReportDetailsModel.value?.esi_applicability_remark ?? '';
      legalApplicabilityRemarkTextCtrlr.text =
          incidentReportDetailsModel.value?.legal_applicability_remark ?? '';
      typeOfJbTextCtrlr.text =
          incidentReportDetailsModel.value?.type_of_job ?? '';
      personAuthorizedInvolvedTextCtrlr.text =
          incidentReportDetailsModel.value?.is_person_authorized ?? '';
      instructionsTextCtrlr.text =
          incidentReportDetailsModel.value?.instructions_given ?? '';
      SafetyEquipmetsTextCtrlr.text =
          incidentReportDetailsModel.value?.safety_equipments ?? '';
      correctSafeTextCtrlr.text =
          incidentReportDetailsModel.value?.safe_procedure_observed ?? '';
      unsafeConditionsTextCtrlr.text =
          incidentReportDetailsModel.value?.unsafe_condition_contributed ?? '';
      unsafeActCauseTextCtrlr.text =
          incidentReportDetailsModel.value?.unsafe_act_cause ?? '';
      investigationTeamList?.value =
          incidentReportDetailsModel.value?.investigation_team ?? [];
      esiApplicabilityValue.value =
          incidentReportDetailsModel.value?.esi_applicability == 1
              ? true
              : false;
      legalApplicabilityValue.value =
          incidentReportDetailsModel.value?.legal_applicability == 1
              ? true
              : false;
      isToggleOn.value =
          incidentReportDetailsModel.value?.Otherinjured_person == []
              ? false
              : true;

      ///why why Analysis
      rowWhyWhyAnalysisItem.value = [];
      _incidentReportDetails.why_why_analysis?.forEach((element) {
        rowWhyWhyAnalysisItem.value.add([
          {'key': "Why ", "value": '${element?.why}'},
          {'key': "Cause ", "value": '${element?.cause}'},
          {'key': "Action ", "value": ''},
        ]);
      });

      ///Root cause
      rowRootCauseItem.value = [];
      _incidentReportDetails.root_cause?.forEach((element) {
        rowRootCauseItem.value.add([
          {'key': "Cause ", "value": '${element?.cause}'},
          {'key': "Action ", "value": ''},
        ]);
      });

      /// immediate correction
      rowImmediateCorrectionItem.value = [];
      _incidentReportDetails.immediate_correction?.forEach((element) {
        rowImmediateCorrectionItem.value.add([
          {'key': "Correction ", "value": '${element?.details}'},
          {'key': "Action ", "value": ''},
        ]);
      });

      ///proposed action plan
      rowItem.value = [];
      _incidentReportDetails.proposed_action_plan?.forEach((element) {
        rowItem.value.add([
          {
            'key': "Action as per plan ",
            "value": '${element?.actions_as_per_plan}'
          },
          {
            "key": "Drop_down",
            "value": '${element?.responsibility}',
          },
          {
            'key': "Target Date ",
            "value":
                '${DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.parse('${element?.target_date}'))}'
          },
          {'key': "Remark", "value": '${element?.remarks}'},
          {'key': "HSC", "value": '${element?.hse_remark}'},
          {
            "key": "Status",
            "value": '${element?.id_Status}',
          },
          {'key': "Action ", "value": ''},
        ]);
        // dropdownEquipmentNameMapperData[element!.responsibility ?? ""] =
        //     eqipmentNameList.firstWhere(
        //         (e) => e?.name == element.responsibility,
        //         orElse: null)!;
      });

      ///Details of Injured person

      rowInjuredPersonItem.value = [];
      _incidentReportDetails.injured_person?.forEach((element) {
        rowInjuredPersonItem.value.add([
          {
            "key": "Name of Injured Person ",
            "value": '${element?.name}',
            "injured_item_id": "${element?.injured_item_id}",
          },
          {
            "key": "Gender ",
            "value": '${element?.sex}',
          },
          {'key': "Trade/Designation ", "value": '${element?.designation}'},
          {'key': "Address ", "value": '${element?.address}'},
          {
            "key": "Name of Contractor ",
            "value": '${element?.name_contractor}',
          },
          {
            "key": "Body part injured ",
            "value": '${element?.body_part_and_nature_of_injury}',
          },
          {
            'key': "work experience ",
            "value": '${element?.work_experience_years}'
          },
          {
            "key": "Plant & Equipment ",
            "value": '${element?.plant_equipment_involved}',
          },
          {
            'key': "Exact Location ",
            "value": '${element?.location_of_incident}'
          },
          {'key': "Action ", "value": ''},
        ]);
        dropdownVictimNameMapperData[element!.name ?? ""] =
            victimNameList.firstWhereOrNull(
          (e) => e.name == element.name,
        );
      });
    }

    ///Details of other Injured person

    rowOtherInjuredPersonItem.value = [];
    _incidentReportDetails?.Otherinjured_person?.forEach((element) {
      rowOtherInjuredPersonItem.value.add([
        {
          "key": "Name of Injured Person ",
          "value": '${element?.name}',
          "otherinjured_item_id": "${element?.injured_item_id}",
        },
        {
          "key": "Gender ",
          "value": '${element?.sex}',
        },
        {
          "key": "Trade/Designation ",
          "value": '${element?.designation}',
        },
        {
          "key": "Address ",
          "value": '${element?.address}',
        },
        {
          "key": "Name of Contractor ",
          "value": '${element?.name_contractor}',
        },
        {
          "key": "Body part injured ",
          "value": '${element?.body_part_and_nature_of_injury}',
        },
        {
          'key': "work experience ",
          "value": '${element?.work_experience_years}',
        },
        {
          "key": "Plant & Equipment ",
          "value": '${element?.plant_equipment_involved}',
        },
        {
          'key': "Exact Location ",
          "value": '${element?.location_of_incident}',
        },
        {
          'key': "Action ",
          "value": '',
        },
      ]);

      // dropdownVictimNameMapperData[element!.name ?? ""] = victimNameList
      //     .firstWhere((e) => e.name == element.name, orElse: null);
    });
  }

  void victimNameSelected(_selectedVictimNameIds) {
    selectedVictimNameIdList.value = <int>[];
    filteredVictimNameList.value = <EmployeeListModel>[];
    late int emp_id = 0;
    for (var _selectedVictimId in _selectedVictimNameIds) {
      selectedVictimNameIdList.add(_selectedVictimId);
      EmployeeListModel? e = victimNameList.firstWhere((element) {
        return element.id == _selectedVictimId;
      });
      filteredVictimNameList.add(e);
    }
    employee_map[emp_id] = selectedVictimNameIdList;
  }

  void removeImage(int? num, int index) {
    files!.remove(num);
    fileList!.removeAt(index);
    print('removed file ids ${files}');
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

  void getBusinessList(int facilityId) async {
    businessList.value = <BusinessListModel>[];
    final _businessList = await incidentReportPresenter.getBusinessList(
      facilityId: facilityId,
      isLoading: true,
      // categoryIds: categoryIds,
      businessType: 2,
    );
    print('Business List:$businessList');
    for (var business_list in _businessList!) {
      businessList.add(business_list!);
    }

    update(['business_list']);
  }

  void getBodyInjuredData() async {
    bodyinjuredList.value = <BodyInjuredModel>[];
    final _bodyinjuredList = await incidentReportPresenter.getBodyInjuredData(
      isLoading: true,
    );
    print('bodyinjured List:$bodyinjuredList');
    for (var bodyinjured_list in _bodyinjuredList!) {
      bodyinjuredList.add(bodyinjured_list!);
    }

    update(['business_list']);
  }

  Future<void> getIncidentReportHistory({required int id}) async {
    /// TODO: CHANGE THESE VALUES
    int moduleType = 131;
    // int tempModuleType = 21;
    // int id = Get.arguments["irId"];
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

  Future<void> getIncidentRiskType(int facilityId) async {
    incidentrisktypeList.value = <IncidentRiskTypeModell>[];
    final _irisktypeList = await incidentReportPresenter.getIncidentRiskType(
      facilityId: facilityId,
      isLoading: true,
    );
    for (var facilityType_list in _irisktypeList) {
      incidentrisktypeList.add(facilityType_list);
    }
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

  Future<void> getTypePermitList(int facility_id) async {
    final _permitTypeList = await incidentReportPresenter.getTypePermitList(
        facility_id: facility_id);

    if (_permitTypeList != null) {
      for (var permitType in _permitTypeList) {
        typePermitList.add(permitType);
      }
      // selectedTypePermit.value = typePermitList[0]?.name ?? '';
    }
  }

  void getInventoryList() async {
    eqipmentNameList.value = <InventoryModel>[
      InventoryModel(
        id: 0,
        name: "NA",
      ),
    ];
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
    irId == 0 ? addDetailsOfInjuredPersonRowItem() : Dimens.box0;
    irId == 0 ? Dimens.box0 : addRowItem();
    irId == 0 ? Dimens.box0 : addWhyWhyAnalysisRowItem();
    irId == 0 ? Dimens.box0 : addRootCauseRowItem();
    irId == 0 ? Dimens.box0 : addImmediateCorrectionRowItem();
    // irId == 0 ? Dimens.box0 : addDetailsOfInjuredPersonRowItem();
  }

  void addRowItem() {
    rowItem.add([
      {'key': "Action as per plan ", "value": ''},
      {
        "key": "Drop_down",
        "value": 'Please Select',
      },
      {'key': "Target Date ", "value": ''},
      {'key': "Remark", "value": ''},
      {'key': "HSE Remark", "value": ''},
      {
        "key": "Status",
        "value": 'Please Select',
      },
      {'key': "Action ", "value": ''},
    ]);
  }

  void addDetailsOfInjuredPersonRowItem() {
    rowInjuredPersonItem.add([
      {
        "key": "Name of Injured Person ",
        "value": 'Please Select',
        "injured_item_id": ''
      },
      {
        "key": "Gender ",
        "value": 'Please Select',
      },
      {'key': "Trade/Designation ", "value": ''},
      {'key': "Address ", "value": ''},
      {
        "key": "Name of Contractor ",
        "value": 'Please Select',
      },
      {
        "key": "Body part injured ",
        "value": 'Please Select',
      },
      {'key': "work experience ", "value": ""},
      {
        "key": "Plant & Equipment ",
        "value": 'Please Select',
      },
      {'key': "Exact Location ", "value": ''},
      {'key': "Action ", "value": ''},
    ]);
  }

  //addDetailsOfOtherInjuredPersonItem
  void addDetailsOfOtherInjuredPersonRowItem() {
    rowOtherInjuredPersonItem.add([
      {
        "key": "Name of Injured Person ",
        "value": '',
        "otherinjured_item_id": ''
      },
      {
        "key": "Gender ",
        "value": 'Please Select',
      },
      {'key': "Trade/Designation ", "value": ''},
      {'key': "Address ", "value": ''},
      {
        "key": "Name of Contractor ",
        "value": 'Please Select',
      },
      {
        "key": "Body part injured ",
        "value": 'Please Select',
      },
      {'key': "work experience ", "value": ''},
      {
        "key": "Plant & Equipment ",
        "value": 'Please Select',
      },
      {'key': "Exact Location ", "value": ''},
      {'key': "Action ", "value": ''},
    ]);
  }

  void addWhyWhyAnalysisRowItem() {
    rowWhyWhyAnalysisItem.add([
      {'key': "Why ", "value": ''},
      {'key': "Cause ", "value": ''},
      {'key': "Action ", "value": ''},
    ]);
  }

  void addRootCauseRowItem() {
    rowRootCauseItem.add([
      {'key': "Cause ", "value": ''},
      {'key': "Action ", "value": ''},
    ]);
  }

  void addImmediateCorrectionRowItem() {
    rowImmediateCorrectionItem.add([
      {'key': "Correction ", "value": ''},
      {'key': "Action ", "value": ''},
    ]);
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
      case const (RxList<FacilityModel>):
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
      case const (RxList<InventoryModel>):
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
      case const (RxList<BlockModel>):
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
      case const (RxList<EmployeeListModel>):
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
      case const (RxList<IncidentRiskTypeModell>):
        {
          int riskTypeListIndex =
              incidentrisktypeList.indexWhere((x) => x.name == value);
          selectedRiskTypeId = incidentrisktypeList[riskTypeListIndex].id ?? 0;
          print('Risk Type id: $selectedRiskTypeId');
        }
        break;
      case const (RxList<BusinessListModel>):
        {
          int businessListIndex =
              businessList.indexWhere((x) => x.name == value);
          selectedBusinessListId = businessList[businessListIndex].id ?? 0;
          print('name of contractor:$selectedBusinessListId');
        }

        break;
      case const (RxList<BodyInjuredModel>):
        {
          int bodyPartInjuredListIndex =
              bodyinjuredList.indexWhere((x) => x?.name == value);
          selectedBodyinjuredListId =
              bodyinjuredList[bodyPartInjuredListIndex]?.id ?? 0;
          print('name of contractor:$selectedBodyinjuredListId');
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
      // isincidentInvestigationVerificationDoneByListSelected.value = true;
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

  void onValuetypeincidentChanged(dynamic list, dynamic value) {
    print('Value Incident type:${value}');

    int typeofincidentListIndex =
        incidentrisktypeList.indexWhere((x) => x.name == value);
    incidenttypeId = incidentrisktypeList[typeofincidentListIndex].id ?? 0;

    if (incidenttypeId > 0) {
      isRiskTypeListSelected.value = true;
    }
    selectedRiskTypeList.value = value;
    print('Type of incident Id: $incidenttypeId');
  }

  void checkForm() {
    if (selectedBlock.value == '') {
      isBlockSelected.value = false;
    }
    if (startDateTimeCtrlr.text == '') {}
    if (selectedRiskTypeList.value == '') {
      isRiskTypeListSelected.value = false;
    }
    if (selectedSeverity.value == '') {
      // Fluttertoast.showToast(
      //     msg: 'Please select severity of incident', timeInSecForIosWeb: 5);
    }
    if (actionTakenDateTimeCtrlr.text == '') {
      // Fluttertoast.showToast(
      //     msg: 'Action Taken By Date & Time Field cannot be empty',
      //     timeInSecForIosWeb: 5);
    }
    if (selectedAssetRestorationActionTakenByList.value == '') {
      isAssetRestorationActionTakenByListSelected.value = false;
    }
    if (damagedAssetCostTextCtrlr.text == '') {
      isDamagedAssetCostTextInvalid.value = true;
    }
    if (genLossAssetDamageTextCtrlr.text == '') {
      isGenLossAssetDamageTextInvalid.value = true;
    }
    if (titleTextCtrlr.text == '') {
      isTitleTextInvalid.value = true;
    }
    if (incidentreportDescriptionCtrlr.text == '') {
      isIncidentDescriptionInvalid.value = true;
    }
    if (isBlockSelected.value == false ||
        startDateTimeCtrlr.text == '' ||
        isTitleTextInvalid.value == true ||
        isIncidentDescriptionInvalid.value == true ||
        actionTakenDateTimeCtrlr.text == '' ||
        selectedSeverity.value == '' ||
        incidentreportDescriptionCtrlr.value == false ||
        isRiskTypeListSelected.value == false ||
        isDamagedAssetCostTextInvalid.value == true ||
        isGenLossAssetDamageTextInvalid.value == true ||
        isAssetRestorationActionTakenByListSelected.value == false ||
        isincidentInvestigationDoneByListSelected.value == false) {
      isFormInvalid.value = true;
    } else {
      isFormInvalid.value = false;
    }
  }

  ///Create Incident Report

  void createIncidentReport({dynamic fileIds}) async {
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
      String _jobType = htmlEscape.convert(typeOfJbTextCtrlr.text.trim());
      String _personAuthorized =
          htmlEscape.convert(personAuthorizedInvolvedTextCtrlr.text.trim());
      String? _instruction =
          htmlEscape.convert(instructionsTextCtrlr.text.trim());
      String? _is_person_involved =
          htmlEscape.convert(personInvolvedTextCtrlr.text.trim());
      String? _safetyEquipment =
          htmlEscape.convert(SafetyEquipmetsTextCtrlr.text.trim());
      String? _correctSafetyProcedure =
          htmlEscape.convert(correctSafeTextCtrlr.text.trim());
      String? _unsafeConditionContributed =
          htmlEscape.convert(unsafeConditionsTextCtrlr.text.trim());
      String? _unsafeActCause =
          htmlEscape.convert(unsafeActCauseTextCtrlr.text.trim());
      String? _legalApplicabilityRemark =
          htmlEscape.convert(legalApplicabilityRemarkTextCtrlr.text.trim());
      String? _esiApplicabilityRemark =
          htmlEscape.convert(ESIApplicabilityRemarkTextCtrlr.text.trim());
      String? _otherVictimName =
          htmlEscape.convert(otherVictimNameTextCtrlr.text.trim());

      // late List<ExternalEmails> external_emails_list = [];

      // externalEmails.forEach((e) {
      //   external_emails_list.add(ExternalEmails(name: e.name, email: e.email));
      // });

      ///Why why analysis
      List<WhyWhyAnalysis> whyWhyAnalysisItems = [];
      rowWhyWhyAnalysisItem.forEach((element) {
        WhyWhyAnalysis item = WhyWhyAnalysis(
          incidents_id: 0,
          why: "",
          cause: "",
        );

        whyWhyAnalysisItems.add(item);
      });

      ///Root Cause
      List<RootCause> rootCauseItems = [];
      rowRootCauseItem.forEach((element) {
        RootCause item = RootCause(
          incidents_id: 0,
          cause: "",
        );

        rootCauseItems.add(item);
      });

      ///Immediate correction
      List<ImmediateCorrection> immediateCorrectionItems = [];
      rowImmediateCorrectionItem.forEach((element) {
        ImmediateCorrection item = ImmediateCorrection(
          incidents_id: 0,
          details: '',
        );

        immediateCorrectionItems.add(item);
      });

      ///Details of Injured Person
      List<DetailsOfInjuredPerson> detailsOfInjuredPersonItems = [];
      rowInjuredPersonItem.forEach((element) {
        DetailsOfInjuredPerson item = DetailsOfInjuredPerson(
          injured_item_id: 0,
          incidents_id: 0,
          name: dropdownVictimNameMapperData[element[0]["value"]]?.name,
          person_type: 1,
          age: 30,
          sex: element[1]["value"] ?? '0',
          designation: element[2]["value"] ?? '0',
          address: element[3]["value"] ?? '0',
          name_contractor:
              dropdownBusinessListMapperData[element[4]["value"]]?.name,
          body_part_and_nature_of_injury:
              dropdownBodyinjuredListMapperData[element[5]["value"]]?.name,
          work_experience_years: int.tryParse('${element[6]["value"] ?? '0'}'),
          plant_equipment_involved:
              dropdownEquipmentNameMapperData[element[7]["value"]]?.name,
          location_of_incident: element[8]["value"] ?? '0',
        );

        detailsOfInjuredPersonItems.add(item);
      });

      ///Details of other Injured Person
      List<DetailsOfOtherInjuredPerson> detailsOfOtherInjuredPersonItems = [];
      rowOtherInjuredPersonItem.forEach((element) {
        DetailsOfOtherInjuredPerson item = DetailsOfOtherInjuredPerson(
          // Otherinjured_item_id: 0,
          incidents_id: 0,
          name: element[0]["value"] ?? '0',
          person_type: 1,
          age: 30,
          sex: element[1]["value"] ?? '0',
          designation: element[2]["value"] ?? '0',
          address: element[3]["value"] ?? '0',
          name_contractor:
              dropdownBusinessListMapperData[element[4]["value"]]?.name,
          body_part_and_nature_of_injury:
              dropdownBodyinjuredListMapperData[element[5]["value"]]?.name,
          work_experience_years: int.tryParse('${element[6]["value"] ?? '0'}'),
          plant_equipment_involved:
              dropdownEquipmentNameMapperData[element[7]["value"]]?.name,
          location_of_incident: element[8]["value"] ?? '0',
        );

        detailsOfOtherInjuredPersonItems.add(item);
      });

      ///Proposed Action Plan
      List<ProposedActionPlan> proposedActionItems = [];
      rowItem.forEach((element) {
        ProposedActionPlan item = ProposedActionPlan(
          incidents_id: 0,
          actions_as_per_plan: "",
          responsibility: "",
          // target_date: element[2]["value"] ?? '0',
          target_date: "2023-11-26T12:00:00",
          remarks: "",
        );

        proposedActionItems.add(item);
      });

      ////investigation Team
      late List<InvestigationTeam> investigation_team_list = [];

      investigationTeam.forEach((e) {
        investigation_team_list.add(InvestigationTeam(
          name: "",
          designation: "",
          person_id: "",
          person_type: 1,
          investigation_date: "",
          srNumber: "",
          // is_required: e.is_required
        ));
      });

      CreateIncidentReportModel createIncidentReportModel =
          CreateIncidentReportModel(
              id: 0,
              facility_id: facilityId,
              block_id: selectedBlockId,
              equipment_id: selectedEquipmentnameId,
              risk_level: 1,
              incident_datetime: startDateTimeCtrlrBuffer,
              reporting_datetime: startDateTimeCtrlrBuffer,
              // reporting_datetime: reportingDateTimeCtrlrBuffer,
              // victim_id: selectedVictimNameId,
              victim_id: 5,
              action_taken_by: selectedAssetRestorationActionTakenById,
              action_taken_datetime: actionTakenDateTimeCtrlrBuffer,
              inverstigated_by: selectedIncidentInvestigationDoneById,
              // verified_by: selectedIncidentInvestigationVerificationDoneById,
              risk_type: incidenttypeId,
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
              // insurance_remark: _insuranceRemark,
              insurance_remark: _insuranceAvailable,
              severity: selectedSeverity.value,
              uploadfileIds: fileIds,
              //new data adding
              type_of_job: _jobType,
              is_other_injured: isToggleOn.value == true ? 1 : 0,
              is_person_involved: _is_person_involved,
              is_person_authorized: _personAuthorized,
              instructions_given: _instruction,
              safety_equipments: _safetyEquipment,
              safe_procedure_observed: _correctSafetyProcedure,
              unsafe_condition_contributed: _unsafeConditionContributed,
              legal_applicability_remark: _legalApplicabilityRemark,
              esi_applicability_remark: _esiApplicabilityRemark,
              unsafe_act_cause: _unsafeActCause,
              why_why_analysis: whyWhyAnalysisItems,
              root_cause: rootCauseItems,
              immediate_correction: immediateCorrectionItems,
              proposed_action_plan: proposedActionItems,
              injured_person: detailsOfInjuredPersonItems,
              Otherinjured_person: detailsOfOtherInjuredPersonItems,
              investigation_team: investigation_team_list);

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
  void updateIncidentReport({dynamic fileIds}) async {
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
      String _esiApplicabilityRemark =
          htmlEscape.convert(ESIApplicabilityRemarkTextCtrlr.text.trim());
      String _legalApplicabilityRemark =
          htmlEscape.convert(legalApplicabilityRemarkTextCtrlr.text.trim());
      String _typeOfJob = htmlEscape.convert(typeOfJbTextCtrlr.text.trim());
      String _personAuthorized =
          htmlEscape.convert(personAuthorizedInvolvedTextCtrlr.text.trim());
      String _instructionGiven =
          htmlEscape.convert(instructionsTextCtrlr.text.trim());
      String _safetyEquipments =
          htmlEscape.convert(SafetyEquipmetsTextCtrlr.text.trim());
      String _correctSafety =
          htmlEscape.convert(correctSafeTextCtrlr.text.trim());
      String _unsafeConditions =
          htmlEscape.convert(unsafeConditionsTextCtrlr.text.trim());
      String _unsafeActCause =
          htmlEscape.convert(unsafeActCauseTextCtrlr.text.trim());
      String? _otherVictimName =
          htmlEscape.convert(otherVictimNameTextCtrlr.text.trim());
      String? _is_person_involved =
          htmlEscape.convert(personInvolvedTextCtrlr.text.trim());

      // int costOfReplacement =
      //     int.parse(costOfReplacementTextController.text.trim());

      // int? sopFileId = createSOPModel2.sop_fileId;
      // // int? jsaFileId = data.jsa_fileId;
      // print('SOPFileId:$sopFileId');

      // late List<WhyWhyAnalysisUpdate> supplier_action_list = [];

      // rowWhyWhyAnalysisItem.forEach((e) {
      //   supplier_action_list.add(WhyWhyAnalysisUpdate(
      //    cause:
      //   ));
      // });

      //Why why analysis for update
      List<WhyWhyAnalysis> whyWhyAnalysisItems = [];
      rowWhyWhyAnalysisItem.forEach((element) {
        WhyWhyAnalysis item = WhyWhyAnalysis(
          incidents_id: irId.value,
          why: element[0]["value"] ?? '0',
          cause: element[1]["value"] ?? '0',
        );

        whyWhyAnalysisItems.add(item);
      });

      ///Root Cause for update
      List<RootCause> rootCauseItems = [];
      rowRootCauseItem.forEach((element) {
        RootCause item = RootCause(
          incidents_id: irId.value,
          cause: element[0]["value"] ?? '0',
        );

        rootCauseItems.add(item);
      });

      ///Immediate correction for update
      List<ImmediateCorrection> immediateCorrectionItems = [];
      rowImmediateCorrectionItem.forEach((element) {
        ImmediateCorrection item = ImmediateCorrection(
          incidents_id: irId.value,
          details: element[0]["value"] ?? '0',
        );

        immediateCorrectionItems.add(item);
      });

      ///Proposed Action Plan for update
      List<ProposedActionPlan> proposedActionItems = [];
      rowItem.forEach((element) {
        ProposedActionPlan item = ProposedActionPlan(
          incidents_id: irId.value,
          actions_as_per_plan: element[0]["value"] ?? '0',
          responsibility: element[1]["value"],
          // target_date: element[2]["value"] ?? '0',
          target_date: "2023-11-26T12:00:00",

          // target_date:
          //     '${DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(DateTime.parse('${element[2]["value"] ?? '0'}'))}',
          remarks: element[3]["value"] ?? '0',
        );

        proposedActionItems.add(item);
      });

      ///Investigation Team for update
      late List<InvestigationTeam> investigation_team_list = [];
      investigationTeamList!.forEach((e) {
        investigation_team_list.add(InvestigationTeam(
            designation: e!.designation,
            person_type: e.person_type,
            investigation_date:
                '${DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(DateTime.parse('${actionTakenDateTimeCtrlr.text}'))}'));
      });

      ///Details of Injured Person for update
      List<DetailsOfInjuredPerson> detailsOfInjuredPersonItems = [];
      rowInjuredPersonItem.forEach((element) {
        DetailsOfInjuredPerson item = DetailsOfInjuredPerson(
          injured_item_id: element[0]["injured_item_id"] == null
              ? 0
              : int.tryParse('${element[0]["injured_item_id"] ?? '0'}'),
          incidents_id: irId.value,
          name: element[0]["value"],
          person_type: 1,
          age: 30,
          sex: element[1]["value"],
          designation: element[2]["value"] ?? '0',
          address: element[3]["value"] ?? '0',
          name_contractor: element[4]["value"],
          body_part_and_nature_of_injury: element[5]["value"],
          work_experience_years: int.tryParse('${element[6]["value"] ?? '0'}'),
          plant_equipment_involved: element[7]["value"],
          location_of_incident: element[8]["value"] ?? '0',
        );

        detailsOfInjuredPersonItems.add(item);
      });

      ///Details of Injured other Person for update
      List<DetailsOfOtherInjuredPerson> detailsOfOtherInjuredPersonItems = [];
      rowOtherInjuredPersonItem.forEach((element) {
        DetailsOfOtherInjuredPerson item = DetailsOfOtherInjuredPerson(
          injured_item_id: element[0]["otherinjured_item_id"] == null
              ? 0
              : int.tryParse('${element[0]["otherinjured_item_id"] ?? '0'}'),
          incidents_id: irId.value,
          name: element[0]["value"],
          person_type: 1,
          age: 30,
          sex: element[1]["value"] ?? '0',
          designation: element[2]["value"] ?? '0',
          address: element[3]["value"] ?? '0',
          name_contractor: element[4]["value"],
          body_part_and_nature_of_injury: element[5]["value"],
          work_experience_years: int.tryParse('${element[6]["value"] ?? '0'}'),
          plant_equipment_involved: element[7]["value"],
          location_of_incident: element[8]["value"] ?? '0',
        );

        detailsOfOtherInjuredPersonItems.add(item);
      });

      CreateIncidentReportModel updateIncidentReportModel =
          CreateIncidentReportModel(
              id: irId.value,
              facility_id: facilityId,
              block_id: selectedBlockId,
              equipment_id: selectedEquipmentnameId,
              risk_level: 2,
              is_person_involved: _is_person_involved,
              victim_id: selectedVictimNameId,
              action_taken_by: selectedAssetRestorationActionTakenById,
              inverstigated_by: selectedIncidentInvestigationDoneById,
              // verified_by: selectedIncidentInvestigationVerificationDoneById,
              risk_type: incidenttypeId,
              legal_applicability:
                  incidentReportDetailsModel.value?.legal_applicability_name ==
                          "YES"
                      ? legalApplicabilityDetailValue.value
                      : legalApplicabilityDetailFalseValue.value,
              esi_applicability:
                  incidentReportDetailsModel.value?.esi_applicability_name ==
                          "YES"
                      ? esiApplicabilityDetailValue.value
                      : esiApplicabilityDetailFalseValue.value,
              incident_datetime: startDateTimeCtrlrBuffer,
              action_taken_datetime: actionTakenDateTimeCtrlrBuffer,
              reporting_datetime: reportingDateTimeCtrlrBuffer,
              insurance: _insuranceAvailable,
              title: _title,
              rca_required:
                  incidentReportDetailsModel.value?.rca_required_name == "YES"
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
              severity: selectedSeverity.value,
              uploadfileIds: fileIds,

              ///new data adding
              type_of_job: _typeOfJob,
              is_person_authorized: _personAuthorized,
              instructions_given: _instructionGiven,
              safety_equipments: _safetyEquipments,
              safe_procedure_observed: _correctSafety,
              unsafe_condition_contributed: _unsafeConditions,
              legal_applicability_remark: _legalApplicabilityRemark,
              esi_applicability_remark: _esiApplicabilityRemark,
              unsafe_act_cause: _unsafeActCause,
              why_why_analysis: whyWhyAnalysisItems,
              root_cause: rootCauseItems,
              immediate_correction: immediateCorrectionItems,
              proposed_action_plan: [],
              injured_person: detailsOfInjuredPersonItems,
              Otherinjured_person: detailsOfOtherInjuredPersonItems,
              investigation_team: investigation_team_list);

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

  void updateIRSecondStep({dynamic fileIds}) async {
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
      String _esiApplicabilityRemark =
          htmlEscape.convert(ESIApplicabilityRemarkTextCtrlr.text.trim());
      String _legalApplicabilityRemark =
          htmlEscape.convert(legalApplicabilityRemarkTextCtrlr.text.trim());
      String _typeOfJob = htmlEscape.convert(typeOfJbTextCtrlr.text.trim());
      String _personAuthorized =
          htmlEscape.convert(personAuthorizedInvolvedTextCtrlr.text.trim());
      String _instructionGiven =
          htmlEscape.convert(instructionsTextCtrlr.text.trim());
      String _safetyEquipments =
          htmlEscape.convert(SafetyEquipmetsTextCtrlr.text.trim());
      String _correctSafety =
          htmlEscape.convert(correctSafeTextCtrlr.text.trim());
      String _unsafeConditions =
          htmlEscape.convert(unsafeConditionsTextCtrlr.text.trim());
      String _unsafeActCause =
          htmlEscape.convert(unsafeActCauseTextCtrlr.text.trim());
      String? _otherVictimName =
          htmlEscape.convert(otherVictimNameTextCtrlr.text.trim());

      // int costOfReplacement =
      //     int.parse(costOfReplacementTextController.text.trim());

      // int? sopFileId = createSOPModel2.sop_fileId;
      // // int? jsaFileId = data.jsa_fileId;
      // print('SOPFileId:$sopFileId');

      // late List<WhyWhyAnalysisUpdate> supplier_action_list = [];

      // rowWhyWhyAnalysisItem.forEach((e) {
      //   supplier_action_list.add(WhyWhyAnalysisUpdate(
      //    cause:
      //   ));
      // });

      //Why why analysis for update
      List<WhyWhyAnalysis> whyWhyAnalysisItems = [];
      rowWhyWhyAnalysisItem.forEach((element) {
        WhyWhyAnalysis item = WhyWhyAnalysis(
          incidents_id: irId.value,
          why: element[0]["value"] ?? '0',
          cause: element[1]["value"] ?? '0',
        );

        whyWhyAnalysisItems.add(item);
      });

      ///Root Cause for update
      List<RootCause> rootCauseItems = [];
      rowRootCauseItem.forEach((element) {
        RootCause item = RootCause(
          incidents_id: irId.value,
          cause: element[0]["value"] ?? '0',
        );

        rootCauseItems.add(item);
      });

      ///Immediate correction for update
      List<ImmediateCorrection> immediateCorrectionItems = [];
      rowImmediateCorrectionItem.forEach((element) {
        ImmediateCorrection item = ImmediateCorrection(
          incidents_id: irId.value,
          details: element[0]["value"] ?? '0',
        );

        immediateCorrectionItems.add(item);
      });

      ///Proposed Action Plan for update
      List<ProposedActionPlan> proposedActionItems = [];
      rowItem.forEach((element) {
        ProposedActionPlan item = ProposedActionPlan(
          incidents_id: irId.value,
          actions_as_per_plan: element[0]["value"] ?? '0',
          responsibility: element[1]["value"],
          target_date: "2023-11-26T12:00:00",
          hse_remark: element[4]["value"],
          id_Status: statusDropDownMapperData[element[5]["value"]]?.id,
          // target_date:
          //     '${DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(DateTime.parse('${element[2]["value"] ?? '0'}'))}',
          remarks: element[3]["value"] ?? '0',
        );

        proposedActionItems.add(item);
      });

      ///Investigation Team for update
      late List<InvestigationTeam> investigation_team_list = [];
      investigationTeamList!.forEach((e) {
        investigation_team_list.add(InvestigationTeam(
            designation: e!.designation,
            person_type: e.person_type,
            investigation_date:
                '${DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(DateTime.parse('${actionTakenDateTimeCtrlr.text}'))}'));
      });

      ///Details of Injured Person for update
      List<DetailsOfInjuredPerson> detailsOfInjuredPersonItems = [];
      rowInjuredPersonItem.forEach((element) {
        DetailsOfInjuredPerson item = DetailsOfInjuredPerson(
          injured_item_id: element[0]["injured_item_id"] == null
              ? 0
              : int.tryParse('${element[0]["injured_item_id"] ?? '0'}'),

          // injured_item_id: int.tryParse('${element[9]["value"] ?? '0'}'),
          incidents_id: irId.value,
          name: element[0]["value"],
          person_type: 1,
          age: 30,
          sex: element[1]["value"],
          designation: element[2]["value"] ?? '0',
          address: element[3]["value"] ?? '0',
          name_contractor: element[4]["value"],
          body_part_and_nature_of_injury: element[5]["value"],
          work_experience_years: int.tryParse('${element[6]["value"] ?? '0'}'),
          plant_equipment_involved: element[7]["value"],
          location_of_incident: element[8]["value"] ?? '0',
        );

        detailsOfInjuredPersonItems.add(item);
      });

      ///Details of Other Injured Person for update
      List<DetailsOfOtherInjuredPerson> detailsOfOtherInjuredPersonItems = [];
      rowOtherInjuredPersonItem.forEach((element) {
        DetailsOfOtherInjuredPerson item = DetailsOfOtherInjuredPerson(
          injured_item_id: element[0]["otherinjured_item_id"] == null
              ? 0
              : int.tryParse('${element[0]["otherinjured_item_id"] ?? '0'}'),
          incidents_id: irId.value,
          name: element[0]["value"],
          person_type: 1,
          age: 30,
          sex: element[1]["value"] ?? '0',
          designation: element[3]["value"] ?? '0',
          address: element[4]["value"] ?? '0',
          name_contractor: element[5]["value"],
          body_part_and_nature_of_injury: element[6]["value"],
          work_experience_years: int.tryParse('${element[7]["value"] ?? '0'}'),
          plant_equipment_involved: element[8]["value"],
          location_of_incident: element[9]["value"] ?? '0',
        );

        detailsOfOtherInjuredPersonItems.add(item);
      });

      CreateIncidentReportModel updateIncidentReportModel =
          CreateIncidentReportModel(
              id: irId.value,
              facility_id: facilityId,
              block_id: selectedBlockId,
              equipment_id: selectedEquipmentnameId,
              risk_level: 2,
              victim_id: selectedVictimNameId,
              action_taken_by: selectedAssetRestorationActionTakenById,
              inverstigated_by: selectedIncidentInvestigationDoneById,
              // verified_by: selectedIncidentInvestigationVerificationDoneById,
              risk_type: incidenttypeId,
              legal_applicability:
                  incidentReportDetailsModel.value?.legal_applicability_name ==
                          "YES"
                      ? legalApplicabilityDetailValue.value
                      : legalApplicabilityDetailFalseValue.value,
              esi_applicability:
                  incidentReportDetailsModel.value?.esi_applicability_name ==
                          "YES"
                      ? esiApplicabilityDetailValue.value
                      : esiApplicabilityDetailFalseValue.value,
              incident_datetime: startDateTimeCtrlrBuffer,
              action_taken_datetime: actionTakenDateTimeCtrlrBuffer,
              reporting_datetime: reportingDateTimeCtrlrBuffer,
              insurance: _insuranceAvailable,
              title: _title,
              rca_required:
                  incidentReportDetailsModel.value?.rca_required_name == "YES"
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
              severity: selectedSeverity.value,
              uploadfileIds: fileIds,

              ///new data adding
              type_of_job: _typeOfJob,
              is_person_authorized: _personAuthorized,
              instructions_given: _instructionGiven,
              safety_equipments: _safetyEquipments,
              safe_procedure_observed: _correctSafety,
              unsafe_condition_contributed: _unsafeConditions,
              legal_applicability_remark: _legalApplicabilityRemark,
              esi_applicability_remark: _esiApplicabilityRemark,
              unsafe_act_cause: _unsafeActCause,
              why_why_analysis: whyWhyAnalysisItems,
              root_cause: rootCauseItems,
              immediate_correction: immediateCorrectionItems,
              proposed_action_plan: proposedActionItems,
              injured_person: detailsOfInjuredPersonItems,
              Otherinjured_person: detailsOfOtherInjuredPersonItems,
              investigation_team: investigation_team_list);

      var updateIncidentReportJsonString = updateIncidentReportModel.toJson();
      Map<String, dynamic>? responseUpdateIncidentReport =
          await incidentReportPresenter.updateIRSecondStep(
        updateIncidentReport: updateIncidentReportJsonString,
        isLoading: true,
      );

      if (responseUpdateIncidentReport == null) {
        // showAlertDialog();
      }
      print('Update Incident Report data: $updateIncidentReportJsonString');
    }
  }

  Future<void> viewIncidentReport({int? id}) async {
    Get.toNamed(Routes.viewIncidentReportScreen, arguments: {"irId": id});
    print('Argument$id');
  }

  Widget _buildActionTakenDateTimeField_web(
    BuildContext context,
  ) {
    return Column(//
        children: [
      Dimens.boxHeight5,
      Container(
        height: MediaQuery.of(context).size.height * 0.050,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: const Offset(
                5.0,
                5.0,
              ),
              blurRadius: 5.0,
              spreadRadius: 1.0,
            ), //BoxShadow
            BoxShadow(
              color: ColorValues.whiteColor,
              offset: const Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ), //BoxShadow
          ],
          color: ColorValues.whiteColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: SizedBox(
          width: Responsive.isDesktop(context)
              ? MediaQuery.of(context).size.width / 3.7
              : MediaQuery.of(context).size.width / 1.0,
          child: TextField(
            style: GoogleFonts.lato(
              textStyle:
                  TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
            ),
            onTap: () {
              pickActionTakenDateTime_web(context, 0);

              // : null;
            },
            controller: actionTakenDateTimeCtrlr,

            // :null,
            autofocus: false,
            decoration: InputDecoration(
                fillColor: ColorValues.whiteColor,
                filled: true,
                contentPadding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                suffixIcon: Icon(Icons.calendar_month)),
          ),
        ),
      ),
    ]);
  }

//Action Taken Date and Time
  Future pickActionTakenDateTime_web(BuildContext context, int position) async {
    var dateTime = selectedActionTakenTime.value;

    final date = await pickActionTakenDate_web(context, position);
    if (date == null) {
      return;
    }

    final time = await pickActionTakenTime_web(context, position);
    if (time == null) {
      return;
    }

    dateTime = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
    selectedActionTakenTime.value;

    actionTakenDateTimeCtrlr
      ..text = DateFormat("yyyy-MM-dd HH:mm").format(dateTime)
      ..selection = TextSelection.fromPosition(
        TextPosition(
          offset: actionTakenDateTimeCtrlr.text.length,
          affinity: TextAffinity.upstream,
        ),
      );

    actionTakenDateTimeCtrlrBuffer =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(dateTime);
    print('Action TakenDate & Time ${actionTakenDateTimeCtrlrBuffer}');
  }

  Future<DateTime?> pickActionTakenDate_web(
      BuildContext context, int position) async {
    DateTime? dateTime = selectedActionTakenTime.value;

    //final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (newDate == null) return null;

    return newDate;
  }

  Future<TimeOfDay?> pickActionTakenTime_web(
      BuildContext context, int position) async {
    DateTime dateTime = selectedActionTakenTime.value;

    //final initialTime = TimeOfDay(hour: 12, minute: 0);
    final newTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light(),
            child: child!,
          );
        });

    if (newTime == null) {
      return null;
    }

    return newTime;
  }

  Future pickDateTime_web(
    BuildContext context,
  ) async {
    var dateTime = selectedBreakdownTime.value;

    final date = await pickDate_web(context);
    if (date == null) {
      return;
    }

    final time = await pickTime_web(context);
    if (time == null) {
      return;
    }

    dateTime = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
    selectedBreakdownTime.value;

    startDateTimeCtrlr
      ..text = DateFormat("yyyy-MM-dd HH:mm").format(dateTime)
      ..selection = TextSelection.fromPosition(
        TextPosition(
          offset: startDateTimeCtrlr.text.length,
          affinity: TextAffinity.upstream,
        ),
      );
    startDateTimeCtrlr.text = DateFormat("yyyy-MM-dd HH:mm").format(dateTime);

    startDateTimeCtrlrBuffer =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(dateTime);
    print('Incident reportDate & Time ${startDateTimeCtrlrBuffer}');
  }

  Future<DateTime?> pickDate_web(
    BuildContext context,
  ) async {
    DateTime? dateTime = selectedBreakdownTime.value;

    //final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (newDate == null) return null;

    return newDate;
  }

  Future<TimeOfDay?> pickTime_web(
    BuildContext context,
  ) async {
    DateTime dateTime = selectedBreakdownTime.value;

    //final initialTime = TimeOfDay(hour: 12, minute: 0);
    final newTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light(),
            child: child!,
          );
        });

    if (newTime == null) {
      return null;
    }

    return newTime;
  }
}
