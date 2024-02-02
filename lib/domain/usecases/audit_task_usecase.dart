import 'package:cmms/domain/models/pm_task_model.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:cmms/domain/repositories/repository.dart';

class AuditTaskUsecase {
  AuditTaskUsecase(this.repository);
  Repository repository;
  Future<List<PmTaskListModel?>?> getAuditTaskList(
          {int? facilityId,
          bool? isLoading,
          dynamic endDate,
          dynamic startDate}) async =>
      await repository.getAuditTaskList(
          facilityId, isLoading, startDate, endDate);
  void clearValue() async => repository.clearData(LocalKeys.auditTaskId);
}
