import 'package:cmms/domain/models/pm_task_model.dart';
import 'package:cmms/domain/usecases/pm_plan_list_usecase.dart';

class PmPlanListPresenter {
  PmPlanListPresenter(this.pmPlanListUsecase);
  PmPlanListUsecase pmPlanListUsecase;
  Future<List<PmTaskListModel?>?> getPmTaskList(
          {int? facilityId,
          bool? isLoading,
          dynamic endDate,
          dynamic startDate}) async =>
      await pmPlanListUsecase.getPmTaskList(
          facilityId: facilityId ?? 0,
          isLoading: isLoading ?? false,
          endDate: endDate,
          startDate: startDate);
}
