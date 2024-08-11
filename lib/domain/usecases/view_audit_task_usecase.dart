import 'package:cmms/domain/models/employee_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/pm_task_view_list_model.dart';
import 'package:cmms/domain/models/update_pm_task_execution_model.dart';
import 'package:cmms/domain/repositories/repository.dart';
import 'package:flutter/services.dart';

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
  void clearStoreData() async => repository.clearData(LocalKeys.permitId);
  void clearTypeValue() async => repository.clearData(LocalKeys.types);
  void clearisCheckedValue() async => repository.clearData(LocalKeys.isChecked);
  void clearjobmodelValue() async => repository.clearData(LocalKeys.jobModel);
  void clearpmTaskValue() async => repository.clearData(LocalKeys.pmTaskModel);
  void clearPermitStoreData() async => repository.clearData(LocalKeys.permitId);

  Future<Map<String, dynamic>> auditTaskCloseButton({
    auditTaskCloseJsonString,
    closePtwJsonString,
    bool? ptw_req,
    bool? isLoading,
  }) async =>
      await repository.auditTaskCloseButton(
        auditTaskCloseJsonString,
        closePtwJsonString,
        ptw_req,
        isLoading,
      );
  Future<PmFiles?> browseFiles(
      Uint8List? fileBytes, String fileName, bool isLoading) async {
    return await repository.browsePmFiles(
      fileBytes,
      fileName,
      isLoading,
    );
    // return true;
  }

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
  void saveTypeValue({String? type}) async =>
      repository.saveValue(LocalKeys.type, type);
  Future<String?> getTypeValue() async =>
      await repository.getStringValue(LocalKeys.type);

  void saveValue({String? auditTaskId}) async =>
      repository.saveValue(LocalKeys.auditTaskId, auditTaskId);
  Future<String?> getValue() async =>
      await repository.getStringValue(LocalKeys.auditTaskId);
  Future<bool> assignToAuditTask({
    int? assignId,
    int? taskId,
    required bool isLoading,
  }) async =>
      await repository.assignAuditTask(
        assignId: assignId,
        taskId: taskId,
        isLoading: isLoading,
      );
  Future<List<EmployeeModel?>?> getAssignedToListWOAttend({
    String? auth,
    int? facilityId,
    int? featureId,
    int? isattendanceneeded,
    bool? isLoading,
  }) async =>
      await repository.getAssignedToListWOAttend(
        auth,
        facilityId,
        featureId,
        isattendanceneeded,
        isLoading,
      );
}
