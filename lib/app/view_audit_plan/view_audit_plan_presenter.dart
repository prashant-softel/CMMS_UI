import 'package:cmms/domain/models/audit_plan_detail_model.dart';
import 'package:cmms/domain/models/get_pm_plan_detail_model.dart';
import 'package:cmms/domain/usecases/view_audit_plan_usecase.dart';

class ViewAuditPlanPresenter {
  ViewAuditPlanPresenter(this.viewAuditPlanUsecase);
  ViewAuditPlanUsecase viewAuditPlanUsecase;

  Future<Map<String, dynamic>?> pmPlanApprovedButton({
    pmPlanApproveJsonString,
    required bool isLoading,
  }) async {
    return viewAuditPlanUsecase.pmPlanApprovedButton(
      pmPlanApproveJsonString: pmPlanApproveJsonString,
      isLoading: isLoading,
    );
  }

  Future<Map<String, dynamic>?> pmPlanRejectButton({
    pmPlanRejectJsonString,
    required bool isLoading,
  }) async {
    return viewAuditPlanUsecase.pmPlanRejectButton(
      pmPlanRejectJsonString: pmPlanRejectJsonString,
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
