import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/employee_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/mrs_list_by_jobId.dart';
import 'package:cmms/domain/models/new_permit_list_model.dart';
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
  Future<List<NewPermitModel?>?> getPermitList({
    int? facilityId,
    bool? selfView,
    bool? isLoading,
  }) async =>
      await repository.getPermitList(
        facilityId,
        selfView,
        isLoading,
      );
  Future<Map<String, dynamic>?> scheduleLinkToPermit({
    int? scheduleId,
    int? permitId,
    bool? isLoading,
  }) async =>
      await repository.scheduleLinkToPermit(
        scheduleId,
        permitId,
        isLoading,
      );

  Future<List<EmployeeModel?>?> getAssignedToList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getAssignedToList(
        auth,
        facilityId,
        isLoading,
      );

  Future<Map<String, dynamic>?> setPmTask({
    int? scheduleId,
    bool? isLoading,
  }) async =>
      await repository.setPmTask(
        scheduleId,
        isLoading,
      );
  Future<bool> approvePmTaskExecution({
    approvetoJsonString,
    bool? isLoading,
  }) async =>
      await repository.approvePmTaskExecution(
          approvetoJsonString: approvetoJsonString, isLoading: isLoading);
  Future<bool> rejectPmTaskExecution({
    rejecttoJsonString,
    bool? isLoading,
  }) async =>
      await repository.rejectPmTaskExecution(
          rejecttoJsonString: rejecttoJsonString, isLoading: isLoading);
  Future<bool> closePmTaskExecution({
    closetoJsonString,
    bool? isLoading,
  }) async =>
      await repository.ClosePMTaskExecution(
          closetoJsonString: closetoJsonString, isLoading: isLoading);
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
  Future<List<MRSListByJobIdModel>?> getMrsListByModuleTask({
    taskId,
    bool? isLoading,
  }) async =>
      await repository.getMrsListByModuleTask(
        taskId,
        isLoading,
      );
  void saveValue({String? pmTaskId}) async =>
      repository.saveValue(LocalKeys.pmTaskId, pmTaskId);
  Future<String?> getValue() async =>
      await repository.getStringValue(LocalKeys.pmTaskId);
  void clearValue() async => repository.clearData(LocalKeys.mrsId);
  void clearStoreData() async => repository.clearData(LocalKeys.permitId);
  void clearTypeValue() async => repository.clearData(LocalKeys.types);
  void clearisCheckedValue() async => repository.clearData(LocalKeys.isChecked);
  void clearjobmodelValue() async => repository.clearData(LocalKeys.jobModel);
  void clearpmTaskValue() async => repository.clearData(LocalKeys.pmTaskModel);
  void clearStoreTaskData() async => repository.clearData(LocalKeys.pmTaskId);
  void clearStoreTaskActivityData() async =>
      repository.clearData(LocalKeys.activity);
  void clearStoreTaskfromActorData() async =>
      repository.clearData(LocalKeys.fromActorTypeId);
  void clearStoreTasktoActorData() async =>
      repository.clearData(LocalKeys.toactortypeid);
  void clearStoreTaskWhereUsedData() async =>
      repository.clearData(LocalKeys.whereUsed);
}
