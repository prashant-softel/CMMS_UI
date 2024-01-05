import 'package:cmms/domain/models/pm_task_model.dart';

import '../../domain/usecases/audit_task_usecase.dart';

class AuditTaskPresenter {
  AuditTaskPresenter(this.auditTaskUsecase);
  AuditTaskUsecase auditTaskUsecase;
  Future<List<PmTaskListModel?>?> getPmTaskList(
          {int? facilityId,
          bool? isLoading,
          dynamic endDate,
          dynamic startDate}) async =>
      await auditTaskUsecase.getPmTaskList(
          facilityId: facilityId ?? 0,
          isLoading: isLoading ?? false,
          endDate: endDate,
          startDate: startDate);
  void clearValue() async => auditTaskUsecase.clearValue();
}
