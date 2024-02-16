import 'package:cmms/app/utils/utility.dart';
import 'package:cmms/app/view_audit_task/view_audit_task_presenter.dart';
import 'package:cmms/domain/models/audit_plan_detail_model.dart';
import 'package:cmms/domain/models/comment_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../home/home_controller.dart';

class ViewAuditTaskController extends GetxController {
  ///
  ViewAuditTaskController(
    this.viewAuditTaskPresenter,
  );
  ViewAuditTaskPresenter viewAuditTaskPresenter;
  final HomeController homecontroller = Get.find();
  TextEditingController approveCommentTextFieldCtrlr = TextEditingController();
  TextEditingController rejectCommentTextFieldCtrlr = TextEditingController();
  Rx<int> auditTaskId = 0.obs;
  RxInt selectedValue = 1.obs;
  Rx<AuditPlanDetailModel?> auditPlanDetailModel = AuditPlanDetailModel().obs;
  RxList<HistoryModel?>? historyList = <HistoryModel?>[].obs;
  void onRadioValueChanged(int value) {
    selectedValue.value = value;
  }

  @override
  void onInit() async {
    try {
      await setauditTaskId();
      if (auditTaskId != 0) {
        print({"fghvjbggjhjgk", auditTaskId});

        //   await getAuditPlanDetails(auditPlanId: auditId.value, isloading: true);
      }
      super.onInit();
    } catch (e) {
      print(e);
    }
  }

  Future<void> setauditTaskId() async {
    try {
      final _auditId = await viewAuditTaskPresenter.getValue();

      if (_auditId == null || _auditId == '' || _auditId == "null") {
        var dataFromPreviousScreen = Get.arguments;

        auditTaskId.value = dataFromPreviousScreen['auditTaskId'];

        viewAuditTaskPresenter.saveValue(
            auditTaskId: auditTaskId.value.toString());
      } else {
        auditTaskId.value = int.tryParse(_auditId) ?? 0;
      }
    } catch (e) {
      Utility.showDialog(e.toString(), 'auditTaskId');
    }
  }

  Future<void> getAuditPlanDetails({int? auditPlanId, bool? isloading}) async {
    final _auditPlanDetailsModel = await viewAuditTaskPresenter
        .getAuditPlanDetails(auditPlanId: auditPlanId, isLoading: isloading);

    if (_auditPlanDetailsModel != null) {
      auditPlanDetailModel.value = _auditPlanDetailsModel;
    }
    print({"auditPlandetailss", auditPlanDetailModel.value?.id});
  }

  void pmPlanApprovedButton({int? id}) async {
    {
      String _comment = approveCommentTextFieldCtrlr.text.trim();

      CommentModel commentpmPlanAproveModel =
          CommentModel(id: id, comment: _comment);

      var pmPlanApproveJsonString = commentpmPlanAproveModel.toJson();

      Map<String, dynamic>? response =
          await viewAuditTaskPresenter.pmPlanApprovedButton(
        pmPlanApproveJsonString: pmPlanApproveJsonString,
        isLoading: true,
      );
      if (response == true) {
        //getCalibrationList(facilityId, true);
      }
    }
  }

  void pmPlanRejectButton({int? id}) async {
    {
      String _comment = rejectCommentTextFieldCtrlr.text.trim();

      CommentModel commentpmPlanRejectModel =
          CommentModel(id: id, comment: _comment);

      var pmPlanRejectJsonString = commentpmPlanRejectModel.toJson();

      Map<String, dynamic>? response =
          await viewAuditTaskPresenter.pmPlanRejectButton(
        pmPlanRejectJsonString: pmPlanRejectJsonString,
        isLoading: true,
      );
      if (response == true) {
        //getCalibrationList(facilityId, true);
      }
    }
  }
}
