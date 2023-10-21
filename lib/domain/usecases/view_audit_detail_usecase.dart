import 'package:cmms/domain/models/get_pm_plan_detail_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

class ViewAuditDetailUsecase {
  ViewAuditDetailUsecase(this.repository);
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
  Future<PMPlanDetail?> getPmPlanDetails({
    int? pmPlanId,
    bool? isLoading,
  }) async =>
      await repository.getPmPlanDetails(
        pmPlanId,
        isLoading,
      );
}
