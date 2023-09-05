import 'package:cmms/domain/models/pm_task_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

class PmPlanListUsecase {
  PmPlanListUsecase(this.repository);
  Repository repository;
  Future<List<PmTaskListModel?>?> getPmTaskList(
          {int? facilityId,
          bool? isLoading,
          dynamic endDate,
          dynamic startDate}) async =>
      await repository.getPmTaskList(facilityId, isLoading, startDate, endDate);
}
