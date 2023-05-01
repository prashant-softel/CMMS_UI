import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/pm_task_view_list_model.dart';

class PreventiveMaintenanceTaskViewUsecase {
  final Repository repository;

  PreventiveMaintenanceTaskViewUsecase(this.repository);
  Future<PmtaskViewModel?> getPmtaskViewList({
    int? scheduleId,
    bool? isLoading,
  }) async =>
      await repository.getPmtaskViewList(
        scheduleId,
        isLoading,
      );
}
