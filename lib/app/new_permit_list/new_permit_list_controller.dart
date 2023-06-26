import 'dart:async';

import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/widgets/permit_approve_message_dialog.dart';
import 'package:cmms/app/widgets/permit_issue_message_dialog.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/job_model.dart';
import 'package:cmms/domain/models/new_permit_list_model.dart';
import 'package:cmms/app/new_permit_list/new_permit_list_presenter.dart';
import 'package:cmms/domain/models/permit_issue_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rxdart/subjects.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

import '../../../domain/models/block_model.dart';
// import '../navigators/app_pages.dart';
// import 'job_list_presenter.dart';

class NewPermitListController extends GetxController {
  ///
  NewPermitListController(
    this.newPermitListPresenter,
  );
  NewPermitListPresenter newPermitListPresenter;

  final HomeController controller = Get.find();

  ///
  // var newPermitLists = <NewPermitListModel>[];

  RxList<NewPermitModel?>? newPermitList = <NewPermitModel?>[].obs;
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
  TextEditingController extendReasonCommentTextFieldCtrlr = TextEditingController();
  TextEditingController timeTextFieldCtrlr = TextEditingController();

  int userId = varUserAccessModel.value.user_id ?? 0;

  ///Buttons Cancel, Close Reject
  TextEditingController cancelCommentTextFieldCtrlr = TextEditingController();
  TextEditingController closeCommentTextFieldCtrlr = TextEditingController();
  TextEditingController rejectCommentTextFieldCtrlr = TextEditingController();

  TextEditingController cancelCommentByApproverTextFieldCtrlr = TextEditingController();
  TextEditingController cancelCommentRequestTextFieldCtrlr = TextEditingController();




  

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
        getNewPermitList(facilityId, userId);
      });
    });

    Future.delayed(Duration(seconds: 1), () {
      getFacilityList(isLoading: true);

      // Future.delayed(Duration(milliseconds: 500), () {
      //   getPermitIssueButton();
      // });
    });

    super.onInit();
  }

  void switchFacility(String? facilityName) {
    facilityId =
        facilityList.indexWhere((facility) => facility?.name == facilityName);
    getNewPermitList(facilityId, userId);
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

  Future<void> getNewPermitList(int facilityId, int userId) async {
    newPermitList!.value = <NewPermitModel>[];
    final _newPermitList = await newPermitListPresenter.getNewPermitList(
        facilityId: facilityId,
        // facilityId: 45,
        // userId: userId,
        userId: userId);

    if (_newPermitList != null) {
      newPermitList!.value = _newPermitList;

      if (newPermitList != null && newPermitList!.isNotEmpty) {
        newPermitListModel = newPermitList![0];
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

  Future<void> permitApprovedButton({String? permitId, String? ptwStatus}) async {
    String _approveComment = approveCommentTextFieldCtrlr.text.trim();

    final _permitApprovedBtn =
        await newPermitListPresenter.permitApprovedButton(
      comment: _approveComment,
      id: permitId,
      ptwStatus: ptwStatus
    );
    // showAlertPermitApproveDialog();
    print('Approved Data:${_approveComment}');
    print('Approved Data:${permitId}');
    
  }


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

  Future<void> permitCancelByApproverButton({String? permitId, String? ptwStatus}) async {
    String _cancelComment = cancelCommentByApproverTextFieldCtrlr.text.trim();

    final _permitCancelByApproverBtn =
        await newPermitListPresenter.permitCancelByApproverButton(
      comment: _cancelComment,
      id: permitId,
      ptwStatus: ptwStatus
    );
    // showAlertPermitApproveDialog();
    print('Cancel Button By Approver Data:${_cancelComment}');
    print('Cancel Button By Approver Data:${permitId}');
    
  }

  Future<void> permitExtendButton({String? permitId}) async {
    String _reasonForExtensionComment = extendReasonCommentTextFieldCtrlr.text.trim();
    String _timeForExtensionComment = timeTextFieldCtrlr.text.trim();


    final _permitextendBtn =
        await newPermitListPresenter.permitExtendButton(
      comment: _reasonForExtensionComment,
      Time: _timeForExtensionComment,
      id: permitId,
    );
    // showAlertPermitApproveDialog();
    
    print('Extend Button Data:${_reasonForExtensionComment}');
    print('Extend Button Data:${_timeForExtensionComment}');
    print('Extend Button Data:${permitId}');
    
  }

  Future<void> permitCloseButton({String? permitId}) async {
    String _closeComment = closeCommentTextFieldCtrlr.text.trim();

    final _permitCloseBtn =
        await newPermitListPresenter.permitCloseButton(
      comment: _closeComment,
      id: permitId,
    );
    // showAlertPermitApproveDialog();
    print('Close Button Data:${_closeComment}');
    print('Close Button Data:${permitId}');
    
  }


   Future<void> permitRejectButton({String? permitId}) async {
    String _rejectComment = rejectCommentTextFieldCtrlr.text.trim();

    final _permitRejectBtn =
        await newPermitListPresenter.permitRejectButton(
      comment: _rejectComment,
      id: permitId,
    );
    // showAlertPermitApproveDialog();
    print('Reject Button Data:${_rejectComment}');
    print('Reject Button Data:${permitId}');
    
  }

  Future<void> addNewPermitList({String? permitId}) async {
    Get.toNamed(Routes.newPermit, arguments: permitId);
  }

// {'permitId':permitId}
  Future<void> editNewPermit({int? permitId}) async {
    Get.toNamed(Routes.newPermit, arguments: {'permitId':permitId});
  }


  Future<void> viewNewPermitList({int? permitId}) async {
    Get.toNamed(Routes.viewPermitWebScreen, arguments: permitId);
  }

  void goToJobCardScreen(int? jobId) {
    Get.toNamed(Routes.jobCard, arguments: jobId);
  }

  void showNewPermitListDetails(int _jobId) {
    // Get.toNamed(Routes.jobDetails, arguments: _jobId);
  }

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
