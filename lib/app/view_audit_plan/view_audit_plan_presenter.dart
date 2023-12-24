import 'package:cmms/domain/models/audit_plan_detail_model.dart';
import 'package:cmms/domain/usecases/view_audit_plan_usecase.dart';

class ViewAuditPlanPresenter {
  ViewAuditPlanPresenter(this.viewAuditPlanUsecase);
  ViewAuditPlanUsecase viewAuditPlanUsecase;

  Future<Map<String, dynamic>?> auditPlanApprovedButton({
    auditPlanApproveJsonString,
    required bool isLoading,
  }) async {
    return viewAuditPlanUsecase.auditPlanApprovedButton(
      auditPlanApproveJsonString: auditPlanApproveJsonString,
      isLoading: isLoading,
    );
  }

  Future<Map<String, dynamic>?> auditPlanRejectButton({
    auditPlanRejectJsonString,
    required bool isLoading,
  }) async {
    return viewAuditPlanUsecase.auditPlanRejectButton(
      auditPlanRejectJsonString: auditPlanRejectJsonString,
      isLoading: isLoading,
    );
  }

  Future<AuditPlanDetailModel?> getAuditPlanDetails({
    int? auditPlanId,
    bool? isLoading,
  }) async =>
      await viewAuditPlanUsecase.getAuditPlanDetails(
        auditPlanId: auditPlanId,
        isLoading: isLoading,
      );
  void saveValue({String? auditId}) async {
    return viewAuditPlanUsecase.saveValue(auditId: auditId);
  }

  Future<String?> getValue() async => await viewAuditPlanUsecase.getValue();

  void saveTypeValue({String? type}) async {
    return viewAuditPlanUsecase.saveTypeValue(type: type);
  }

  Future<String?> getTypeValue() async =>
      await viewAuditPlanUsecase.getTypeValue();
}
