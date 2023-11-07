import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/mrs_list_by_jobId.dart';

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
  Future<List<HistoryModel>?> getHistory({
    moduleType,
    id,
    bool? isLoading,
  }) async =>
      await repository.getHistory(
        moduleType,
        id,
        isLoading,
      );
  Future<bool> closePmTaskExecution({
    closetoJsonString,
    bool? isLoading,
  }) async =>
      await repository.ClosePMTaskExecution(
          closetoJsonString: closetoJsonString, isLoading: isLoading);
  Future<bool> UpdatePMTaskExecution({
    updatePMTaskExecutionJsonString,
    bool? isLoading,
  }) async =>
      await repository.UpdatePMTaskExecution(
          updatePMTaskExecutionJsonString: updatePMTaskExecutionJsonString,
          isLoading: isLoading);
  Future<bool> cloneSchedule(
          {required int from_schedule_id,
          required int to_schedule_id,
          required int taskId,
          bool? isloading}) async =>
      await repository.cloneSchedule(
          from_schedule_id: from_schedule_id,
          to_schedule_id: to_schedule_id,
          taskId: taskId,
          isloading: isloading);
  void saveValue({String? pmTaskId}) async =>
      repository.saveValue(LocalKeys.pmTaskId, pmTaskId);
  Future<String?> getValue() async =>
      await repository.getStringValue(LocalKeys.pmTaskId);
  Future<List<MRSListByJobIdModel>?> getMrsListByModuleTask({
    taskId,
    bool? isLoading,
  }) async =>
      await repository.getMrsListByModuleTask(
        taskId,
        isLoading,
      );
}
