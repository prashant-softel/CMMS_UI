import 'package:cmms/domain/models/audit_plan_detail_model.dart';

import '../../domain/usecases/view_audit_task_usecase.dart';

class ViewAuditTaskPresenter {
  ViewAuditTaskPresenter(this.viewAuditTaskUsecase);
  ViewAuditTaskUsecase viewAuditTaskUsecase;

  Future<Map<String, dynamic>?> pmPlanApprovedButton({
    pmPlanApproveJsonString,
    required bool isLoading,
  }) async {
    return viewAuditTaskUsecase.pmPlanApprovedButton(
      pmPlanApproveJsonString: pmPlanApproveJsonString,
      isLoading: isLoading,
    );
  }

  Future<Map<String, dynamic>?> pmPlanRejectButton({
    pmPlanRejectJsonString,
    required bool isLoading,
  }) async {
    return viewAuditTaskUsecase.pmPlanRejectButton(
      pmPlanRejectJsonString: pmPlanRejectJsonString,
      isLoading: isLoading,
    );
  }

  Future<AuditPlanDetailModel?> getAuditPlanDetails({
    int? auditPlanId,
    required int facilityId,
    bool? isLoading,
  }) async =>
      await viewAuditTaskUsecase.getAuditPlanDetails(
        auditPlanId: auditPlanId,
        isLoading: isLoading,
        facilityId: facilityId
      );
  void saveValue({String? auditTaskId}) async {
    return viewAuditTaskUsecase.saveValue(auditTaskId: auditTaskId);
  }

  Future<String?> getValue() async => await viewAuditTaskUsecase.getValue();
}
