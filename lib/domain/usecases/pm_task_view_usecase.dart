import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/employee_model.dart';
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
}
