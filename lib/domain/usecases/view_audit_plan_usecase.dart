import 'package:cmms/domain/models/audit_plan_detail_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

import '../repositories/local_storage_keys.dart';

class ViewAuditPlanUsecase {
  ViewAuditPlanUsecase(this.repository);
  Repository repository;

  Future<Map<String, dynamic>> auditPlanApprovedButton({
    auditPlanApproveJsonString,
    bool? isLoading,
  }) async =>
      await repository.auditPlanApprovedButton(
        auditPlanApproveJsonString,
        isLoading,
      );
  Future<Map<String, dynamic>> auditPlanRejectButton({
    auditPlanRejectJsonString,
    bool? isLoading,
  }) async =>
      await repository.auditPlanRejectButton(
        auditPlanRejectJsonString,
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
  void saveValue({String? auditId}) async =>
      repository.saveValue(LocalKeys.auditId, auditId);
  Future<String?> getValue() async =>
      await repository.getStringValue(LocalKeys.auditId);
  void saveTypeValue({String? type}) async =>
      repository.saveValue(LocalKeys.type, type);
  Future<String?> getTypeValue() async =>
      await repository.getStringValue(LocalKeys.type);
}
