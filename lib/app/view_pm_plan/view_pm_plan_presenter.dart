import 'package:cmms/domain/models/get_pm_plan_detail_model.dart';

import '../../domain/usecases/view_pm_plan_usecase.dart';

class ViewPmPlanPresenter {
  ViewPmPlanPresenter(this.viewPmPlanUsecase);
  ViewPmPlanUsecase viewPmPlanUsecase;

  Future<Map<String, dynamic>?> pmPlanApprovedButton({
    pmPlanApproveJsonString,
    required bool isLoading,
  }) async {
    return viewPmPlanUsecase.pmPlanApprovedButton(
      pmPlanApproveJsonString: pmPlanApproveJsonString,
      isLoading: isLoading,
    );
  }

  Future<Map<String, dynamic>?> pmPlanRejectButton({
    pmPlanRejectJsonString,
    required bool isLoading,
  }) async {
    return viewPmPlanUsecase.pmPlanRejectButton(
      pmPlanRejectJsonString: pmPlanRejectJsonString,
      isLoading: isLoading,
    );
  }

  Future<PMPlanDetail?> getPmPlanDetails({
    int? pmPlanId,
    bool? isLoading,
  }) async =>
      await viewPmPlanUsecase.getPmPlanDetails(
        pmPlanId: pmPlanId,
        isLoading: isLoading,
      );
  void saveValue({String? pmPlanId}) async {
    return viewPmPlanUsecase.saveValue(pmPlanId: pmPlanId);
  }

  Future<String?> getValue() async => await viewPmPlanUsecase.getValue();
}
