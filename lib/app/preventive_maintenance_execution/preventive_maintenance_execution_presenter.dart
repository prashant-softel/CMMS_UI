import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/mrs_list_by_jobId.dart';
import 'package:flutter/services.dart';

import '../../domain/models/pm_task_view_list_model.dart';
import '../../domain/models/update_pm_task_execution_model.dart';
import '../../domain/usecases/preventive_maintenance_execution_usecase.dart';

class PreventiveMaintenanceExecutionPresenter {
  PreventiveMaintenanceExecutionPresenter(
      this.preventiveMaintenanceExecutionUsecase);
  PreventiveMaintenanceExecutionUsecase preventiveMaintenanceExecutionUsecase;

  Future<PmtaskViewModel?> getPmtaskViewList({
    int? scheduleId,
    required int facilityId,
    bool? isloading,
  }) async =>
      await preventiveMaintenanceExecutionUsecase.getPmtaskViewList(
          scheduleId: scheduleId, isLoading: isloading, facilityId: facilityId);
  Future<List<dynamic>> updatePmExecution({
    pmExecutionJsonString,
    required bool isLoading,
  }) async {
    return preventiveMaintenanceExecutionUsecase.updatePmExecution(
      pmExecutionJsonString: pmExecutionJsonString,
      isLoading: isLoading,
    );
  }

  void clearValue() async => preventiveMaintenanceExecutionUsecase.clearValue();

  Future<PmFiles?> browseFiles(
      Uint8List? fileBytes, String fileName, bool isLoading) async {
    return await preventiveMaintenanceExecutionUsecase.browseFiles(
        fileBytes, fileName, isLoading);
    // return true;
  }

  Future<List<HistoryModel>?> getHistory(
    facilityId,
    moduleType,
    id,
    isLoading,
  ) async =>
      await preventiveMaintenanceExecutionUsecase.getHistory(
        facilityId: facilityId,
        moduleType: moduleType,
        id: id,
        isLoading: isLoading,
      );
  Future<bool> closePmTaskExecution(
      {closetoJsonString,
      closePtwJsonString,
      required bool isLoading,
      int? closetype}) async {
    return preventiveMaintenanceExecutionUsecase.closePmTaskExecution(
      closetoJsonString: closetoJsonString,
      closePtwJsonString: closePtwJsonString,
      isLoading: isLoading,
      closetype: closetype,
    );
  }

  Future<bool> CancelPMTask({
    CancelPMTaskJsonString,
    closePtwJsonString,
    required bool isLoading,
    required bool shouldClosePermit,
  }) async {
    return preventiveMaintenanceExecutionUsecase.CancelPMTask(
      CancelPMTaskJsonString: CancelPMTaskJsonString,
      closePtwJsonString: closePtwJsonString,
      shouldClosePermit: shouldClosePermit,
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
      required int cloneJobs,
      bool? isloading}) async {
    return preventiveMaintenanceExecutionUsecase.cloneSchedule(
        from_schedule_id: from_schedule_id,
        to_schedule_id: to_schedule_id,
        taskId: taskId,
        cloneJobs: cloneJobs,
        isloading: isloading);
  }

  void saveValue({String? pmTaskId}) async {
    return preventiveMaintenanceExecutionUsecase.saveValue(pmTaskId: pmTaskId);
  }

  Future<String?> getValue() async =>
      await preventiveMaintenanceExecutionUsecase.getValue();
  Future<List<MRSListByJobIdModel>?> getMrsListByModuleTask(
    taskId,
    isLoading,
  ) async =>
      await preventiveMaintenanceExecutionUsecase.getMrsListByModuleTask(
        taskId: taskId,
        isLoading: isLoading,
      );
  Future<bool> transferItem({
    transferItemJsonString,
    required bool isLoading,
  }) async {
    return preventiveMaintenanceExecutionUsecase.transferItem(
      transferItemJsonString: transferItemJsonString,
      isLoading: isLoading,
    );
  }
}
