import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/pm_task_view_list_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

import '../repositories/local_storage_keys.dart';

class ViewAuditTaskUsecase {
  ViewAuditTaskUsecase(this.repository);
  Repository repository;

  Future<Map<String, dynamic>> auditTaskApprovedButton({
    auditTaskApproveJsonString,
    bool? isLoading,
  }) async =>
      await repository.auditTaskApprovedButton(
        auditTaskApproveJsonString,
        isLoading,
      );
  Future<Map<String, dynamic>> auditTaskCloseButton({
    auditTaskCloseJsonString,
    bool? isLoading,
  }) async =>
      await repository.auditTaskCloseButton(
        auditTaskCloseJsonString,
        isLoading,
      );
  Future<Map<String, dynamic>> auditTaskCloseApproveButton({
    auditTaskCloseApproveJsonString,
    bool? isLoading,
  }) async =>
      await repository.auditTaskCloseApproveButton(
        auditTaskCloseApproveJsonString,
        isLoading,
      );
  Future<Map<String, dynamic>> auditTaskCloseRejectButton({
    auditTaskCloseRejectJsonString,
    bool? isLoading,
  }) async =>
      await repository.auditTaskCloseRejectButton(
        auditTaskCloseRejectJsonString,
        isLoading,
      );
  Future<List<dynamic>> updateAuditTaskExecution({
    auditExecutionJsonString,
    bool? isLoading,
  }) async =>
      await repository.updateAuditTaskExecution(
        auditExecutionJsonString,
        isLoading,
      );
  Future<Map<String, dynamic>> auditTaskRejectButton({
    auditTaskRejectJsonString,
    bool? isLoading,
  }) async =>
      await repository.auditTaskRejectButton(
        auditTaskRejectJsonString,
        isLoading,
      );
  Future<Map<String, dynamic>> auditTaskSkipButton({
    auditTaskSkipJsonString,
    bool? isLoading,
  }) async =>
      await repository.auditTaskSkipButton(
        auditTaskSkipJsonString,
        isLoading,
      );
  Future<Map<String, dynamic>> pmPlanRejectButton({
    pmPlanRejectJsonString,
    bool? isLoading,
  }) async =>
      await repository.pmPlanRejectButton(
        pmPlanRejectJsonString,
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
        0,
        isLoading,
      );
  Future<Map<String, dynamic>?> startAuditTask({
    int? auditTaskId,
    bool? isLoading,
  }) async =>
      await repository.startAuditTask(
        auditTaskId,
        isLoading,
      );
  Future<PmtaskViewModel?> getAuditTaskDetails({
    int? auditTaskId,
    bool? isLoading,
  }) async =>
      await repository.getAuditTaskDetails(
        auditTaskId,
        isLoading,
      );
  void saveValue({String? auditTaskId}) async =>
      repository.saveValue(LocalKeys.auditTaskId, auditTaskId);
  Future<String?> getValue() async =>
      await repository.getStringValue(LocalKeys.auditTaskId);
}
