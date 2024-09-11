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
  Future<List<dynamic>> updatePmExecution(
          {pmExecutionJsonString, bool? isLoading, int? facility_id}) async =>
      await repository.updatePmExecution(
          pmExecutionJsonString, isLoading, facility_id);
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
          isLoading: isLoading,
          type: 1);

  Future<bool> UpdatePMTaskExecution(
          {updatePMTaskExecutionJsonString,
          bool? isLoading,
          int? facility_id}) async =>
      await repository.UpdatePMTaskExecution(
          updatePMTaskExecutionJsonString: updatePMTaskExecutionJsonString,
          isLoading: isLoading,
          facility_id: facility_id);
  Future<bool> cloneSchedule(
          {required int from_schedule_id,
          required int to_schedule_id,
          required int taskId,
          required int cloneJobs,
          bool? isloading,
          int? facility_id}) async =>
      await repository.cloneSchedule(
          from_schedule_id: from_schedule_id,
          to_schedule_id: to_schedule_id,
          taskId: taskId,
          cloneJobs: cloneJobs,
          isloading: isloading,
          facility_id: facility_id);
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
  void clearStoreTaskData() async => repository.clearData(LocalKeys.pmTaskId);
  void clearStoreTaskActivityData() async =>
      repository.clearData(LocalKeys.activity);
  void clearStoreDataTaskId() async => repository.clearData(LocalKeys.pmTaskId);
  void clearMrsIdStoreData() async => repository.clearData(LocalKeys.mrsId);
  void clearJobIdStoreData() async => repository.clearData(LocalKeys.jobId);

  void clearStoreTaskfromActorData() async =>
      repository.clearData(LocalKeys.fromActorTypeId);
  void clearStoreTasktoActorData() async =>
      repository.clearData(LocalKeys.toactortypeid);
  void clearStoreTaskWhereUsedData() async =>
      repository.clearData(LocalKeys.whereUsed);
  void clearTypeValue() async => repository.clearData(LocalKeys.types);
}
