import 'package:cmms/domain/models/pm_plan_list_model.dart';
import 'package:cmms/domain/models/pm_task_model.dart';
import 'package:cmms/domain/usecases/pm_plan_list_usecase.dart';

class PmPlanListPresenter {
  PmPlanListPresenter(this.pmPlanListUsecase);
  PmPlanListUsecase pmPlanListUsecase;
  Future<List<PmPlanListModel?>?> getPmPlanList(
          {int? facilityId,
          bool? isLoading,
          dynamic endDate,
          dynamic startDate}) async =>
      await pmPlanListUsecase.getPmPlanList(
          facilityId: facilityId ?? 0,
          isLoading: isLoading ?? false,
          endDate: endDate,
          startDate: startDate);
}
