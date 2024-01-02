import 'package:cmms/domain/models/employee_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/mrs_list_by_jobId.dart';
import 'package:cmms/domain/models/new_permit_list_model.dart';
import 'package:cmms/domain/models/pm_task_view_list_model.dart';
import 'package:cmms/domain/usecases/audit_task_view_usecase.dart';

class AuditTaskViewPresenter {
  AuditTaskViewPresenter(this.auditTaskViewUsecase);
  AuditTaskViewUsecase auditTaskViewUsecase;
  Future<PmtaskViewModel?> getPmtaskViewList({
    int? scheduleId,
    bool? isloading,
  }) async =>
      await auditTaskViewUsecase.getPmtaskViewList(
        scheduleId: scheduleId,
        isLoading: isloading,
      );
  Future<List<NewPermitModel?>?> getPermitList({
    int? facilityId,
    bool? selfView,
    bool? isLoading,
  }) async =>
      await auditTaskViewUsecase.getPermitList(
        facilityId: facilityId,
        selfView: selfView,
        isLoading: isLoading,
      );

  Future<List<EmployeeModel?>?> getAssignedToList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await auditTaskViewUsecase.getAssignedToList(
        auth: auth ?? "",
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );

  // Future<Map<String, dynamic>?> scheduleLinkToPermit({
  //   int? scheduleId,
  //   int? permitId,
  //   bool? isLoading,
  // }) async =>
  //     await auditTaskViewUsecase.scheduleLinkToPermit(
  //       scheduleId: scheduleId,
  //       permitId: permitId,
  //       isLoading: isLoading,
  //     );
  Future<Map<String, dynamic>?> setPmTask({
    int? scheduleId,
    bool? isLoading,
  }) async =>
      await auditTaskViewUsecase.setPmTask(
        scheduleId: scheduleId,
        isLoading: isLoading,
      );
  Future<bool> approvePmTaskExecution({
    approvetoJsonString,
    required bool isLoading,
  }) async {
    return auditTaskViewUsecase.approvePmTaskExecution(
      approvetoJsonString: approvetoJsonString,
      isLoading: isLoading,
    );
  }

  Future<bool> rejectPmTaskExecution({
    rejecttoJsonString,
    required bool isLoading,
  }) async {
    return auditTaskViewUsecase.rejectPmTaskExecution(
      rejecttoJsonString: rejecttoJsonString,
      isLoading: isLoading,
    );
  }

  Future<bool> closePmTaskExecution({
    closetoJsonString,
    required bool isLoading,
  }) async {
    return auditTaskViewUsecase.closePmTaskExecution(
      closetoJsonString: closetoJsonString,
      isLoading: isLoading,
    );
  }

  Future<List<MRSListByJobIdModel>?> getMrsListByModuleTask(
    taskId,
    isLoading,
  ) async =>
      await auditTaskViewUsecase.getMrsListByModuleTask(
        taskId: taskId,
        isLoading: isLoading,
      );
  Future<List<HistoryModel>?> getHistory(
    moduleType,
    id,
    isLoading,
  ) async =>
      await auditTaskViewUsecase.getHistory(
        moduleType: moduleType,
        id: id,
        isLoading: isLoading,
      );
  void saveValue({String? pmTaskId}) async {
    return auditTaskViewUsecase.saveValue(pmTaskId: pmTaskId);
  }

  Future<String?> getValue() async => await auditTaskViewUsecase.getValue();
  void clearValue() async => auditTaskViewUsecase.clearValue();
  void clearStoreData() async => auditTaskViewUsecase.clearStoreData();
  void clearTypeValue() async => auditTaskViewUsecase.clearTypeValue();
  void clearisCheckedValue() async =>
      auditTaskViewUsecase.clearisCheckedValue();
  void clearjobmodelValue() async => auditTaskViewUsecase.clearjobmodelValue();
  void clearpmTaskValue() async => auditTaskViewUsecase.clearpmTaskValue();
  void clearStoreTaskData() {
    auditTaskViewUsecase.clearStoreTaskData();
  }

  void clearStoreTaskActivityData() {
    auditTaskViewUsecase.clearStoreTaskActivityData();
  }

  void clearStoreTaskfromActorData() {
    auditTaskViewUsecase.clearStoreTaskfromActorData();
  }

  void clearStoreTasktoActorData() {
    auditTaskViewUsecase.clearStoreTasktoActorData();
  }

  void clearStoreTaskWhereUsedData() {
    auditTaskViewUsecase.clearStoreTaskWhereUsedData();
  }
}
