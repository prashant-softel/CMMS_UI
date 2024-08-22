import 'dart:async';
import 'dart:convert';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/job_list/job_list_presenter.dart';
import 'package:cmms/app/navigators/navigators.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/domain/models/block_model.dart';
import 'package:cmms/domain/models/create_permit_model.dart';
import 'package:cmms/domain/models/employee_list_model.dart';
import 'package:cmms/domain/models/employee_list_model2.dart';
import 'package:cmms/domain/models/employee_model.dart';
import 'package:cmms/domain/models/end_mc_execution_detail_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/inventory_detail_model.dart';
import 'package:cmms/domain/models/job_type_list_model.dart';
import 'package:cmms/domain/models/new_permit_details_model.dart';
import 'package:cmms/domain/models/new_permit_list_model.dart';
import 'package:cmms/domain/models/pm_task_view_list_model.dart';
import 'package:cmms/domain/models/safety_measure_list_model.dart';
import 'package:cmms/domain/models/sop_list_model.dart';
import 'package:cmms/domain/models/veg_execution_details_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cmms/domain/models/equipment_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/inventory_model.dart';
import 'package:cmms/domain/models/type_permit_model.dart';
import 'package:cmms/app/new_permit/new_permit_presenter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/subjects.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../../domain/models/inventory_category_model.dart';
import '../../domain/models/job_details_model.dart';

class NewPermitController extends GetxController {
  NewPermitController(this.permitPresenter, this.jobListPresenter);

  final HomeController homeController = Get.find();
  // final NewPermitController _controller = Get.find();

  // PreventivePresenter preventivePresenter;

  //   RxBool on = false.obs; // our observable
  // // swap true/false & save it to observable
  // void toggle() => on.value = on.value ? false : true;
  int? permitIdForJob = 0;
  int? permitIdForMc = 0;

  var itemCount = 0.obs;

  var isHovered = false.obs;

  var isToggleOn = false.obs;
  var isTBTTrainingAttendedByOtherPersonOn = false.obs;

  var isToggleOn1 = false.obs;
  var isToggleOn2 = false.obs;
  var isToggleOn3 = false.obs;
  var isToggleOn4 = false.obs;
  var isToggleOn5 = false.obs;
  var isToggleOn6 = false.obs;
  var isToggleOn7 = false.obs;

  var idCtrlr = TextEditingController();

  ///Switch toggle
  final isSuccess = false.obs;

  void toggle() {
    isToggleOn.value = !isToggleOn.value;
  }

  void toggleTBTTrainingAttendedByOtherPersonOn() {
    isTBTTrainingAttendedByOtherPersonOn.value =
        !isTBTTrainingAttendedByOtherPersonOn.value;
  }

  ///Checkbox
  RxBool isChecked1 = false.obs;
  RxBool isChecked2 = false.obs;
  RxBool isChecked3 = false.obs;
  RxBool isChecked4 = false.obs;
  RxBool isChecked5 = false.obs;
  RxBool isChecked6 = false.obs;
  RxBool isChecked7 = false.obs;
  RxBool isFormValid = false.obs;

  RxBool isCheckedJSA = false.obs;
  RxBool isCheckedSOP = false.obs;

  void toggleCheckbox1() {
    isChecked1.value = !isChecked1.value; // Toggle the checkbox state
  }

  void toggleCheckbox2() {
    isChecked2.value = !isChecked2.value; // Toggle the checkbox state
  }

  void toggleCheckbox3() {
    isChecked3.value = !isChecked3.value; // Toggle the checkbox state
  }

  void toggleCheckbox4() {
    isChecked4.value = !isChecked4.value; // Toggle the checkbox state
  }

  void toggleCheckbox5() {
    isChecked5.value = !isChecked5.value; // Toggle the checkbox state
  }

  void toggleCheckbox6() {
    isChecked6.value = !isChecked6.value; // Toggle the checkbox state
  }

  void toggleCheckbox7() {
    isChecked7.value = !isChecked7.value; // Toggle the checkbox state
  }

  void jSAtoggleCheckbox() {
    isCheckedJSA.value = !isCheckedJSA.value;
  }

  void soptoggleCheckbox() {
    isCheckedSOP.value = !isCheckedSOP.value; // Toggle the checkbox state
  }

  void _doSomething() {
    // Do something
  }

  int? selectedFacilityId = 0;
  int selectedTypePermitId = 0;
  int? selectedPermitTypeId = 0;
  // int? selectedPermitTypeIdForSafetyList = 0;

  int selectedJobTypesId = 0;

  NewPermitPresenter permitPresenter;
  JobListPresenter jobListPresenter;

  //Permit History
  RxList<HistoryModel?>? historyList = <HistoryModel?>[].obs;

  // create permit
  Rx<bool> isFormInvalid = false.obs;
  int selectedFacility_id = 0;
  RxList<InventoryModel?> selectedWorkAreaList = <InventoryModel>[].obs;

  String username = '';
  Rx<String> selectedFacility = ''.obs;
  RxList<InventoryCategoryModel?> equipmentCategoryList =
      <InventoryCategoryModel>[].obs;
  RxList<int> selectedEquipmentCategoryIdList = <int>[].obs;
  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  Rx<bool> isFacilitySelected = true.obs;
  Rx<bool> isJobDescriptionInvalid = false.obs;
  Rx<bool> isTitleTextInvalid = false.obs;
  Rx<bool> isWorPermitNumberTextInvalid = false.obs;
  Rx<bool> isstartdateInvalid = false.obs;
  Rx<bool> isExpiryInvalid = false.obs;

  String? ptwData = "ptwString";
  bool showColumn2 = true;
  // RxList<String> ptwData = <String>[].obs;

  ///Permit Type
  RxList<TypePermitModel?> typePermitList = <TypePermitModel>[].obs;
  Rx<bool> isTypePermitSelected = true.obs;
  Rx<String> selectedTypePermit = ''.obs;
  Rx<String> selectedTypeOfPermit = ''.obs;
  Rx<bool> isTypePermit = true.obs;
  Rx<String> selectedStartDate = ''.obs;
  Rx<bool> isStartdate = true.obs;
  Rx<bool> isEnddate = true.obs;

  var startDateTimeCtrlr = TextEditingController();
  var validTillTimeCtrlr = TextEditingController();
  var validTillTimeCtrlrBuffer;
  var startDateTimeCtrlrBuffer;
  var tbtDateTimeCtrlrBuffer;

//For date Time
  var dateTimeCtrlr = TextEditingController();
  Rx<DateTime> selectedDateTime = DateTime.now().obs;

  FocusNode descFocus = FocusNode();
  ScrollController descScroll = ScrollController();
  FocusNode commentFocus = FocusNode();
  ScrollController commentScroll = ScrollController();

  var permitDescriptionCtrlr = TextEditingController();
  var titleTextCtrlr = TextEditingController();
  var blockNameTextCtrlr = TextEditingController();
  var assignToTextCtrlr = TextEditingController();
  var breakdownTimeTextCtrlr = TextEditingController();
  var workPermitNumberTextCtrlr = TextEditingController();
  var workPermitRemarkTextCtrlr = TextEditingController();

  Rx<DateTime> selectedBreakdownTime = DateTime.now().obs;
  Rx<DateTime> selectedValidTillTime = DateTime.now().obs;

  //block
  int facilityId = 0;
  StreamSubscription<int>? facilityIdStreamSubscription;
  RxList<BlockModel?> blockList = <BlockModel>[].obs;
  Rx<bool> isBlockSelected = true.obs;
  Rx<String> selectedBlock = ''.obs;
  Rx<bool> isstartdateFieldSelected = true.obs;
  RxBool isCheckedValue = false.obs;

  int selectedBlockId = 0;
  RxList<EquipmentModel?> equipmentList = <EquipmentModel>[].obs;
  RxList<InventoryModel?> workAreaList = <InventoryModel>[].obs;
  RxList<String?> selectedWorkAreaNameList = <String>[].obs;
  RxList<int?> selectedWorkAreaIdList = <int>[].obs;
  RxList<InventoryCategoryModel?> selectedEquipmentCategoryList =
      <InventoryCategoryModel>[].obs;
  RxList<EmployeeModel?> assignedToList = <EmployeeModel>[].obs;
  int selectedAssignedToId = 0;
  Rx<bool> isAssignedToSelected = true.obs;
  Rx<String> selectedAssignedTo = ''.obs;
  int selectedInventoryCategoryId = 0;

  //Equipment Isolation
  RxList<int> selectedEquipmentIsolationIdList = <int>[].obs;
  RxList<InventoryCategoryModel?> equipmentIsolationList =
      <InventoryCategoryModel>[].obs;
  RxList<InventoryCategoryModel?> selectedEquipmentIsolationList =
      <InventoryCategoryModel>[].obs;

  //Equipment Name List
  RxList<InventoryModel?> equipmentNameList = <InventoryModel>[].obs;
  RxList<InventoryModel?> filteredEquipmentNameList = <InventoryModel>[].obs;
  RxList<int> selectedEquipmentNameIdList = <int>[].obs;
  RxList<InventoryCategoryModel?> selectedEquipmentNameList =
      <InventoryCategoryModel>[].obs;
  String categoryIds = '';
  Rx<int> id = 0.obs;

  ///Employee List
  RxList<EmployeeListModel?> employeeList = <EmployeeListModel>[].obs;

  RxList<ListEmployees?>? listEmployee = <ListEmployees?>[].obs; //ListEmployees
  RxList<ListCategory?>? listCategory = <ListCategory?>[].obs; //ListCategory
  RxList<LotoLists?>? listLoto = <LotoLists?>[].obs; //ListsLoto
  RxList<ListIsolation?>? listIsolationCategory =
      <ListIsolation?>[].obs; //ListIsolation
  RxList<int?> selectedEditEquipemntIsolationIdList = <int?>[].obs;
  RxList<ListIsolation?> selectedEditEquipmentIsolationList =
      <ListIsolation>[].obs;
  int selectedIsolationEquipmentsId = 0;

  RxList<int?> selectedJobModelEquipemntIsolationIdList = <int?>[].obs;

  RxList<EquipmentCatList?> listJobModelCategory = <EquipmentCatList?>[].obs;
  RxList<AssociatedPermit?> listAssociatedPermit = <AssociatedPermit?>[].obs;
  RxList<WorkingAreaList?> list_working_area_name = <WorkingAreaList?>[].obs;

  String? selectedItem = '';
  int? associatePermitId = 0;

  Rx<bool> isemployeeListSelected = true.obs;
  Rx<String> selectedEmployeeList = ''.obs;
  RxList<String?> selectedEmployeeDataList = <String>[].obs;
  RxList<int?> selectedEmployeeIdList = <int>[].obs;
  RxList<EmployeeListModel?> selectedEmployeeNameList =
      <EmployeeListModel>[].obs;
  RxList<int> selectedEmployeeNameIdList = <int>[].obs;

  //
  RxList<EmployeeListModel?> employeeNameList = <EmployeeListModel>[].obs;
  Rx<bool> isemployeeNameListSelected = true.obs;
  Rx<String> selectedEmployeeNamesList = ''.obs;
  int selectedTbtConductedId = 0;

  RxList<EmployeeListModel?> filteredEmployeeNameList =
      <EmployeeListModel>[].obs;
  RxList<List<Map<String, String>>> rowTBTTrainingOtherPersonItem =
      <List<Map<String, String>>>[].obs;

  RxList<int> selectedEmployeeNameIds = <int>[].obs;

  /// Job Type Permit List
  RxList<JobTypeListModel> jobTypeList = <JobTypeListModel>[].obs;
  Rx<bool> isJobTypeListSelected = true.obs;
  Rx<String> selectedJobType = ''.obs;
  RxList<String?> selectedJobTypeDataList = <String>[].obs;
  RxList<int?> selectedJobTypeIdList = <int>[].obs;

  ///SOP Permit List
  RxList<SOPListModel> sopPermitList = <SOPListModel>[].obs;
  RxList<SOPListModel?> filteredSOPPathList = <SOPListModel>[].obs;

  ///For Job
  Rx<bool> isPermitLinked = false.obs;
  RxString responseMessage = ''.obs;

  Rx<bool> isSopPermitListSelected = true.obs;
  Rx<String> selectedSopPermit = ''.obs;
  RxList<String?> selectedSopPermitDataList = <String>[].obs;
  RxList<int?> selectedSopPermitIdList = <int>[].obs;
  int selectedSOPId = 0;
  String? jsaData;
  String? sopData;
  var isInventoryCategoryListLoaded = false.obs;

  ///Safety Measure List
  RxList<SafetyMeasureListModel> safetyMeasureList =
      <SafetyMeasureListModel>[].obs;
  Rx<bool> isSafetyMeasuretListSelected = true.obs;
  Rx<String> selectedSafetyMeasureList = ''.obs;
  RxList<String?> selectedSafetyMeasureDataList = <String>[].obs;
  RxList<int?> selectedSafetyMeasureIdList = <int>[].obs;
  int selectedSafetyMeasureId = 0;
  SafetyMeasureListModel? safetyMeasureListModel;

  RxList<ListSafetyQuestion?>? safetyList = <ListSafetyQuestion?>[].obs;

  ///Permit Issuer
  RxList<EmployeeListModel?> selectedPermitIssuerList =
      <EmployeeListModel>[].obs;
  RxList<int> selectedPermitIssuerIdList = <int>[].obs;
  RxList<EmployeeListModel?> permitIssuerList = <EmployeeListModel>[].obs;
  Rx<bool> isPermitIssuerListSelected = true.obs;
  Rx<String> selectedPermitIssuerLists = ''.obs;
  RxList<String?> selectedPermitIssuerDataList = <String>[].obs;
  int selectedPermitIssuerTypeId = 0;
  int selectedEmployeeTestId = 0;

  ///Permit Approver
  RxList<EmployeeListModel2?> selectedPermitApproverList =
      <EmployeeListModel2>[].obs;
  RxList<int> selectedPermitApproverIdList = <int>[].obs;
  RxList<EmployeeListModel2?> permitApproverList = <EmployeeListModel2>[].obs;
  Rx<bool> isPermitApproverListSelected = true.obs;
  Rx<String> selectedPermitApproverLists = ''.obs;
  RxList<String?> selectedPermitApproverDataList = <String>[].obs;
  int selectedPermitApproverTypeId = 0;

  RxList<NewPermitModel?>? newPermitList = <NewPermitModel?>[].obs;
  NewPermitModel? newPermitListModel;
  RxList<String> newPermitListTableColumns = <String>[].obs;

  PaginationController equipmentNamepaginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );

  PaginationController employeeNamepaginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );

  RxList<InventoryDetailModel?>? inventoryDetailList =
      <InventoryDetailModel?>[].obs;
  InventoryDetailModel? inventoryDetailListModel;
  RxList<String> inventoryDetailListTableColumns = <String>[].obs;
  int ids = 14430;

  PaginationController inventoryDetailPaginationController =
      PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );

  RxList<NewPermitModel?>? newPermitDetails = <NewPermitModel?>[].obs;

  Rx<CreatePermitModel?> createPermitDetailsModel = CreatePermitModel().obs;
  RxList<CreatePermitModel?>? createPermitDetailsList =
      <CreatePermitModel?>[].obs;

  Rx<NewPermitDetailModel?> newPermitDetailsModel = NewPermitDetailModel().obs;
  RxList<NewPermitDetailModel?>? newPermitDetailsList =
      <NewPermitDetailModel?>[].obs;

  ///SOP File Path
  RxList<SOPListModel> sopListFilePathModel = <SOPListModel>[].obs;
  Rx<String> selectedSOPFilePath = ''.obs;

  // var jobModel = JobDetailsModel();

  BehaviorSubject<int> _facilityId = BehaviorSubject.seeded(0);
  Stream<int> get facilityId$ => _facilityId.stream;
  int get facilityId1 => _facilityId.value;
  List<dynamic>? files = [];

  Map<dynamic, dynamic> employee_map = {};
  Map<int, dynamic> loto_map = {};
  int userId = varUserAccessModel.value.user_id ?? 0;
  bool isFromJobDetails = false;
  Rx<int> permitId = 0.obs;
  Rx<int> typee = 0.obs;
  Rx<int> scheduleID = 0.obs;

  Rx<bool> isChecked = false.obs;
  JobDetailsModel? jobModel;
  EndMCExecutionDetailsModel? mcExecutionDetailsModel;
  VegExecutionDetailsModel? vegExecutionDetailsModel;
  PmtaskViewModel? pmtaskViewModel;
  RxList<ScheduleCheckPoint?>? scheduleCheckPoint;
  int? jcId = 0;
  RxList<FileList?>? file_list = <FileList>[].obs;

  //File Import
  RxString fileName = "".obs;
  Uint8List? fileBytes;
  int type = 0;

  void addRowItem() {
    rowTBTTrainingOtherPersonItem.add([
      {'key': "Employee Name", "value": ''},
      {'key': "Contact Number", "value": ''},
      {'key': "Responsibility", "value": ''},
      {'key': "Action ", "value": ''},
    ]);
  }

  String allChecklistNames = '';

  @override
  void onInit() async {
    try {
      await setId();

      facilityIdStreamSubscription = homeController.facilityId$.listen((event) {
        facilityId = event;
        print('FacilityIdsss$facilityId');
        Future.delayed(Duration(seconds: 1), () {
          getBlocksList(facilityId);
        });
        if (permitId.value > 0) {
          getNewPermitDetail(
              intPermitId: permitId.value, facilityId: facilityId);
          isCheckedJSA.value = true;
          isCheckedSOP.value = true;
          getPermitHistory(permitId: permitId.value, facilityId: facilityId);
        }

        Future.delayed(Duration(seconds: 1), () {
          getTypePermitList(facilityId);
        });
        getInventoryCategoryList();
        getInventoryIsolationList();
        getAssignedToList();
        getFacilityLists();

        getEmployeePermitList();
        addRowItem();
        getJobTypePermitList();
        if (pmtaskViewModel?.id != null) {
          loadPermitDetailsWithTask(pmtaskViewModel);
        } else if (jobModel != null || jobModel != "" || jobModel?.id != 0) {
          loadPermitDetails(jobModel);
        } else {
          print("Nothing to load");
        }
      });
    } catch (e) {
      print('jobModelError: $e');
    }

    descFocus.addListener(() {
      if (!descFocus.hasFocus) {
        descScroll.jumpTo(0.0);
      }
    });

    commentFocus.addListener(() {
      if (!commentFocus.hasFocus) {
        commentScroll.jumpTo(0.0);
      }
    });

    super.onInit();
  }

  void removeItem(int index) {
    filteredEquipmentNameList.removeAt(index);
    selectedEquipmentNameIdList.removeAt(index);
    print("Item at index $index removed successfully.");
  }

  Future<void> setId() async {
    try {
      JobDetailsModel? jobDetail;
      PmtaskViewModel? pmdetail;
      EndMCExecutionDetailsModel? mcdetail;
      VegExecutionDetailsModel? vegdetail;

      final _permitId = await permitPresenter.getValue();
      final _type = await permitPresenter.getValuee();
      final _isChecked = await permitPresenter.getisCheckedValue();
      final _pmTaskModel = await permitPresenter.getPmtaskModelValue();
      final _jobModel = await permitPresenter.getJobModelValue();

      // if (_jobModel.isNotEmpty) {
      //   final jobdetaildata = jsonDecode(_jobModel);
      //   jobDetail = JobDetailsModel.fromJson(jobdetaildata);
      // }
      // if (_pmTaskModel.isNotEmpty) {
      //   final pmtaskdata = jsonDecode(_pmTaskModel);
      //   pmdetail = PmtaskViewModel.fromJson(pmtaskdata);
      // }
      if (_permitId == null || _permitId == "" || _permitId == "null") {
        var dataFromPreviousScreen = Get.arguments;
        permitId.value = dataFromPreviousScreen['permitId'];
        print("permit id: ${permitId.value}");
        isChecked.value = dataFromPreviousScreen['isChecked'];
        typee.value = dataFromPreviousScreen['type'];
        jobModel = dataFromPreviousScreen['jobModel'];
        scheduleID.value = dataFromPreviousScreen['scheduleID'];
        if (typee.value == 4) {
          mcExecutionDetailsModel = dataFromPreviousScreen['mcModel'];
        } else if (typee.value == 5) {
          vegExecutionDetailsModel = dataFromPreviousScreen['vegModel'];
        }
        pmtaskViewModel = dataFromPreviousScreen['pmTaskModel'];
        permitPresenter.saveValue(permitId: permitId.value.toString());
        permitPresenter.saveValuee(type: typee.value.toString());
        permitPresenter.savePmTaskModelValue(
            pmtaskModel: pmtaskViewModel.toString());
        permitPresenter.saveisCheckedValue(isChecked: isChecked.value);
        permitPresenter.saveJobModelValue(jobModel: jobModel.toString());
        print("SChedule check point: ${pmtaskViewModel}");

        if (pmtaskViewModel?.id != null && pmtaskViewModel!.id! > 0) {
          for (int i = 0; i < pmtaskViewModel!.schedules!.length; i++) {
            allChecklistNames +=
                pmtaskViewModel!.schedules![i].checklist_name ?? '';
            // Add a comma and space if it's not the last item
            // if (i < pmtaskViewModel.s.length - 1) {
            //   allChecklistNames += ', ';
            // }
          }
        }
      } else {
        permitId.value = int.tryParse(_permitId) ?? 0;
        if (jobDetail != null) {
          jobModel = jobDetail;
        }
        if (pmdetail != null) {
          pmtaskViewModel = pmdetail;
        }
        if (mcdetail != null) {
          mcExecutionDetailsModel = mcdetail;
          //  scheduleID.value = int.tryParse(_type!) ?? 0;
        }
        if (vegdetail != null) {
          vegExecutionDetailsModel = vegdetail;
          //  scheduleID.value = int.tryParse(_type!) ?? 0;
        }
        isChecked.value = _isChecked ?? false;
        typee.value = int.tryParse(_type!) ?? 0;
        // print({"permit11", permitId});
        // print({"isChecked", isChecked});
      }
    } catch (e) {
      print({"error on permit", e});
    }
  }

  Future<void> createJobCard() async {
    //   await startStopJobCard();

    ///
    // if (isJobCardStarted.value == true) {
    Map<String, dynamic>? responseMapJobCardStarted =
        await permitPresenter.createJobCard(
      jobId: jobModel?.id,
      isLoading: false,
    );

    if (responseMapJobCardStarted != null &&
        responseMapJobCardStarted.length > 0) {
      Get.toNamed(Routes.createMrs, arguments: {
        "whereUsedId": jobModel?.id,
        "activity": jobModel?.jobTitle,
        "whereUsed": 1,
      });
    }
    //  }
  }

  Future<void> getNewPermitDetail(
      {required int intPermitId, required int facilityId}) async {
    // newPermitDetails!.value = <NewPermitListModel>[];
    newPermitDetailsList?.value = <NewPermitDetailModel>[];

    final _newPermitDetails = await permitPresenter.getNewPermitDetail(
        permitId: intPermitId, facilityId: facilityId);
    print('New Permit Detail:$_newPermitDetails');

    if (_newPermitDetails != null) {
      newPermitDetailsModel.value = _newPermitDetails;
      titleTextCtrlr.text = newPermitDetailsModel.value?.title ?? '';
      permitDescriptionCtrlr.text =
          newPermitDetailsModel.value?.description ?? '';

      ///// Start Date Time
      startDateTimeCtrlr.text =
          '${DateFormat('yyyy-MM-dd HH:mm').format(DateTime.parse('${newPermitDetailsModel.value?.start_datetime}')).toString()}';

      startDateTimeCtrlrBuffer =
          '${DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(DateTime.parse('${newPermitDetailsModel.value?.start_datetime}')).toString()}';

      ///

      ///End date Time
      validTillTimeCtrlr.text =
          '${DateFormat('yyyy-MM-dd HH:mm').format(DateTime.parse('${newPermitDetailsModel.value?.end_datetime ?? ''}')).toString()}';

      validTillTimeCtrlrBuffer =
          newPermitDetailsModel.value?.end_datetime ?? '';

      ///
      selectedBlock.value = newPermitDetailsModel.value?.blockName ?? "";
      selectedBlockId = newPermitDetailsModel.value?.blockId ?? 0;

      selectedTypePermit.value =
          newPermitDetailsModel.value?.permitTypeName ?? '';
      selectedPermitTypeId = newPermitDetailsModel.value?.permitTypeid ?? 0;
      print('PermitTyepId:$selectedPermitTypeId');
      // selectedJobTypeList.value = newPermitDetailsModel.value.
      selectedPermitIssuerLists.value =
          newPermitDetailsModel.value?.issuedByName ?? '';
      selectedPermitApproverLists.value =
          newPermitDetailsModel.value?.approvedByName ?? '';
      listEmployee?.value = newPermitDetailsModel.value?.employee_list ?? [];
      rowTBTTrainingOtherPersonItem.value = [];
      newPermitDetailsModel.value?.lotoOtherDetails?.forEach(
        (element) {
          rowTBTTrainingOtherPersonItem.value.add(
            [
              {'key': "Employee Name", "value": '${element.employee_name}'},
              {'key': "Contact Number", "value": '${element.contact_number}'},
              {'key': "Responsibility", "value": '${element.responsibility}'},
              {'key': "Action ", "value": ''},
            ],
          );
        },
      );
      late List<ListSafetyQuestion> safety_measure_map_list = [];
      newPermitDetailsModel.value?.safety_question_list?.forEach((element) {
        safetyMeasureList.add(SafetyMeasureListModel(
            id: element.saftyQuestionId,
            name: element.saftyQuestionName,
            isChecked: element.ischeck == 1 ? true : false));

        print('Islationidsafty:$safety_measure_map_list');
      });
      safetyList?.value =
          newPermitDetailsModel.value?.safety_question_list ?? [];
      if (selectedPermitTypeId != 0) {
        // getSafetyMeasureList();
      }
      int num = newPermitDetailsModel.value!.is_loto_required!;
      num == 1 ? isToggleOn.value = true : isToggleOn.value = false;
      selectedEquipmentCategoryIdList.assignAll(
        (newPermitDetailsModel.value?.category_ids ?? []) as Iterable<int>,
      );
      selectedJobType.value = newPermitDetailsModel.value?.job_type_name ?? "";
      selectedSopPermit.value =
          newPermitDetailsModel.value?.sop_type_name ?? '';
      listCategory?.value = newPermitDetailsModel.value?.lstCategory ?? [];
      listLoto?.value = newPermitDetailsModel.value?.loto_list ?? [];
      listIsolationCategory?.value =
          newPermitDetailsModel.value?.lstIsolation ?? [];
      List<int?> idList = listIsolationCategory!
          .map((obj) => obj!.isolationAssetsCatID)
          .toList();
      print('Islation id:$idList');
      selectedEquipmentIsolationIdList.value = idList.whereType<int>().toList();
      print('Islation id:$selectedEquipmentIsolationIdList');
      await equipmentIsolationSelected(idList);
      List<int?> nameList = listLoto!.map((obj) => obj!.loto_id).toList();
      selectedEquipmentNameIdList.value = nameList.whereType<int>().toList();
      equipmentNameSelected(nameList);
      print("equipment names id's: $selectedEquipmentNameIdList");
      file_list?.value = newPermitDetailsModel.value?.file_list ?? [];
      List<int?> fileid = file_list!.map((element) => element!.id).toList();
      print("files while getting ${fileid}");
      files!.addAll(fileid);
      print("files while getting ${files}");
      // workPermitRemarkTextCtrlr.text =
      //     newPermitDetailsModel.value?.physical_iso_remark ?? "";
      // print('EmployeeList:${listEmployee}');
    }
  }

  Future<void> getInventoryDetailList(int facilityId) async {
    inventoryDetailList!.value = <InventoryDetailModel>[];

    final list = await permitPresenter.getInventoryDetailList(
        isLoading: true, id: 14430, facilityId: facilityId);
    if (list != null) {
      // selectedSupplierNameList.clear();
      // supplierNameList.clear();
      Set<String> supplierNameSet = {};
      for (var _inventoryDetailList in list) {
        if (_inventoryDetailList?.name != null) {
          // inventoryDetailList!.add(_inventoryDetailList?.name ?? "");
          inventoryDetailList!.add(_inventoryDetailList);
        }
      }

      // for (var supplier_name_list in list) {
      //   supplierNameList.add(supplier_name_list);
      // }
    }
    // inventoryDetailList = list;
    inventoryDetailPaginationController = PaginationController(
      rowCount: inventoryDetailList!.length,
      rowsPerPage: 10,
    );
    update(['inventory_detail_list']);
  }

  void equipmentCategoriesSelected(_selectedEquipmentCategoryIds) {
    selectedEquipmentCategoryIdList.value = <int>[];
    for (var _selectedCategoryId in _selectedEquipmentCategoryIds) {
      selectedEquipmentCategoryIdList.add(_selectedCategoryId);
    }
  }

  void equipmentNameSelected(_selectedEquipmentNameIds) {
    selectedEquipmentNameIdList.value = <int>[];
    filteredEquipmentNameList.value = <InventoryModel>[];
    for (var _selectedNameId in _selectedEquipmentNameIds) {
      selectedEquipmentNameIdList.add(_selectedNameId);
      InventoryModel? e = equipmentNameList.firstWhere((element) {
        print("element id : ${_selectedNameId}");
        return element?.id == _selectedNameId;
      });
      filteredEquipmentNameList.add(e);
    }
    print({"filteredEquipmentNameList": filteredEquipmentNameList});
    //  print({"selectedEquipmentNameIdList le":selectedEquipmentNameIdList.value.length,"filteredEquipmentNameList":filteredEquipmentNameList.value.length});
  }

  void equipmentNameSelectedGet(_selectedEquipmentNameIds) {
    selectedEquipmentNameIdList.value = <int>[];
    filteredEquipmentNameList.value = <InventoryModel>[];
    for (var _selectedNameId in _selectedEquipmentNameIds) {
      selectedEquipmentNameIdList.add(_selectedNameId);
      InventoryModel? e = equipmentNameList.firstWhere((element) {
        print("element id : ${_selectedNameId}");
        return element?.id == _selectedNameId;
      });
      filteredEquipmentNameList.add(e);
    }
    //  print({"selectedEquipmentNameIdList le":selectedEquipmentNameIdList.value.length,"filteredEquipmentNameList":filteredEquipmentNameList.value.length});
  }

  void employeeNameSelected(_selectedEmployeeNameIds) {
    selectedEmployeeNameIdList.value = <int>[];
    filteredEmployeeNameList.value = <EmployeeListModel>[];
    late int emp_id = 0;
    for (var _selectedEmployeeNameId in _selectedEmployeeNameIds) {
      selectedEmployeeNameIdList.add(_selectedEmployeeNameId);
      EmployeeListModel? e = employeeNameList.firstWhere((element) {
        return element?.id == _selectedEmployeeNameId;
      });
      filteredEmployeeNameList.add(e);
    }

    employee_map[emp_id] = selectedEmployeeNameIdList;
  }

  //  void removeRow({selectedEmployeeNameIds}) {
  //   selectedEmployeeNameIdList.value = <int>[];
  //   filteredEmployeeNameList.value = <EmployeeListModel>[];
  //   late int emp_id = 0;
  //   for (var _selectedEmployeeNameId in selectedEmployeeNameIds) {
  //     selectedEmployeeNameIdList.add(_selectedEmployeeNameId);
  //     EmployeeListModel? e = employeeNameList.firstWhere((element) {
  //       return element?.id == _selectedEmployeeNameId;
  //     });
  //     filteredEmployeeNameList.remove(e);
  //   }

  //   employee_map[emp_id] = selectedEmployeeNameIdList;
  // }

  Future<void> getPermitHistory(
      {required int permitId, required int facilityId}) async {
    /// TODO: CHANGE THESE VALUES
    int moduleType = 3;
    // int tempModuleType = 21;
    //
    historyList?.value = await permitPresenter.getPermitHistory(
          // tempModuleType,
          // tempJobCardId,
          moduleType,
          facilityId,
          permitId,
          true,
        ) ??
        [];
    update(["historyList"]);
  }

  void removeRow({required int id}) {
    employeeNameList.removeWhere((element) => element?.id == id);
  }

  void permitIssuerSelected(_selectedEmployeeNameIds) {
    selectedPermitIssuerIdList.value = <int>[];
    // filteredEmployeeNameList.value = <EmployeeListModel>[];
    late int emp_id = 0;
    for (var _selectedPermitIssuerId in _selectedEmployeeNameIds) {
      selectedPermitIssuerIdList.add(_selectedPermitIssuerId);
      EmployeeListModel? e = permitIssuerList.firstWhere((element) {
        return element?.id == _selectedPermitIssuerId;
      });
      // filteredEmployeeNameList.add(e);
    }

    // employee_map[emp_id] = selectedEmployeeNameIdList;
  }

  equipmentIsolationSelected(_selectedEquipmentIsolationIds) async {
    selectedEquipmentIsolationIdList.value = <int>[];
    for (var _selectedIsolationId in _selectedEquipmentIsolationIds) {
      selectedEquipmentIsolationIdList.add(_selectedIsolationId);
    }
    await getInventoryEquipmentNameList();
  }

  Future<void> getAssignedToList() async {
    final _assignedToList = await permitPresenter.getAssignedToList();

    if (_assignedToList != null) {
      for (var _assignedTo in _assignedToList) {
        assignedToList.add(_assignedTo);
      }
      update(["assignedToList"]);
    }
  }

  Future<void> getEmployeePermitList() async {
    employeeNameList.value = <EmployeeListModel>[];
    final _employeeNameList = await permitPresenter.getEmployeePermitList(
        isLoading: true,
        // categoryIds: categoryIds,
        facility_id: facilityId,
        featureId: UserAccessConstants.kPermitFeatureId);
    for (var employee_list in _employeeNameList) {
      employeeNameList.add(employee_list);
    }
    // supplierNameList = _supplierNameList;
    employeeNamepaginationController = PaginationController(
      rowCount: employeeNameList.length,
      rowsPerPage: 10,
    );
    update(['permit_employee_list']);
  }

  Future<void> getPermitIssuerList() async {
    permitIssuerList.value = <EmployeeListModel>[];
    final _permitIssuerList = await permitPresenter.getPermitIssuerList(
      isLoading: true,
      // categoryIds: categoryIds,
      facility_id: facilityId,
    );
    for (var permit_issuer_list in _permitIssuerList) {
      permitIssuerList.add(permit_issuer_list);
    }
    // supplierNameList = _supplierNameList;
    // employeeNamepaginationController = PaginationController(
    //   rowCount: employeeNameList.length,
    //   rowsPerPage: 10,
    // );
    update(['permit_issuer_list']);
  }

  Future<void> getPermitApproverList() async {
    permitApproverList.value = <EmployeeListModel2>[];
    final _permitApproverList = await permitPresenter.getPermitApproverList(
      isLoading: true,
      // categoryIds: categoryIds,
      facility_id: facilityId,
    );
    for (var permit_approver_list in _permitApproverList) {
      permitApproverList.add(permit_approver_list);
    }
    // supplierNameList = _supplierNameList;
    // employeeNamepaginationController = PaginationController(
    //   rowCount: employeeNameList.length,
    //   rowsPerPage: 10,
    // );
    update(['permit_approver_list']);
  }

  Future<void> getJobTypePermitList() async {
    jobTypeList.value = <JobTypeListModel>[];
    final _jobTypeList = await permitPresenter.getJobTypePermitList(
      isLoading: true,
      // categoryIds: cPategoryIds,
      facility_id: facilityId,
    );
    for (var jobType_list in _jobTypeList) {
      jobTypeList.add(jobType_list);
    }
    // supplierNameList = _supplierNameList;
    // employeeNamepaginationController = PaginationController(
    //   rowCount: employeeNameList.length,
    //   rowsPerPage: 10,
    // );
    update(['job_Type_list']);
  }

  Future<void> getSopPermitList() async {
    sopPermitList.value = <SOPListModel>[];
    final _sopPermitList = await permitPresenter.getSopPermitList(
      isLoading: true,
      // categoryIds: categoryIds,
      job_type_id: selectedJobTypesId,
      // job_type_id: 36,
    );

    for (var sopPermit_list in _sopPermitList) {
      sopPermitList.add(sopPermit_list);
      String filePath;
    }

    print('SOP List 18:${filteredSOPPathList.value}');

    // supplierNameList = _supplierNameList;
    // employeeNamepaginationController = PaginationController(
    //   rowCount: employeeNameList.length,
    //   rowsPerPage: 10,
    // );
    update(['sop_permit_list']);
  }

  Future<void> getSafetyMeasureList() async {
    safetyMeasureList.value = <SafetyMeasureListModel>[];
    final _safetyMeasureList = await permitPresenter.getSafetyMeasureList(
      isLoading: true,
      // categoryIds: categoryIds,
      permit_type_id: selectedPermitTypeId,
      // job_type_id: 36,
    );
    for (var safetyMeasure_list in _safetyMeasureList) {
      safetyMeasureList.add(safetyMeasure_list);
    }
    // supplierNameList = _supplierNameList;
    // employeeNamepaginationController = PaginationController(
    //   rowCount: employeeNameList.length,
    //   rowsPerPage: 10,
    // );
    update(['safety_measure_list']);
  }

  void onValueTbtConductedChanged(dynamic list, dynamic value) {
    print('Value Tbt Conducted By:${value}');

    if (value != "Please Select") {
      int tbtConductedIndex =
          employeeNameList.indexWhere((x) => x?.name == value);
      selectedTbtConductedId = employeeNameList[tbtConductedIndex]?.id ?? 0;
      print('Tbt Conducted Id: $selectedTbtConductedId');
    } else {
      selectedTbtConductedId = 0;
    }
  }

  void onValueChanged(dynamic list, dynamic value) {
    print({list, value});
    switch (list.runtimeType) {
      case const (RxList<FacilityModel>):
        {
          if (value != "Please Select") {
            int facilityIndex =
                facilityList.indexWhere((x) => x?.name == value);
            selectedFacilityId = facilityList[facilityIndex]?.id ?? 0;
            _facilityId.add(facilityList[facilityIndex]?.id ?? 0);

            if (selectedFacilityId != 0) {
              isFacilitySelected.value = true;
            }
            selectedFacility.value = value;
            getBlocksList(selectedFacilityId!);
            getTypePermitList(selectedFacilityId!);
          } else {
            selectedFacilityId = 0;
          }
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
      case const (RxList<EquipmentModel>):
        {
          int equipmentIndex =
              equipmentList.indexWhere((x) => x?.name == value);
          int selectedEquipmentId = equipmentList[equipmentIndex]?.id ?? 0;
        }
        break;
      case const (RxList<InventoryModel>):
        {
          for (var workAreaName in selectedWorkAreaNameList) {
            int workAreaIndex =
                workAreaList.indexWhere((x) => x?.name == workAreaName);
            selectedWorkAreaIdList.add(workAreaIndex);
          }
        }
        break;
      case const (RxList<InventoryCategoryModel>):
        {
          for (var equipCat in selectedEquipmentCategoryList) {
            int equipCatIndex =
                equipmentCategoryList.indexWhere((x) => x?.name == value);
            selectedEquipmentCategoryIdList.add(equipCatIndex);
            // selectedInventoryCategoryId = equipmentCategoryList[equipCatIndex]?.id ?? 0;
            print('First Category Id:$selectedInventoryCategoryId');
          }
        }
        break;
      case const (RxList<InventoryCategoryModel>):
        {
          for (var equipIso in selectedEquipmentIsolationList) {
            int equipIsoIndex = selectedEquipmentIsolationList
                .indexWhere((x) => x?.name == equipIso);
            selectedEquipmentIsolationIdList.add(equipIsoIndex);
          }
        }
        break;

      case const (RxList<EmployeeModel>):
        {
          int assignedToIndex =
              assignedToList.indexWhere((x) => x?.name == value);
          selectedAssignedToId = assignedToList[assignedToIndex]?.id ?? 0;
          if (selectedAssignedToId != 0) {
            isAssignedToSelected.value = true;
          }
          selectedAssignedTo.value = value;
        }
        break;
      case const (RxList<TypePermitModel>):
        {
          int permitTypeIndex =
              typePermitList.indexWhere((x) => x?.name == value);
          // selectedTypePermitId = facilityList[permitTypeIndex]?.id ?? 0;
          selectedPermitTypeId = typePermitList[permitTypeIndex]?.id ?? 0;
          getSafetyMeasureList();
          print('PErmit Type Id: $selectedPermitTypeId');
          if (selectedPermitTypeId != 0) {
            isTypePermitSelected.value = true;
          }
          selectedTypePermit.value = value;
          // getBlocksList(selectedPermitTypeId ?? 0);
        }
        break;
      case const (RxList<EmployeeListModel>):
        {
          int permitIssuerListIndex =
              permitIssuerList.indexWhere((x) => x!.name == value);
          selectedPermitIssuerTypeId =
              permitIssuerList[permitIssuerListIndex]!.id ?? 0;
        }
        break;
      case const (RxList<EmployeeListModel2>):
        {
          int permitApproverListIndex =
              permitApproverList.indexWhere((x) => x!.name == value);
          selectedPermitApproverTypeId =
              permitApproverList[permitApproverListIndex]!.id ?? 0;
        }
        break;
      case const (RxList<JobTypeListModel>):
        {
          int jobTypeListIndex = jobTypeList.indexWhere((x) => x.name == value);
          selectedJobTypesId = jobTypeList[jobTypeListIndex].id ?? 0;
          isJobTypeListSelected.value = true;
          selectedJobType.value = value;
          getSopPermitList();
          //}
        }
        break;
      case const (RxList<SOPListModel>):
        {
          int sopPermitListIndex =
              sopPermitList.indexWhere((x) => x.name == value);
          jsaData = sopPermitList[sopPermitListIndex].jsa_file_path ?? '';
          sopData = sopPermitList[sopPermitListIndex].sop_file_path ?? '';
          selectedSOPId = sopPermitList[sopPermitListIndex].id ?? 0;
          isSopPermitListSelected.value = true;
          selectedSopPermit.value = value;
          print('JsaPath:$jsaData');
          print('SopPath:$sopData');
        }
        break;

      default:
        {
          //statements;
        }
        break;
    }
  }

  Future<void> getBlocksList(int _facilityId) async {
    blockList.value = <BlockModel>[];
    final _blockList =
        await permitPresenter.getBlocksList(facilityId: _facilityId);

    if (_blockList != null) {
      for (var block in _blockList) {
        blockList.add(block);
      }
      update(["blockList"]);
    }
  }

  Future<void> getInventoryCategoryList({String? facilityId}) async {
    equipmentCategoryList.value = <InventoryCategoryModel>[];

    isInventoryCategoryListLoaded.value = false;

    try {
      final _equipmentCategoryList =
          await permitPresenter.getInventoryCategoryList(
        isLoading: true,
      );

      if (_equipmentCategoryList != null) {
        for (var equimentCategory in _equipmentCategoryList) {
          equipmentCategoryList.add(equimentCategory);
        }
      }

      isInventoryCategoryListLoaded.value = true;
    } catch (e) {
      print('Error fetching inventory category list: $e');
      isInventoryCategoryListLoaded.value = true;
    }
  }

  Future<void> getInventoryIsolationList({String? facilityId}) async {
    equipmentIsolationList.value = <InventoryCategoryModel>[];
    final _equipmentIsolationList =
        await permitPresenter.getInventoryIsolationList(
      isLoading: true,
    );
    if (_equipmentIsolationList != null) {
      for (var equimentIsolation in _equipmentIsolationList) {
        equipmentIsolationList.add(equimentIsolation);
      }
    }
  }

  Future<void> getInventoryEquipmentNameList() async {
    equipmentNameList.value = <InventoryModel>[];
    String categoryIds = selectedEquipmentIsolationIdList.join(', ');
    final _equipmentNameList =
        await permitPresenter.getInventoryEquipmentNameList(
      isLoading: true,
      categoryIds: categoryIds,
      facilityId: facilityId,
    );
    if (_equipmentNameList != null) {
      for (var equipmentName in _equipmentNameList) {
        equipmentNameList.add(equipmentName);
      }
    }
    equipmentNamepaginationController = PaginationController(
      rowCount: equipmentNameList.length,
      rowsPerPage: 10,
    );
  }

  void updateDropdownValue(String value) {
    selectedFacility.value = value;
  }

  Future<void> getFacilityLists() async {
    final _facilityList = await permitPresenter.getFacilityLists();

    if (_facilityList != null) {
      for (var facility in _facilityList) {
        facilityList.add(facility);
      }
      selectedFacility.value = facilityList[0]?.name ?? '';
    }
  }

  Future<void> getTypePermitList(int _facilityId) async {
    final _permitTypeList =
        await permitPresenter.getTypePermitList(facility_id: facilityId);

    if (_permitTypeList != null) {
      _permitTypeList != [];
      for (var permitType in _permitTypeList) {
        typePermitList.add(permitType);
      }
      // selectedTypePermit.value = typePermitList[0]?.name ?? '';
    }
  }

  void linkToPermit({int? jobId, int? permitId}) async {
    Map<String, dynamic>? responseMapPermitLinked =
        await permitPresenter.linkToPermit(
      permitId: permitId,
      jobId: jobId,
      isLoading: false,
    );
    if (responseMapPermitLinked != null && responseMapPermitLinked.length > 0) {
      var _jobId = responseMapPermitLinked["id"][0];
      responseMessage.value = responseMapPermitLinked["message"];
      isPermitLinked.value = true;
    }
  }

  bool checkForm() {
    if (selectedFacility.value == '') {
      isFacilitySelected.value = false;
      isFormValid.value = false;
    }
    if (selectedBlock.value == '') {
      isBlockSelected.value = false;
      isFormValid.value = false;
    }
    if (workPermitRemarkTextCtrlr.text == '') {
      isWorPermitNumberTextInvalid.value = true;
      isFormValid = false.obs;
    }
    if (permitDescriptionCtrlr.text == '') {
      isJobDescriptionInvalid.value = true;
      isFormValid = false.obs;
    }
    if (startDateTimeCtrlr.text.trim() == '') {
      isstartdateInvalid.value = true;
      isFormValid = false.obs;
    }
    if (validTillTimeCtrlr.text.trim() == '') {
      isstartdateInvalid.value = true;
      isFormValid = false.obs;
    }
    if (selectedTypePermit.value == '') {
      isTypePermitSelected.value = false;
    }
    if (selectedJobType.value == '') {
      isJobTypeListSelected.value = false;
    }
    if (selectedSopPermit.value == '') {
      isSopPermitListSelected.value = false;
    }
    // if (selectedEquipmentCategoryIdList.isEmpty) {
    //   Fluttertoast.showToast(msg: "Select the equipment category");
    // }
    // if (startDateTimeCtrlr.text == '') {
    //   Fluttertoast.showToast(msg: 'Start date Field cannot be empty');
    // }
    // if (validTillTimeCtrlr.text == '') {
    //   Fluttertoast.showToast(msg: 'End date Field cannot be empty');
    // }
    // if (selectedTypePermit.value == '') {
    //   Fluttertoast.showToast(msg: 'Permit type should not be empty');
    // }
    // if (permitDescriptionCtrlr.text.trim().length < 3) {
    //   isJobDescriptionInvalid.value = true;
    // }
    // if (titleTextCtrlr.text.trim().length < 3) {
    //   isTitleTextInvalid.value = true;
    // }
    // if (isCheckedJSA.value == false) {
    //   Fluttertoast.showToast(msg: 'JSA checkbox should be checked');
    // }
    // if (isCheckedSOP.value == false) {
    //   Fluttertoast.showToast(msg: 'SOP checkbox should be checked');
    // }
    if (isAssignedToSelected.value == false ||
        isFacilitySelected.value == false ||
        isstartdateInvalid.value == true ||
        isJobTypeListSelected.value == false ||
        isSopPermitListSelected.value == false ||
        isBlockSelected.value == false ||
        isJobDescriptionInvalid == true ||
        isWorPermitNumberTextInvalid.value == true ||
        workPermitRemarkTextCtrlr.text == '') {
      isFormInvalid.value = true;
      return false;
    } else {
      isFormInvalid.value = false;
    }
    return true;
  }

  //  int?   getAssignedBlockId(String _selectedBlockName) {
  //   final item = blockList
  //   .firstWhere((item) => item?.name == _selectedBlockName);
  //   final _selectedAssignBlockId = item?.id ?? 0;
  //   return _selectedAssignBlockId;
  //   }

  void createNewPermit({List<dynamic>? fileIds}) async {
    {
      // checkForm();
      // if (isFormInvalid.value) {
      //   return;
      // }
      //   if(selectedBlockId <= 0){
      //   selectedBlockId = getAssignedBlockId(selectedBlock.value) ?? 0;
      //   }

      // print('JobList BlockId:$selectedBlockId');

      String _description =
          htmlEscape.convert(permitDescriptionCtrlr.text.trim());
      String _title = htmlEscape.convert(titleTextCtrlr.text.trim());
      String _startDate = htmlEscape.convert(startDateTimeCtrlr.text.trim());

      String _workPermitRemark =
          htmlEscape.convert(workPermitRemarkTextCtrlr.text.trim());

      //UserId
      int userId = varUserAccessModel.value.user_id ?? 0;

      var data = filteredEmployeeNameList
          .map((element) => element?.responsibility?.map((e) => e.name));

      print('EmpoyeeData34:${data.toString()}');

      List<Employeelist> employee_map_list = [];
      filteredEmployeeNameList.forEach((e) {
        employee_map_list.add(
            Employeelist(employeeId: e?.id, responsibility: data.toString()));
      });

      late List<LotoList> loto_map_list = [];

      filteredEquipmentNameList.forEach(
        (e) {
          loto_map_list.add(
            LotoList(
              Loto_id: e?.id,
              Loto_Key: e?.name,
              Loto_lock_number: e?.serialNumber,
              user_id: userId,
            ),
          );
        },
      );

      late List<Safetyquestionlist> safety_measure_map_list = [];

      safetyMeasureList.forEach((e) {
        safety_measure_map_list.add(Safetyquestionlist(
            safetyMeasureId: e.id,
            safetyMeasureValue: e.name,
            ischeck: e.isChecked ? 1 : 0));
      });

      //  List<Employeelist> employee_list= <Employeelist>[];
      // List<Safetyquestionlist> safety_question_list = <Safetyquestionlist>[];
      // List<LotoList> loto_list = <LotoList>[];

      // for (var _selectedWorkArea in selectedWorkAreaList) {
      //   var json = '{"asset_id": ${_selectedWorkArea?.id},'
      //       '"category_ids": ${_selectedWorkArea?.categoryId}}';

      //   // CreatePermitModel _employeeList = addCreatePermitModelFromJson(json);
      //   // employee_list.add(_employeeList as Employeelist);
      //   // CreatePermitModel _safetyQuestionList = addCreatePermitModelFromJson(json);
      //   // safety_question_list.add(_safetyQuestionList as Safetyquestionlist);
      //   // CreatePermitModel _lotoList = addCreatePermitModelFromJson(json);
      //   // loto_list.add(_lotoList as LotoList);

      //   // SafetyQuestionList _safetyQuestionList = addSafetyQuestionListFromJson(json);
      //   // safety_question_list.add(_safetyQuestionList);
      // }

      CreatePermitModel createPermitModel = CreatePermitModel(
        facility_id: facilityId,
        blockId: selectedBlockId,
        lotoId: typee.value == 5 || typee.value == 4
            ? 8
            : selectedEquipmentCategoryIdList.first,
        permitTypeId: selectedPermitTypeId,

        ///Permit Type Id
        start_datetime: startDateTimeCtrlrBuffer,
        end_datetime: validTillTimeCtrlrBuffer,
        title: _title,
        description: _description,
        job_type_id: selectedJobTypesId, ////Job type Id
        sop_type_id: selectedSOPId,
        issuer_id: selectedPermitIssuerTypeId,
        approver_id: selectedPermitApproverTypeId,
        user_id: userId,
        latitude: 0,
        longitude: 0,
        block_ids: selectedEmployeeNameIdList,
        category_ids: selectedEquipmentCategoryIdList,
        uploadfile_ids: fileIds,
        is_loto_required: loto_map_list.length > 0 ? true : false,
        isolated_category_ids: selectedEquipmentIsolationIdList,
        Loto_list: loto_map_list,
        lotoOtherDetails: [],
        employee_list: employee_map_list,
        safety_question_list: safety_measure_map_list,
        TBT_Done_by: selectedTbtConductedId,
        TBT_Done_at: tbtDateTimeCtrlrBuffer,
        PHYSICAL_ISO_REMARK: _workPermitRemark,
        is_physical_iso_required: isToggleOn.value,
      );
      var jobJsonString = createPermitModel.toJson();
      Map<String, dynamic>? responseNewPermitCreated =
          await permitPresenter.createNewPermit(
        newPermit: jobJsonString,
        isLoading: true,
      );
      if (responseNewPermitCreated != null) {
        //  CreateNewPermitDialog();
        // showAlertDialog();
      }
      print('Create permit data: $jobJsonString');
    }
  }

  void createNewPermitForJob({int? jobId, List<dynamic>? fileIds}) async {
    {
      checkForm();
      if (isFormInvalid.value) {
        return;
      }
      //   if(selectedBlockId <= 0){
      //   selectedBlockId = getAssignedBlockId(selectedBlock.value) ?? 0;
      //   }

      // print('JobList BlockId:$selectedBlockId');

      String _description =
          htmlEscape.convert(permitDescriptionCtrlr.text.trim());
      String _title = htmlEscape.convert(titleTextCtrlr.text.trim());
      String _startDate = htmlEscape.convert(startDateTimeCtrlr.text.trim());
      String _workPermitRemark =
          htmlEscape.convert(workPermitRemarkTextCtrlr.text.trim());

      //UserId
      int userId = varUserAccessModel.value.user_id ?? 0;

      var data = filteredEmployeeNameList
          .map((element) => element?.responsibility?.map((e) => e.name));

      List<Employeelist> employee_map_list = [];
      filteredEmployeeNameList.forEach((e) {
        employee_map_list.add(
            Employeelist(employeeId: e?.id, responsibility: data.toString()));
      });

      late List<LotoList> loto_map_list = [];

      filteredEquipmentNameList.forEach(
        (e) {
          loto_map_list.add(
            LotoList(
                Loto_id: e?.id,
                Loto_Key: e?.name,
                Loto_lock_number: e?.serialNumber,
                user_id: userId),
          );
        },
      );

      late List<Safetyquestionlist> safety_measure_map_list = [];

      safetyMeasureList.forEach((e) {
        safety_measure_map_list.add(Safetyquestionlist(
            safetyMeasureId: e.id,
            safetyMeasureValue: e.name,
            ischeck: e.isChecked ? 1 : 0));
      });

      //  List<Employeelist> employee_list= <Employeelist>[];
      // List<Safetyquestionlist> safety_question_list = <Safetyquestionlist>[];
      // List<LotoList> loto_list = <LotoList>[];

      // for (var _selectedWorkArea in selectedWorkAreaList) {
      //   var json = '{"asset_id": ${_selectedWorkArea?.id},'
      //       '"category_ids": ${_selectedWorkArea?.categoryId}}';

      //   // CreatePermitModel _employeeList = addCreatePermitModelFromJson(json);
      //   // employee_list.add(_employeeList as Employeelist);
      //   // CreatePermitModel _safetyQuestionList = addCreatePermitModelFromJson(json);
      //   // safety_question_list.add(_safetyQuestionList as Safetyquestionlist);
      //   // CreatePermitModel _lotoList = addCreatePermitModelFromJson(json);
      //   // loto_list.add(_lotoList as LotoList);

      //   // SafetyQuestionList _safetyQuestionList = addSafetyQuestionListFromJson(json);
      //   // safety_question_list.add(_safetyQuestionList);
      // }

      CreatePermitModel createPermitModel = CreatePermitModel(
        facility_id: facilityId,
        blockId: selectedBlockId,
        lotoId: typee.value == 5 || typee.value == 4
            ? 8
            : selectedEquipmentCategoryIdList.first,
        permitTypeId: selectedPermitTypeId,

        ///Permit Type Id
        start_datetime: startDateTimeCtrlrBuffer,
        end_datetime: validTillTimeCtrlrBuffer,
        title: _title,
        description: _description,
        job_type_id: selectedJobTypesId, ////Job type Id
        sop_type_id: selectedSOPId,
        issuer_id: selectedPermitIssuerTypeId,
        approver_id: selectedPermitApproverTypeId,
        uploadfile_ids: fileIds,
        user_id: userId,
        lotoOtherDetails: [],
        latitude: 0,
        longitude: 0,
        block_ids: selectedEmployeeNameIdList,
        category_ids: selectedEquipmentCategoryIdList,
        is_loto_required: loto_map_list.length > 0 ? true : false,
        isolated_category_ids: selectedEquipmentIsolationIdList,
        Loto_list: loto_map_list,
        employee_list: employee_map_list,
        safety_question_list: safety_measure_map_list,
        TBT_Done_by: selectedTbtConductedId,
        TBT_Done_at: tbtDateTimeCtrlrBuffer,
        PHYSICAL_ISO_REMARK: _workPermitRemark,
        is_physical_iso_required: isToggleOn.value,
      );
      var jobJsonString = createPermitModel.toJson();
      Map<String, dynamic>? responseNewPermitCreatedForJob =
          await permitPresenter.createNewPermitForJob(
        newPermit: jobJsonString,
        jobId: jobId!,
        isLoading: true,
      );
      if (responseNewPermitCreatedForJob != null) {
        //  CreateNewPermitDialog();
        // showAlertDialog();
      }
      print('Create permit For Job data: $jobJsonString');
      print('permit Id For Job data: $permitIdForJob');
    }
  }

  void createNewPermitForPm(
      {int? pmTaskId, String? activity, List<dynamic>? fileIds}) async {
    {
      checkForm();
      if (isFormInvalid.value) {
        return;
      }
      //   if(selectedBlockId <= 0){
      //   selectedBlockId = getAssignedBlockId(selectedBlock.value) ?? 0;
      //   }

      // print('JobList BlockId:$selectedBlockId');

      String _description =
          htmlEscape.convert(permitDescriptionCtrlr.text.trim());
      print("Description: ${_description}");
      String _title = htmlEscape.convert(titleTextCtrlr.text.trim());
      print("Title: ${_title}");
      String _startDate = htmlEscape.convert(startDateTimeCtrlr.text.trim());
      print("Start Date: ${_startDate}");
      String _workPermitRemark =
          htmlEscape.convert(workPermitRemarkTextCtrlr.text.trim());
      print("Remark: ${_workPermitRemark}");

      //UserId
      int userId = varUserAccessModel.value.user_id ?? 0;
      print("User ID: ${userId}");

      var data = filteredEmployeeNameList
          .map((element) => element?.responsibility?.map((e) => e.name));
      print("Employee Data: ${data}");

      List<Employeelist> employee_map_list = [];
      filteredEmployeeNameList.forEach((e) {
        employee_map_list.add(
            Employeelist(employeeId: e?.id, responsibility: data.toString()));
      });
      print("employee_map_list: ${employee_map_list}");

      late List<LotoList> loto_map_list = [];

      filteredEquipmentNameList.forEach(
        (e) {
          loto_map_list.add(
            LotoList(
              Loto_id: e?.id,
              Loto_Key: e?.name,
              Loto_lock_number: e?.serialNumber,
              user_id: userId,
            ),
          );
        },
      );
      print("loto_map_list: ${loto_map_list}");

      late List<Safetyquestionlist> safety_measure_map_list = [];
      safetyMeasureList.forEach((e) {
        safety_measure_map_list.add(Safetyquestionlist(
            safetyMeasureId: e.id,
            safetyMeasureValue: e.name,
            ischeck: e.isChecked ? 1 : 0));
      });

      print("safety_measure_map_list: ${safety_measure_map_list}");

      CreatePermitModel createPermitModel = CreatePermitModel(
        permit_id: permitId.value,
        facility_id: facilityId,
        blockId: selectedBlockId,
        lotoId: typee.value == 5 || typee.value == 4
            ? 8
            : selectedEquipmentCategoryIdList.first,
        permitTypeId: selectedPermitTypeId,
        resubmit: false,

        ///Permit Type Id
        start_datetime: startDateTimeCtrlrBuffer,
        end_datetime: validTillTimeCtrlrBuffer,
        title: _title,
        description: _description,
        job_type_id: selectedJobTypesId, ////Job type Id
        sop_type_id: selectedSOPId,
        issuer_id: selectedPermitIssuerTypeId,
        approver_id: selectedPermitApproverTypeId,
        uploadfile_ids: fileIds,
        user_id: userId,
        latitude: 0,
        longitude: 0,
        block_ids: selectedEmployeeNameIdList,
        category_ids: selectedEquipmentCategoryIdList,
        is_loto_required: loto_map_list.length > 0 ? true : false,
        isolated_category_ids: selectedEquipmentIsolationIdList,
        Loto_list: loto_map_list,
        lotoOtherDetails: [],
        employee_list: employee_map_list,
        safety_question_list: safety_measure_map_list,
        TBT_Done_by: selectedTbtConductedId,
        TBT_Done_at: tbtDateTimeCtrlrBuffer,
        PHYSICAL_ISO_REMARK: _workPermitRemark,
        is_physical_iso_required: isToggleOn.value,
      );
      var jobJsonString = createPermitModel.toJson();
      print(createPermitModel);
      print(jobJsonString);
      Map<String, dynamic>? responseNewPermitCreatedForJob =
          await permitPresenter.createNewPermitForPm(
        newPermit: jobJsonString,
        pmTaskId: pmTaskId!,
        activity: activity,
        isLoading: true,
        type: typee.value,
        vegplanId: vegExecutionDetailsModel?.planId,
        vegexid: vegExecutionDetailsModel?.executionId,
      );
      if (responseNewPermitCreatedForJob != null) {
        //  CreateNewPermitDialog();
        // showAlertDialog();
      }
      print('Create permit For Job data: $jobJsonString');
      print('permit Id For Job data: $permitIdForJob');
    }
  }

  // static void showAlertDialog({
  //   int? facility_id,
  //   String? message,
  //   String? title,
  //   Function()? onPress,
  // }) async {
  //   await Get.dialog<void>(CreateNewPermitDialog());
  // }

  //  void createCheckList() async {
  //   {
  //     await permitPresenter.createCheckList(
  //       isLoading: true,
  //     );
  //   }
  // }

  // void switchFacility(String? facilityName) {
  //   facilityId =
  //       facilityList.indexWhere((facility) => facility?.name == facilityName);
  //   getJobList(facilityId, userId);
  // }
  //  void onValueChanged(dynamic list, dynamic value) {

  //         int facilityIndex = facilityList.indexWhere((x) => x?.name == value);
  //         selectedFacilityId = facilityList[facilityIndex]?.id ?? 0;
  //         if (selectedFacilityId != 0) {
  //           isFacilitySelected.value = true;
  //         }
  //         selectedFacility.value = value;
  //       }

  ///Update New Permit
  void updateNewPermit({List<dynamic>? fileIds}) async {
    {
      // checkForm();
      // if (isFormInvalid.value) {
      //   return;
      // }
      String _description =
          htmlEscape.convert(permitDescriptionCtrlr.text.trim());
      String _title = htmlEscape.convert(titleTextCtrlr.text.trim());
      String _startDate = htmlEscape.convert(startDateTimeCtrlr.text.trim());
      String _workPermitRemark =
          htmlEscape.convert(workPermitRemarkTextCtrlr.text.trim());

      //UserId
      int userId = varUserAccessModel.value.user_id ?? 0;

      // var data = filteredEmployeeNameList
      //     .map((element) => element?.responsibility?.map((e) => e.name));

      List<Employeelist> employee_map_list = [];

      filteredEmployeeNameList.forEach((e) {
        employee_map_list.add(
            Employeelist(employeeId: e?.id, responsibility: e!.designation));
      });

      List<LotoOtherDetails> rowTBTTrainingOtherPersonItems = [];
      rowTBTTrainingOtherPersonItem.forEach((element) {
        LotoOtherDetails item = LotoOtherDetails(
          employee_name: element[0]["value"] ?? '0',
          contact_number: int.tryParse('${element[1]["value"] ?? '0'}') ?? 0,
          responsibility: element[2]["value"] ?? '0',
        );

        rowTBTTrainingOtherPersonItems.add(item);
      });
      if (fileIds != null) {
        files?.addAll(fileIds);
      }
      print("files while updating ${files}");
      // List<LotoOtherDetails> rowItemLotoOtherDetails = [];
      // rowItemLotoOtherDetails.forEach((element) {
      //   LotoOtherDetails item = LotoOtherDetails(
      //     employee_name: element[0]["value"] ?? '0',
      //     contact_number: int.tryParse(element[1]["value"] ?? '0'),
      //     responsibility: element[2]["value"] ?? '0',
      //   );
      //   rowItemLotoOtherDetails.add(item);
      //   print('Create req  order  data: $item');
      // });

      late List<LotoList> loto_map_list = [];

      filteredEquipmentNameList.forEach(
        (e) {
          loto_map_list.add(
            LotoList(
              Loto_id: e?.id,
              Loto_Key: e?.name,
              Loto_lock_number: e?.serialNumber,
              user_id: userId,
            ),
          );
        },
      );

      late List<Safetyquestionlist> safety_measure_map_list = [];

      safetyMeasureList.forEach((e) {
        safety_measure_map_list.add(Safetyquestionlist(
            safetyMeasureId: e.id,
            safetyMeasureValue: e.name,
            ischeck: e.isChecked ? 1 : 0));
      });

      CreatePermitModel updatePermitModel = CreatePermitModel(
        facility_id: facilityId,
        blockId: selectedBlockId,
        lotoId: typee.value == 5 || typee.value == 4
            ? 8
            : selectedEquipmentCategoryIdList.first,
        permit_id: permitId.value,
        permitTypeId: selectedPermitTypeId,

        ///Permit Type Id
        start_datetime: startDateTimeCtrlrBuffer,
        end_datetime: validTillTimeCtrlrBuffer,
        title: _title,
        description: _description,
        job_type_id: selectedJobTypesId, ////Job type Id
        sop_type_id: selectedSOPId,
        issuer_id: selectedPermitIssuerTypeId,
        approver_id: selectedPermitApproverTypeId,
        user_id: userId,
        latitude: 0,
        longitude: 0,
        block_ids: selectedEmployeeNameIdList,
        category_ids: selectedEquipmentCategoryIdList,
        uploadfile_ids: files,
        is_loto_required: loto_map_list.length > 0 ? true : false,
        isolated_category_ids: selectedEquipmentIsolationIdList,
        Loto_list: loto_map_list,
        employee_list: employee_map_list,
        safety_question_list: safety_measure_map_list,
        resubmit: isChecked.value,
        lotoOtherDetails: rowTBTTrainingOtherPersonItems,
        TBT_Done_by: selectedTbtConductedId,
        TBT_Done_at: tbtDateTimeCtrlrBuffer,
        PHYSICAL_ISO_REMARK: _workPermitRemark,
        is_physical_iso_required: isToggleOn.value,
      );
      var jobJsonString = updatePermitModel.toJson();
      Map<String, dynamic>? responseUpdatePermit =
          await permitPresenter.updateNewPermit(
        newPermit: jobJsonString,
        resubmit: isChecked.value,
        isLoading: true,
        type: typee.value,
        vegplanId: vegExecutionDetailsModel?.planId,
        vegexid: vegExecutionDetailsModel?.executionId,
      );
      if (responseUpdatePermit != null) {
        //  CreateNewPermitDialog();
        // showAlertDialog();
      }
      print('Update permit data: $jobJsonString');
    }
  }

  void resubmitPermit({List<dynamic>? fileIds}) async {
    {
      checkForm();
      if (isFormInvalid.value) {
        return;
      }

      String _description =
          htmlEscape.convert(permitDescriptionCtrlr.text.trim());
      String _title = htmlEscape.convert(titleTextCtrlr.text.trim());
      String _startDate = htmlEscape.convert(startDateTimeCtrlr.text.trim());

      String _workPermitRemark =
          htmlEscape.convert(workPermitRemarkTextCtrlr.text.trim());

      //UserId
      int userId = varUserAccessModel.value.user_id ?? 0;

      var data = filteredEmployeeNameList
          .map((element) => element?.responsibility?.map((e) => e.name));

      print('EmpoyeeData34:${data.toString()}');

      // List<Employeelist> employee_map_list = [];
      // filteredEmployeeNameList.forEach((e) {
      //   employee_map_list.add(
      //       Employeelist(employeeId: e?.id, responsibility: data.toString()));
      // });
      List<Employeelist> employee_map_list = [];

      filteredEmployeeNameList.forEach((e) {
        employee_map_list.add(
            Employeelist(employeeId: e?.id, responsibility: e!.designation));
      });
      late List<LotoList> loto_map_list = [];

      filteredEquipmentNameList.forEach(
        (e) {
          loto_map_list.add(
            LotoList(
              Loto_id: e?.id,
              Loto_Key: e?.name,
              Loto_lock_number: e?.serialNumber,
              user_id: userId,
            ),
          );
        },
      );

      late List<Safetyquestionlist> safety_measure_map_list = [];

      safetyMeasureList.forEach((e) {
        safety_measure_map_list.add(Safetyquestionlist(
            safetyMeasureId: e.id,
            safetyMeasureValue: e.name,
            ischeck: e.isChecked ? 1 : 0));
      });

      CreatePermitModel createPermitModel = CreatePermitModel(
        facility_id: facilityId,
        permit_id: permitId.value,
        blockId: selectedBlockId,
        lotoId: typee.value == 5 || typee.value == 4
            ? 8
            : selectedEquipmentCategoryIdList.first,
        permitTypeId: selectedPermitTypeId,
        start_datetime: startDateTimeCtrlrBuffer,
        end_datetime: validTillTimeCtrlrBuffer,
        title: _title,
        description: _description,
        job_type_id: selectedJobTypesId, ////Job type Id
        sop_type_id: selectedSOPId,
        issuer_id: selectedPermitIssuerTypeId,
        approver_id: selectedPermitApproverTypeId,
        user_id: userId,
        latitude: 0,
        longitude: 0,
        block_ids: selectedEmployeeNameIdList,
        category_ids: selectedEquipmentCategoryIdList,
        uploadfile_ids: fileIds,
        is_loto_required: loto_map_list.length > 0 ? true : false,
        isolated_category_ids: selectedEquipmentIsolationIdList,
        Loto_list: loto_map_list,
        lotoOtherDetails: [],
        employee_list: employee_map_list,
        safety_question_list: safety_measure_map_list, resubmit: true,
        TBT_Done_by: selectedTbtConductedId,
        TBT_Done_at: tbtDateTimeCtrlrBuffer,
        PHYSICAL_ISO_REMARK: _workPermitRemark,
        is_physical_iso_required: isToggleOn.value,
      );
      var jobJsonString = createPermitModel.toJson();
      Map<String, dynamic>? responseNewPermitCreated =
          await permitPresenter.resubmitPermit(
        newPermit: jobJsonString,
        resubmit: true,
        isLoading: true,
        type: typee.value,
        vegplanId: vegExecutionDetailsModel?.planId,
        vegexid: vegExecutionDetailsModel?.executionId,
      );
      if (responseNewPermitCreated != null) {
        //  CreateNewPermitDialog();
        // showAlertDialog();
      }
      print('Create permit data: $jobJsonString');
    }
  }

  Future<void> createNewPermits() async {
    Get.toNamed(
      Routes.newPermit,
    );
  }

  void removeImage(int? num, int index) {
    files!.remove(num);
    file_list!.removeAt(index);
    print('removed file ids ${files}');
  }

  loadPermitDetails(jobModel) {
    titleTextCtrlr.text = jobModel.jobTitle ?? '';
    selectedBlock.value = jobModel.blockName ?? '';
    selectedBlockId = jobModel.blockId ?? 0;
    assignToTextCtrlr.text = jobModel.assignedName ?? "";

    //// uncomment once work done
    listJobModelCategory.value = jobModel.equipmentCatList ?? [];
    List<int> idList = listJobModelCategory.map((obj) => obj!.id).toList();
    List<String> nameList =
        listJobModelCategory.map((obj) => obj!.name).toList();

    list_working_area_name.value = jobModel.workingAreaList ?? [];

    //  selectedItem = nameList[0];
    ///end uncomment

    // listAssociatedPermit.value = jobModel.associatedPermitList ?? [];
    // List<int?> associetdPermitId = listAssociatedPermit.map((element) => element?.permitId).toList();
    // associatePermitId = associetdPermitId[0];
    // print("Associated Permit Id:${associatePermitId}");

    print("Selected Block Id:${selectedBlockId}");
    //uncomment once work done
    selectedEquipmentCategoryIdList.value = idList;
    // selectedJobModelEquipemntIsolationIdList.value = idList;
    print("Selected Equipment: ${selectedEquipmentCategoryIdList}");
    print("JobModel Equipment Category Id:${selectedEquipmentCategoryIdList}");
    print("Selected Name Category:${jobModel.id ?? 0}");

    ///end uncomment

    // idCtrlr.text = '${int.tryParse(jobModel.id ?? 0)}';
    if (jobModel.breakdownTime != null && jobModel.breakdownTime.isNotEmpty) {
      breakdownTimeTextCtrlr.text = DateFormat('yyyy-MM-dd HH:mm')
          .format(DateTime.parse(jobModel.breakdownTime))
          .toString();
      blockNameTextCtrlr.text = jobModel.blockwName ?? '';
    } else {
      breakdownTimeTextCtrlr.text = '';
      blockNameTextCtrlr.text = '';
    }

    // RxList<JobDetailsModel> jobDataList =
    // filteredEmployeeNameList = jobModel.assignedId;
    // filteredEmployeeNameList = jobModel.assignedName;
    // filteredEmployeeNameList.add(EmployeeListModel(id: jobModel.assignedId,name: "${jobModel.assignedName}"));
  }

  Future<void> viewNewPermitList({int? permitId}) async {
    Get.toNamed(Routes.viewPermitScreen, arguments: {"permitId": permitId});
  }

  Future<void> viewJobDetails() async {
    Get.toNamed(Routes.jobDetails);
  }

  Future<void> viewPMTDetails() async {
    Get.toNamed(Routes.pmTaskView);
  }

  Future<void> viewAudDetails() async {
    Get.toNamed(Routes.viewAuditTask);
  }

  Future<void> viewMCTDetails() async {
    Get.toNamed(Routes.addModuleCleaningExecutionContentWeb);
  }

  browseFiles({Uint8List? fileBytes}) async {
    await permitPresenter.browseFiles(
        fileBytes, fileName.value, type, true, facilityId);
    return true;
  }

  void clearStoreData() {
    permitPresenter.clearValue();
  }

  void clearTypeStoreData() {
    permitPresenter.clearTypeValue();
  }

  void isSuccessDialog() {
    Get.dialog(
      AlertDialog(
        title: Text('Import Image'),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Color.fromARGB(255, 7, 161, 17),
              border: Border.all(
                color: Color.fromARGB(255, 7, 161, 17),
                width: 1,
              ),
            ),
            child: Icon(Icons.check, size: 35, color: ColorValues.whiteColor),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text("${fileName.value} \n data uploaded Successfully....",
                style: TextStyle(fontSize: 16, color: ColorValues.blackColor)),
          )
        ]),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
              // Get.back();
              Future.delayed(Duration(seconds: 2), () {
                fileName.value = "";
              });
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  loadPermitDetailsWithTask(pmtaskViewModel) {
    // blockNameTextCtrlr.text = pmtaskViewModel.blockName;
    titleTextCtrlr.text = pmtaskViewModel?.plan_title ?? '';
    List<int> idList = [];
    if (pmtaskViewModel.category_id is List) {
      idList = (pmtaskViewModel.category_id as List).cast<int>();
    } else if (pmtaskViewModel.category_id is int) {
      idList = [(pmtaskViewModel.category_id as int)];
    }
    print({"PM Task Id List: ", idList});
    selectedEquipmentCategoryIdList.value = idList;
    print("Selected Equipment : ${selectedEquipmentCategoryIdList}");
    print("PM Task ID: ${pmtaskViewModel.id}");
  }

  /// class ends
}
