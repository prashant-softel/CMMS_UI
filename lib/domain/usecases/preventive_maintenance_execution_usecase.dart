import 'package:cmms/domain/domain.dart';

import '../models/pm_task_view_list_model.dart';

class PreventiveMaintenanceExecutionUsecase {
  final Repository repository;

  PreventiveMaintenanceExecutionUsecase(this.repository);
  Future<PmtaskViewModel?> getPmtaskViewList({
    int? scheduleId,
    bool? isLoading,
  }) async =>
      await repository.getPmtaskViewList(
        scheduleId,
        isLoading,
      );
  Future<List<dynamic>> updatePmExecution({
    pmExecutionJsonString,
    bool? isLoading,
  }) async =>
      await repository.updatePmExecution(
        pmExecutionJsonString,
        isLoading,
      );
}
