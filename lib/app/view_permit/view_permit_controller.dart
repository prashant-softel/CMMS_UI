import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/job_list/job_list_presenter.dart';
import 'package:cmms/app/navigators/navigators.dart';
import 'package:cmms/app/new_permit_list/permit_status_constants.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/utils/save_file_web.dart';
import 'package:cmms/app/view_permit/view_permit_presenter.dart';
import 'package:cmms/app/widgets/create_permit_dialog.dart';
import 'package:cmms/domain/models/block_model.dart';
import 'package:cmms/domain/models/cancel_permit_request_model.dart';
import 'package:cmms/domain/models/close_permit_model.dart';
import 'package:cmms/domain/models/comment_model.dart';
import 'package:cmms/domain/models/create_sop_model.dart';
import 'package:cmms/domain/models/employee_list_model.dart';
import 'package:cmms/domain/models/employee_list_model2.dart';
import 'package:cmms/domain/models/employee_model.dart';
import 'package:cmms/domain/models/extend_permit_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/inventory_detail_model.dart';
import 'package:cmms/domain/models/job_type_list_model.dart';
import 'package:cmms/domain/models/new_permit_details_model.dart';
import 'package:cmms/domain/models/permit_cancel_condition_list_model.dart';
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
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/subjects.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import '../../../domain/models/inventory_category_model.dart';
import '../../domain/models/aprove_extend_model.dart';
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
  int? type = 0;

  ///
  // var issuedAtTimeCtrlr = TextEditingController();

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

  /// Employee Table
  Rx<String> selectedEmployeeName = ''.obs;
  Rx<bool> isEmployeeSelected = true.obs;

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

  ///Extend Condition List
  RxList<ExtendConditions?>? listExtendCondition =
      <ExtendConditions?>[].obs; //Extend Condition List

  ///Cancel Condition List
  RxList<CancelConditions?>? listCancelCondition =
      <CancelConditions?>[].obs; //Cancel Condition List

  ///Close Condition List
  RxList<CloseConditions?>? listCloseCondition =
      <CloseConditions?>[].obs; //Close Condition List

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

  var fileId;
  var fileIdExtend;

//Permit Cancel Condition
  RxList<PermitCancelListModel?>? permitCancelConditionList =
      <PermitCancelListModel?>[].obs;

  //Permit Close Condition
  RxList<PermitCancelListModel?>? permitCloseConditionList =
      <PermitCancelListModel?>[].obs;

  //Permit extend Condition
  RxList<PermitCancelListModel?>? permitExtendConditionList =
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

  RxBool isChecked = false.obs;
  void toggleItemSelection(int index) {
    permitCancelConditionList![index]!.id =
        permitCancelConditionList![index]?.id;
  }

  RxBool isCheckedRequire6 = false.obs;
  RxInt intValue6 = 0.obs;
  void requiretoggleCheckbox6(bool value) {
    isCheckedRequire6.value = value;
    if (value) {
      intValue6.value = 6;
    } else {
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
    if (value) {}
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
  TextEditingController cancelCommentRejectTextFieldCtrlr =
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

  //File Import For Cancel
  RxString fileName = "".obs;
  Uint8List? fileBytes;
  // int types = 0;

  //File Import for Extend
  RxString fileNameExtend = "".obs;
  Uint8List? fileBytesExtend;
  int typeExtend = 0;

  BehaviorSubject<int> _facilityId = BehaviorSubject.seeded(0);
  Stream<int> get facilityId$ => _facilityId.stream;
  int get facilityId1 => _facilityId.value;

  Map<dynamic, dynamic> employee_map = {};
  Map<int, dynamic> loto_map = {};
  int? isCancle = 1;
  int? isClose = 1;
  int? isExtend = 1;

  int? permitId = 0;
  int? jobId = 0;
  Map<String, dynamic> data = {};
  @override
  void onInit() async {
    // types = Get.arguments["types"];
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

    await getSafetyMeasureList();
    await getPermitHistory(permitId: permitId!);
    await getPermitConditionList(isCancle: isCancle!);
    await getPermitCloseConditionList(isClose: isClose!);
    await getPermitExtendConditionList(isExtend: isExtend!);
    await getEmployeeList();

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

  void permitApprovedButton(
      {int? permitId, String? ptwStatus, int? jobId}) async {
    {
      String _approveComment = approveCommentTextFieldCtrlr.text.trim();

      AproveExtendPermitModel commentRejectCancelPermitModel =
          AproveExtendPermitModel(
        id: permitId,
        comment: _approveComment,
        ptwStatus: ptwStatus,
        jobId: jobId,
      );

      var rejectCancelPermitJsonString =
          commentRejectCancelPermitModel.toJson();

      Map<String, dynamic>? response =
          await viewPermitPresenter.permitApprovedButton(
        rejectCancelPermitJsonString: rejectCancelPermitJsonString,
        ptwStatus: ptwStatus,
        jobId: jobId,
        isLoading: true,
      );
      if (response == true) {
        //getCalibrationList(facilityId, true);
      }
    }
  }
  // Future<void> permitApprovedButton(
  //     {String? permitId, String? ptwStatus, int? jobId}) async {
  //   String _approveComment = approveCommentTextFieldCtrlr.text.trim();

  //   final _permitApprovedBtn = await viewPermitPresenter.permitApprovedButton(
  //       comment: _approveComment,
  //       id: permitId,
  //       ptwStatus: ptwStatus,
  //       jobId: jobId,
  //       isLoading: true);
  //   // showAlertPermitApproveDialog();
  //   print('Approved Data:${_approveComment}');
  //   print('Approved Data:${permitId}');
  // }

  Future<void> permitCloseButton(
      {String? permitId, List<dynamic>? closeFileIds}) async {
    //  String _closeComment = closeCommentTextFieldCtrlr.text.trim();

    // final _permitCloseBtn = await viewPermitPresenter.permitCloseButton(
    //   comment: _closeComment,
    //   id: permitId,
    // );
    // // showAlertPermitApproveDialog();
    // print('Close Button Data:${_closeComment}');
    // print('Close Button Data:${permitId}');
    {
      String _closeComment = closeCommentTextFieldCtrlr.text.trim();
      List<int> dataClose = [];
      permitCloseConditionList!.value.forEach((element) {
        if (element!.isChecked!) {
          dataClose.add(element.id!);
        }
      });
      // print('ConditionIds:$data');

      ClosePermitModel closePermitModel = ClosePermitModel(
          id: int.tryParse('${permitId}'),
          comment: _closeComment,
          conditionIds: dataClose,
          fileIds: closeFileIds);

      var closePermitJsonString = closePermitModel.toJson();
      // print({"rejectCalibrationJsonString", approveCalibrationtoJsonString});
      Map<String, dynamic>? response =
          await viewPermitPresenter.permitCloseButton(
        closePermitJsonString: closePermitJsonString,
        isLoading: true,
      );
      print('closePermitRequest:$closePermitJsonString');
      if (response == true) {
        //getCalibrationList(facilityId, true);
      }
    }
  }

  Future<void> permitCancelRequestButton(
      {String? permitId, List<dynamic>? fileIds}) async {
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
      List<int> data = [];
      permitCancelConditionList!.value.forEach((element) {
        if (element!.isChecked!) {
          data.add(element.id!);
        }
      });
      print('ConditionIds:$data');

      CancelPermitRequestModel cancelPermitModel = CancelPermitRequestModel(
          id: int.tryParse('${permitId}'),
          comment: _cancelComment,
          conditionIds: data,
          fileIds: fileIds);

      var cancelPermitJsonString = cancelPermitModel.toJson();
      // print({"rejectCalibrationJsonString", approveCalibrationtoJsonString});
      Map<String, dynamic>? response =
          await viewPermitPresenter.permitCancelRequestButton(
        cancelPermitJsonString: cancelPermitJsonString,
        isLoading: true,
      );
      print('cancelPermitRequest:$cancelPermitJsonString');
      if (response == true) {
        //getCalibrationList(facilityId, true);
      }
    }
  }

  Future<void> permitExtendButton(
      {String? permitId, List<dynamic>? extendFileIds}) async {
    // String _reasonForExtensionComment =
    //     extendReasonCommentTextFieldCtrlr.text.trim();
    // String _timeForExtensionComment = timeTextFieldCtrlr.text.trim();

    // final _permitextendBtn = await viewPermitPresenter.permitExtendButton(
    //   comment: _reasonForExtensionComment,
    //   // Time: _timeForExtensionComment,
    //   Time: 240,
    //   id: permitId,
    // );
    // // showAlertPermitApproveDialog();

    // print('Extend Button Data:${_reasonForExtensionComment}');
    // print('Extend Button Data:${_timeForExtensionComment}');
    // print('Extend Button Data:${permitId}');
    {
      final _reasonForExtensionComment =
          extendReasonCommentTextFieldCtrlr.text.trim();
      List<int> dataExtend = [];
      permitExtendConditionList!.value.forEach((element) {
        if (element!.isChecked!) {
          dataExtend.add(element.id!);
        }
      });
      print('ConditionIdsExtend:$dataExtend');

      ExtendPermitModel extendPermitModel = ExtendPermitModel(
          id: int.tryParse('${permitId}'),
          extend_by_minutes: 240,
          comment: _reasonForExtensionComment,
          conditionIds: dataExtend,
          fileIds: extendFileIds);

      var extendPermitJsonString = extendPermitModel.toJson();
      // print({"rejectCalibrationJsonString", approveCalibrationtoJsonString});
      Map<String, dynamic>? response =
          await viewPermitPresenter.permitExtendButton(
        extendPermitJsonString: extendPermitJsonString,
        isLoading: true,
      );
      print('extendPermitRequest:$extendPermitJsonString');
      if (response == true) {
        //getCalibrationList(facilityId, true);
      }
    }
  }

  // Future<void> permitRejectButton(
  //     {String? permitId, String? ptwStatus, int? jobId}) async {
  //   String _rejectComment = rejectCommentTextFieldCtrlr.text.trim();

  //   final _permitRejectBtn = await viewPermitPresenter.permitRejectButton(
  //       comment: _rejectComment,
  //       id: permitId,
  //       ptwStatus: ptwStatus,
  //       jobId: jobId,
  //       isLoading: true);
  //   // showAlertPermitApproveDialog();
  //   print('Reject Button Data:${_rejectComment}');
  //   print('Reject Button Data:${permitId}');
  // }

  void permitRejectButton(
      {int? permitId, String? ptwStatus, int? jobId}) async {
    {
      String _rejectComment = rejectCommentTextFieldCtrlr.text.trim();

      CommentModel commentRejectExtendPermitModel =
          CommentModel(id: permitId, comment: _rejectComment);

      var rejectExtendPermitJsonString =
          commentRejectExtendPermitModel.toJson();

      Map<String, dynamic>? response =
          await viewPermitPresenter.permitRejectButton(
        rejectExtendPermitJsonString: rejectExtendPermitJsonString,
        id: permitId,
        ptwStatus: ptwStatus,
        jobId: jobId,
        isLoading: true,
      );
      if (response == true) {
        //getCalibrationList(facilityId, true);
      }
    }
  }

  Future<void> permitCancelByApproverButton(
      {int? permitId, String? ptwStatus}) async {
    // String _cancelComment = cancelCommentByApproverTextFieldCtrlr.text.trim();

    // final _permitCancelByApproverBtn =
    //     await viewPermitPresenter.permitCancelByApproverButton(
    //         comment: _cancelComment, id: permitId, ptwStatus: ptwStatus);
    // // showAlertPermitApproveDialog();
    // print('Cancel Button By Approver Data:${_cancelComment}');
    // print('Cancel Button By Approver Data:${permitId}');
    {
      String _cancelComment = cancelCommentByApproverTextFieldCtrlr.text.trim();

      CommentModel commentCancelByApproverPermitModel =
          CommentModel(id: permitId, comment: _cancelComment);

      var cancelByApproverJsonString =
          commentCancelByApproverPermitModel.toJson();

      Map<String, dynamic>? response =
          await viewPermitPresenter.permitCancelByApproverButton(
        cancelByApproverJsonString: cancelByApproverJsonString,
        ptwStatus: ptwStatus,
        isLoading: true,
      );
      if (response == true) {
        //getCalibrationList(facilityId, true);
      }
    }
  }

  void permitCancelRejectButton({int? permitId}) async {
    {
      String _comment = cancelCommentRejectTextFieldCtrlr.text.trim();

      CommentModel commentRejectCancelPermitModel =
          CommentModel(id: permitId, comment: _comment);

      var rejectCancelPermitJsonString =
          commentRejectCancelPermitModel.toJson();

      Map<String, dynamic>? response =
          await viewPermitPresenter.permitCancelRejectButton(
        rejectCancelPermitJsonString: rejectCancelPermitJsonString,
        isLoading: true,
      );
      if (response == true) {
        //getCalibrationList(facilityId, true);
      }
    }
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
      listExtendCondition?.value =
          viewPermitDetailsModel.value?.extendDetails?.conditions ?? [];
      listCancelCondition?.value =
          viewPermitDetailsModel.value?.cancelDetails?.conditions ?? [];
      listCloseCondition?.value =
          viewPermitDetailsModel.value?.closeDetails?.conditions ?? [];
      // selectedTypePermit.value = newPermitDetailsModel.value?.permitTypeName ?? '';
      // // selectedJobTypeList.value = newPermitDetailsModel.value.
      // selectedPermitIssuerLists.value = newPermitDetailsModel.value?.issuedByName ?? '';
      // selectedPermitApproverLists.value = newPermitDetailsModel.value?.approvedByName ?? '';
      // listEmployee?.value = newPermitDetailsModel.value?.lstEmp ?? [];
      // safetyList?.value = newPermitDetailsModel.value?.safety_question_list ?? [];
      // print('EmployeeList:${listExtendCondition?.value}');
    }
  }

  Future<void> getPermitConditionList({required int isCancle}) async {
    permitCancelConditionList!.value = <PermitCancelListModel>[];
    final _permitCancelConditionList =
        await viewPermitPresenter.getPermitConditionList(
      isLoading: true,
      // categoryIds: categoryIds,
      isCancle: 1,
      // job_type_id: 36,
    );
    print('Permit condition List${permitCancelConditionList}');
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

  Future<void> getPermitCloseConditionList({required int isClose}) async {
    permitCloseConditionList!.value = <PermitCancelListModel>[];
    final _permitCloseConditionList =
        await viewPermitPresenter.getPermitCloseConditionList(
      isLoading: true,
      // categoryIds: categoryIds,
      isClose: 1,
      // job_type_id: 36,
    );
    // print('Permit condition List${permitCancelConditionList}');
    if (_permitCloseConditionList != null) {
      for (var permitCloseCondition_list in _permitCloseConditionList) {
        permitCloseConditionList!.add(permitCloseCondition_list);
      }
    }
    // supplierNameList = _supplierNameList;
    // employeeNamepaginationController = PaginationController(
    //   rowCount: employeeNameList.length,
    //   rowsPerPage: 10,
    // );
    update(['permit_close_condition_list']);
  }

  Future<void> getPermitExtendConditionList({required int isExtend}) async {
    permitExtendConditionList!.value = <PermitCancelListModel>[];
    final _permitExtendConditionList =
        await viewPermitPresenter.getPermitExtendConditionList(
      isLoading: true,
      // categoryIds: categoryIds,
      isExtend: 1,
      // job_type_id: 36,
    );
    // print('Permit condition List${permitCancelConditionList}');
    if (_permitExtendConditionList != null) {
      for (var permitExtendCondition_list in _permitExtendConditionList) {
        permitExtendConditionList!.add(permitExtendCondition_list);
      }
    }
    // supplierNameList = _supplierNameList;
    // employeeNamepaginationController = PaginationController(
    //   rowCount: employeeNameList.length,
    //   rowsPerPage: 10,
    // );
    update(['permit_extend_condition_list']);
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

  Future<void> getEmployeeList() async {
    employeeList.value = <EmployeeListModel>[];
    final _employeeList = await viewPermitPresenter.getEmployeeList(
      isLoading: true,
      // categoryIds: categoryIds,
      facility_id: facilityId,
    );
    print('employee List:$_employeeList');
    for (var employee_list in _employeeList) {
      employeeList.add(employee_list);
    }

    update(['employee_list']);
  }

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

  // Future<bool> browseFiles({Uint8List? fileBytes}) async {
  //  await viewPermitPresenter.browseFiles(
  //       fileBytes, fileName.value, type, true, facilityId);
  //   return true;
  // }
  Future<bool> browseFiles(
      {Uint8List? fileBytes, required int position}) async {
    CreateSOPModel? createSOPModel =
        await viewPermitPresenter.browseFiles(fileBytes, fileName.value, true);

    fileId = createSOPModel?.jsa_fileId;
    print('fileId:$fileId');

    return true;
  }

  Future<bool> browseFilesForExtend(
      {Uint8List? fileBytesExtend, required int position}) async {
    CreateSOPModel? createSOPModel = await viewPermitPresenter
        .browseFilesForExtend(fileBytesExtend, fileNameExtend.value, true);

    fileIdExtend = createSOPModel?.jsa_fileId;
    print('fileIdExtend:$fileIdExtend');

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

  conditionMethod(bool value) {
    return Checkbox(
        value: value,
        onChanged: (bool? value) {
          value = !value!;
        });
  }

  Future<void> generateInvoice() async {
    //Create a PDF document.
    final PdfDocument document = PdfDocument();
    //Add page to the PDF
    final PdfPage page = document.pages.add();
    //Get page client size
    final Size pageSize = page.getClientSize();
    //Draw rectangle
    page.graphics.drawRectangle(
        bounds: Rect.fromLTWH(0, 0, pageSize.width, pageSize.height),
        pen: PdfPen(PdfColor(142, 170, 219)));
    //Generate PDF grid.
    //  final PdfGrid grid = getGrid();
    var url = "assets/files/logo.png";
    var response = await get(Uri.parse(url));
    var data = response.bodyBytes;

//Load image data into PDF bitmap object
    PdfBitmap image = PdfBitmap(data);

    //Draw the header section by creating text element
    final PdfLayoutResult result = drawHeader(page, pageSize, document, image);

    //Draw grid
    // drawGrid(page, grid, result);
    //Add invoice footer
    // drawFooter(page, pageSize);
    //Save the PDF document
    final List<int> bytes = document.save();
    //Dispose the document.
    document.dispose();
    //Save and launch the file.
    await saveAndLaunchFile(bytes, 'permit.pdf');
  }

  PdfLayoutResult drawHeader(
    PdfPage page,
    Size pageSize,
    PdfDocument document,
    PdfBitmap image,
  ) {
    // document.pages
    //     .add()
    //     .graphics
    //     .drawImage(image, const Rect.fromLTWH(0, 0, 100, 80));
    page.graphics.drawImage(image, Rect.fromLTWH(15, 10, 100, 80));
    page.graphics.drawImage(image, Rect.fromLTWH(370, 590, 100, 50));

    // page.graphics.drawRectangle(
    //   brush: PdfSolidBrush(PdfColor(142, 170, 219)),
    //   bounds: Rect.fromLTWH(0, 0, pageSize.width, 40),
    // ); //Draw string
    //Draw the image

    // page.graphics.drawImage(
    //     PdfBitmap(image),
    //     Rect.fromLTWH(20, 10, 50, 50));

    page.graphics.drawString(
        'This permit is valid only when issued Et approved by an authorized issuer.This permit must be obtained before a specified work is started Et it must be closed immediately after completion of the work or at the end of the shift as agreed by ther parties identified on this permit. Refer PTW SOP(hyperlink).',
        PdfStandardFont(PdfFontFamily.helvetica, 10),
        brush: PdfBrushes.black,
        bounds: Rect.fromLTWH(25, 0, pageSize.width - 50, 90),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString(
        'Plant: ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(30, 100, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString('${viewPermitDetailsModel.value?.siteName ?? ""}',
        PdfStandardFont(PdfFontFamily.helvetica, 10),
        bounds: Rect.fromLTWH(60, 100, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    //Draw Rectangle to highlight margin
    page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(142, 170, 219)),
        bounds: Rect.fromLTWH(25, 90, pageSize.width - 270, 25));
    page.graphics.drawString(
        'Block: ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(280, 100, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString('${viewPermitDetailsModel.value?.blockName ?? ""}',
        PdfStandardFont(PdfFontFamily.helvetica, 10),
        bounds: Rect.fromLTWH(310, 100, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    //Draw Rectangle to highlight margin
    page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(142, 170, 219)),
        bounds: Rect.fromLTWH(270, 90, pageSize.width - 290, 25));
    page.graphics.drawString(
        'Permit No.: ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(30, 130, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString('${viewPermitDetailsModel.value?.permitNo ?? ""}',
        PdfStandardFont(PdfFontFamily.helvetica, 10),
        bounds: Rect.fromLTWH(83, 130, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    //Draw Rectangle to highlight margin
    page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(142, 170, 219)),
        bounds: Rect.fromLTWH(25, 115, pageSize.width - 270, 25));
    page.graphics.drawString(
        'Start Date: ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(280, 130, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString(
        '${viewPermitDetailsModel.value?.start_datetime ?? ""}',
        PdfStandardFont(PdfFontFamily.helvetica, 10),
        bounds: Rect.fromLTWH(330, 130, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    //Draw Rectangle to highlight margin
    page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(142, 170, 219)),
        bounds: Rect.fromLTWH(270, 115, pageSize.width - 290, 25));

    page.graphics.drawString(
        'Valid Date: ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(30, 150, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString(
        '${viewPermitDetailsModel.value?.end_datetime ?? ""}',
        PdfStandardFont(PdfFontFamily.helvetica, 10),
        bounds: Rect.fromLTWH(83, 150, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    //Draw Rectangle to highlight margin
    page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(142, 170, 219)),
        bounds: Rect.fromLTWH(25, 140, pageSize.width - 270, 25));
    page.graphics.drawString(
        'Permit Type: ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(280, 150, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString(
        '${viewPermitDetailsModel.value?.permitTypeName ?? ""}',
        PdfStandardFont(PdfFontFamily.helvetica, 10),
        bounds: Rect.fromLTWH(336, 150, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    //Draw Rectangle to highlight margin
    page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(142, 170, 219)),
        bounds: Rect.fromLTWH(270, 140, pageSize.width - 290, 25));
    page.graphics.drawString(
        'Equipment Category: ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(30, 175, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString(
        "${listCategory!.isEmpty ? '' : listCategory!.map((element) => element!.equipmentCat)}", // '${viewPermitDetailsModel.value?.lstCategory?? ""}',
        PdfStandardFont(PdfFontFamily.helvetica, 10),
        bounds: Rect.fromLTWH(130, 175, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    //Draw Rectangle to highlight margin
    page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(142, 170, 219)),
        bounds: Rect.fromLTWH(25, 165, pageSize.width - 45, 25));
    page.graphics.drawString(
        'Description: ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(30, 200, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString(
        '${viewPermitDetailsModel.value?.description ?? ""}',
        PdfStandardFont(PdfFontFamily.helvetica, 10),
        bounds: Rect.fromLTWH(100, 200, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    //Draw Rectangle to highlight margin
    page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(142, 170, 219)),
        bounds: Rect.fromLTWH(25, 190, pageSize.width - 45, 45));

    final PdfFont contentFont = PdfStandardFont(PdfFontFamily.helvetica, 9);
    //Draw string

    //ISolation
    //Draw Rectangle to highlight margin
    page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(142, 170, 219)),
        bounds: Rect.fromLTWH(25, 240, pageSize.width - 45, 25));
    page.graphics.drawString(
        'Isolation Required: ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(30, 250, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString('', PdfStandardFont(PdfFontFamily.helvetica, 10),
        bounds: Rect.fromLTWH(100, 240, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    ///Loto Applied

    page.graphics.drawString(
        'Loto Applied: ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(180, 250, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString('', PdfStandardFont(PdfFontFamily.helvetica, 10),
        bounds: Rect.fromLTWH(100, 240, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    /// Isolated Equipments
    page.graphics.drawString(
        'Isolated Equipments: ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(300, 250, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString(
        '${listIsolation!.isEmpty ? '' : listIsolation?.map((element) => element?.isolationAssetsCatName!.split(','))}',
        PdfStandardFont(PdfFontFamily.helvetica, 10),
        bounds: Rect.fromLTWH(400, 250, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    /////
    //ISolation
    //Draw Rectangle to highlight margin
    page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(142, 170, 219)),
        bounds: Rect.fromLTWH(25, 270, pageSize.width - 45, 55));
    page.graphics.drawString(
        'Isolated Category ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(30, 280, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString('', PdfStandardFont(PdfFontFamily.helvetica, 10),
        bounds: Rect.fromLTWH(100, 280, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    ///Loto Applied

    page.graphics.drawString(
        'Loto Applied On: ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(30, 295, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString(
        '${listLoto!.map((element) => element!.asset_name)}',
        PdfStandardFont(PdfFontFamily.helvetica, 10),
        bounds: Rect.fromLTWH(30, 310, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    /// Isolated Equipments
    page.graphics.drawString(
        'Loto Lock Sr. No.: ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(300, 295, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString('${listLoto!.map((element) => element!.locksrno)}',
        PdfStandardFont(PdfFontFamily.helvetica, 10),
        bounds: Rect.fromLTWH(300, 310, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    //Permit Type checklist
    page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(142, 170, 219)),
        bounds: Rect.fromLTWH(25, 330, pageSize.width - 45, 55));
    page.graphics.drawString(
        'Permit Type Checklist ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(30, 340, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString(
        '${safetyMeasureList.map((element) => element.name)}',
        PdfStandardFont(PdfFontFamily.helvetica, 10),
        bounds: Rect.fromLTWH(30, 350, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
    // page.graphics.drawString(
    //     'confine', PdfStandardFont(PdfFontFamily.helvetica, 10),
    //     bounds: Rect.fromLTWH(30, 360, 0, 0),
    //     format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    ///Toolbox talk
    //ISolation
    //Draw Rectangle to highlight margin
    page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(142, 170, 219)),
        bounds: Rect.fromLTWH(25, 390, pageSize.width - 45, 45));
    page.graphics.drawString(
        'Tool Box Talk ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(30, 400, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    ///Job Type

    page.graphics.drawString(
        'Job Type: ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(30, 415, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString(
        '${viewPermitDetailsModel.value?.job_type_name ?? 'No Data Found'}',
        PdfStandardFont(PdfFontFamily.helvetica, 10),
        bounds: Rect.fromLTWH(80, 415, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    /// SOP
    page.graphics.drawString(
        'SOP: ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(200, 415, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString(
        '${viewPermitDetailsModel.value?.sop_type_name ?? 'No Data Found'}',
        PdfStandardFont(PdfFontFamily.helvetica, 10),
        bounds: Rect.fromLTWH(230, 415, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    ///JSA
    page.graphics.drawString(
        'JSA: ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(340, 415, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString('', PdfStandardFont(PdfFontFamily.helvetica, 10),
        bounds: Rect.fromLTWH(370, 415, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    ///Pre Job Description
    //ISolation
    //Draw Rectangle to highlight margin
    page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(142, 170, 219)),
        bounds: Rect.fromLTWH(25, 440, pageSize.width - 45, 150));
    page.graphics.drawString(
        'Tool Box Talk (TBT) / PRE-JOB DISCUSSION',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(30, 450, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    ///Job Type

    page.graphics.drawString(
        'Conducted At Job-Site By: ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(30, 470, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString('${viewPermitDetailsModel.value?.tbT_Done_By}',
        PdfStandardFont(PdfFontFamily.helvetica, 10),
        bounds: Rect.fromLTWH(150, 470, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    /// SOP
    page.graphics.drawString(
        'Date & Time: ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(230, 470, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString('${viewPermitDetailsModel.value?.tbT_Done_At}',
        PdfStandardFont(PdfFontFamily.helvetica, 10),
        bounds: Rect.fromLTWH(290, 470, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    //Traning attended by
    page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(142, 170, 219)),
        bounds: Rect.fromLTWH(45, 500, pageSize.width - 75, 60));
    page.graphics.drawString(
        'TBT Training Attended By',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(50, 510, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    ///Job Type

    page.graphics.drawString(
        'Employee Name: ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(50, 525, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString(
        '${listEmployee!.map((element) => element!.empName)}',
        PdfStandardFont(PdfFontFamily.helvetica, 10),
        bounds: Rect.fromLTWH(50, 535, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    /// SOP
    page.graphics.drawString(
        'Responsibility: ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(230, 525, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString('${listEmployee!.map((element) => element!.resp)}',
        PdfStandardFont(PdfFontFamily.helvetica, 10),
        bounds: Rect.fromLTWH(230, 535, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    ///Extend Condition Lists
    viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_EXTEND_REQUESTED //133
            ||
            viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_EXTEND_REQUEST_APPROVE //135
        ?
        //ISolation
        //Draw Rectangle to highlight margin
        page.graphics.drawRectangle(
            pen: PdfPen(PdfColor(142, 170, 219)),
            bounds: Rect.fromLTWH(25, 595, pageSize.width - 45, 110),
          )
        : Dimens.box0;
    viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_EXTEND_REQUESTED //133
            ||
            viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_EXTEND_REQUEST_APPROVE //135
        ? page.graphics.drawString(
            'Extend Condition List',
            PdfStandardFont(
              PdfFontFamily.helvetica,
              10,
            ),
            bounds: Rect.fromLTWH(30, 610, 0, 0),
            format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle))
        : Dimens.box0;

    ///

    viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_EXTEND_REQUESTED //133
            ||
            viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_EXTEND_REQUEST_APPROVE //135
        ? page.graphics.drawString(
            '${listExtendCondition!.map((element) => element!.name)}',
            PdfStandardFont(PdfFontFamily.helvetica, 10),
            bounds: Rect.fromLTWH(30, 640, pageSize.width - 50, 0),
            format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle))
        : Dimens.box0;

    ///
    viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_EXTEND_REQUESTED //133
            ||
            viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_EXTEND_REQUEST_APPROVE //135
        ? page.graphics.drawString(
            'Attached Files: ',
            PdfStandardFont(
              PdfFontFamily.helvetica,
              10,
            ),
            bounds: Rect.fromLTWH(30, 670, 0, 0),
            format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle))
        : Dimens.box0;

    ////
    viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_EXTEND_REQUESTED //133
            ||
            viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_EXTEND_REQUEST_APPROVE //135
        ? page.graphics.drawString(
            'anaszia.jpeg', PdfStandardFont(PdfFontFamily.helvetica, 10),
            bounds: Rect.fromLTWH(30, 682, 0, 0),
            format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle))
        : Dimens.box0;

    ////Comment/remark
    viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_EXTEND_REQUESTED //133
            ||
            viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_EXTEND_REQUEST_APPROVE //135
        ? page.graphics.drawString(
            'Comment/Remark: ',
            PdfStandardFont(
              PdfFontFamily.helvetica,
              10,
            ),
            bounds: Rect.fromLTWH(140, 670, 0, 0),
            format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle))
        : Dimens.box0;

    ////
    viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_EXTEND_REQUESTED //133
            ||
            viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_EXTEND_REQUEST_APPROVE //135
        ? page.graphics.drawString(
            'Extended Conditions', PdfStandardFont(PdfFontFamily.helvetica, 10),
            bounds: Rect.fromLTWH(140, 682, 0, 0),
            format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle))
        : Dimens.box0;

    //Approver Name
    ////Comment/remark
    viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_EXTEND_REQUESTED //133
            ||
            viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_EXTEND_REQUEST_APPROVE //135
        ? page.graphics.drawString(
            'Approver Name: ',
            PdfStandardFont(
              PdfFontFamily.helvetica,
              10,
            ),
            bounds: Rect.fromLTWH(260, 670, 0, 0),
            format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle))
        : Dimens.box0;

    ////
    viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_EXTEND_REQUESTED //133
            ||
            viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_EXTEND_REQUEST_APPROVE //135
        ? page.graphics.drawString(
            '${viewPermitDetailsModel.value?.requestedByName}',
            PdfStandardFont(PdfFontFamily.helvetica, 10),
            bounds: Rect.fromLTWH(260, 682, 0, 0),
            format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle))
        : Dimens.box0;

    //Date Time
    ////Comment/remark
    viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_EXTEND_REQUESTED //133
            ||
            viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_EXTEND_REQUEST_APPROVE //135
        ? page.graphics.drawString(
            'Date & Time: ',
            PdfStandardFont(
              PdfFontFamily.helvetica,
              10,
            ),
            bounds: Rect.fromLTWH(360, 670, 0, 0),
            format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle))
        : Dimens.box0;

    ////
    viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_EXTEND_REQUESTED //133
            ||
            viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_EXTEND_REQUEST_APPROVE //135
        ? page.graphics.drawString(
            '${viewPermitDetailsModel.value?.start_datetime}',
            PdfStandardFont(PdfFontFamily.helvetica, 10),
            bounds: Rect.fromLTWH(360, 682, 0, 0),
            format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle))
        : Dimens.box0;

    ///Cancel Condition Lists
    viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_CANCELLED_BY_APPROVER //129
            ||
            viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_CANCEL_REQUESTED //130
        ?
        //ISolation
        //Draw Rectangle to highlight margin
        page.graphics.drawRectangle(
            pen: PdfPen(PdfColor(142, 170, 219)),
            bounds: Rect.fromLTWH(25, 595, pageSize.width - 45, 110),
          )
        : Dimens.box0;
    viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_CANCELLED_BY_APPROVER //129
            ||
            viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_CANCEL_REQUESTED //130
        ? page.graphics.drawString(
            'Cancel Condition List',
            PdfStandardFont(
              PdfFontFamily.helvetica,
              10,
            ),
            bounds: Rect.fromLTWH(30, 610, 0, 0),
            format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle))
        : Dimens.box0;

    ///

    viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_CANCELLED_BY_APPROVER //129
            ||
            viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_CANCEL_REQUESTED //130
        ? page.graphics.drawString(
            '${listCancelCondition!.map((element) => element!.name)}',
            PdfStandardFont(PdfFontFamily.helvetica, 10),
            bounds: Rect.fromLTWH(30, 640, pageSize.width - 50, 0),
            format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle))
        : Dimens.box0;

    ///

    ///
    viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_CANCELLED_BY_APPROVER //129
            ||
            viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_CANCEL_REQUESTED //130
        ? page.graphics.drawString(
            'Attached Files: ',
            PdfStandardFont(
              PdfFontFamily.helvetica,
              10,
            ),
            bounds: Rect.fromLTWH(30, 675, 0, 0),
            format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle))
        : Dimens.box0;

    ////
    viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_CANCELLED_BY_APPROVER //129
            ||
            viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_CANCEL_REQUESTED //130
        ? page.graphics.drawString(
            'anaszia.jpeg', PdfStandardFont(PdfFontFamily.helvetica, 10),
            bounds: Rect.fromLTWH(30, 687, 0, 0),
            format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle))
        : Dimens.box0;

    ////Comment/remark
    viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_CANCELLED_BY_APPROVER //129
            ||
            viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_CANCEL_REQUESTED //130
        ? page.graphics.drawString(
            'Comment/Remark: ',
            PdfStandardFont(
              PdfFontFamily.helvetica,
              10,
            ),
            bounds: Rect.fromLTWH(140, 675, 0, 0),
            format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle))
        : Dimens.box0;

    ////
    viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_CANCELLED_BY_APPROVER //129
            ||
            viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_CANCEL_REQUESTED //130
        ? page.graphics.drawString(
            'Cancel Conditions', PdfStandardFont(PdfFontFamily.helvetica, 10),
            bounds: Rect.fromLTWH(140, 687, 0, 0),
            format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle))
        : Dimens.box0;

    //Approver Name
    ////Comment/remark
    viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_CANCELLED_BY_APPROVER //129
            ||
            viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_CANCEL_REQUESTED //130
        ? page.graphics.drawString(
            'Approver Name: ',
            PdfStandardFont(
              PdfFontFamily.helvetica,
              10,
            ),
            bounds: Rect.fromLTWH(260, 675, 0, 0),
            format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle))
        : Dimens.box0;

    ////
    viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_CANCELLED_BY_APPROVER //129
            ||
            viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_CANCEL_REQUESTED //130
        ? page.graphics.drawString(
            '${viewPermitDetailsModel.value?.requestedByName}',
            PdfStandardFont(PdfFontFamily.helvetica, 10),
            bounds: Rect.fromLTWH(260, 687, 0, 0),
            format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle))
        : Dimens.box0;

    //Date Time
    ////Comment/remark
    viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_CANCELLED_BY_APPROVER //129
            ||
            viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_CANCEL_REQUESTED //130
        ? page.graphics.drawString(
            'Date & Time: ',
            PdfStandardFont(
              PdfFontFamily.helvetica,
              10,
            ),
            bounds: Rect.fromLTWH(360, 675, 0, 0),
            format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle))
        : Dimens.box0;

    ////
    viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_CANCELLED_BY_APPROVER //129
            ||
            viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_CANCEL_REQUESTED //130
        ? page.graphics.drawString(
            '${viewPermitDetailsModel.value?.start_datetime}',
            PdfStandardFont(PdfFontFamily.helvetica, 10),
            bounds: Rect.fromLTWH(360, 687, 0, 0),
            format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle))
        : Dimens.box0;

    ///cancel condition list end here

    ///CLose Condition Lists
    viewPermitDetailsModel.value?.ptwStatus ==
            PermitStatusConstants.PTW_CLOSED //126
        ?
        //ISolation
        //Draw Rectangle to highlight margin
        page.graphics.drawRectangle(
            pen: PdfPen(PdfColor(142, 170, 219)),
            bounds: Rect.fromLTWH(25, 595, pageSize.width - 45, 110),
          )
        : Dimens.box0;
    viewPermitDetailsModel.value?.ptwStatus ==
            PermitStatusConstants.PTW_CLOSED //126
        ? page.graphics.drawString(
            'Close Condition List',
            PdfStandardFont(
              PdfFontFamily.helvetica,
              10,
            ),
            bounds: Rect.fromLTWH(30, 610, 0, 0),
            format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle))
        : Dimens.box0;

    ///

    viewPermitDetailsModel.value?.ptwStatus ==
            PermitStatusConstants.PTW_CLOSED //126
        ? page.graphics.drawString(
            '${listCloseCondition!.map((element) => element!.name)}',
            PdfStandardFont(PdfFontFamily.helvetica, 10),
            bounds: Rect.fromLTWH(30, 640, pageSize.width - 50, 0),
            format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle))
        : Dimens.box0;

    ///

    ///
    viewPermitDetailsModel.value?.ptwStatus ==
            PermitStatusConstants.PTW_CLOSED //126
        ? page.graphics.drawString(
            'Attached Files: ',
            PdfStandardFont(
              PdfFontFamily.helvetica,
              10,
            ),
            bounds: Rect.fromLTWH(30, 670, 0, 0),
            format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle))
        : Dimens.box0;

    ////
    viewPermitDetailsModel.value?.ptwStatus ==
            PermitStatusConstants.PTW_CLOSED //126
        ? page.graphics.drawString(
            'anaszia.jpeg', PdfStandardFont(PdfFontFamily.helvetica, 10),
            bounds: Rect.fromLTWH(30, 682, 0, 0),
            format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle))
        : Dimens.box0;

    ////Comment/remark
    viewPermitDetailsModel.value?.ptwStatus ==
            PermitStatusConstants.PTW_CLOSED //126
        ? page.graphics.drawString(
            'Comment/Remark: ',
            PdfStandardFont(
              PdfFontFamily.helvetica,
              10,
            ),
            bounds: Rect.fromLTWH(140, 670, 0, 0),
            format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle))
        : Dimens.box0;

    ////
    viewPermitDetailsModel.value?.ptwStatus ==
            PermitStatusConstants.PTW_CLOSED //126
        ? page.graphics.drawString(
            'Close Conditions', PdfStandardFont(PdfFontFamily.helvetica, 10),
            bounds: Rect.fromLTWH(140, 682, 0, 0),
            format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle))
        : Dimens.box0;

    //Approver Name
    ////Comment/remark
    viewPermitDetailsModel.value?.ptwStatus ==
            PermitStatusConstants.PTW_CLOSED //126
        ? page.graphics.drawString(
            'Approver Name: ',
            PdfStandardFont(
              PdfFontFamily.helvetica,
              10,
            ),
            bounds: Rect.fromLTWH(260, 670, 0, 0),
            format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle))
        : Dimens.box0;

    ////
    viewPermitDetailsModel.value?.ptwStatus ==
            PermitStatusConstants.PTW_CLOSED //126
        ? page.graphics.drawString(
            '${viewPermitDetailsModel.value?.requestedByName}',
            PdfStandardFont(PdfFontFamily.helvetica, 10),
            bounds: Rect.fromLTWH(260, 682, 0, 0),
            format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle))
        : Dimens.box0;

    //Date Time
    ////Comment/remark
    viewPermitDetailsModel.value?.ptwStatus ==
            PermitStatusConstants.PTW_CLOSED //126
        ? page.graphics.drawString(
            'Date & Time: ',
            PdfStandardFont(
              PdfFontFamily.helvetica,
              10,
            ),
            bounds: Rect.fromLTWH(360, 670, 0, 0),
            format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle))
        : Dimens.box0;

    ////
    viewPermitDetailsModel.value?.ptwStatus ==
            PermitStatusConstants.PTW_CLOSED //126
        ? page.graphics.drawString(
            '${viewPermitDetailsModel.value?.start_datetime}',
            PdfStandardFont(PdfFontFamily.helvetica, 10),
            bounds: Rect.fromLTWH(360, 682, 0, 0),
            format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle))
        : Dimens.box0;

    ///close condition list end here

    final String invoiceNumber = 'Signature:      ';
    final Size contentSize = contentFont.measureString(invoiceNumber);
    // ignore: leading_newlines_in_multiline_strings

    String address =
        'Requested By: ${viewPermitDetailsModel.value?.requestedByName ?? ""}';

    String date = 'Date / Time: ${viewPermitDetailsModel.value?.issue_at}';

    // viewPermitDetailsModel
    //                                                           .value?.ptwStatus ==
    //                                                       PermitStatusConstants
    //                                                           .PTW_APPROVE //125
    //                                                   ||
    //                                                   viewPermitDetailsModel
    //                                                           .value
    //                                                           ?.ptwStatus ==
    //                                                       PermitStatusConstants
    //                                                           .PTW_CLOSED //126
    //                                                   ||
    //                                                  viewPermitDetailsModel
    //                                                           .value
    //                                                           ?.ptwStatus ==
    //                                                       PermitStatusConstants
    //                                                           .PTW_CANCELLED_BY_APPROVER //129
    String approvedBy =
        'Approved By: ${viewPermitDetailsModel.value?.approvedByName ?? ""}';

    String dateApproved =
        'Date / Time: ${viewPermitDetailsModel.value?.approve_at}';

    final String approvedSignature = 'Signature:      ';

    ///Cancelled By
    String datecancelledBy =
        'Date / Time: ${viewPermitDetailsModel.value?.cancel_at}';

    String cancelledBy =
        'Cancelled By: ${viewPermitDetailsModel.value?.cancelRequestByName ?? ""}';

    final String cancelledSignature = 'Signature:      ';

    ///Closed By
    String dateClosedBy =
        'Date / Time: ${viewPermitDetailsModel.value?.close_at}';

    String closedBy =
        'Closed By: ${viewPermitDetailsModel.value?.closedByName ?? ""}';

    final String closedSignature = 'Signature:      ';

    PdfTextElement(text: invoiceNumber, font: contentFont).draw(
        page: page,
        bounds: Rect.fromLTWH(pageSize.width - (contentSize.width + 30), 710,
            contentSize.width - 100, pageSize.height - 120));

    PdfTextElement(text: date, font: contentFont).draw(
        page: page,
        bounds: Rect.fromLTWH(pageSize.width - (contentSize.width + 230), 710,
            contentSize.width - 100, pageSize.height - 120));

    PdfTextElement(
            text: viewPermitDetailsModel.value?.ptwStatus ==
                        PermitStatusConstants.PTW_APPROVE //125
                    ||
                    viewPermitDetailsModel.value?.ptwStatus ==
                        PermitStatusConstants.PTW_CLOSED //126
                    ||
                    viewPermitDetailsModel.value?.ptwStatus ==
                        PermitStatusConstants.PTW_CANCELLED_BY_APPROVER //129,
                ? approvedBy
                : '',
            font: contentFont)
        .draw(
            page: page,
            bounds: Rect.fromLTWH(
                35, 720, contentSize.width - 100, pageSize.height - 120));

    PdfTextElement(
            text: viewPermitDetailsModel.value?.ptwStatus ==
                        PermitStatusConstants.PTW_APPROVE //125
                    ||
                    viewPermitDetailsModel.value?.ptwStatus ==
                        PermitStatusConstants.PTW_CLOSED //126
                    ||
                    viewPermitDetailsModel.value?.ptwStatus ==
                        PermitStatusConstants.PTW_CANCELLED_BY_APPROVER //129,
                ? dateApproved
                : '',
            font: contentFont)
        .draw(
            page: page,
            bounds: Rect.fromLTWH(pageSize.width - (contentSize.width + 230),
                720, contentSize.width - 100, pageSize.height - 120));

    PdfTextElement(
            text: viewPermitDetailsModel.value?.ptwStatus ==
                        PermitStatusConstants.PTW_APPROVE //125
                    ||
                    viewPermitDetailsModel.value?.ptwStatus ==
                        PermitStatusConstants.PTW_CLOSED //126
                    ||
                    viewPermitDetailsModel.value?.ptwStatus ==
                        PermitStatusConstants.PTW_CANCELLED_BY_APPROVER //129,
                ? approvedSignature
                : '',
            font: contentFont)
        .draw(
            page: page,
            bounds: Rect.fromLTWH(
                445,
                720,
                pageSize.width - (contentSize.width + 30),
                pageSize.height - 120))!;

    ////Cancelled by
    PdfTextElement(
            text: viewPermitDetailsModel.value?.ptwStatus ==
                        PermitStatusConstants.PTW_CANCELLED_BY_APPROVER //129
                    ||
                    viewPermitDetailsModel.value?.ptwStatus ==
                        PermitStatusConstants.PTW_CLOSED //126,
                ? cancelledBy
                : '',
            font: contentFont)
        .draw(
            page: page,
            bounds: Rect.fromLTWH(
                33, 730, contentSize.width - 100, pageSize.height - 120));

    PdfTextElement(
            text: viewPermitDetailsModel.value?.ptwStatus ==
                        PermitStatusConstants.PTW_CANCELLED_BY_APPROVER //129
                    ||
                    viewPermitDetailsModel.value?.ptwStatus ==
                        PermitStatusConstants.PTW_CLOSED //126,
                ? datecancelledBy
                : '',
            font: contentFont)
        .draw(
            page: page,
            bounds: Rect.fromLTWH(pageSize.width - (contentSize.width + 230),
                730, contentSize.width - 100, pageSize.height - 120));

    PdfTextElement(
            text: viewPermitDetailsModel.value?.ptwStatus ==
                        PermitStatusConstants.PTW_CANCELLED_BY_APPROVER //129
                    ||
                    viewPermitDetailsModel.value?.ptwStatus ==
                        PermitStatusConstants.PTW_CLOSED //126,
                ? cancelledSignature
                : '',
            font: contentFont)
        .draw(
            page: page,
            bounds: Rect.fromLTWH(
                445,
                730,
                pageSize.width - (contentSize.width + 30),
                pageSize.height - 120))!;

    ////Closed by
    PdfTextElement(
            text: viewPermitDetailsModel.value?.ptwStatus ==
                    PermitStatusConstants.PTW_CLOSED //126,
                ? closedBy
                : '',
            font: contentFont)
        .draw(
            page: page,
            bounds: Rect.fromLTWH(
                45, 740, contentSize.width - 100, pageSize.height - 120));

    PdfTextElement(
            text: viewPermitDetailsModel.value?.ptwStatus ==
                    PermitStatusConstants.PTW_CLOSED //126,
                ? dateClosedBy
                : '',
            font: contentFont)
        .draw(
            page: page,
            bounds: Rect.fromLTWH(pageSize.width - (contentSize.width + 230),
                740, contentSize.width - 100, pageSize.height - 120));

    PdfTextElement(
            text: viewPermitDetailsModel.value?.ptwStatus ==
                    PermitStatusConstants.PTW_CLOSED //126,
                ? closedSignature
                : '',
            font: contentFont)
        .draw(
            page: page,
            bounds: Rect.fromLTWH(
                445,
                740,
                pageSize.width - (contentSize.width + 30),
                pageSize.height - 120))!;

    return PdfTextElement(text: address, font: contentFont).draw(
        page: page,
        bounds: Rect.fromLTWH(30, 710,
            pageSize.width - (contentSize.width + 30), pageSize.height - 120))!;

    /////1

    //Draw rectangle
    // page.graphics.drawRectangle(
    //     brush: PdfSolidBrush(PdfColor(91, 126, 215)),
    //     bounds: Rect.fromLTWH(0, 0, pageSize.width - 115, 90));
    //Draw string
    // page.graphics.drawString(
    //     'INVOICE', PdfStandardFont(PdfFontFamily.helvetica, 30),
    //     brush: PdfBrushes.white,
    //     bounds: Rect.fromLTWH(25, 0, pageSize.width - 115, 90),
    //     format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    // page.graphics.drawRectangle(
    //     bounds: Rect.fromLTWH(400, 0, pageSize.width - 400, 90),
    //     brush: PdfSolidBrush(PdfColor(65, 104, 205)));

    // page.graphics.drawString(r'viewPermitDetailsModel.value?.siteName ',
    //     PdfStandardFont(PdfFontFamily.helvetica, 18),
    //     bounds: Rect.fromLTWH(400, 0, pageSize.width - 400, 100),
    //     brush: PdfBrushes.white,
    //     format: PdfStringFormat(
    //         alignment: PdfTextAlignment.center,
    //         lineAlignment: PdfVerticalAlignment.middle));

    //final PdfFont contentFont = PdfStandardFont(PdfFontFamily.helvetica, 9);
    //Draw string
    // page.graphics.drawString('Amount', contentFont,
    //     brush: PdfBrushes.white,
    //     bounds: Rect.fromLTWH(0, 0, pageSize.width - 400, 33),
    //     format: PdfStringFormat(
    //         alignment: PdfTextAlignment.center,
    //         lineAlignment: PdfVerticalAlignment.bottom));
    //Create data foramt and convert it to text.
    // final DateFormat format = DateFormat.yMMMMd('en_US');
    // final String invoiceNumber =
    //     'Invoice Number: 2058557939\r\n\r\nDate: ${format.format(DateTime.now())}';
    // ignore: leading_newlines_in_multiline_strings
//     String text =
//         '''This permit is valid only when issued Et approved by an authorized issuer.This permit must be obtained before a specified\r\nwork is started Et it must be closed immediately after completion of the work or at the end of the shift as agreed by ther\r\nparties identified on this permit. Refer PTW SOP(hyperlink).
//  \r\n\r\nPlant: ${viewPermitDetailsModel.value?.siteName ?? ""} Block:${viewPermitDetailsModel.value?.blockName ?? ""} Permit No.: ${viewPermitDetailsModel.value?.permitNo ?? ""}  ,

//         ''';
//     final Size contentSize = contentFont.measureString(text);

//     // PdfTextElement(text: invoiceNumber, font: contentFont).draw(
//     //     page: page,
//     //     bounds: Rect.fromLTWH(pageSize.width - (contentSize.width + 30), 120,
//     //         contentSize.width + 30, pageSize.height - 120));

//     return PdfTextElement(text: text, font: contentFont).draw(
//         page: page,
//         bounds: Rect.fromLTWH(
//             10, 30, contentSize.width + 30, pageSize.height - 120))!;
  }

  PdfGrid getGrid() {
    //Create a PDF grid
    final PdfGrid grid = PdfGrid();
    //Secify the columns count to the grid.
    grid.columns.add(count: 8);
    //Create the header row of the grid.
    final PdfGridRow headerRow = grid.headers.add(1)[0];
    //Set style
    headerRow.style.backgroundBrush = PdfSolidBrush(PdfColor(68, 114, 196));
    headerRow.style.textBrush = PdfBrushes.white;
    headerRow.cells[0].value = 'Product Id';
    headerRow.cells[0].stringFormat.alignment = PdfTextAlignment.center;
    headerRow.cells[1].value = 'Product Name';
    headerRow.cells[2].value = 'Price';
    headerRow.cells[3].value = 'Quantity';
    headerRow.cells[4].value = 'Quantity1';
    headerRow.cells[5].value = 'Quantity2';
    headerRow.cells[6].value = 'Quantity3';

    headerRow.cells[7].value = 'Total';
    //Add rows
    addProducts('CA-1098', 'AWC Logo Cap', 8.99, 2, 2, 2, 2, 17.98, grid);
    addProducts('CA-1098', 'AWC Logo Cap', 8.99, 2, 2, 2, 2, 17.98, grid);
    addProducts('CA-1098', 'AWC Logo Cap', 8.99, 2, 2, 2, 2, 17.98, grid);
    addProducts('CA-1098', 'AWC Logo Cap', 8.99, 2, 2, 2, 2, 17.98, grid);
    grid.applyBuiltInStyle(PdfGridBuiltInStyle.listTable4Accent5);
    //Set gird columns width
    grid.columns[1].width = 200;
    for (int i = 0; i < headerRow.cells.count; i++) {
      headerRow.cells[i].style.cellPadding =
          PdfPaddings(bottom: 5, left: 5, right: 5, top: 5);
    }
    for (int i = 0; i < grid.rows.count; i++) {
      final PdfGridRow row = grid.rows[i];
      for (int j = 0; j < row.cells.count; j++) {
        final PdfGridCell cell = row.cells[j];
        if (j == 0) {
          cell.stringFormat.alignment = PdfTextAlignment.center;
        }
        cell.style.cellPadding =
            PdfPaddings(bottom: 5, left: 5, right: 5, top: 5);
      }
    }
    return grid;
  }

  void addProducts(
      String productId,
      String productName,
      double price,
      int quantity,
      int quantity1,
      int quantity2,
      int quantity3,
      double total,
      PdfGrid grid) {
    final PdfGridRow row = grid.rows.add();
    row.cells[0].value = productId;
    row.cells[1].value = productName;
    row.cells[2].value = price.toString();
    row.cells[3].value = quantity.toString();
    row.cells[4].value = quantity.toString();
    row.cells[5].value = quantity.toString();
    row.cells[6].value = quantity.toString();

    row.cells[7].value = total.toString();
  }
}
