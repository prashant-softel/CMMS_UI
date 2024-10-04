import 'dart:async';

import 'package:cmms/app/utils/utility.dart';
import 'package:cmms/app/view_audit_plan/view_audit_plan_presenter.dart';
import 'package:cmms/domain/models/audit_plan_detail_model.dart';
import 'package:cmms/domain/models/comment_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../home/home_controller.dart';

class ViewAuditPlanController extends GetxController {
  ///
  ViewAuditPlanController(
    this.viewAuditPlanPresenter,
  );
  ViewAuditPlanPresenter viewAuditPlanPresenter;
  final HomeController homecontroller = Get.find();
  TextEditingController approveCommentTextFieldCtrlr = TextEditingController();
  TextEditingController rejectCommentTextFieldCtrlr = TextEditingController();
  Rx<int> auditId = 0.obs;
  Rx<int> type = 0.obs;
  RxBool iscommentTextInvalid = false.obs;
  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;

  Rx<AuditPlanDetailModel?> auditPlanDetailModel = AuditPlanDetailModel().obs;
  RxList<HistoryModel?>? historyList = <HistoryModel?>[].obs;

  @override
  void onInit() async {
    try {
      await setauditPlanId();
      facilityIdStreamSubscription =
          homecontroller.facilityId$.listen((event) async {
        facilityId = event;
        if (facilityId > 0) {
          if (auditId != 0) {
            await getAuditPlanDetails(
                auditPlanId: auditId.value,
                isloading: true,
                facilityId: facilityId);
            getHistory(facilityId);
          }
        }
      });

      super.onInit();
    } catch (e) {
      print(e);
    }
  }

  Future<void> getHistory(int facilityId) async {
    /// TODO: CHANGE THESE VALUES
    int moduleType = 41;
    //
    historyList?.value = await viewAuditPlanPresenter.getHistory(
          // tempModuleType,
          // tempJobCardId,
          moduleType,
          auditId.value,
          facilityId,
          true,
        ) ??
        [];
    update(["historyList"]);
  }

  Future<void> setauditPlanId() async {
    final String? _auditId = Get.parameters['auditId'];
    final String? _type = Get.parameters['type'];

    auditId.value = int.tryParse(_auditId ?? "") ?? 0;
    type.value = int.tryParse(_type ?? "") ?? 0;

    // try {
    //   final _auditId = await viewAuditPlanPresenter.getValue();
    //   final _type = await viewAuditPlanPresenter.getTypeValue();

    //   if (_auditId == null || _auditId == '' || _auditId == "null") {
    //     var dataFromPreviousScreen = Get.arguments;

    //     auditId.value = dataFromPreviousScreen['auditId'];
    //     type.value = dataFromPreviousScreen['type'];

    //     viewAuditPlanPresenter.saveValue(auditId: auditId.value.toString());
    //     viewAuditPlanPresenter.saveTypeValue(type: type.value.toString());
    //   } else {
    //     auditId.value = int.tryParse(_auditId) ?? 0;
    //     type.value = int.tryParse(_type ?? "") ?? 0;
    //   }
    // } catch (e) {
    //   Utility.showDialog(e.toString(), 'auditId');
    // }
  }

  Future<void> getAuditPlanDetails(
      {int? auditPlanId, bool? isloading, required int facilityId}) async {
    final _auditPlanDetailsModel =
        await viewAuditPlanPresenter.getAuditPlanDetails(
            auditPlanId: auditPlanId,
            isLoading: isloading,
            facilityId: facilityId);

    if (_auditPlanDetailsModel != null) {
      auditPlanDetailModel.value = _auditPlanDetailsModel;
    }
    print({"auditPlandetailss", auditPlanDetailModel.value?.id});
  }

  void auditPlanApprovedButton({int? id}) async {
    String _comment = approveCommentTextFieldCtrlr.text.trim();

    CommentModel commentauditPlanAproveModel =
        CommentModel(id: id, comment: _comment);

    var auditPlanApproveJsonString = commentauditPlanAproveModel.toJson();

    Map<String, dynamic>? response =
        await viewAuditPlanPresenter.auditPlanApprovedButton(
      auditPlanApproveJsonString: auditPlanApproveJsonString,
      isLoading: true,
      type: type.value,
    );
    if (response == true) {
      //getCalibrationList(facilityId, true);
    }
  }

  void auditPlanRejectButton({int? id}) async {
    {
      String _comment = rejectCommentTextFieldCtrlr.text.trim();

      CommentModel commentauditPlanRejectModel =
          CommentModel(id: id, comment: _comment);

      var auditPlanRejectJsonString = commentauditPlanRejectModel.toJson();

      Map<String, dynamic>? response =
          await viewAuditPlanPresenter.auditPlanRejectButton(
        auditPlanRejectJsonString: auditPlanRejectJsonString,
        isLoading: true,
      );
      if (response == true) {
        //getCalibrationList(facilityId, true);
      }
    }
  }

  bool checkComment() {
    if (approveCommentTextFieldCtrlr.text == "") {
      iscommentTextInvalid.value = true;
      return true;
    }

    return false;
  }
}
