import 'package:cmms/domain/models/update_pm_task_execution_model.dart';
import 'package:flutter/services.dart';

import '../../domain/models/history_model.dart';
import '../../domain/models/pm_task_view_list_model.dart';
import '../../domain/usecases/view_audit_task_usecase.dart';

class ViewAuditTaskPresenter {
  ViewAuditTaskPresenter(this.viewAuditTaskUsecase);
  ViewAuditTaskUsecase viewAuditTaskUsecase;

  Future<Map<String, dynamic>?> auditTaskApprovedButton({
    auditTaskApproveJsonString,
    required bool isLoading,
  }) async {
    return viewAuditTaskUsecase.auditTaskApprovedButton(
      auditTaskApproveJsonString: auditTaskApproveJsonString,
      isLoading: isLoading,
    );
  }
void clearStoreData() async =>
      viewAuditTaskUsecase.clearStoreData();
  void clearTypeValue() async =>
      viewAuditTaskUsecase.clearTypeValue();
  void clearisCheckedValue() async =>
      viewAuditTaskUsecase.clearisCheckedValue();
  void clearjobmodelValue() async =>
      viewAuditTaskUsecase.clearjobmodelValue();
  void clearpmTaskValue() async =>
      viewAuditTaskUsecase.clearpmTaskValue();
 
  Future<Map<String, dynamic>?> auditTaskCloseButton({
    auditTaskCloseJsonString,
    required bool isLoading,
  }) async {
    return viewAuditTaskUsecase.auditTaskCloseButton(
      auditTaskCloseJsonString: auditTaskCloseJsonString,
      isLoading: isLoading,
    );
  }

  Future<PmFiles?> browseFiles(
      Uint8List? fileBytes, String fileName, bool isLoading) async {
    return await viewAuditTaskUsecase.browseFiles(
        fileBytes, fileName, isLoading);
    // return true;
  }

  Future<Map<String, dynamic>?> auditTaskCloseApproveButton({
    auditTaskCloseApproveJsonString,
    required bool isLoading,
  }) async {
    return viewAuditTaskUsecase.auditTaskCloseApproveButton(
      auditTaskCloseApproveJsonString: auditTaskCloseApproveJsonString,
      isLoading: isLoading,
    );
  }

  Future<Map<String, dynamic>?> auditTaskCloseRejectButton({
    auditTaskCloseRejectJsonString,
    required bool isLoading,
  }) async {
    return viewAuditTaskUsecase.auditTaskCloseRejectButton(
      auditTaskCloseRejectJsonString: auditTaskCloseRejectJsonString,
      isLoading: isLoading,
    );
  }

  Future<List<dynamic>> updateAuditTaskExecution({
    auditExecutionJsonString,
    required bool isLoading,
  }) async {
    return viewAuditTaskUsecase.updateAuditTaskExecution(
      auditExecutionJsonString: auditExecutionJsonString,
      isLoading: isLoading,
    );
  }

  Future<Map<String, dynamic>?> auditTaskRejectButton({
    auditTaskRejectJsonString,
    required bool isLoading,
  }) async {
    return viewAuditTaskUsecase.auditTaskRejectButton(
      auditTaskRejectJsonString: auditTaskRejectJsonString,
      isLoading: isLoading,
    );
  }

  Future<Map<String, dynamic>?> auditTaskSkipButton({
    auditTaskSkipJsonString,
    required bool isLoading,
  }) async {
    return viewAuditTaskUsecase.auditTaskSkipButton(
      auditTaskSkipJsonString: auditTaskSkipJsonString,
      isLoading: isLoading,
    );
  }

  Future<Map<String, dynamic>?> pmPlanRejectButton({
    pmPlanRejectJsonString,
    required bool isLoading,
  }) async {
    return viewAuditTaskUsecase.pmPlanRejectButton(
      pmPlanRejectJsonString: pmPlanRejectJsonString,
      isLoading: isLoading,
    );
  }

  Future<List<HistoryModel>?> getHistory(
    moduleType,
    id,
    isLoading,
  ) async =>
      await viewAuditTaskUsecase.getHistory(
        moduleType: moduleType,
        id: id,
        isLoading: isLoading,
      );
  Future<Map<String, dynamic>?> startAuditTask({
    int? auditTaskId,
    bool? isLoading,
  }) async =>
      await viewAuditTaskUsecase.startAuditTask(
        auditTaskId: auditTaskId,
        isLoading: isLoading,
      );
  Future<PmtaskViewModel?> getAuditTaskDetails({
    int? auditTaskId,
    bool? isLoading,
  }) async =>
      await viewAuditTaskUsecase.getAuditTaskDetails(
        auditTaskId: auditTaskId,
        isLoading: isLoading,
      );
  void saveTypeValue({String? type}) async {
    return viewAuditTaskUsecase.saveTypeValue(type: type);
  }

  Future<String?> getTypeValue() async =>
      await viewAuditTaskUsecase.getTypeValue();
  void saveValue({String? auditTaskId}) async {
    return viewAuditTaskUsecase.saveValue(auditTaskId: auditTaskId);
  }

  Future<String?> getValue() async => await viewAuditTaskUsecase.getValue();
}
