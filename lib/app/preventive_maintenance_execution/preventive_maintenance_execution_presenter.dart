import '../../domain/models/pm_task_view_list_model.dart';
import '../../domain/usecases/preventive_maintenance_execution_usecase.dart';

class PreventiveMaintenanceExecutionPresenter {
  PreventiveMaintenanceExecutionPresenter(
      this.preventiveMaintenanceExecutionUsecase);
  PreventiveMaintenanceExecutionUsecase preventiveMaintenanceExecutionUsecase;

  Future<PmtaskViewModel?> getPmtaskViewList({
    int? scheduleId,
    bool? isloading,
  }) async =>
      await preventiveMaintenanceExecutionUsecase.getPmtaskViewList(
        scheduleId: scheduleId,
        isLoading: isloading,
      );
  Future<List<dynamic>> updatePmExecution({
    pmExecutionJsonString,
    required bool isLoading,
  }) async {
    return preventiveMaintenanceExecutionUsecase.updatePmExecution(
      pmExecutionJsonString: pmExecutionJsonString,
      isLoading: isLoading,
    );
  }

  Future<bool> closePmTaskExecution({
    closetoJsonString,
    required bool isLoading,
  }) async {
    return preventiveMaintenanceExecutionUsecase.closePmTaskExecution(
      closetoJsonString: closetoJsonString,
      isLoading: isLoading,
    );
  }

  Future<bool> UpdatePMTaskExecution({
    updatePMTaskExecutionJsonString,
    required bool isLoading,
  }) async {
    return preventiveMaintenanceExecutionUsecase.UpdatePMTaskExecution(
      updatePMTaskExecutionJsonString: updatePMTaskExecutionJsonString,
      isLoading: isLoading,
    );
  }
}
