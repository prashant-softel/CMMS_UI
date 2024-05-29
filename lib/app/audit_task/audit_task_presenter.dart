import 'package:cmms/domain/models/pm_task_model.dart';

import '../../domain/usecases/audit_task_usecase.dart';

class AuditTaskPresenter {
  AuditTaskPresenter(this.auditTaskUsecase);
  AuditTaskUsecase auditTaskUsecase;
  Future<List<PmTaskListModel?>?> getAuditTaskList(
          {int? facilityId,
          bool? isLoading,
          bool? isExport,
          dynamic endDate,
          dynamic startDate}) async =>
      await auditTaskUsecase.getAuditTaskList(
          facilityId: facilityId ?? 0,
          isLoading: isLoading ?? false,
          isExport: isExport,
          endDate: endDate,
          startDate: startDate);
  void clearValue() async => auditTaskUsecase.clearValue();
  void clearTypeValue() async => auditTaskUsecase.clearTypeValue();

  void saveValue({String? type}) async {
    return auditTaskUsecase.saveValue(type: type);
  }

  Future<String?> getValue() async => await auditTaskUsecase.getValue();
}
