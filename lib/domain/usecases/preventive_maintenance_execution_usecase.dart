import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/mrs_list_by_jobId.dart';
import 'package:cmms/domain/models/update_pm_task_execution_model.dart';
import 'package:flutter/services.dart';

import '../models/pm_task_view_list_model.dart';

class PreventiveMaintenanceExecutionUsecase {
  final Repository repository;

  PreventiveMaintenanceExecutionUsecase(this.repository);
  Future<PmtaskViewModel?> getPmtaskViewList(
          {int? scheduleId, bool? isLoading, required int facilityId}) async =>
      await repository.getPmtaskViewList(scheduleId, isLoading, facilityId);
  Future<List<dynamic>> updatePmExecution({
    pmExecutionJsonString,
    bool? isLoading,
  }) async =>
      await repository.updatePmExecution(
        pmExecutionJsonString,
        isLoading,
      );
  void clearValue() async => repository.clearData(LocalKeys.mrsId);

  Future<PmFiles?> browseFiles(
      Uint8List? fileBytes, String fileName, bool isLoading) async {
    return await repository.browsePmFiles(
      fileBytes,
      fileName,
      isLoading,
    );
    // return true;
  }

  Future<List<HistoryModel>?> getHistory({
    moduleType,
    id,
    facilityId,
    bool? isLoading,
  }) async =>
      await repository.getHistory(
        moduleType,
        id,
        facilityId,
        isLoading,
      );
  Future<bool> closePmTaskExecution(
          {closetoJsonString,
          closePtwJsonString,
          bool? isLoading,
          int? closetype}) async =>
      await repository.ClosePMTaskExecution(
        closetoJsonString: closetoJsonString,
        closePtwJsonString: closePtwJsonString,
        isLoading: isLoading,
      );
  Future<bool> CancelPMTask({
    CancelPMTaskJsonString,
    closePtwJsonString,
    bool? isLoading,
    required bool shouldClosePermit,
  }) async =>
      await repository.CancelPMTask(
          CancelPMTaskJsonString: CancelPMTaskJsonString,
          closePtwJsonString: closePtwJsonString,
          shouldClosePermit: shouldClosePermit,
          isLoading: isLoading);

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
          required int cloneJobs,
          bool? isloading}) async =>
      await repository.cloneSchedule(
          from_schedule_id: from_schedule_id,
          to_schedule_id: to_schedule_id,
          taskId: taskId,
          cloneJobs: cloneJobs,
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
  Future<bool> transferItem({
    transferItemJsonString,
    bool? isLoading,
  }) async =>
      await repository.transferItem(
        isLoading: isLoading,
        transferItemJsonString: transferItemJsonString,
      );
}
