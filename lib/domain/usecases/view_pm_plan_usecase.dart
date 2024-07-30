import 'package:cmms/domain/models/get_pm_plan_detail_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

import '../repositories/local_storage_keys.dart';

class ViewPmPlanUsecase {
  ViewPmPlanUsecase(this.repository);
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
    required int facilityId,
    bool? isLoading,
  }) async =>
      await repository.getPmPlanDetails(
        pmPlanId,
        facilityId,
        isLoading,
      );

    Future<List<HistoryModel>?>  getViewPlanHistory({
    moduleType,
    pmPlanId,
    facilityId,
    bool? isLoading,
  }) async =>
      await repository.getViewPlanHistory(
        moduleType,
        pmPlanId,
        facilityId,
        isLoading,
      );
      
  void saveValue({String? pmPlanId}) async =>
      repository.saveValue(LocalKeys.pmPlanId, pmPlanId);
  Future<String?> getValue() async =>
      await repository.getStringValue(LocalKeys.pmPlanId);
}
