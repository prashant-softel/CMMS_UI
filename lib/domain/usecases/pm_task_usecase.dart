import 'package:cmms/domain/models/pm_task_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

class PreventiveMaintenanceTaskUsecase {
  PreventiveMaintenanceTaskUsecase(this.repository);
  Repository repository;
  Future<List<PmTaskListModel?>?> getPmTaskList({
    int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getPmTaskList(
        facilityId,
        isLoading,
      );
}
