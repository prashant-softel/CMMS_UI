import 'package:cmms/app/utils/utility.dart';
import 'package:cmms/app/view_mis_plan/view_mis_plan_presenter.dart';
import 'package:cmms/domain/models/audit_plan_detail_model.dart';
import 'package:cmms/domain/models/comment_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../home/home_controller.dart';

class ViewMisPlanController extends GetxController {
  ///
  ViewMisPlanController(
    this.viewMisPlanPresenter,
  );
  ViewMisPlanPresenter viewMisPlanPresenter;
  final HomeController homecontroller = Get.find();
  TextEditingController approveCommentTextFieldCtrlr = TextEditingController();
  TextEditingController rejectCommentTextFieldCtrlr = TextEditingController();
  Rx<int> auditId = 0.obs;
  Rx<int> type = 0.obs;
  RxInt selectedValue = 1.obs;
  Rx<AuditPlanDetailModel?> auditPlanDetailModel = AuditPlanDetailModel().obs;
  RxList<HistoryModel?>? historyList = <HistoryModel?>[].obs;
  void onRadioValueChanged(int value) {
    selectedValue.value = value;
  }

  @override
  void onInit() async {
    try {
      //   await setauditPlanId();
      if (auditId != 0) {
        print({"fghvjbggjhjgk", auditId});

        //   await getAuditPlanDetails(auditPlanId: auditId.value, isloading: true);
      }
      super.onInit();
    } catch (e) {
      print(e);
    }
  }

  Future<void> setauditPlanId() async {
    try {
      final _auditId = await viewMisPlanPresenter.getValue();
      final _type = await viewMisPlanPresenter.getTypeValue();

      if (_auditId == null || _auditId == '' || _auditId == "null") {
        var dataFromPreviousScreen = Get.arguments;

        auditId.value = dataFromPreviousScreen['auditId'];
        type.value = dataFromPreviousScreen['type'];

        viewMisPlanPresenter.saveValue(auditId: auditId.value.toString());
        viewMisPlanPresenter.saveTypeValue(type: type.value.toString());
      } else {
        auditId.value = int.tryParse(_auditId) ?? 0;
        type.value = int.tryParse(_type ?? "") ?? 0;
      }
    } catch (e) {
      Utility.showDialog(e.toString(), 'auditId');
    }
  }

  Future<void> getAuditPlanDetails({int? auditPlanId, bool? isloading}) async {
    final _auditPlanDetailsModel = await viewMisPlanPresenter
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
          await viewMisPlanPresenter.pmPlanApprovedButton(
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
          await viewMisPlanPresenter.pmPlanRejectButton(
        pmPlanRejectJsonString: pmPlanRejectJsonString,
        isLoading: true,
      );
      if (response == true) {
        //getCalibrationList(facilityId, true);
      }
    }
  }
}
