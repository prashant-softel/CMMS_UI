import 'dart:async';

import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/domain/models/end_mc_execution_detail_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/job_details_model.dart';
import 'package:cmms/domain/models/new_permit_list_model.dart';
import 'package:cmms/app/new_permit_list/new_permit_list_presenter.dart';
import 'package:cmms/domain/models/permit_issue_model.dart';
import 'package:cmms/domain/models/pm_task_view_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/subjects.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

import '../../../domain/models/block_model.dart';

class NewPermitListController extends GetxController {
  ///
  NewPermitListController(
    this.newPermitListPresenter,
  );
  NewPermitListPresenter newPermitListPresenter;
  // For sorting
  RxString currentSortColumn = ''.obs;
  RxBool isAscending = true.obs;
  final HomeController controller = Get.find();

  ///
  // var newPermitLists = <NewPermitListModel>[];

  ///Column Visibility
  final columnVisibility = ValueNotifier<Map<String, bool>>({
    "Permit Id": true,
    "Title": true,
    "Permit Type Name": true,
    "Equipment Category": true,
    "Working Area": true,
    "Requested By": true,
    "Approved By": true,
    // "Status": true,
    // "Status code": true,

    // "search": true,
  });
  final Map<String, double> columnwidth = {
    "Permit Id": 153,
    "Title": 150,
    "Permit Type Name": 200,
    "Equipment Category": 220,
    "Working Area": 173,
    "Requested By": 170,
    "Approved By": 170,
    // "Status": 100,
    // "Status code": 120,
  };
  Map<String, RxString> filterText = {};
  void setColumnVisibility(String columnName, bool isVisible) {
    final newVisibility = Map<String, bool>.from(columnVisibility.value)
      ..[columnName] = isVisible;
    columnVisibility.value = newVisibility;
    print({"updated columnVisibility": columnVisibility});
  }

  ///Checkbox
  RxBool isChecked = false.obs;

  ///Date Range
  bool openFromDateToStartDatePicker = false;
  RxString PermitIdFilterText = ''.obs;
  RxString DescriptionFilterText = ''.obs;
  RxString PermitTypeNameFilterText = ''.obs;
  RxString EquipmentCategoriesFilterText = ''.obs;
  RxString WorkingAreaNameFilterText = ''.obs;
  RxString RequestByNameFilterText = ''.obs;
  RxString ApprovedByNameFilterText = ''.obs;
  RxString CurrentStatusShortFilterText = ''.obs;
  // RxString PtwStatusFilterText = ''.obs;
  Rx<PmtaskViewModel?> pmtaskViewModel = PmtaskViewModel().obs;
  Rx<JobDetailsModel?> jobDetailsModel = JobDetailsModel().obs;
  Rx<EndMCExecutionDetailsModel?> mcExecutionDetailsModel =
      EndMCExecutionDetailsModel().obs;
  RxString ActionFilterText = ''.obs;

  Rx<DateTime> fromDate = DateTime.now().subtract(Duration(days: 7)).obs;
  Rx<DateTime> toDate = DateTime.now().obs;
  String get formattedFromdate =>
      DateFormat('yyyy-MM-dd').format(fromDate.value);
  String get formattedTodate => DateFormat('yyyy-MM-dd').format(toDate.value);
  String get formattedTodate1 => DateFormat('yyyy-MM-dd').format(toDate.value);
  String get formattedFromdate1 =>
      DateFormat('yyyy-MM-dd').format(fromDate.value);
  Rx<int> misPermit = 0.obs;
  RxList<NewPermitModel?> newPermitList = <NewPermitModel?>[].obs;
  RxList<NewPermitModel?> filteredData = <NewPermitModel>[].obs;

  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  RxList<BlockModel?> blockList = <BlockModel>[].obs;
  Rx<String> selectedFacility = ''.obs;
  Rx<bool> isFacilitySelected = false.obs;
  int facilityId = 0;
  // int userId = 33;
  Rx<int> permitId = 0.obs;
  var breakdownTime;
  Rx<DateTime> startDate = DateTime.now().obs;
  Rx<DateTime> endDate = DateTime.now().obs;
  // NewPermitModel? newPermitListModel;
  PermitIssueModel? permitIssueModel;
  RxList<String> newPermitListTableColumns = <String>[].obs;
  PaginationController newPermitPaginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  TextEditingController commentTextFieldCtrlr = TextEditingController();
  TextEditingController approveCommentTextFieldCtrlr = TextEditingController();
  TextEditingController extendReasonCommentTextFieldCtrlr =
      TextEditingController();
  TextEditingController timeTextFieldCtrlr = TextEditingController();

  int userId = varUserAccessModel.value.user_id ?? 0;

  // Add variables to store filter text for each column
  RxString permitIdFilterText = ''.obs;
  RxString descriptionFilterText = ''.obs;
  RxString permitTypeNameFilterText = ''.obs;
  RxString equipment_categoriesFilterText = ''.obs;
  RxString workingAreaNameFilterText = ''.obs;
  RxString requestByNameFilterText = ''.obs;
  RxString approvedByNameFilterText = ''.obs;
  RxString approvedDatetimeFilterText = ''.obs;
  RxString current_status_shortFilterText = ''.obs;

  String formatDate(String? inputDateTime) {
    ///
    String formattedDateTimeString = '';

    if (inputDateTime != null &&
        inputDateTime.isNotEmpty &&
        inputDateTime != "null")
    // Parse the input DateTime string
    {
      DateFormat inputFormat = DateFormat("yyyy-MM-dd hh:mm:ss.SSS");
      DateTime parsedDateTime = inputFormat.parse(inputDateTime);

      // Format the parsed DateTime to the desired format
      DateFormat outputFormat = DateFormat("yyyy-MM-dd hh:mm");
      formattedDateTimeString = outputFormat.format(parsedDateTime);
    }

    return formattedDateTimeString;
  }

  ///Buttons Cancel, Close Reject
  TextEditingController cancelCommentTextFieldCtrlr = TextEditingController();
  // TextEditingController closeCommentTextFieldCtrlr = TextEditingController();
  // TextEditingController rejectCommentTextFieldCtrlr = TextEditingController();

  // TextEditingController cancelCommentByApproverTextFieldCtrlr =
  //     TextEditingController();
  // TextEditingController cancelCommentRequestTextFieldCtrlr =
  //     TextEditingController();

  StreamSubscription<int>? facilityIdStreamSubscription;
  BehaviorSubject<int> _facilityId = BehaviorSubject.seeded(0);
  Stream<int> get facilityId$ => _facilityId.stream;
  int get facilityId1 => _facilityId.value;

  ///
  Rx<bool> isLoading = true.obs;
  @override
  void onInit() async {
    setId();
    this.filterText = {
      "Permit Id": PermitIdFilterText,
      "Title": DescriptionFilterText,
      "Permit Type Name": PermitTypeNameFilterText,
      "Equipment Category": EquipmentCategoriesFilterText,
      "Working Area": WorkingAreaNameFilterText,
      "Requested By": RequestByNameFilterText,
      "Approved By": ApprovedByNameFilterText,
      // "Status": CurrentStatusShortFilterText,
      // "Status code": PtwStatusFilterText,
    };
    //homePresenter.generateToken();
    facilityIdStreamSubscription = controller.facilityId$.listen((event) {
      facilityId = event;
      if (facilityId > 0) {
        Future.delayed(Duration(seconds: 1), () {
          getNewPermitList(facilityId, userId, formattedFromdate,
              formattedTodate, false, false, false);
        });
      }
    });

    // Future.delayed(Duration(seconds: 1), () {
    //   getFacilityList(isLoading: true);
    // });

    super.onInit();
  }

  void setId() async {
    {
      var dataFromPrevioursScreen = Get.arguments;
      misPermit.value = dataFromPrevioursScreen['misPermit'];
    }
  }

  void switchFacility(String? facilityName) {
    facilityId =
        facilityList.indexWhere((facility) => facility?.name == facilityName);
    // getNewPermitList(facilityId, userId,formattedTodate, formattedFromdate, false, false);
  }

  Future<void> getFacilityList({bool? isLoading}) async {
    facilityList.value = <FacilityModel>[];
    List<FacilityModel?>? _facilityList = <FacilityModel?>[];

    _facilityList = await newPermitListPresenter.getFacilityList();
    if (_facilityList != null && _facilityList.isNotEmpty) {
      facilityList.value = _facilityList;
    }
    if (facilityList.isNotEmpty) {
      selectedFacility.value = facilityList[0]?.name ?? '';
    }
  }

  void search(String keyword) {
    if (keyword.isEmpty) {
      newPermitList.value = filteredData;
      return;
    }

    List<NewPermitModel?> filteredList = filteredData
        .where((item) =>
            (item?.permitId?.toString().toLowerCase().contains(keyword.toLowerCase()) ?? false) ||
            (item?.permitTypeName
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.equipment_categories
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.workingAreaName
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.requestByName?.toString().toLowerCase().contains(keyword.toLowerCase()) ??
                false) ||
            (item?.approvedByName
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.description?.toString().toLowerCase().contains(keyword.toLowerCase()) ??
                false) ||
            (item?.current_status_short
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.requestDatetime?.toString().toLowerCase().contains(keyword.toLowerCase()) ?? false))
        .toList();

    newPermitList.value = filteredList;

    // newPermitList.value = filteredData
    //     .where((item) =>
    //         item!.description!.toLowerCase().contains(keyword.toLowerCase()))
    //     .toList();
    // update(['permit_list']);
  }

  void export() {
    getNewPermitList(facilityId, userId, formattedFromdate, formattedTodate,
        false, false, true,
        isExportOnly: true);
  }

  Future<void> getNewPermitList(int facilityId, int userId, dynamic startDate,
      dynamic endDate, bool self_view, bool non_expired, bool isExport,
      {bool isExportOnly = false}) async {
    if (!isExportOnly) {
      newPermitList.value = <NewPermitModel>[];
    }

    bool selfview = varUserAccessModel.value.access_list!
            .where((e) =>
                e.feature_id == UserAccessConstants.kPermitFeatureId &&
                e.selfView == UserAccessConstants.kHaveSelfViewAccess)
            .length >
        0;

    final _newPermitList = await newPermitListPresenter.getNewPermitList(
        facilityId: facilityId,
        isLoading: isLoading.value,
        start_date: startDate,
        end_date: endDate,
        userId: userId,
        isExport: isExport,
        self_view: selfview,
        non_expired: false);

    if (_newPermitList != null && !isExportOnly) {
      newPermitList.value = _newPermitList;
      filteredData.value = newPermitList.value;
      isLoading.value = false;

      if (newPermitList.isNotEmpty) {
        NewPermitModel? newPermitListModel = newPermitList[0];
        newPermitListModel = filteredData[0];
        var newPermitListJson = newPermitListModel?.toJson();
        newPermitListTableColumns.value = <String>[];
        for (var key in newPermitListJson?.keys.toList() ?? []) {
          newPermitListTableColumns.add(key);
        }
      }

      newPermitPaginationController = PaginationController(
        rowCount: newPermitList.length,
        rowsPerPage: 10,
      );
    }

    update(['permit_list']);
  }

  Future<void> permitIssueButton({String? permitId}) async {
    String _comment = commentTextFieldCtrlr.text.trim();

    final _permitIssueBtn = await newPermitListPresenter.permitIssueButton(
      comment: _comment,
      id: permitId,
    );
    // showAlertPermitIssueDialog();
    print('Issue Data1:${_comment}');
    print('Issue Data:${permitId}');
  }

  // Future<void> permitApprovedButton(
  //     {String? permitId, String? ptwStatus}) async {
  //   String _approveComment = approveCommentTextFieldCtrlr.text.trim();

  //   final _permitApprovedBtn =
  //       await newPermitListPresenter.permitApprovedButton(
  //           comment: _approveComment, id: permitId, ptwStatus: ptwStatus);
  //   // showAlertPermitApproveDialog();
  //   print('Approved Data:${_approveComment}');
  //   print('Approved Data:${permitId}');
  // }

  Future<void> permitCancelByIssuerButton({String? permitId}) async {
    String _cancelComment = cancelCommentTextFieldCtrlr.text.trim();

    final _permitCancelByIssuerBtn =
        await newPermitListPresenter.permitCancelByIssuerButton(
      comment: _cancelComment,
      id: permitId,
    );
    // showAlertPermitApproveDialog();
    print('Cancel Button Data:${_cancelComment}');
    print('Cancel Button Data:${permitId}');
  }

  Future<void> addNewPermitList({String? permitId}) async {
    clearStoreData();
    clearTypeStoreData();
    clearisCheckedtoreData();
    clearjobmodelValue();
    clearpmTaskValue();
    Get.toNamed(Routes.createPermit, arguments: {
      'permitId': permitId,
      'isChecked': false,
      "jobModel": jobDetailsModel.value,
      "pmTaskModel": pmtaskViewModel.value,
      "mcModel": mcExecutionDetailsModel.value,
      "scheduleID": 0
    });
  }

// {'permitId':permitId}
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
      "scheduleID": 0
    });
    print('PermitIDForTBt:$permitId');
    print('PermitIdArgument:$isChecked');
  }

  Future<void> viewNewPermitList({int? permitId}) async {
    clearStoreData();
    clearTypeStoreData();
    clearisCheckedtoreData();
    Get.toNamed(Routes.viewPermitScreen, arguments: {
      "permitId": permitId,
      "type": 0,
    });
  }

  Future<void> viewMisPermitList({int? permitId}) async {
    clearStoreData();
    clearTypeStoreData();
    clearisCheckedtoreData();
    Get.toNamed(Routes.viewPermitScreen, arguments: {
      "permitId": permitId,
      "type": 0,
      'hseMis': 1,
    });
  }

  Future<void> cancelPermitList({int? permitId}) async {
    clearStoreData();
    clearTypeStoreData();
    clearisCheckedtoreData();
    Get.toNamed(Routes.viewPermitScreen,
        arguments: {"permitId": permitId, "type": 0});
  }

  Future<void> extendPermitList({int? permitId}) async {
    clearStoreData();
    clearTypeStoreData();
    clearisCheckedtoreData();
    clearjobmodelValue();
    clearpmTaskValue();
    Get.toNamed(Routes.viewPermitScreen,
        arguments: {"permitId": permitId, "type": 0});
  }

  Future<void> closePermitRequestList({int? permitId}) async {
    clearStoreData();
    clearTypeStoreData();
    clearisCheckedtoreData();
    clearjobmodelValue();
    clearpmTaskValue();
    Get.toNamed(Routes.viewPermitScreen,
        arguments: {"permitId": permitId, "type": 0});
  }

  void goToJobCardScreen(int? jobId) {
    Get.toNamed(Routes.jobCard, arguments: jobId);
  }

  void showNewPermitListDetails(int _jobId) {
    // Get.toNamed(Routes.jobDetails, arguments: _jobId);
  }

  void getNewPermitListByDate() {
    getNewPermitList(facilityId, userId, formattedFromdate1, formattedTodate1,
        false, false, false);
  }

  void clearStoreData() {
    newPermitListPresenter.clearValue();
  }

  void clearTypeStoreData() {
    newPermitListPresenter.clearTypeValue();
  }

  void clearisCheckedtoreData() {
    newPermitListPresenter.clearisCheckedValue();
  }

  void clearjobmodelValue() {
    newPermitListPresenter.clearjobmodelValue();
  }

  void clearpmTaskValue() {
    newPermitListPresenter.clearpmTaskValue();
  }

  bool isOneHour(String validTill) {
    DateTime current = DateTime.now();
    DateTime expiryTime = DateTime.parse(validTill);
    Duration timeDifference = expiryTime.difference(current);

    if (timeDifference.inHours >= 1 && current.isBefore(expiryTime)) {
      return true;
    }
    return false;
  }

  void sortData(String columnName) {
    if (currentSortColumn.value == columnName) {
      isAscending.value = !isAscending.value;
    } else {
      currentSortColumn.value = columnName;
      isAscending.value = true;
    }

    switch (columnName) {
      case 'Permit Id':
        newPermitList.sort((a, b) => isAscending.value
            ? (a?.permitId ?? 0).compareTo(b?.permitId ?? 0)
            : (b?.permitId ?? 0).compareTo(a?.permitId ?? 0));
        break;
      case 'Title':
        newPermitList.sort((a, b) => isAscending.value
                   ? (a?.description ?? '').compareTo(b?.description ?? '')
            : (b?.description ?? '').compareTo(a?.description ?? ''));
        break;
      case 'Permit Type Name':
        newPermitList.sort((a, b) => isAscending.value
                   ? (a?.permitTypeName ?? '').compareTo(b?.permitTypeName ?? '')
            : (b?.permitTypeName ?? '').compareTo(a?.permitTypeName ?? ''));
        break;
      case 'Equipment Category':
        newPermitList.sort((a, b) => isAscending.value
                   ? (a?.equipment_categories ?? '').compareTo(b?.equipment_categories ?? '')
            : (b?.equipment_categories ?? '').compareTo(a?.equipment_categories ?? ''));
        break;
      case 'Working Area':
        newPermitList.sort((a, b) => isAscending.value
                   ? (a?.workingAreaName ?? '').compareTo(b?.workingAreaName ?? '')
            : (b?.workingAreaName ?? '').compareTo(a?.workingAreaName ?? ''));
        break;
      case 'Requested By':
        newPermitList.sort((a, b) => isAscending.value
                   ? (a?.requestByName ?? '').compareTo(b?.requestByName ?? '')
            : (b?.requestByName ?? '').compareTo(a?.requestByName ?? ''));
        break;
      case 'Approved By':
        newPermitList.sort((a, b) => isAscending.value
                   ? (a?.approvedByName ?? '').compareTo(b?.approvedByName ?? '')
            : (b?.approvedByName ?? '').compareTo(a?.approvedByName ?? ''));
        break;
      default:
        break;
    }
    update();
  }
}
