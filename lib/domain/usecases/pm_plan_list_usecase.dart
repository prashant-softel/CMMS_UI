import 'package:cmms/domain/models/pm_plan_list_model.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:cmms/domain/repositories/repository.dart';

class PmPlanListUsecase {
  PmPlanListUsecase(this.repository);
  Repository repository;
  Future<List<PmPlanListModel?>?> getPmPlanList(
          {int? facilityId,
          bool? isLoading,
          dynamic endDate,
          // bool? self_view,
          dynamic startDate,

          bool? isExport}) async =>
      await repository.getPmPlanList(
          facilityId, isLoading, startDate, endDate, isExport
          // ,
          // self_view
          );
  deletePmPlan({required Object planId, required bool isLoading}) async =>
      await repository.deletePmPlan(
        planId,
        isLoading,
      );
  void clearValue() async => repository.clearData(LocalKeys.pmPlanId);
}
