import 'package:cmms/domain/models/audit_plan_detail_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

import '../repositories/local_storage_keys.dart';

class ViewMisPlanUsecase {
  ViewMisPlanUsecase(this.repository);
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
    required int facilityId,
    bool? isLoading,
  }) async =>
      await repository.getAuditPlanDetails(
        auditPlanId,
        facilityId,
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
