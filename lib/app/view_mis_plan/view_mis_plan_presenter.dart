import 'package:cmms/domain/models/audit_plan_detail_model.dart';
import 'package:cmms/domain/usecases/view_mis_plan_usecase.dart';

class ViewMisPlanPresenter {
  ViewMisPlanPresenter(this.viewMisPlanUsecase);
  ViewMisPlanUsecase viewMisPlanUsecase;

  Future<Map<String, dynamic>?> pmPlanApprovedButton({
    pmPlanApproveJsonString,
    required bool isLoading,
  }) async {
    return viewMisPlanUsecase.pmPlanApprovedButton(
      pmPlanApproveJsonString: pmPlanApproveJsonString,
      isLoading: isLoading,
    );
  }

  Future<Map<String, dynamic>?> pmPlanRejectButton({
    pmPlanRejectJsonString,
    required bool isLoading,
  }) async {
    return viewMisPlanUsecase.pmPlanRejectButton(
      pmPlanRejectJsonString: pmPlanRejectJsonString,
      isLoading: isLoading,
    );
  }

  Future<AuditPlanDetailModel?> getAuditPlanDetails({
    int? auditPlanId,
    required int facilityId,
    bool? isLoading,
  }) async =>
      await viewMisPlanUsecase.getAuditPlanDetails(
        auditPlanId: auditPlanId,
        facilityId:facilityId,
        isLoading: isLoading,
      );
  void saveValue({String? auditId}) async {
    return viewMisPlanUsecase.saveValue(auditId: auditId);
  }

  Future<String?> getValue() async => await viewMisPlanUsecase.getValue();

  void saveTypeValue({String? type}) async {
    return viewMisPlanUsecase.saveTypeValue(type: type);
  }

  Future<String?> getTypeValue() async =>
      await viewMisPlanUsecase.getTypeValue();
}
