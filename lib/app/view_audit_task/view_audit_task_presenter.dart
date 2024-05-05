import 'package:cmms/domain/models/audit_plan_detail_model.dart';
import 'package:cmms/domain/models/view_audit_task_model.dart';

import '../../domain/models/history_model.dart';
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

  Future<List<HistoryModel>?> getHistory(
    moduleType,
    id,
    isLoading,
  ) async =>
      await viewAuditTaskUsecase.getHistory(
        moduleType: moduleType,
        id: id,
        isLoading: isLoading,
      );
  Future<Map<String, dynamic>?> startAuditTask({
    int? auditTaskId,
    bool? isLoading,
  }) async =>
      await viewAuditTaskUsecase.startAuditTask(
        auditTaskId: auditTaskId,
        isLoading: isLoading,
      );
  Future<AuditTaskViewModel?> getAuditTaskDetails({
    int? auditTaskId,
    bool? isLoading,
  }) async =>
      await viewAuditTaskUsecase.getAuditTaskDetails(
        auditTaskId: auditTaskId,
        isLoading: isLoading,
      );
  void saveValue({String? auditTaskId}) async {
    return viewAuditTaskUsecase.saveValue(auditTaskId: auditTaskId);
  }

  Future<String?> getValue() async => await viewAuditTaskUsecase.getValue();
}
