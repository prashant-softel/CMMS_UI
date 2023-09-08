import 'package:cmms/domain/models/pm_plan_list_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

class PmPlanListUsecase {
  PmPlanListUsecase(this.repository);
  Repository repository;
  Future<List<PmPlanListModel?>?> getPmPlanList(
          {int? facilityId,
          bool? isLoading,
          dynamic endDate,
          dynamic startDate}) async =>
      await repository.getPmPlanList(facilityId, isLoading, startDate, endDate);
}
