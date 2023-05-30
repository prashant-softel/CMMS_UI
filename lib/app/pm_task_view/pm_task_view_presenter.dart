import 'package:cmms/domain/models/pm_task_view_list_model.dart';

import '../../domain/usecases/pm_task_view_usecase.dart';

class PreventiveMaintenanceTaskViewPresenter {
  PreventiveMaintenanceTaskViewPresenter(
      this.preventiveMaintenanceTaskViewUsecase);
  PreventiveMaintenanceTaskViewUsecase preventiveMaintenanceTaskViewUsecase;
  Future<PmtaskViewModel?> getPmtaskViewList({
    int? scheduleId,
    bool? isloading,
  }) async =>
      await preventiveMaintenanceTaskViewUsecase.getPmtaskViewList(
        scheduleId: scheduleId,
        isLoading: isloading,
      );
}
