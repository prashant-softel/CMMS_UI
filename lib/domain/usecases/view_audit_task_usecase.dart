import 'package:cmms/domain/models/audit_plan_detail_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

import '../repositories/local_storage_keys.dart';

class ViewAuditTaskUsecase {
  ViewAuditTaskUsecase(this.repository);
  Repository repository;

  Future<Map<String, dynamic>> pmPlanApprovedButton({
    pmPlanApproveJsonString,
    bool? isLoading,
  }) async =>
      await repository.pmPlanApprovedButton(
        pmPlanApproveJsonString,
        isLoading,
      );
  Future<Map<String, dynamic>> pmPlanRejectButton({
    pmPlanRejectJsonString,
    bool? isLoading,
  }) async =>
      await repository.pmPlanRejectButton(
        pmPlanRejectJsonString,
        isLoading,
      );
  Future<AuditPlanDetailModel?> getAuditPlanDetails({
    int? auditPlanId,
    bool? isLoading,
  }) async =>
      await repository.getAuditPlanDetails(
        auditPlanId,
        isLoading,
      );
  void saveValue({String? auditTaskId}) async =>
      repository.saveValue(LocalKeys.auditTaskId, auditTaskId);
  Future<String?> getValue() async =>
      await repository.getStringValue(LocalKeys.auditTaskId);
}
