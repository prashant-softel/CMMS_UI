import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';

import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/job_list/job_list_presenter.dart';
import 'package:cmms/app/navigators/navigators.dart';
import 'package:cmms/app/view_permit/view_permit_presenter.dart';
import 'package:cmms/app/widgets/create_permit_dialog.dart';
import 'package:cmms/domain/models/block_model.dart';
import 'package:cmms/domain/models/cancel_permit_request_model.dart';
import 'package:cmms/domain/models/employee_list_model.dart';
import 'package:cmms/domain/models/employee_list_model2.dart';
import 'package:cmms/domain/models/employee_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/inventory_detail_model.dart';
import 'package:cmms/domain/models/job_type_list_model.dart';
import 'package:cmms/domain/models/new_permit_details_model.dart';
import 'package:cmms/domain/models/permit_cancel_condition_list.dart';
import 'package:cmms/domain/models/safety_measure_list_model.dart';
import 'package:cmms/domain/models/sop_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:cmms/domain/models/equipment_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/inventory_model.dart';
import 'package:cmms/domain/models/type_permit_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:rxdart/subjects.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../../domain/models/inventory_category_model.dart';
import '../theme/color_values.dart';

class ViewPermitController extends GetxController {
  ViewPermitController(this.viewPermitPresenter, this.jobListPresenter);

  final HomeController homeController = Get.find();
  RxList<HistoryModel?>? historyList = <HistoryModel?>[].obs;

  ViewPermitPresenter viewPermitPresenter;
  JobListPresenter jobListPresenter;

  ///Print Global key
  final GlobalKey<State<StatefulWidget>> printKey = GlobalKey();

  var isToggleOn = false.obs;
  var isToggleOn1 = false.obs;
  var isToggleOn2 = false.obs;
  var isToggleOn3 = false.obs;
  var isToggleOn4 = false.obs;
  var isToggleOn5 = false.obs;
  var isToggleOn6 = false.obs;
  var isToggleOn7 = false.obs;

  ///Switch toggle
  final isSuccess = false.obs;

  void toggle() {
    isToggleOn.value = !isToggleOn.value;
  }

  ///Checkbox
  RxBool isChecked1 =
      false.obs; // Create an observable boolean to track the checkbox state
  RxBool isChecked2 = false.obs;
  RxBool isChecked3 = false.obs;
  RxBool isChecked4 = false.obs;
  RxBool isChecked5 = false.obs;
  RxBool isChecked6 = false.obs;
  RxBool isChecked7 = false.obs;

  RxBool isCheckedJSA = false.obs;

  //Loto Checkbox
  RxBool isCheckedLoto = true.obs;

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
    isCheckedJSA.value = !isCheckedJSA.value; // Toggle the checkbox state
  }

  void _doSomething() {
    // Do something
  }

  TextEditingController extendReasonCommentTextFieldCtrlr =
      TextEditingController();
  TextEditingController timeTextFieldCtrlr = TextEditingController();

  TextEditingController closeCommentTextFieldCtrlr = TextEditingController();

   TextEditingController cancelCommentRequestTextFieldCtrlr =
      TextEditingController();

  int? selectedFacilityId = 0;
  int selectedTypePermitId = 0;
  int? selectedPermitTypeId = 0;
  int selectedJobTYpesId = 0;

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

  var jobDescriptionCtrlr = TextEditingController();
  var titleTextCtrlr = TextEditingController();

  Rx<DateTime> selectedBreakdownTime = DateTime.now().obs;
  Rx<DateTime> selectedValidTillTime = DateTime.now().obs;

  //block
  int facilityId = 0;
  StreamSubscription<int>? facilityIdStreamSubscription;
  RxList<BlockModel?> blockList = <BlockModel>[].obs;
  Rx<bool> isBlockSelected = true.obs;
  Rx<String> selectedBlock = ''.obs;
  Rx<bool> isstartdateFieldSelected = true.obs;

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
  RxList<EmployeeListModel> employeeList = <EmployeeListModel>[].obs;
  Rx<bool> isemployeeListSelected = true.obs;
  Rx<String> selectedEmployeeList = ''.obs;
  RxList<String?> selectedEmployeeDataList = <String>[].obs;
  RxList<int?> selectedEmployeeIdList = <int>[].obs;
  RxList<EmployeeListModel?> selectedEmployeeNameList =
      <EmployeeListModel>[].obs;
  RxList<int> selectedEmployeeNameIdList = <int>[].obs;
  RxList<EmployeeListModel?> employeeNameList = <EmployeeListModel>[].obs;
  RxList<EmployeeListModel?> filteredEmployeeNameList =
      <EmployeeListModel>[].obs;

  /// Job Type Permit List
  RxList<JobTypeListModel> jobTypeList = <JobTypeListModel>[].obs;
  Rx<bool> isJobTypeListSelected = true.obs;
  Rx<String> selectedJobTypeList = ''.obs;
  RxList<String?> selectedJobTypeDataList = <String>[].obs;
  RxList<int?> selectedJobTypeIdList = <int>[].obs;

  ///SOP Permit List
  RxList<SOPListModel> sopPermitList = <SOPListModel>[].obs;
  Rx<bool> isSopPermitListSelected = true.obs;
  Rx<String> selectedSopPermitList = ''.obs;
  RxList<String?> selectedSopPermitDataList = <String>[].obs;
  RxList<int?> selectedSopPermitIdList = <int>[].obs;
  int selectedSOPId = 0;

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

  ///View Permit Details
  Rx<NewPermitDetailModel?> viewPermitDetailsModel = NewPermitDetailModel().obs;
  RxList<NewPermitDetailModel?>? viewPermitDetailsList =
      <NewPermitDetailModel?>[].obs;

  RxList<ListAssociatedJob?>? listAssociatedJobs = <ListAssociatedJob?>[].obs;

  ///Employee List
  RxList<ListEmployees?>? listEmployee = <ListEmployees?>[].obs; //ListEmployees

  ///Safety Measure List
  RxList<ListSafetyQuestion?>? safetyList = <ListSafetyQuestion?>[].obs;
  RxList<ListCategory?>? listCategory = <ListCategory?>[].obs; //ListCategory
  RxList<LotoLists?>? listLoto = <LotoLists?>[].obs; //ListsLoto
  RxList<ListIsolation?>? listIsolation = <ListIsolation?>[].obs; //ListCategory

  ///Safety Measure List
  RxList<SafetyMeasureListModel> safetyMeasureList =
      <SafetyMeasureListModel>[].obs;
  Rx<bool> isSafetyMeasuretListSelected = true.obs;
  Rx<String> selectedSafetyMeasureList = ''.obs;
  RxList<String?> selectedSafetyMeasureDataList = <String>[].obs;
  RxList<int?> selectedSafetyMeasureIdList = <int>[].obs;
  int selectedSafetyMeasureId = 0;
  SafetyMeasureListModel? safetyMeasureListModel;

//Permit Cancel Condition
  RxList<PermitCancelListModel?>? permitCancelConditionList =
      <PermitCancelListModel?>[].obs;

  PaginationController equipmentNamepaginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );

  PaginationController employeeNamepaginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );

  ///Checkbox
  RxBool isCheckedRequire = false.obs;
  void requiretoggleCheckbox() {
    isCheckedRequire.value =
        !isCheckedRequire.value; // Toggle the checkbox state
  }

  RxBool isCheckedRequire1 = false.obs;
  void requiretoggleCheckbox1() {
    isCheckedRequire1.value =
        !isCheckedRequire1.value; // Toggle the checkbox state
  }

  RxBool isCheckedRequire2 = false.obs;
  void requiretoggleCheckbox2() {
    isCheckedRequire2.value =
        !isCheckedRequire2.value; // Toggle the checkbox state
  }

  RxBool isCheckedRequire3 = false.obs;
  void requiretoggleCheckbox3() {
    isCheckedRequire3.value =
        !isCheckedRequire3.value; // Toggle the checkbox state
  }

  RxBool isCheckedRequire4 = false.obs;
  void requiretoggleCheckbox4() {
    isCheckedRequire4.value =
        !isCheckedRequire4.value; // Toggle the checkbox state
  }

  RxBool isCheckedRequire5 = false.obs;
  void requiretoggleCheckbox5() {
    isCheckedRequire5.value =
        !isCheckedRequire5.value; // Toggle the checkbox state
  }

   RxBool isCheckedRequire6 = false.obs;
   RxInt intValue6 = 0.obs;
  void requiretoggleCheckbox6(bool value) {
    
    isCheckedRequire6.value = value;
    if(value){
      intValue6.value = 6;
    }else{
      intValue6.value = 0;
    }
    // isCheckedRequire6.value = 
    //     !isCheckedRequire6.value; // Toggle the checkbox state
  }

   RxBool isCheckedRequire7 = false.obs;
   RxInt intValue7 = 0.obs;
  void requiretoggleCheckbox7(bool value) {
    isCheckedRequire7.value =
        !isCheckedRequire7.value; // Toggle the checkbox state
    if(value){

    }
  }

   RxBool isCheckedRequire8 = false.obs;
  void requiretoggleCheckbox8() {
    isCheckedRequire8.value =
        !isCheckedRequire8.value; // Toggle the checkbox state
  }

   RxBool isCheckedRequire9 = false.obs;
  void requiretoggleCheckbox9() {
    isCheckedRequire9.value =
        !isCheckedRequire9.value; // Toggle the checkbox state
  }

  TextEditingController approveCommentTextFieldCtrlr = TextEditingController();
  TextEditingController rejectCommentTextFieldCtrlr = TextEditingController();
  TextEditingController cancelCommentByApproverTextFieldCtrlr =
      TextEditingController();

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

  //File Import
  RxString fileName = "".obs;
  Uint8List? fileBytes;
  int type = 0;

  BehaviorSubject<int> _facilityId = BehaviorSubject.seeded(0);
  Stream<int> get facilityId$ => _facilityId.stream;
  int get facilityId1 => _facilityId.value;

  Map<dynamic, dynamic> employee_map = {};
  Map<int, dynamic> loto_map = {};
  int? isCancle = 1;
  int? permitId = 0;
  int? jobId = 0;
  Map<String, dynamic> data = {};
  @override
  void onInit() async {
    final _flutterSecureStorage = const FlutterSecureStorage();
    // Read jobId
    String? _permitId = await _flutterSecureStorage.read(key: "permitId");
    //  data = Get.arguments;
    // print('Data permitId ${data['permitId']}');
    // print('Data JobId ${data['jobId']}');

    // // if(data['jobId'] != null){
    //   permitId = int.tryParse('${data['permitId']}');
    // // }

    permitId = Get.arguments["permitId"];
    jobId = Get.arguments["jobId"];

    // jobId = Get.arguments[1];

    print('PermitIdView:${permitId}');
    print('JobIdIdView:${jobId}');

    //homePresenter.generateToken();
    //  Future.delayed(Duration(seconds: 1), () {
    facilityIdStreamSubscription = homeController.facilityId$.listen((event) {
      facilityId = event;
      print('FacilityIdsss$facilityId');
      Future.delayed(Duration(seconds: 1), () {
        getBlocksList(facilityId);
      });
    });
    if (permitId != null) {
      await getViewPermitDetail(permitId: permitId!);
    }

    // await getInventoryCategoryList();
    //   await getInventoryIsolationList();
    //  await getInventoryEquipmentNameList();
    // await getAssignedToList();
    // await getFacilityLists();
    // await getFacilitiesLists();
    // await getTypePermitList();
    // await getInventoryDetailList();
    // await getEmployeePermitList();
    // await getJobTypePermitList();
    // await getPermitIssuerList();
    // await getPermitApproverList();

    await getSafetyMeasureList();
    await getPermitHistory(permitId: permitId!);
    await getPermitConditionList(isCancle: isCancle!);

    super.onInit();
  }

  Future<void> getFacilitiesLists() async {
    facilityList.value = <FacilityModel>[];
    blockList.value = <BlockModel>[];
    final _facilityList = await jobListPresenter.getFacilityList();
    selectedFacilityId = Get.arguments;
    if (_facilityList != null) {
      facilityList.value = _facilityList;

      int facilityIndex =
          facilityList.indexWhere((x) => x?.id == selectedFacilityId);
      if (facilityIndex > -1) {
        selectedFacility.value = facilityList[facilityIndex]?.name ?? '';
        getBlocksList(selectedFacilityId!);
      }
    }
  }

  Future<void> permitApprovedButton(
      {String? permitId, String? ptwStatus, int? jobId}) async {
    String _approveComment = approveCommentTextFieldCtrlr.text.trim();

    final _permitApprovedBtn = await viewPermitPresenter.permitApprovedButton(
        comment: _approveComment,
        id: permitId,
        ptwStatus: ptwStatus,
        jobId: jobId);
    // showAlertPermitApproveDialog();
    print('Approved Data:${_approveComment}');
    print('Approved Data:${permitId}');
  }

  Future<void> permitCloseButton({String? permitId}) async {
    String _closeComment = closeCommentTextFieldCtrlr.text.trim();

    final _permitCloseBtn = await viewPermitPresenter.permitCloseButton(
      comment: _closeComment,
      id: permitId,
    );
    // showAlertPermitApproveDialog();
    print('Close Button Data:${_closeComment}');
    print('Close Button Data:${permitId}');
  }


  Future<void> permitCancelRequestButton({String? permitId}) async {
    // String _cancelComment = cancelCommentRequestTextFieldCtrlr.text.trim();

    // final _permitCancelRequestBtn =
    //     await viewPermitPresenter.permitCancelRequestButton(
    //   comment: _cancelComment,
    //   id: permitId,
    // );
    // // showAlertPermitApproveDialog();
    // print('Cancel Request Button Data:${_cancelComment}');
    // print('Cancel Request Button Data:${permitId}');
     {
      String _cancelComment = cancelCommentRequestTextFieldCtrlr.text.trim();

      CancelPermitRequestModel cancelPermitModel =
          CancelPermitRequestModel(
            id: int.tryParse('${permitId}'), 
            comment: _cancelComment,
            conditionIds:[4,6],
            fileId:125

            );

      var cancelPermitJsonString = cancelPermitModel.toJson();
      // print({"rejectCalibrationJsonString", approveCalibrationtoJsonString});
      Map<String, dynamic>? response = await viewPermitPresenter.permitCancelRequestButton(
        cancelPermitJsonString: cancelPermitJsonString,
        isLoading: true,
      );
      print('cancelPermitRequest:$cancelPermitJsonString');
      if (response == true) {
        //getCalibrationList(facilityId, true);
      }
    }
  }

  Future<void> permitExtendButton({String? permitId}) async {
    String _reasonForExtensionComment =
        extendReasonCommentTextFieldCtrlr.text.trim();
    String _timeForExtensionComment = timeTextFieldCtrlr.text.trim();

    final _permitextendBtn = await viewPermitPresenter.permitExtendButton(
      comment: _reasonForExtensionComment,
      Time: _timeForExtensionComment,
      id: permitId,
    );
    // showAlertPermitApproveDialog();

    print('Extend Button Data:${_reasonForExtensionComment}');
    print('Extend Button Data:${_timeForExtensionComment}');
    print('Extend Button Data:${permitId}');
  }

  Future<void> permitRejectButton({String? permitId}) async {
    String _rejectComment = rejectCommentTextFieldCtrlr.text.trim();

    final _permitRejectBtn = await viewPermitPresenter.permitRejectButton(
      comment: _rejectComment,
      id: permitId,
    );
    // showAlertPermitApproveDialog();
    print('Reject Button Data:${_rejectComment}');
    print('Reject Button Data:${permitId}');
  }

  Future<void> permitCancelByApproverButton(
      {String? permitId, String? ptwStatus}) async {
    String _cancelComment = cancelCommentByApproverTextFieldCtrlr.text.trim();

    final _permitCancelByApproverBtn =
        await viewPermitPresenter.permitCancelByApproverButton(
            comment: _cancelComment, id: permitId, ptwStatus: ptwStatus);
    // showAlertPermitApproveDialog();
    print('Cancel Button By Approver Data:${_cancelComment}');
    print('Cancel Button By Approver Data:${permitId}');
  }

  Future<void> getPermitHistory({required int permitId}) async {
    /// TODO: CHANGE THESE VALUES
    int moduleType = 3;
    // int tempModuleType = 21;
    //
    historyList?.value = await viewPermitPresenter.getPermitHistory(
          // tempModuleType,
          // tempJobCardId,
          moduleType,
          permitId,
          true,
        ) ??
        [];
    update(["historyList"]);
  }

  Future<void> getViewPermitDetail({required int permitId}) async {
    // newPermitDetails!.value = <NewPermitListModel>[];
    viewPermitDetailsList?.value = <NewPermitDetailModel>[];

    final _viewPermitDetails =
        await viewPermitPresenter.getViewPermitDetail(permitId: permitId);
    print('New Permit Detail:$_viewPermitDetails');

    if (_viewPermitDetails != null) {
      viewPermitDetailsModel.value = _viewPermitDetails;
      listEmployee?.value = viewPermitDetailsModel.value?.employee_list ?? [];
      safetyList?.value =
          viewPermitDetailsModel.value?.safety_question_list ?? [];
      listCategory?.value = viewPermitDetailsModel.value?.lstCategory ?? [];
      listLoto?.value = viewPermitDetailsModel.value?.loto_list ?? [];
      // titleTextCtrlr.text = newPermitDetailsModel.value?.title ?? '';
      // permitDescriptionCtrlr.text = newPermitDetailsModel.value?.description ?? '';
      startDateTimeCtrlr.text =
          '${DateFormat('yyyy-MM-dd HH:mm').format(DateTime.parse('${viewPermitDetailsModel.value?.start_datetime}'))}';
      validTillTimeCtrlr.text =
          '${DateFormat('yyyy-MM-dd HH:mm').format(DateTime.parse('${viewPermitDetailsModel.value?.end_datetime}'))}';

      selectedSafetyMeasureId = viewPermitDetailsModel.value?.permitTypeid ?? 0;

      listAssociatedJobs?.value =
          viewPermitDetailsModel.value?.lstAssociatedJobs ?? [];
      listIsolation?.value = viewPermitDetailsModel.value?.lstIsolation ?? [];
      // selectedTypePermit.value = newPermitDetailsModel.value?.permitTypeName ?? '';
      // // selectedJobTypeList.value = newPermitDetailsModel.value.
      // selectedPermitIssuerLists.value = newPermitDetailsModel.value?.issuedByName ?? '';
      // selectedPermitApproverLists.value = newPermitDetailsModel.value?.approvedByName ?? '';
      // listEmployee?.value = newPermitDetailsModel.value?.lstEmp ?? [];
      // safetyList?.value = newPermitDetailsModel.value?.safety_question_list ?? [];
      // // print('EmployeeList:${listEmployee}');
    }
  }

  
   Future<void> getPermitConditionList({required int isCancle}) async {
    permitCancelConditionList!.value = <PermitCancelListModel>[];
    final _permitCancelConditionList = await viewPermitPresenter.getPermitConditionList(
      isLoading: true,
      // categoryIds: categoryIds,
      isCancle: 1,
      // job_type_id: 36,
    );
    print('Permit condition List${_permitCancelConditionList}');
    if (_permitCancelConditionList != null) {
      for (var permitCancelCondition_list in _permitCancelConditionList) {
        permitCancelConditionList!.add(permitCancelCondition_list);
      }
    }
    // supplierNameList = _supplierNameList;
    // employeeNamepaginationController = PaginationController(
    //   rowCount: employeeNameList.length,
    //   rowsPerPage: 10,
    // );
    update(['permit_condition_list']);
  }


  Future<void> getSafetyMeasureList() async {
    safetyMeasureList.value = <SafetyMeasureListModel>[];
    final _safetyMeasureList = await viewPermitPresenter.getSafetyMeasureList(
      isLoading: true,
      // categoryIds: categoryIds,
      permit_type_id: selectedSafetyMeasureId,
      // job_type_id: 36,
    );
    print('View SafetyrMeasure${selectedSafetyMeasureId}');
    if (_safetyMeasureList != null) {
      for (var safetyMeasure_list in _safetyMeasureList) {
        safetyMeasureList.add(safetyMeasure_list);
      }
    }
    // supplierNameList = _supplierNameList;
    // employeeNamepaginationController = PaginationController(
    //   rowCount: employeeNameList.length,
    //   rowsPerPage: 10,
    // );
    update(['safety_measure_list']);
  }

  Future<void> getInventoryDetailList() async {
    inventoryDetailList!.value = <InventoryDetailModel>[];

    final list = await viewPermitPresenter.getInventoryDetailList(
        isLoading: true, id: 14430);
    print('InventoryDetail List:$inventoryDetailList');
    if (list != null) {
      // selectedSupplierNameList.clear();
      // supplierNameList.clear();
      Set<String> supplierNameSet = {};
      for (var _inventoryDetailList in list) {
        if (_inventoryDetailList?.name != null) {
          // inventoryDetailList!.add(_inventoryDetailList?.name ?? "");
          inventoryDetailList!.add(_inventoryDetailList);
        }
        // print('Supplier Name Data:$supplierNameSet');
        // selectedSupplierNameList.addAll(supplierNameSet.toList());
        // print('Supplier Name5:$selectedSupplierNameList');
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
    print({"_selectedEquipmentNameIds": _selectedEquipmentNameIds});
    selectedEquipmentNameIdList.value = <int>[];
    filteredEquipmentNameList.value = <InventoryModel>[];
    for (var _selectedNameId in _selectedEquipmentNameIds) {
      selectedEquipmentNameIdList.add(_selectedNameId);
      InventoryModel? e = equipmentNameList.firstWhere((element) {
        print({"element?.id": element?.id, "ddd": _selectedNameId});
        return element?.id == _selectedNameId;
      });
      filteredEquipmentNameList.add(e);
    }
    print({
      "selectedEquipmentNameIdList le":
          selectedEquipmentNameIdList.value.length,
      "filteredEquipmentNameList": filteredEquipmentNameList.value.length
    });
  }

  void employeeNameSelected(_selectedEmployeeNameIds) {
    print({"_selectedEmployeeNameIds": _selectedEmployeeNameIds});
    selectedEmployeeNameIdList.value = <int>[];
    filteredEmployeeNameList.value = <EmployeeListModel>[];
    late int emp_id = 0;
    for (var _selectedEmployeeNameId in _selectedEmployeeNameIds) {
      selectedEmployeeNameIdList.add(_selectedEmployeeNameId);
      EmployeeListModel? e = employeeNameList.firstWhere((element) {
        print({"element?.id": element?.id, "ddd": _selectedEmployeeNameId});
        return element?.id == _selectedEmployeeNameId;
      });
      filteredEmployeeNameList.add(e);
    }
    print({
      "selectedEmployeeNameIdList": selectedEmployeeNameIdList.value.length,
      "filteredEmployeeNameList": filteredEmployeeNameList.value.length
    });

    employee_map[emp_id] = selectedEmployeeNameIdList;
  }

  void permitIssuerSelected(_selectedEmployeeNameIds) {
    print({"_selectedEmployeeNameIds": _selectedEmployeeNameIds});
    selectedPermitIssuerIdList.value = <int>[];
    // filteredEmployeeNameList.value = <EmployeeListModel>[];
    late int emp_id = 0;
    for (var _selectedPermitIssuerId in _selectedEmployeeNameIds) {
      selectedPermitIssuerIdList.add(_selectedPermitIssuerId);
      EmployeeListModel? e = permitIssuerList.firstWhere((element) {
        print({"element?.id": element?.id, "ddd": _selectedPermitIssuerId});
        return element?.id == _selectedPermitIssuerId;
      });
      // filteredEmployeeNameList.add(e);
    }
    print({
      "selectedEmployeeNameIdList": selectedEmployeeNameIdList.value.length,
      "filteredEmployeeNameList": filteredEmployeeNameList.value.length
    });

    employee_map[emp_id] = selectedEmployeeNameIdList;
  }

  void equipmentIsolationSelected(_selectedEquipmentIsolationIds) {
    selectedEquipmentIsolationIdList.value = <int>[];
    for (var _selectedIsolationId in _selectedEquipmentIsolationIds) {
      selectedEquipmentIsolationIdList.add(_selectedIsolationId);
    }
    print("category123:${selectedEquipmentIsolationIdList}");

    // getInventoryEquipmentNameList();
  }

  Future<void> getAssignedToList() async {
    final _assignedToList = await viewPermitPresenter.getAssignedToList();

    if (_assignedToList != null) {
      for (var _assignedTo in _assignedToList) {
        assignedToList.add(_assignedTo);
      }
      update(["assignedToList"]);
    }
  }

  Future<void> getEmployeePermitList() async {
    employeeNameList.value = <EmployeeListModel>[];
    final _employeeNameList = await viewPermitPresenter.getEmployeePermitList(
      isLoading: true,
      // categoryIds: categoryIds,
      facility_id: facilityId,
    );
    print('Employee List:$employeeNameList');
    if (_employeeNameList != null) {
      for (var employee_list in _employeeNameList) {
        employeeNameList.add(employee_list);
      }
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
    final _permitIssuerList = await viewPermitPresenter.getPermitIssuerList(
      isLoading: true,
      // categoryIds: categoryIds,
      facility_id: facilityId,
    );
    print('Permit Issuer List:$permitIssuerList');
    if (_permitIssuerList != null) {
      for (var permit_issuer_list in _permitIssuerList) {
        permitIssuerList.add(permit_issuer_list);
      }
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
    final _permitApproverList = await viewPermitPresenter.getPermitApproverList(
      isLoading: true,
      // categoryIds: categoryIds,
      facility_id: facilityId,
    );
    print('Permit Approver List:$permitApproverList');
    if (_permitApproverList != null) {
      for (var permit_approver_list in _permitApproverList) {
        permitApproverList.add(permit_approver_list);
      }
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
    final _jobTypeList = await viewPermitPresenter.getJobTypePermitList(
      isLoading: true,
      // categoryIds: cPategoryIds,
      facility_id: facilityId,
    );
    print('Job Type List:${jobTypeList}');
    if (_jobTypeList != null) {
      for (var jobType_list in _jobTypeList) {
        jobTypeList.add(jobType_list);
      }
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
    final _sopPermitList = await viewPermitPresenter.getSopPermitList(
      isLoading: true,
      // categoryIds: categoryIds,
      job_type_id: selectedJobTYpesId,
      // job_type_id: 36,
    );
    print('SOP Permit List:${sopPermitList}');
    if (_sopPermitList != null) {
      for (var sopPermit_list in _sopPermitList) {
        sopPermitList.add(sopPermit_list);
      }
    }
    // supplierNameList = _supplierNameList;
    // employeeNamepaginationController = PaginationController(
    //   rowCount: employeeNameList.length,
    //   rowsPerPage: 10,
    // );
    update(['sop_permit_list']);
  }

  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {
      case RxList<FacilityModel>:
        {
          int facilityIndex = facilityList.indexWhere((x) => x?.name == value);
          selectedFacilityId = facilityList[facilityIndex]?.id ?? 0;
          print('FacilityId:$selectedFacilityId');
          _facilityId.add(facilityList[facilityIndex]?.id ?? 0);

          if (selectedFacilityId != 0) {
            isFacilitySelected.value = true;
          }
          selectedFacility.value = value;
          getBlocksList(selectedFacilityId!);
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
          getInventoryCategoryList(facilityId: selectedBlockId.toString());
        }
        break;
      case RxList<EquipmentModel>:
        {
          int equipmentIndex =
              equipmentList.indexWhere((x) => x?.name == value);
          int selectedEquipmentId = equipmentList[equipmentIndex]?.id ?? 0;
          print('euipment data5:$selectedEquipmentId');
        }
        break;
      case RxList<InventoryModel>:
        {
          for (var workAreaName in selectedWorkAreaNameList) {
            int workAreaIndex =
                workAreaList.indexWhere((x) => x?.name == workAreaName);
            selectedWorkAreaIdList.add(workAreaIndex);
          }
        }
        break;
      case RxList<InventoryCategoryModel>:
        {
          for (var equipCat in selectedEquipmentCategoryList) {
            int equipCatIndex =
                equipmentCategoryList.indexWhere((x) => x?.name == value);
            selectedEquipmentCategoryIdList.add(equipCatIndex);
            selectedInventoryCategoryId =
                equipmentCategoryList[equipCatIndex]?.id ?? 0;
            // print('First Category Id:$selectedInventoryCategoryId');
          }
        }
        break;
      case RxList<InventoryCategoryModel>:
        {
          for (var equipIso in selectedEquipmentIsolationList) {
            int equipIsoIndex = selectedEquipmentIsolationList
                .indexWhere((x) => x?.name == equipIso);
            selectedEquipmentIsolationIdList.add(equipIsoIndex);
          }
        }
        break;

      case RxList<EmployeeModel>:
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
      case RxList<TypePermitModel>:
        {
          int permitTypeIndex =
              typePermitList.indexWhere((x) => x?.name == value);
          selectedTypePermitId = facilityList[permitTypeIndex]?.id ?? 0;
          selectedPermitTypeId = typePermitList[permitTypeIndex]?.id ?? 0;
          print('TypePermitList$selectedPermitTypeId');
          if (selectedTypePermitId != 0) {
            isTypePermitSelected.value = true;
          }
          selectedTypePermit.value = value;
          getBlocksList(selectedTypePermitId);
        }
        break;
      case RxList<EmployeeListModel>:
        {
          int permitIssuerListIndex =
              permitIssuerList.indexWhere((x) => x!.name == value);
          selectedPermitIssuerTypeId =
              permitIssuerList[permitIssuerListIndex]!.id ?? 0;
          print('PermitIssuerId:$selectedPermitIssuerTypeId');
        }
        break;
      case RxList<EmployeeListModel2>:
        {
          int permitApproverListIndex =
              permitApproverList.indexWhere((x) => x!.name == value);
          selectedPermitApproverTypeId =
              permitApproverList[permitApproverListIndex]!.id ?? 0;
          print('PermitApproverId:$selectedPermitApproverTypeId');
        }
        break;
      case RxList<JobTypeListModel>:
        {
          int jobTypeListIndex = jobTypeList.indexWhere((x) => x.name == value);
          selectedJobTYpesId = jobTypeList[jobTypeListIndex].id ?? 0;
          print('JobtypeId:$selectedJobTYpesId');
          getSopPermitList();

          //}
        }
        break;
      case RxList<SOPListModel>:
        {
          int sopPermitListIndex =
              sopPermitList.indexWhere((x) => x.name == value);
          selectedSOPId = sopPermitList[sopPermitListIndex].id ?? 0;
          print('SOPTyeId:$selectedSOPId');
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
        await viewPermitPresenter.getBlocksList(facilityId: _facilityId);

    if (_blockList != null) {
      for (var block in _blockList) {
        blockList.add(block);
      }
      update(["blockList"]);
    }
  }

  Future<void> getInventoryCategoryList({String? facilityId}) async {
    equipmentCategoryList.value = <InventoryCategoryModel>[];
    final _equipmentCategoryList =
        await viewPermitPresenter.getInventoryCategoryList(
      isLoading: true,
    );
    if (_equipmentCategoryList != null) {
      for (var equimentCategory in _equipmentCategoryList) {
        equipmentCategoryList.add(equimentCategory);
      }
    }
  }

  Future<void> printScreen() async {
    try {
      final RenderRepaintBoundary boundary =
          printKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      final imageBytes = await boundary
          .toImage(pixelRatio: 3.0)
          .then((image) => image.toByteData(format: ImageByteFormat.png));

      if (imageBytes != null) {
        Printing.layoutPdf(onLayout: (PdfPageFormat format) async {
          final doc = pw.Document();
          doc.addPage(
            pw.Page(
              build: (pw.Context context) {
                return pw.Image(
                    pw.MemoryImage(imageBytes.buffer.asUint8List()));
              },
            ),
          );
          return doc.save();
        });
      }
    } catch (e) {
      print('Error printing: ${e}');
    }
  }

  //  Future<void> getInventoryIsolationList({String? facilityId}) async {
  //   equipmentIsolationList.value = <InventoryCategoryModel>[];
  //   final _equipmentIsolationList =
  //       await viewPermitPresenter.getInventoryIsolationList(
  //     isLoading: true,
  //   );
  //   if (_equipmentIsolationList != null) {
  //     for (var equimentIsolation in _equipmentIsolationList) {
  //       equipmentIsolationList.add(equimentIsolation);
  //     }
  //   }
  // }

  //  Future<void> getInventoryEquipmentNameList() async {
  //   equipmentNameList.value = <InventoryModel>[];
  //   String  categoryIds= selectedEquipmentIsolationIdList.join(', ');
  //   print({"cate123",categoryIds});
  //   final _equipmentNameList =
  //       await viewPermitPresenter.getInventoryEquipmentNameList(
  //     isLoading: true,
  //     categoryIds:categoryIds,
  //     facilityId: facilityId,
  //   );
  //   if (_equipmentNameList != null) {
  //     for (var equipmentName in _equipmentNameList) {
  //       equipmentNameList.add(equipmentName);
  //     }

  //   }
  //    equipmentNamepaginationController = PaginationController(
  //     rowCount: equipmentNameList.length,
  //     rowsPerPage: 10,
  //   );

  // }

  void updateDropdownValue(String value) {
    selectedFacility.value = value;
  }

  Future<void> getFacilityLists() async {
    final _facilityList = await viewPermitPresenter.getFacilityLists();

    if (_facilityList != null) {
      for (var facility in _facilityList) {
        facilityList.add(facility);
      }
      selectedFacility.value = facilityList[0]?.name ?? '';
    }
  }

  Future<void> getTypePermitList() async {
    final _permitTypeList =
        await viewPermitPresenter.getTypePermitList(facility_id: facilityId);

    if (_permitTypeList != null) {
      for (var permitType in _permitTypeList) {
        typePermitList.add(permitType);
      }
      selectedTypePermit.value = typePermitList[0]?.name ?? '';
    }
  }

  // void checkForm() {
  //   if (selectedFacility.value == '') {
  //     isFacilitySelected.value = false;
  //   }
  //   if (selectedBlock.value == '') {
  //     isBlockSelected.value = false;
  //   }
  //   if (selectedTypeOfPermit.value == '') {
  //     isTypePermit.value = false;
  //   }
  //   if (startDateTimeCtrlr.text == '') {
  //     Fluttertoast.showToast(msg: 'Start date Field cannot be empty');
  //   }
  //   if (validTillTimeCtrlr.text == '') {
  //     Fluttertoast.showToast(msg: 'End date Field cannot be empty');
  //   }
  //   if (selectedTypePermit.value == '') {
  //     isTypePermitSelected.value = false;
  //   }
  //   if (jobDescriptionCtrlr.text.trim().length < 3) {
  //     isJobDescriptionInvalid.value = true;
  //   }
  //   if (titleTextCtrlr.text.trim().length < 3) {
  //     isTitleTextInvalid.value = true;
  //   }
  //   if (isAssignedToSelected.value == false ||
  //       isFacilitySelected.value == false ||
  //       isBlockSelected.value == false ||
  //       isJobDescriptionInvalid == true) {
  //     isFormInvalid.value = true;
  //   } else {
  //     isFormInvalid.value = false;
  //   }
  // }

  // void createNewPermit() async {
  //   {
  //     checkForm();
  //     if (isFormInvalid.value) {
  //       return;
  //     }

  //     String _description = htmlEscape.convert(jobDescriptionCtrlr.text.trim());
  //     String _title = htmlEscape.convert(titleTextCtrlr.text.trim());
  //     String _startDate = htmlEscape.convert(startDateTimeCtrlr.text.trim());
  //      List<Employeelist> employee_map_list = [];
  //     //UserId
  //     int userId = varUserAccessModel.value.user_id ?? 0;

  //   filteredEmployeeNameList.forEach((e) {
  //     employee_map_list.add(Employeelist(
  //         employeeId: e?.id, responsibility: e?.name));
  //   });
  //   //print('EmployeeMapList:$employee_map_list');
  //   // print('EmployeeMapData:$employee_map');

  //  // Map<int, dynamic> employee_Map = employee_map_list.asMap();

  //   late List<LotoList> loto_map_list = [];

  //   filteredEquipmentNameList.forEach((e) {
  //     loto_map_list.add(LotoList(
  //         Loto_id: e?.id, Loto_Key: e?.name));
  //   });

  //     //  List<Employeelist> employee_list= <Employeelist>[];
  //     // List<Safetyquestionlist> safety_question_list = <Safetyquestionlist>[];
  //     // List<LotoList> loto_list = <LotoList>[];

  //     // for (var _selectedWorkArea in selectedWorkAreaList) {
  //     //   var json = '{"asset_id": ${_selectedWorkArea?.id},'
  //     //       '"category_ids": ${_selectedWorkArea?.categoryId}}';

  //     //   // CreatePermitModel _employeeList = addCreatePermitModelFromJson(json);
  //     //   // employee_list.add(_employeeList as Employeelist);
  //     //   // CreatePermitModel _safetyQuestionList = addCreatePermitModelFromJson(json);
  //     //   // safety_question_list.add(_safetyQuestionList as Safetyquestionlist);
  //     //   // CreatePermitModel _lotoList = addCreatePermitModelFromJson(json);
  //     //   // loto_list.add(_lotoList as LotoList);

  //     //   // SafetyQuestionList _safetyQuestionList = addSafetyQuestionListFromJson(json);
  //     //   // safety_question_list.add(_safetyQuestionList);
  //     // }

  //     CreatePermitModel createPermitModel = CreatePermitModel(
  //       facility_id: facilityId,
  //       blockId: selectedBlockId,
  //       title: _title,
  //       description: _description,
  //       approver_id: selectedPermitApproverTypeId,
  //       category_ids: selectedEquipmentCategoryIdList,
  //       block_ids: selectedEmployeeNameIdList,
  //       employee_list: employee_map_list,
  //       start_datetime: startDateTimeCtrlr.text,
  //       end_datetime: validTillTimeCtrlr.text,
  //       is_isolation_required: isToggleOn.value,
  //       isolated_category_ids: selectedEquipmentIsolationIdList,
  //       issuer_id: selectedPermitIssuerTypeId,
  //       lotoId: selectedEquipmentCategoryIdList.first,
  //       safety_question_list: [],
  //       sop_type_id: selectedSOPId,
  //       typeId: selectedPermitTypeId, ///Permit Type Id
  //       user_id: userId,
  //       work_type_id: selectedJobTYpesId,  ////Job type Id
  //       Loto_list: loto_map_list,
  //     );
  //     var jobJsonString = createPermitModel.toJson();
  //     print({"jsonData5", jobJsonString});
  //     Map<String, dynamic>? responseNewPermitCreated =
  //         await viewPermitPresenter.createNewPermit(
  //       newPermit: jobJsonString,
  //       isLoading: true,
  //     );
  //     if (responseNewPermitCreated != null) {
  //       print("respomsecghj,$responseNewPermitCreated");
  //       //  CreateNewPermitDialog();
  //       showAlertDialog();

  //       // print('NewCreated:$_facilityId');

  //     }
  //   }
  // }

  static void showAlertDialog({
    int? facility_id,
    String? message,
    String? title,
    Function()? onPress,
  }) async {
    await Get.dialog<void>(CreateNewPermitDialog());
  }

  Future<void> createNewPermits() async {
    Get.toNamed(
      Routes.newPermit,
    );
  }

  void goToNewPermitScreen() {
    Get.toNamed(Routes.newPermit);
  }

  Future<void> viewJobDetails(int? _jobId) async {
    Get.toNamed(Routes.jobDetails, arguments: {'jobId': _jobId});
  }

  browseFiles({Uint8List? fileBytes}) async {
    await viewPermitPresenter.browseFiles(
        fileBytes, fileName.value, type, true, facilityId);
    return true;
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
}
