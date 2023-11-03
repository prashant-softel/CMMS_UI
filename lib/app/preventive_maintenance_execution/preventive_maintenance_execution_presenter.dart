import 'package:cmms/domain/models/history_model.dart';

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

  Future<List<HistoryModel>?> getHistory(
    moduleType,
    id,
    isLoading,
  ) async =>
      await preventiveMaintenanceExecutionUsecase.getHistory(
        moduleType: moduleType,
        id: id,
        isLoading: isLoading,
      );
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

  Future<bool> cloneSchedule(
      {required int from_schedule_id,
      required int to_schedule_id,
      required int taskId,
      bool? isloading}) async {
    return preventiveMaintenanceExecutionUsecase.cloneSchedule(
        from_schedule_id: from_schedule_id,
        to_schedule_id: to_schedule_id,
        taskId: taskId,
        isloading: isloading);
  }

  void saveValue({String? pmTaskId}) async {
    return preventiveMaintenanceExecutionUsecase.saveValue(pmTaskId: pmTaskId);
  }

  Future<String?> getValue() async =>
      await preventiveMaintenanceExecutionUsecase.getValue();
}
