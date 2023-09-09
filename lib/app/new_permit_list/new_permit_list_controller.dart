import 'dart:async';

import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/new_permit_list_model.dart';
import 'package:cmms/app/new_permit_list/new_permit_list_presenter.dart';
import 'package:cmms/domain/models/permit_issue_model.dart';
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

  final HomeController controller = Get.find();

  ///
  // var newPermitLists = <NewPermitListModel>[];

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
  RxString ActionFilterText = ''.obs;

  Rx<DateTime> fromDate = DateTime.now().subtract(Duration(days: 70)).obs;
  Rx<DateTime> toDate = DateTime.now().obs;
  // Rx<DateTime> fromDate = DateTime.now().subtract(Duration(days: 7)).obs;
  String get formattedFromdate =>
      DateFormat('yyyy-MM-dd').format(fromDate.value);
  String get formattedTodate => DateFormat('yyyy-MM-dd').format(toDate.value);

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
  NewPermitModel? newPermitListModel;
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
  TextEditingController closeCommentTextFieldCtrlr = TextEditingController();
  // TextEditingController rejectCommentTextFieldCtrlr = TextEditingController();

  // TextEditingController cancelCommentByApproverTextFieldCtrlr =
  //     TextEditingController();
  TextEditingController cancelCommentRequestTextFieldCtrlr =
      TextEditingController();

  StreamSubscription<int>? facilityIdStreamSubscription;
  BehaviorSubject<int> _facilityId = BehaviorSubject.seeded(0);
  Stream<int> get facilityId$ => _facilityId.stream;
  int get facilityId1 => _facilityId.value;

  ///
  @override
  void onInit() async {
    //homePresenter.generateToken();
    facilityIdStreamSubscription = controller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 1), () {
        getNewPermitList(facilityId, userId, formattedFromdate, formattedTodate,
            true, false, false);
      });
    });

    Future.delayed(Duration(seconds: 1), () {
      getFacilityList(isLoading: true);
    });

    super.onInit();
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
      newPermitList!.value = filteredData;
      return;
    }

    newPermitList!.value = filteredData
        .where((item) =>
            item!.description!.toLowerCase().contains(keyword.toLowerCase()))
        .toList();
    update(['permit_list']);
  }

  Future<void> getNewPermitList(int facilityId, int userId, dynamic startDate,
      dynamic endDate, bool isLoading, bool self_view, bool non_expired) async {
    newPermitList.value = <NewPermitModel>[];
    final _newPermitList = await newPermitListPresenter.getNewPermitList(
        facilityId: facilityId,
        isLoading: isLoading,
        start_date: startDate, //// "2020-01-01",
        end_date: endDate,
        userId: userId,
        self_view: varUserAccessModel.value.access_list!
                    .where((e) =>
                        e.feature_id == UserAccessConstants.kPermitFeatureId &&
                        e.selfView == UserAccessConstants.kHaveSelfViewAccess)
                    .length >
                0
            ? true
            : false,
        non_expired: false);

    if (_newPermitList != null) {
      newPermitList!.value = _newPermitList;
      filteredData.value = newPermitList!.value;
      if (newPermitList != null && newPermitList!.isNotEmpty) {
        // newPermitListModel = newPermitList![0];
        newPermitListModel = filteredData[0];
        var newPermitListJson = newPermitListModel?.toJson();
        newPermitListTableColumns.value = <String>[];
        for (var key in newPermitListJson?.keys.toList() ?? []) {
          newPermitListTableColumns.add(key);
        }
      }
    }
    newPermitPaginationController = PaginationController(
      rowCount: newPermitList!.length,
      rowsPerPage: 10,
    );

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

  Future<void> permitCancelRequestButton({String? permitId}) async {
    String _cancelComment = cancelCommentRequestTextFieldCtrlr.text.trim();

    final _permitCancelRequestBtn =
        await newPermitListPresenter.permitCancelRequestButton(
      comment: _cancelComment,
      id: permitId,
    );
    // showAlertPermitApproveDialog();
    print('Cancel Request Button Data:${_cancelComment}');
    print('Cancel Request Button Data:${permitId}');
  }

  // Future<void> permitCancelByApproverButton(
  //     {String? permitId, String? ptwStatus}) async {
  //   String _cancelComment = cancelCommentByApproverTextFieldCtrlr.text.trim();

  //   final _permitCancelByApproverBtn =
  //       await newPermitListPresenter.permitCancelByApproverButton(
  //           comment: _cancelComment, id: permitId, ptwStatus: ptwStatus);
  //   // showAlertPermitApproveDialog();
  //   print('Cancel Button By Approver Data:${_cancelComment}');
  //   print('Cancel Button By Approver Data:${permitId}');
  // }

  Future<void> permitExtendButton({String? permitId}) async {
    String _reasonForExtensionComment =
        extendReasonCommentTextFieldCtrlr.text.trim();
    String _timeForExtensionComment = timeTextFieldCtrlr.text.trim();

    final _permitextendBtn = await newPermitListPresenter.permitExtendButton(
      comment: _reasonForExtensionComment,
      Time: _timeForExtensionComment,
      id: permitId,
    );
    // showAlertPermitApproveDialog();

    // print('Extend Button Data:${_reasonForExtensionComment}');
    // print('Extend Button Data:${_timeForExtensionComment}');
    // print('Extend Button Data:${permitId}');
  }

  Future<void> permitCloseButton({String? permitId}) async {
    String _closeComment = closeCommentTextFieldCtrlr.text.trim();

    final _permitCloseBtn = await newPermitListPresenter.permitCloseButton(
      comment: _closeComment,
      id: permitId,
    );
    // showAlertPermitApproveDialog();
    print('Close Button Data:${_closeComment}');
    print('Close Button Data:${permitId}');
  }

  // Future<void> permitRejectButton({String? permitId}) async {
  //   String _rejectComment = rejectCommentTextFieldCtrlr.text.trim();

  //   final _permitRejectBtn = await newPermitListPresenter.permitRejectButton(
  //     comment: _rejectComment,
  //     id: permitId,
  //   );
  //   // showAlertPermitApproveDialog();
  //   print('Reject Button Data:${_rejectComment}');
  //   print('Reject Button Data:${permitId}');
  // }

  Future<void> addNewPermitList({String? permitId}) async {
    Get.toNamed(Routes.newPermit, arguments: permitId);
  }

// {'permitId':permitId}
  Future<void> editNewPermit({int? permitId, bool? isChecked}) async {
    Get.toNamed(Routes.newPermit,
        arguments: {'permitId': permitId, 'isChecked': isChecked});
    print('PermitIdArgument:$permitId');
  }

  Future<void> viewNewPermitList({int? permitId}) async {
    Get.toNamed(Routes.viewPermitWebScreen, arguments: {"permitId": permitId});
  }

  void goToJobCardScreen(int? jobId) {
    Get.toNamed(Routes.jobCard, arguments: jobId);
  }

  void showNewPermitListDetails(int _jobId) {
    // Get.toNamed(Routes.jobDetails, arguments: _jobId);
  }

  void getNewPermitListByDate() {
    getNewPermitList(facilityId, userId, formattedFromdate, formattedTodate,
        false, false, false);
  }

  //  Future<void> viewPermit({int? id}) async {
  //   Get.toNamed(Routes.viewPermitWebScreen, arguments: id);
  //   print('Argument$id');
  // }

  //  static void showAlertPermitIssueDialog({
  //   String? comment,
  //   int? employee_id,
  //   int? id,
  //   Function()? onPress,
  // }) async {
  //   await Get.dialog<void>(PermitMessageIssueDialog());
  // }

  // static void showAlertPermitApproveDialog({
  //   String? comment,
  //   int? employee_id,
  //   int? id,
  //   Function()? onPress,
  // }) async {
  //   await Get.dialog<void>(PermitMessageApproveDialog());
  // }

  ///
}
