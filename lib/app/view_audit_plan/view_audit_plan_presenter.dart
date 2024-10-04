import 'package:cmms/domain/models/audit_plan_detail_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/usecases/view_audit_plan_usecase.dart';

class ViewAuditPlanPresenter {
  ViewAuditPlanPresenter(this.viewAuditPlanUsecase);
  ViewAuditPlanUsecase viewAuditPlanUsecase;

  Future<Map<String, dynamic>?> auditPlanApprovedButton({
    auditPlanApproveJsonString,
    int? type,
    required bool isLoading,
  }) async {
    return viewAuditPlanUsecase.auditPlanApprovedButton(
      auditPlanApproveJsonString: auditPlanApproveJsonString,
      isLoading: isLoading,
      type: type,
    );
  }

  Future<List<HistoryModel>?> getHistory(
    moduleType,
    id,
    facilityId,
    isLoading,
  ) async =>
      await viewAuditPlanUsecase.getHistory(
        moduleType: moduleType,
        id: id,
        facilityId: facilityId,
        isLoading: isLoading,
      );
  Future<Map<String, dynamic>?> auditPlanRejectButton({
    auditPlanRejectJsonString,
    required bool isLoading,
    int? type,
  }) async {
    return viewAuditPlanUsecase.auditPlanRejectButton(
      auditPlanRejectJsonString: auditPlanRejectJsonString,
      isLoading: isLoading,
      type: type,
    );
  }

  Future<AuditPlanDetailModel?> getAuditPlanDetails({
    int? auditPlanId,
    required int facilityId,
    bool? isLoading,
  }) async =>
      await viewAuditPlanUsecase.getAuditPlanDetails(
        auditPlanId: auditPlanId,
        facilityId: facilityId,
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
