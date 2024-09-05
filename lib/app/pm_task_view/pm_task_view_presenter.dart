import 'package:cmms/domain/models/employee_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/mrs_list_by_jobId.dart';
import 'package:cmms/domain/models/new_permit_list_model.dart';
import 'package:cmms/domain/models/pm_task_view_list_model.dart';

import '../../domain/usecases/pm_task_view_usecase.dart';

class PreventiveMaintenanceTaskViewPresenter {
  PreventiveMaintenanceTaskViewPresenter(
      this.preventiveMaintenanceTaskViewUsecase);
  PreventiveMaintenanceTaskViewUsecase preventiveMaintenanceTaskViewUsecase;
  Future<PmtaskViewModel?> getPmtaskViewList({
    int? scheduleId,
    required int facilityId,
    bool? isloading,
  }) async =>
      await preventiveMaintenanceTaskViewUsecase.getPmtaskViewList(
        scheduleId: scheduleId,
        facilityId: facilityId,
        isLoading: isloading,
      );
  Future<List<NewPermitModel?>?> getPermitList({
    int? facilityId,
    bool? selfView,
    bool? isLoading,
  }) async =>
      await preventiveMaintenanceTaskViewUsecase.getPermitList(
        facilityId: facilityId,
        selfView: selfView,
        isLoading: isLoading,
      );

  Future<List<EmployeeModel?>?> getAssignedToListWOAttend({
    String? auth,
    int? facilityId,
    int? featureId,
    int? isattendanceneeded,
    bool? isLoading,
  }) async =>
      await preventiveMaintenanceTaskViewUsecase.getAssignedToListWOAttend(
        auth: auth ?? "",
        facilityId: facilityId ?? 0,
        featureId: featureId ?? 0,
        isattendanceneeded: isattendanceneeded ?? 0,
        isLoading: isLoading ?? false,
      );

  // Future<Map<String, dynamic>?> scheduleLinkToPermit({
  //   int? scheduleId,
  //   int? permitId,
  //   bool? isLoading,
  // }) async =>
  //     await preventiveMaintenanceTaskViewUsecase.scheduleLinkToPermit(
  //       scheduleId: scheduleId,
  //       permitId: permitId,
  //       isLoading: isLoading,
  //     );
  Future<Map<String, dynamic>?> setPmTask(
          {int? scheduleId, bool? isLoading, int? facility_id}) async =>
      await preventiveMaintenanceTaskViewUsecase.setPmTask(
          scheduleId: scheduleId,
          isLoading: isLoading,
          facility_id: facility_id);
  Future<bool> approvePmTaskExecution({
    approvetoJsonString,
    required bool isLoading,
  }) async {
    return preventiveMaintenanceTaskViewUsecase.approvePmTaskExecution(
      approvetoJsonString: approvetoJsonString,
      isLoading: isLoading,
    );
  }

  Future<bool> CancelPMTask({
    CancelPMTaskJsonString,
    closePtwJsonString,
    required bool isLoading,
    required bool shouldClosePermit,
  }) async {
    return preventiveMaintenanceTaskViewUsecase.CancelPMTask(
      CancelPMTaskJsonString: CancelPMTaskJsonString,
      closePtwJsonString: closePtwJsonString,
      shouldClosePermit:shouldClosePermit,
      isLoading: isLoading,
    );
  }

  Future<bool> rejectPmTaskExecution({
    rejecttoJsonString,
    required bool isLoading,
  }) async {
    return preventiveMaintenanceTaskViewUsecase.rejectPmTaskExecution(
      rejecttoJsonString: rejecttoJsonString,
      isLoading: isLoading,
    );
  }

  Future<bool> closePmTaskExecution(
      {closetoJsonString, required bool isLoading, closePtwJsonString}) async {
    return preventiveMaintenanceTaskViewUsecase.closePmTaskExecution(
      closetoJsonString: closetoJsonString,
      closePtwJsonString: closePtwJsonString,
      isLoading: isLoading,
    );
  }

  Future<bool> assignToPmTask(
      {int? assignId,
      int? taskId,
      required bool isLoading,
      int? facility_id}) async {
    return preventiveMaintenanceTaskViewUsecase.assignToPmTask(
        assignId: assignId,
        taskId: taskId,
        isLoading: isLoading,
        facility_id: facility_id);
  }

  Future<List<MRSListByJobIdModel>?> getMrsListByModuleTask(
    taskId,
    isLoading,
  ) async =>
      await preventiveMaintenanceTaskViewUsecase.getMrsListByModuleTask(
        taskId: taskId,
        isLoading: isLoading,
      );
  Future<List<HistoryModel>?> getHistory(
    moduleType,
    id,
    facilityId,
    isLoading,
  ) async =>
      await preventiveMaintenanceTaskViewUsecase.getHistory(
        moduleType: moduleType,
        id: id,
        facilityId: facilityId,
        isLoading: isLoading,
      );
  void saveValue({String? pmTaskId}) async {
    return preventiveMaintenanceTaskViewUsecase.saveValue(pmTaskId: pmTaskId);
  }

  Future<String?> getValue() async =>
      await preventiveMaintenanceTaskViewUsecase.getValue();
  void clearValue() async => preventiveMaintenanceTaskViewUsecase.clearValue();
  void clearStoreData() async =>
      preventiveMaintenanceTaskViewUsecase.clearStoreData();
  void clearTypeValue() async =>
      preventiveMaintenanceTaskViewUsecase.clearTypeValue();
  void clearisCheckedValue() async =>
      preventiveMaintenanceTaskViewUsecase.clearisCheckedValue();
  void clearjobmodelValue() async =>
      preventiveMaintenanceTaskViewUsecase.clearjobmodelValue();
  void clearpmTaskValue() async =>
      preventiveMaintenanceTaskViewUsecase.clearpmTaskValue();
  void clearStoreTaskData() {
    preventiveMaintenanceTaskViewUsecase.clearStoreTaskData();
  }

  void clearStoreTaskActivityData() {
    preventiveMaintenanceTaskViewUsecase.clearStoreTaskActivityData();
  }

  void clearStoreTaskfromActorData() {
    preventiveMaintenanceTaskViewUsecase.clearStoreTaskfromActorData();
  }

  void clearStoreTasktoActorData() {
    preventiveMaintenanceTaskViewUsecase.clearStoreTasktoActorData();
  }

  void clearStoreTaskWhereUsedData() {
    preventiveMaintenanceTaskViewUsecase.clearStoreTaskWhereUsedData();
  }

  void clearStoreDataJobId() async =>
      preventiveMaintenanceTaskViewUsecase.clearStoreDataJobId();
  void clearPermitStoreData() async =>
      preventiveMaintenanceTaskViewUsecase.clearPermitStoreData();
}
