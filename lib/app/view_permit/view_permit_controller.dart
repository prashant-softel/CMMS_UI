import 'dart:async';
import 'dart:typed_data';
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
import 'package:cmms/domain/models/end_mc_execution_detail_model.dart';
import 'package:cmms/domain/models/extend_permit_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/inventory_detail_model.dart';
import 'package:cmms/domain/models/job_details_model.dart';
import 'package:cmms/domain/models/job_type_list_model.dart';
import 'package:cmms/domain/models/new_permit_details_model.dart';
import 'package:cmms/domain/models/permit_cancel_condition_list_model.dart';
import 'package:cmms/domain/models/pm_task_view_list_model.dart';
import 'package:cmms/domain/models/safety_measure_list_model.dart';
import 'package:cmms/domain/models/sop_list_model.dart';
import 'package:flutter/material.dart';
import 'package:cmms/domain/models/equipment_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/inventory_model.dart';
import 'package:cmms/domain/models/type_permit_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
  RxBool iscommentTextInvalid = false.obs;

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
  String? jsaData;
  String? sopData;

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
  RxBool isCheckedIso = false.obs;
  RxBool isCheckedLoto = false.obs;

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

  Rx<PmtaskViewModel?> pmtaskViewModel = PmtaskViewModel().obs;
  Rx<JobDetailsModel?> jobDetailsModel = JobDetailsModel().obs;
  var showMore = false.obs;
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
  Rx<int> type = 0.obs;
  Rx<int> hseMis = 0.obs;

  bool isOneHour(String validTill) {
    DateTime current = DateTime.now();
    DateTime expiryTime = DateTime.parse(validTill);
    Duration timeDifference = expiryTime.difference(current);

    if (timeDifference.inHours >= 1 && current.isBefore(expiryTime)) {
      return true;
    }
    return false;
  }

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
  RxList<FileList?>? file_list = <FileList>[].obs;

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
  RxList<ListAssociatedPm?>? listAssociatedPm = <ListAssociatedPm?>[].obs;
  RxList<ListAssociatedMC?>? lstAssociatedMc = <ListAssociatedMC?>[].obs;
  RxList<ListAssociatedVC?>? lstAssociatedVc = <ListAssociatedVC?>[].obs;

  ///Employee List
  RxList<ListEmployees?>? listEmployee = <ListEmployees?>[].obs; //ListEmployees

  ///Extend Condition List
  RxList<ExtendConditions?>? listExtendCondition =
      <ExtendConditions?>[].obs; //Extend Condition List
  RxList<List<Map<String, String>>> rowTBTTrainingOtherPersonItem =
      <List<Map<String, String>>>[].obs;

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

  Rx<EndMCExecutionDetailsModel?> mcExecutionDetailsModel =
      EndMCExecutionDetailsModel().obs;

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
  Rx<int> permitId = 0.obs;
  Rx<int> jobId = 0.obs;

  Map<String, dynamic> data = {};
  @override
  void onInit() async {
    try {
      await setPermitId();

      // permitId = Get.arguments["permitId"];
      // jobId = Get.arguments["jobId"];

      // print('PermitIdView:${permitId}');
      // print('JobIdIdView:${jobId}');

      //homePresenter.generateToken();
      //  Future.delayed(Duration(seconds: 1), () {
      facilityIdStreamSubscription = homeController.facilityId$.listen((event) {
        facilityId = event;
        print('FacilityIdsss$facilityId');
        Future.delayed(Duration(seconds: 1), () async {
          await getBlocksList(facilityId);
          await getViewPermitDetail(
              permitId: permitId.value, facilityId: facilityId);
          await getPermitHistory(
              permitId: permitId.value, facilityId: facilityId);
        });
        // Future.delayed(Duration(seconds: 1), () {

        // });
      });
      // await getViewPermitDetail(
      //     permitId: permitId.value, facilityId: facilityId);
      // await getSafetyMeasureList();
      await getPermitHistory(permitId: permitId.value, facilityId: facilityId);
      await getPermitConditionList(isCancle: isCancle!, facilityId: facilityId);
      await getPermitCloseConditionList(isClose: isClose!);
      await getPermitExtendConditionList(isExtend: isExtend!);
      await getEmployeeList();
      await getSopPermitList();

      super.onInit();
    } catch (e) {
      print(e);
    }
  }

  Future<void> setPermitId() async {
    // try {
    //   final _permitId = await viewPermitPresenter.getValue();
    //   final _type = await viewPermitPresenter.getTypeValue();
    //   // final _jobId = await viewPermitPresenter.getJobIdValue();
    //   if (_permitId == null || _permitId == "" || _permitId == "null") {
    //     var dataFromPreviousScreen = Get.arguments;
    //     permitId.value = dataFromPreviousScreen['permitId'];
    //     type.value = dataFromPreviousScreen['type'];
    //     hseMis.value = dataFromPreviousScreen['hseMis'];

    //     // jobId.value = dataFromPreviousScreen['jobId'];
    //     viewPermitPresenter.saveValue(permitId: permitId.value.toString());
    //     viewPermitPresenter.saveTypeValue(type: type.value.toString());
    //     print("permitId: ${permitId.value}");
    //     print("type: ${type.value}");
    // print("jobId: ${jobId.value}");
    // viewPermitPresenter.saveJobIdValue(jobId: jobId.value.toString());
    // } else {]
    final String? _permitId = Get.parameters['permitId'];
    final String? _type = Get.parameters['type'];
    final String? _hseMis = Get.parameters['hseMis'];

    permitId.value = int.tryParse(_permitId ?? "") ?? 0;
    type.value = int.tryParse(_type ?? "") ?? 0;
    hseMis.value = int.tryParse(_hseMis ?? "") ?? 0;

    // }
    // } catch (e) {
    //   // Utility.showDialog(e.toString() + 'permitId');
    // }
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
      {int? permitId, String? ptwStatus, int? jobId, int? type}) async {
    {
      String _approveComment = approveCommentTextFieldCtrlr.text.trim();
      String taskId = listAssociatedPm!.isEmpty
          ? ""
          : listAssociatedPm?[0]?.pmId.toString() ?? "";
      String jobId = listAssociatedJobs!.isEmpty
          ? ""
          : listAssociatedJobs![0]?.jobId.toString() ?? '';
      String mctaskId = lstAssociatedMc!.isEmpty
          ? ""
          : lstAssociatedMc![0]?.executionId.toString() ?? '';
      String mcplanId = lstAssociatedMc!.isEmpty
          ? ""
          : lstAssociatedMc![0]?.plan_id.toString() ?? '';
      AproveExtendPermitModel commentRejectCancelPermitModel =
          AproveExtendPermitModel(
        id: permitId,
        comment: _approveComment,
        ptwStatus: ptwStatus,
        jobId: 0,
      );

      var rejectCancelPermitJsonString =
          commentRejectCancelPermitModel.toJson();

      Map<String, dynamic>? response =
          await viewPermitPresenter.permitApprovedButton(
              rejectCancelPermitJsonString: rejectCancelPermitJsonString,
              ptwStatus: ptwStatus,
              jobId: int.tryParse(jobId),
              type: type,
              isLoading: true,
              vegid: lstAssociatedVc!.value.length > 0
                  ? lstAssociatedVc![0]!.plan_id
                  : 0,
              vegexe: lstAssociatedVc!.value.length > 0
                  ? lstAssociatedVc![0]!.executionId
                  : 0,
              taskId: type == 1 ? jobId : taskId,
              mcplanId: int.tryParse(mcplanId),
              mctaskId: int.tryParse(mctaskId));
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
      {String? permitId, List<dynamic>? closeFileIds, int? jobId}) async {
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
        jobId: jobId,
        isLoading: true,
      );
      print('closePermitRequest:$closePermitJsonString');
      if (response == true) {
        //getCalibrationList(facilityId, true);
      }
    }
  }

  void checkcommentcancel() {
    if (cancelCommentRequestTextFieldCtrlr.text.trim().isEmpty) {
      isFormInvalid.value = true;
      Fluttertoast.showToast(msg: "Please Enter Remark!");
    } else {
      isFormInvalid.value = false;
    }
  }

  Future<void> permitCancelRequestButton(
      {String? permitId, List<dynamic>? fileIds, int? jobId}) async {
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
      checkcommentcancel();
      if (isFormInvalid.value) {
        return;
      }
      String taskId = listAssociatedPm!.isEmpty
          ? ""
          : listAssociatedPm?[0]?.pmId.toString() ?? "";
      String jobId = listAssociatedJobs!.isEmpty
          ? ""
          : listAssociatedJobs![0]?.jobId.toString() ?? '';
      String vegplanId = lstAssociatedVc!.isEmpty
          ? ""
          : lstAssociatedVc![0]?.plan_id.toString() ?? '';

      String vegexid = lstAssociatedVc!.isEmpty
          ? ""
          : lstAssociatedVc![0]?.executionId.toString() ?? '';
      String mctaskId = lstAssociatedMc!.isEmpty
          ? ""
          : lstAssociatedMc![0]?.executionId.toString() ?? '';
      String mcplanId = lstAssociatedMc!.isEmpty
          ? ""
          : lstAssociatedMc![0]?.plan_id.toString() ?? '';
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
          conditionIds: [1],
          fileIds: fileIds);

      var cancelPermitJsonString = cancelPermitModel.toJson();
      // print({"rejectCalibrationJsonString", approveCalibrationtoJsonString});
      Map<String, dynamic>? response =
          await viewPermitPresenter.permitCancelRequestButton(
              cancelPermitJsonString: cancelPermitJsonString,
              jobId: int.tryParse(jobId),
              isLoading: true,
              type: type.value,
              taskId: type.value == 1 ? jobId : taskId,
              vegexid: int.tryParse(vegexid),
              vegplanId: int.tryParse(vegplanId),
              mcplanId: int.tryParse(mcplanId),
              mctaskId: int.tryParse(mctaskId));
      print('cancelPermitRequest:$cancelPermitJsonString');
      if (response == true) {
        //getCalibrationList(facilityId, true);
      }
    }
  }

  void toggleShowMore() {
    showMore.value = !showMore.value;
  }

  void checkcommentextend() {
    if (extendReasonCommentTextFieldCtrlr.text.trim().isEmpty) {
      isFormInvalid.value = true;
      Fluttertoast.showToast(msg: "Please enter Remark!");
    } else {
      isFormInvalid.value = false;
    }
  }

  Future<void> permitExtendButton(
      {String? permitId, List<dynamic>? extendFileIds, int? jobId}) async {
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
      checkcommentextend();
      if (isFormInvalid.value) {
        return;
      }
      final _reasonForExtensionComment =
          extendReasonCommentTextFieldCtrlr.text.trim();
      List<int> dataExtend = [1];
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
        jobId: jobId,
        isLoading: true,
      );
      print('extendPermitRequest:$extendPermitJsonString');
      if (response == true) {
        //getCalibrationList(facilityId, true);
      }
    }
  }

  void permitRejectButton(
      {int? permitId, String? ptwStatus, int? jobId, String? taskId}) async {
    {
      String _rejectComment = rejectCommentTextFieldCtrlr.text.trim();
      String mctaskId = lstAssociatedMc!.isEmpty
          ? ""
          : lstAssociatedMc![0]?.executionId.toString() ?? '';
      String mcplanId = lstAssociatedMc!.isEmpty
          ? ""
          : lstAssociatedMc![0]?.plan_id.toString() ?? '';

      CommentModel commentRejectExtendPermitModel =
          CommentModel(id: permitId, comment: _rejectComment);

      var rejectExtendPermitJsonString =
          commentRejectExtendPermitModel.toJson();

      Map<String, dynamic>? response =
          await viewPermitPresenter
              .permitRejectButton(
                  rejectExtendPermitJsonString: rejectExtendPermitJsonString,
                  id: permitId,
                  ptwStatus: ptwStatus,
                  jobId: jobId,
                  taskId: taskId,
                  isLoading: true,
                  type: type.value,
                  vegid: lstAssociatedVc!.value.length > 0
                      ? lstAssociatedVc![0]!.plan_id
                      : 0,
                  vegexe: lstAssociatedVc!.value.length > 0
                      ? lstAssociatedVc![0]!.executionId
                      : 0,
                  mcplanId: int.tryParse(mcplanId),
                  mctaskId: int.tryParse(mctaskId));
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

  Future<void> getPermitHistory(
      {required int permitId, required int facilityId}) async {
    /// TODO: CHANGE THESE VALUES
    int moduleType = 3;
    // int tempModuleType = 21;
    //
    historyList?.value = await viewPermitPresenter.getPermitHistory(
          // tempModuleType,
          // tempJobCardId,
          moduleType,
          permitId,
          facilityId,
          true,
        ) ??
        [];
    update(["historyList"]);
  }

  Future<void> getViewPermitDetail(
      {required int permitId, required int facilityId}) async {
    // newPermitDetails!.value = <NewPermitListModel>[];
    viewPermitDetailsList?.value = <NewPermitDetailModel>[];

    final _viewPermitDetails = await viewPermitPresenter.getViewPermitDetail(
        permitId: permitId, facilityId: facilityId);
    print('New Permit Detail:$_viewPermitDetails');

    if (_viewPermitDetails != null) {
      viewPermitDetailsModel.value = _viewPermitDetails;
      isCheckedIso.value =
          _viewPermitDetails.is_physical_iso_required == 0 ? false : true;
      listEmployee?.value = viewPermitDetailsModel.value?.employee_list ?? [];
      safetyList?.value =
          viewPermitDetailsModel.value?.safety_question_list ?? [];
      listCategory?.value = viewPermitDetailsModel.value?.lstCategory ?? [];
      listLoto?.value = viewPermitDetailsModel.value?.loto_list ?? [];
      isCheckedLoto.value = viewPermitDetailsModel.value?.is_loto_required == 1
          ? true
          : false; // titleTextCtrlr.text = newPermitDetailsModel.value?.title ?? '';
      // permitDescriptionCtrlr.text = newPermitDetailsModel.value?.description ?? '';
      startDateTimeCtrlr.text =
          '${DateFormat('yyyy-MM-dd HH:mm').format(DateTime.parse('${viewPermitDetailsModel.value?.start_datetime}'))}';
      validTillTimeCtrlr.text =
          '${DateFormat('yyyy-MM-dd HH:mm').format(DateTime.parse('${viewPermitDetailsModel.value?.end_datetime}'))}';

      selectedSafetyMeasureId = viewPermitDetailsModel.value?.permitTypeid ?? 0;
      if (selectedSafetyMeasureId > 0) {
        getSafetyMeasureList();
      }
      rowTBTTrainingOtherPersonItem.value = [];
      viewPermitDetailsModel.value?.lotoOtherDetails?.forEach(
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
      viewPermitDetailsModel.value?.safety_question_list?.forEach((element) {
        safety_measure_map_list.add(
          ListSafetyQuestion(
              saftyQuestionId: element.saftyQuestionId,
              saftyQuestionName: element.saftyQuestionName,
              ischeck: element.ischeck != null ? 1 : 0),
        );
      });
      print("safety_measure_map_listghevdwj: ${safety_measure_map_list}");

      listAssociatedJobs?.value =
          viewPermitDetailsModel.value?.lstAssociatedJobs ?? [];
      listAssociatedPm?.value =
          viewPermitDetailsModel.value?.lstAssociatedPM ?? [];
      print({"12233", listAssociatedPm});
      lstAssociatedMc?.value =
          viewPermitDetailsModel.value?.lstAssociatedMC ?? [];
      print({"MC Data of ptw", lstAssociatedMc});
      lstAssociatedVc?.value =
          viewPermitDetailsModel.value?.lstAssociatedVC ?? [];
      print({"MC Data of ptw", lstAssociatedVc});
      listIsolation?.value = viewPermitDetailsModel.value?.lstIsolation ?? [];
      file_list?.value = viewPermitDetailsModel.value?.file_list ?? [];
      print("File List:");
      file_list?.forEach(
        (fileItem) {
          print("ID: ${fileItem!.id}");
          print("File Name: ${fileItem.fileName}");
          print("File Category: ${fileItem.fileCategory}");
          print("File Size: ${fileItem.fileSize}");
          print("Status: ${fileItem.status}");
          print("PTW Files: ${fileItem.ptwFiles}");
        },
      );
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

  Future<void> getPermitConditionList(
      {required int isCancle, required int facilityId}) async {
    permitCancelConditionList!.value = <PermitCancelListModel>[];
    final _permitCancelConditionList =
        await viewPermitPresenter.getPermitConditionList(
      facilityId: facilityId,
      isLoading: true,
      // categoryIds: categoryIds,
      isCancle: 1,
      // job_type_id: 36,
    );
    print('Permit condition List${permitCancelConditionList}');
    for (var permitCancelCondition_list in _permitCancelConditionList) {
      permitCancelConditionList!.add(permitCancelCondition_list);
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
    for (var permitCloseCondition_list in _permitCloseConditionList) {
      permitCloseConditionList!.add(permitCloseCondition_list);
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
    for (var permitExtendCondition_list in _permitExtendConditionList) {
      permitExtendConditionList!.add(permitExtendCondition_list);
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
    safetyMeasureList.value = <SafetyMeasureListModel>[];

    print('View SafetyrMeasure${selectedSafetyMeasureId}');
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

  Future<void> getInventoryDetailList(int facilityId) async {
    inventoryDetailList!.value = <InventoryDetailModel>[];

    final list = await viewPermitPresenter.getInventoryDetailList(
        isLoading: true, id: 14430, facilityId: facilityId);
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
    final _permitIssuerList = await viewPermitPresenter.getPermitIssuerList(
      isLoading: true,
      // categoryIds: categoryIds,
      facility_id: facilityId,
    );
    print('Permit Issuer List:$permitIssuerList');
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
    final _permitApproverList = await viewPermitPresenter.getPermitApproverList(
      isLoading: true,
      // categoryIds: categoryIds,
      facility_id: facilityId,
    );
    print('Permit Approver List:$permitApproverList');
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
    final _jobTypeList = await viewPermitPresenter.getJobTypePermitList(
      isLoading: true,
      // categoryIds: cPategoryIds,
      facility_id: facilityId,
    );
    print('Job Type List:${jobTypeList}');
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
    final _sopPermitList = await viewPermitPresenter.getSopPermitList(
      isLoading: true,
      // categoryIds: categoryIds,
      job_type_id: selectedJobTYpesId,
      // job_type_id: 36,
    );

    print('SOP Permit List: $_sopPermitList');

    for (var sopPermitListData in _sopPermitList) {
      sopPermitList.add(sopPermitListData);
      jsaData = sopPermitListData.jsa_file_path ?? "";
      sopData = sopPermitListData.sop_file_path ?? "";
    }

    update(['sop_permit_list']);
  }

  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {
      case const (RxList<FacilityModel>):
        {
          if (value != "Please Select") {
            int facilityIndex =
                facilityList.indexWhere((x) => x?.name == value);
            selectedFacilityId = facilityList[facilityIndex]?.id ?? 0;
            print('FacilityId:$selectedFacilityId');
            _facilityId.add(facilityList[facilityIndex]?.id ?? 0);

            if (selectedFacilityId != 0) {
              isFacilitySelected.value = true;
            }
            selectedFacility.value = value;
            getBlocksList(selectedFacilityId!);
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
          getInventoryCategoryList(facilityId: selectedBlockId.toString());
        }
        break;
      case const (RxList<EquipmentModel>):
        {
          int equipmentIndex =
              equipmentList.indexWhere((x) => x?.name == value);
          int selectedEquipmentId = equipmentList[equipmentIndex]?.id ?? 0;
          print('euipment data5:$selectedEquipmentId');
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
            selectedInventoryCategoryId =
                equipmentCategoryList[equipCatIndex]?.id ?? 0;
            // print('First Category Id:$selectedInventoryCategoryId');
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
      case const (RxList<EmployeeListModel>):
        {
          int permitIssuerListIndex =
              permitIssuerList.indexWhere((x) => x!.name == value);
          selectedPermitIssuerTypeId =
              permitIssuerList[permitIssuerListIndex]!.id ?? 0;
          print('PermitIssuerId:$selectedPermitIssuerTypeId');
        }
        break;
      case const (RxList<EmployeeListModel2>):
        {
          int permitApproverListIndex =
              permitApproverList.indexWhere((x) => x!.name == value);
          selectedPermitApproverTypeId =
              permitApproverList[permitApproverListIndex]!.id ?? 0;
          print('PermitApproverId:$selectedPermitApproverTypeId');
        }
        break;
      case const (RxList<JobTypeListModel>):
        {
          int jobTypeListIndex = jobTypeList.indexWhere((x) => x.name == value);
          selectedJobTYpesId = jobTypeList[jobTypeListIndex].id ?? 0;
          print('JobtypeId:$selectedJobTYpesId');
          getSopPermitList();

          //}
        }
        break;
      case const (RxList<SOPListModel>):
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
      Routes.createPermit,
    );
  }

  void goToNewPermitScreen() {
    Get.toNamed(Routes.createPermit);
  }

  Future<void> viewJobDetails(int? _jobId) async {
    Get.offNamed('${Routes.jobDetails}/$_jobId');
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
    // page.graphics.drawRectangle(
    //     bounds: Rect.fromLTWH(0, 0, pageSize.width, pageSize.height),
    //     pen: PdfPen(PdfColor(142, 170, 219)));
    //Generate PDF grid.
    //  final PdfGrid grid = getGrid();
    var url = "assets/assets/files/logo.png";
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
    final List<int> bytes = await document.save();
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

    //Draw the image

    // page.graphics.drawImage(
    //     PdfBitmap(image),
    //     Rect.fromLTWH(20, 10, 50, 50));

    page.graphics.drawString(
        'WORK PERMIT TYPE ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(180, 20, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    //Draw Rectangle to highlight margin

    page.graphics.drawString(
        'PTW No: ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(370, 20, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString('${viewPermitDetailsModel.value?.sitePermitNo}',
        PdfStandardFont(PdfFontFamily.helvetica, 10),
        bounds: Rect.fromLTWH(430, 20, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    ///HSE LOTO
    page.graphics.drawString(
        'Hero Future Energies Private limited ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(150, 40, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    //Draw Rectangle to highlight margin

    page.graphics.drawString(
        'LOTO No: ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(370, 40, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString(
        '${listLoto!.map((element) => element!.loto_lock_number)}',
        PdfStandardFont(PdfFontFamily.helvetica, 10),
        bounds: Rect.fromLTWH(430, 40, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    page.graphics.drawString(
        '*SOP ID* ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(200, 60, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    page.graphics.drawString(
        'Valid only when signed by an authorised issuer, delegated by management. This permit must be issued before specified work is started; It must be cancelled immediately after completion of the work or at the end of the shift as agreed by parties identified on this permit. File cancelled permits in chronological order in a folder, which will be stored cloud.',
        PdfStandardFont(PdfFontFamily.helvetica, 10),
        brush: PdfBrushes.black,
        bounds: Rect.fromLTWH(25, 70, pageSize.width - 50, 90),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    page.graphics.drawString(
        'Issued to: ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(25, 150, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString('${viewPermitDetailsModel.value?.issuedByName}',
        PdfStandardFont(PdfFontFamily.helvetica, 10),
        bounds: Rect.fromLTWH(75, 150, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    //Draw Rectangle to highlight margin
    // page.graphics.drawRectangle(
    //     pen: PdfPen(PdfColor(142, 170, 219)),
    //     bounds: Rect.fromLTWH(270, 140, pageSize.width - 290, 25));
    page.graphics.drawString(
        'Softel Technologies', PdfStandardFont(PdfFontFamily.helvetica, 10),
        bounds: Rect.fromLTWH(170, 150, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    page.graphics.drawString(
        'Software Developer', PdfStandardFont(PdfFontFamily.helvetica, 10),
        bounds: Rect.fromLTWH(330, 150, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    //Name
    page.graphics.drawString(
        'Name', PdfStandardFont(PdfFontFamily.helvetica, 10),
        bounds: Rect.fromLTWH(75, 160, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    page.graphics.drawString(
        'Company/Contractor', PdfStandardFont(PdfFontFamily.helvetica, 10),
        bounds: Rect.fromLTWH(170, 160, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    page.graphics.drawString(
        'Designation', PdfStandardFont(PdfFontFamily.helvetica, 10),
        bounds: Rect.fromLTWH(330, 160, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    ///For work in
    page.graphics.drawString(
        'For work in: ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(25, 190, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString(
        'Sujit', PdfStandardFont(PdfFontFamily.helvetica, 10),
        bounds: Rect.fromLTWH(85, 190, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    page.graphics.drawString(
        'Softel Technologies', PdfStandardFont(PdfFontFamily.helvetica, 10),
        bounds: Rect.fromLTWH(250, 190, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

//Name
    page.graphics.drawString(
        'Equipment / Location', PdfStandardFont(PdfFontFamily.helvetica, 10),
        bounds: Rect.fromLTWH(85, 200, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    page.graphics.drawString(
        'Area', PdfStandardFont(PdfFontFamily.helvetica, 10),
        bounds: Rect.fromLTWH(250, 200, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    //Start & End Date
    ///For work in
    page.graphics.drawString(
        'Start at: ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(25, 220, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString('${startDateTimeCtrlr.text}',
        PdfStandardFont(PdfFontFamily.helvetica, 10),
        bounds: Rect.fromLTWH(85, 220, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    page.graphics.drawString(
        'Expires at:', PdfStandardFont(PdfFontFamily.helvetica, 10),
        bounds: Rect.fromLTWH(250, 220, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

//Name
    page.graphics.drawString('${validTillTimeCtrlr.text}',
        PdfStandardFont(PdfFontFamily.helvetica, 10),
        bounds: Rect.fromLTWH(310, 220, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    ///Work description
    page.graphics.drawString(
        'Description of work to be done: ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(25, 250, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString('${viewPermitDetailsModel.value?.description}',
        PdfStandardFont(PdfFontFamily.helvetica, 10),
        bounds: Rect.fromLTWH(180, 250, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    page.graphics.drawString(
        '''This certifies that I have personally completed a safety inspection of the area where this work is to be done, as well as the surrounding area, with specific attention to the type of work checked below. I HAVE reviewed the minimum precautions and have indicated on the reverse side of this permit all necessary precautions taken to protect the personal engaged in this work from accident and injury. I HAVE made sure that the assigned personnel know the applicable safety rules and that the know what to do in an EMERGENCY.
''', PdfStandardFont(PdfFontFamily.helvetica, 10),
        brush: PdfBrushes.black,
        bounds: Rect.fromLTWH(25, 255, pageSize.width - 50, 90),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    //Permit Issuer name
    page.graphics.drawString(
        'Permit issuer name:  ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(25, 350, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString('${viewPermitDetailsModel.value?.issuedByName}',
        PdfStandardFont(PdfFontFamily.helvetica, 10),
        bounds: Rect.fromLTWH(125, 350, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    //Pre Job
    page.graphics.drawString(
        'HELD PRE-JOB DISCUSSION ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(25, 370, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString('${viewPermitDetailsModel.value?.tbT_Done_By}',
        PdfStandardFont(PdfFontFamily.helvetica, 10),
        bounds: Rect.fromLTWH(200, 370, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    page.graphics.drawString('${viewPermitDetailsModel.value?.tbT_Done_At}',
        PdfStandardFont(PdfFontFamily.helvetica, 10),
        bounds: Rect.fromLTWH(320, 370, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

//Name
    page.graphics.drawString(
        'Signed at Job site by ', PdfStandardFont(PdfFontFamily.helvetica, 10),
        bounds: Rect.fromLTWH(200, 380, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    page.graphics.drawString(
        'Date & Time', PdfStandardFont(PdfFontFamily.helvetica, 10),
        bounds: Rect.fromLTWH(320, 380, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    ///Responsibility accepted by
    page.graphics.drawString(
        'Responsibility accepted by: ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(25, 395, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    page.graphics.drawString(
        'Engineer: ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(25, 410, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString('${viewPermitDetailsModel.value?.issuedByName}',
        PdfStandardFont(PdfFontFamily.helvetica, 10),
        bounds: Rect.fromLTWH(85, 410, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    /// SOP
    page.graphics.drawString(
        'Date', PdfStandardFont(PdfFontFamily.helvetica, 10),
        bounds: Rect.fromLTWH(250, 410, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

//Name
    page.graphics.drawString('${viewPermitDetailsModel.value?.issue_at}',
        PdfStandardFont(PdfFontFamily.helvetica, 10),
        bounds: Rect.fromLTWH(310, 410, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    ///Supervisor
    page.graphics.drawString(
        'Supervisor: ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(25, 420, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString('${viewPermitDetailsModel.value?.approvedByName}',
        PdfStandardFont(PdfFontFamily.helvetica, 10),
        bounds: Rect.fromLTWH(85, 420, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    page.graphics.drawString(
        'Date', PdfStandardFont(PdfFontFamily.helvetica, 10),
        bounds: Rect.fromLTWH(250, 420, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

//Name
    page.graphics.drawString('${viewPermitDetailsModel.value?.approve_at}',
        PdfStandardFont(PdfFontFamily.helvetica, 10),
        bounds: Rect.fromLTWH(310, 420, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    ///Following permit type
    page.graphics.drawString(
        'The following type of works is covered by this *Work Permit type*: ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(25, 440, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    page.graphics.drawString(
        '''
1.Point wise list will be provided by HFE.
2.Point wise list will be provided by HFE.
3.Point wise list will be provided by HFE.
4.Point wise list will be provided by HFE.
5.Point wise list will be provided by HFE.

''',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(25, 480, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    /// for close condition List
    viewPermitDetailsModel.value?.ptwStatus ==
            PermitStatusConstants.PTW_CLOSED //126
        ? page.graphics.drawString(
            '*Work permit type* Closure',
            PdfStandardFont(
              PdfFontFamily.helvetica,
              10,
            ),
            bounds: Rect.fromLTWH(180, 520, 0, 0),
            format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle))
        : Dimens.box0;

    viewPermitDetailsModel.value?.ptwStatus ==
            PermitStatusConstants.PTW_CLOSED //126
        ? page.graphics.drawString(
            'Work Satisfactorily completed, house keeping is restored to normal.',
            PdfStandardFont(
              PdfFontFamily.helvetica,
              10,
            ),
            bounds: Rect.fromLTWH(30, 530, 0, 0),
            format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle))
        : Dimens.box0;

    ///
    viewPermitDetailsModel.value?.ptwStatus ==
            PermitStatusConstants.PTW_CLOSED //126
        ? page.graphics.drawString(
            '*Work permit type* area and equipment released in proper condition for normal use',
            PdfStandardFont(
              PdfFontFamily.helvetica,
              10,
            ),
            bounds: Rect.fromLTWH(30, 540, 0, 0),
            format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle))
        : Dimens.box0;

    ////
    viewPermitDetailsModel.value?.ptwStatus ==
            PermitStatusConstants.PTW_CLOSED //126
        ? page.graphics.drawString(
            'Work not finished, to be continued with a new work permit issued by another competent person.',
            PdfStandardFont(
              PdfFontFamily.helvetica,
              10,
            ),
            bounds: Rect.fromLTWH(30, 550, 0, 0),
            format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle))
        : Dimens.box0;

    viewPermitDetailsModel.value?.ptwStatus ==
            PermitStatusConstants.PTW_CLOSED //126
        ? page.graphics.drawString(
            'Work Suspended, as present conditions are not conductive for carrying the work safely.',
            PdfStandardFont(
              PdfFontFamily.helvetica,
              10,
            ),
            bounds: Rect.fromLTWH(30, 560, 0, 0),
            format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle))
        : Dimens.box0;
    viewPermitDetailsModel.value?.ptwStatus ==
            PermitStatusConstants.PTW_CLOSED //126
        ? page.graphics.drawString(
            'Closed at job site by: ',
            PdfStandardFont(
              PdfFontFamily.helvetica,
              10,
            ),
            bounds: Rect.fromLTWH(30, 570, 0, 0),
            format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle))
        : Dimens.box0;
    viewPermitDetailsModel.value?.ptwStatus ==
            PermitStatusConstants.PTW_CLOSED //126
        ? page.graphics.drawString(
            '${viewPermitDetailsModel.value?.requestedByName}',
            PdfStandardFont(
              PdfFontFamily.helvetica,
              10,
            ),
            bounds: Rect.fromLTWH(130, 570, 0, 0),
            format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle))
        : Dimens.box0;
    viewPermitDetailsModel.value?.ptwStatus ==
            PermitStatusConstants.PTW_CLOSED //126
        ? page.graphics.drawString(
            'Date & Time: ',
            PdfStandardFont(
              PdfFontFamily.helvetica,
              10,
            ),
            bounds: Rect.fromLTWH(200, 570, 0, 0),
            format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle))
        : Dimens.box0;
    viewPermitDetailsModel.value?.ptwStatus ==
            PermitStatusConstants.PTW_CLOSED //126
        ? page.graphics.drawString(
            '${viewPermitDetailsModel.value?.start_datetime}',
            PdfStandardFont(
              PdfFontFamily.helvetica,
              10,
            ),
            bounds: Rect.fromLTWH(260, 570, 0, 0),
            format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle))
        : Dimens.box0;

    /// for Cancel condition List
    viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_CANCELLED_BY_APPROVER //129
            ||
            viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_CANCEL_REQUESTED //130
        ? page.graphics.drawString(
            '*Work permit type* Cancel',
            PdfStandardFont(
              PdfFontFamily.helvetica,
              10,
            ),
            bounds: Rect.fromLTWH(180, 520, 0, 0),
            format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle))
        : Dimens.box0;

    viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_CANCELLED_BY_APPROVER //129
            ||
            viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_CANCEL_REQUESTED //130
        ? page.graphics.drawString(
            'Work Satisfactorily completed, house keeping is restored to normal.',
            PdfStandardFont(
              PdfFontFamily.helvetica,
              10,
            ),
            bounds: Rect.fromLTWH(30, 530, 0, 0),
            format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle))
        : Dimens.box0;

    viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_CANCELLED_BY_APPROVER //129
            ||
            viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_CANCEL_REQUESTED //130
        ? page.graphics.drawString(
            '*Work permit type* area and equipment released in proper condition for normal use',
            PdfStandardFont(
              PdfFontFamily.helvetica,
              10,
            ),
            bounds: Rect.fromLTWH(30, 540, 0, 0),
            format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle))
        : Dimens.box0;

    viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_CANCELLED_BY_APPROVER //129
            ||
            viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_CANCEL_REQUESTED //130
        ? page.graphics.drawString(
            'Work not finished, to be continued with a new work permit issued by another competent person.',
            PdfStandardFont(
              PdfFontFamily.helvetica,
              10,
            ),
            bounds: Rect.fromLTWH(30, 550, 0, 0),
            format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle))
        : Dimens.box0;

    viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_CANCELLED_BY_APPROVER //129
            ||
            viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_CANCEL_REQUESTED //130
        ? page.graphics.drawString(
            'Work Suspended, as present conditions are not conductive for carrying the work safely.',
            PdfStandardFont(
              PdfFontFamily.helvetica,
              10,
            ),
            bounds: Rect.fromLTWH(30, 560, 0, 0),
            format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle))
        : Dimens.box0;
    viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_CANCELLED_BY_APPROVER //129
            ||
            viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_CANCEL_REQUESTED //130
        ? page.graphics.drawString(
            'Cancel at job site by: ',
            PdfStandardFont(
              PdfFontFamily.helvetica,
              10,
            ),
            bounds: Rect.fromLTWH(30, 570, 0, 0),
            format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle))
        : Dimens.box0;
    viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_CANCELLED_BY_APPROVER //129
            ||
            viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_CANCEL_REQUESTED //130
        ? page.graphics.drawString(
            '${viewPermitDetailsModel.value?.requestedByName}',
            PdfStandardFont(
              PdfFontFamily.helvetica,
              10,
            ),
            bounds: Rect.fromLTWH(130, 570, 0, 0),
            format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle))
        : Dimens.box0;
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
            bounds: Rect.fromLTWH(200, 570, 0, 0),
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
            PdfStandardFont(
              PdfFontFamily.helvetica,
              10,
            ),
            bounds: Rect.fromLTWH(260, 570, 0, 0),
            format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle))
        : Dimens.box0;

    ///For Extend condition list

    viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_EXTEND_REQUESTED //133
            ||
            viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_EXTEND_REQUEST_APPROVE //135
        ? page.graphics.drawString(
            '*Work permit type* Extend',
            PdfStandardFont(
              PdfFontFamily.helvetica,
              10,
            ),
            bounds: Rect.fromLTWH(180, 520, 0, 0),
            format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle))
        : Dimens.box0;

    ///

    viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_EXTEND_REQUESTED //133
            ||
            viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_EXTEND_REQUEST_APPROVE //135
        ? page.graphics.drawString(
            'Work Satisfactorily completed, house keeping is restored to normal.',
            PdfStandardFont(
              PdfFontFamily.helvetica,
              10,
            ),
            bounds: Rect.fromLTWH(30, 530, 0, 0),
            format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle))
        : Dimens.box0;

    viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_EXTEND_REQUESTED //133
            ||
            viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_EXTEND_REQUEST_APPROVE //135
        ? page.graphics.drawString(
            '*Work permit type* area and equipment released in proper condition for normal use',
            PdfStandardFont(
              PdfFontFamily.helvetica,
              10,
            ),
            bounds: Rect.fromLTWH(30, 540, 0, 0),
            format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle))
        : Dimens.box0;

    viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_EXTEND_REQUESTED //133
            ||
            viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_EXTEND_REQUEST_APPROVE //135
        ? page.graphics.drawString(
            'Work not finished, to be continued with a new work permit issued by another competent person.',
            PdfStandardFont(
              PdfFontFamily.helvetica,
              10,
            ),
            bounds: Rect.fromLTWH(30, 550, 0, 0),
            format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle))
        : Dimens.box0;

    viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_EXTEND_REQUESTED //133
            ||
            viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_EXTEND_REQUEST_APPROVE //135
        ? page.graphics.drawString(
            'Work Suspended, as present conditions are not conductive for carrying the work safely.',
            PdfStandardFont(
              PdfFontFamily.helvetica,
              10,
            ),
            bounds: Rect.fromLTWH(30, 560, 0, 0),
            format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle))
        : Dimens.box0;
    viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_EXTEND_REQUESTED //133
            ||
            viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_EXTEND_REQUEST_APPROVE //135
        ? page.graphics.drawString(
            'Extend at job site by: ',
            PdfStandardFont(
              PdfFontFamily.helvetica,
              10,
            ),
            bounds: Rect.fromLTWH(30, 570, 0, 0),
            format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle))
        : Dimens.box0;
    viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_EXTEND_REQUESTED //133
            ||
            viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_EXTEND_REQUEST_APPROVE //135
        ? page.graphics.drawString(
            '${viewPermitDetailsModel.value?.requestedByName}',
            PdfStandardFont(
              PdfFontFamily.helvetica,
              10,
            ),
            bounds: Rect.fromLTWH(130, 570, 0, 0),
            format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle))
        : Dimens.box0;
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
            bounds: Rect.fromLTWH(200, 570, 0, 0),
            format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle))
        : Dimens.box0;
    viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_EXTEND_REQUESTED //133
            ||
            viewPermitDetailsModel.value?.ptwStatus ==
                PermitStatusConstants.PTW_EXTEND_REQUEST_APPROVE //135
        ? page.graphics.drawString(
            '${viewPermitDetailsModel.value?.start_datetime}',
            PdfStandardFont(
              PdfFontFamily.helvetica,
              10,
            ),
            bounds: Rect.fromLTWH(260, 570, 0, 0),
            format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle))
        : Dimens.box0;

    ///ToolBox Talk
    page.graphics.drawString(
        'Toolbox Talk Register',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(180, 600, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    page.graphics.drawString(
        '*SOP ID* ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(200, 610, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    page.graphics.drawString(
        'Site / Project name:  ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(25, 620, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString(
        'CMMS_UI', PdfStandardFont(PdfFontFamily.helvetica, 10),
        bounds: Rect.fromLTWH(120, 620, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    page.graphics.drawString(
        'Date & Time  ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(25, 633, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString('${viewPermitDetailsModel.value?.tbT_Done_At}',
        PdfStandardFont(PdfFontFamily.helvetica, 10),
        bounds: Rect.fromLTWH(120, 633, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    page.graphics.drawString(
        'PTW no.:',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(230, 633, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString('${viewPermitDetailsModel.value?.sitePermitNo}',
        PdfStandardFont(PdfFontFamily.helvetica, 10),
        bounds: Rect.fromLTWH(280, 633, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    page.graphics.drawString(
        'Topic:',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(25, 643, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString('', PdfStandardFont(PdfFontFamily.helvetica, 10),
        bounds: Rect.fromLTWH(120, 643, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    page.graphics.drawString(
        'Conducted by:',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(25, 653, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString('${viewPermitDetailsModel.value?.tbT_Done_By}',
        PdfStandardFont(PdfFontFamily.helvetica, 10),
        bounds: Rect.fromLTWH(120, 653, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    page.graphics.drawString(
        'Total no. of participants:',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(25, 665, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString('', PdfStandardFont(PdfFontFamily.helvetica, 10),
        bounds: Rect.fromLTWH(150, 665, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    page.graphics.drawString(
        'Duration of training:',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(230, 665, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString('', PdfStandardFont(PdfFontFamily.helvetica, 10),
        bounds: Rect.fromLTWH(330, 665, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    ///Table
    page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(142, 180, 219)),
        bounds: Rect.fromLTWH(25, 673, pageSize.width - 400, 15));
    page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(142, 180, 219)),
        bounds: Rect.fromLTWH(140, 673, pageSize.width - 400, 15));
    page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(142, 180, 219)),
        bounds: Rect.fromLTWH(255, 673, pageSize.width - 400, 15));
    page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(142, 180, 219)),
        bounds: Rect.fromLTWH(370, 673, pageSize.width - 400, 15));
    //
    page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(142, 180, 219)),
        bounds: Rect.fromLTWH(25, 688, pageSize.width - 400, 15));
    page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(142, 180, 219)),
        bounds: Rect.fromLTWH(140, 688, pageSize.width - 400, 15));
    page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(142, 180, 219)),
        bounds: Rect.fromLTWH(255, 688, pageSize.width - 400, 15));
    page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(142, 180, 219)),
        bounds: Rect.fromLTWH(370, 688, pageSize.width - 400, 15));
    //
    page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(142, 180, 219)),
        bounds: Rect.fromLTWH(25, 703, pageSize.width - 400, 15));
    page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(142, 180, 219)),
        bounds: Rect.fromLTWH(140, 703, pageSize.width - 400, 15));
    page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(142, 180, 219)),
        bounds: Rect.fromLTWH(255, 703, pageSize.width - 400, 15));
    page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(142, 180, 219)),
        bounds: Rect.fromLTWH(370, 703, pageSize.width - 400, 15));
    page.graphics.drawString(
        'S.No. ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(30, 680, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    page.graphics.drawString(
        'Name ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(150, 680, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString(
        'Designation ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(265, 680, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString(
        'Number ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(380, 680, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
    final PdfFont contentFont = PdfStandardFont(PdfFontFamily.helvetica, 9);
    //Draw string

    final String invoiceNumber = 'Signature of trainer';
    final Size contentSize = contentFont.measureString(invoiceNumber);
    // ignore: leading_newlines_in_multiline_strings

    return PdfTextElement(text: invoiceNumber, font: contentFont).draw(
        page: page,
        bounds: Rect.fromLTWH(400, 740,
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

  Future<void> editNewPermit({int? permitId, bool? isChecked}) async {
    clearStoreData();
    clearTypeStoreData();
    clearisCheckedtoreData();
    clearjobmodelValue();
    clearpmTaskValue();
    Get.toNamed(Routes.createPermit, arguments: {
      'permitId': permitId,
      'isChecked': isChecked,
      "jobModel": jobDetailsModel.value,
      "pmTaskModel": pmtaskViewModel.value,
      "mcModel": mcExecutionDetailsModel.value,
      "scheduleID": 0,
      "type": type.value,
    });
    print('PermitIdArgument:$permitId');
  }

  void clearStoreData() {
    viewPermitPresenter.clearValue();
  }

  void clearTypeStoreData() {
    viewPermitPresenter.clearTypeValue();
  }

  void clearisCheckedtoreData() {
    viewPermitPresenter.clearisCheckedValue();
  }

  void clearjobmodelValue() {
    viewPermitPresenter.clearjobmodelValue();
  }

  void clearpmTaskValue() {
    viewPermitPresenter.clearpmTaskValue();
  }

  void clearStoreDataPMtaskId() {
    viewPermitPresenter.clearStoreDataPMtaskId();
  }

  bool checkComment() {
    if (approveCommentTextFieldCtrlr.text == "") {
      iscommentTextInvalid.value = true;
      return true;
    }

    return false;
  }
}
