import 'package:cmms/domain/models/pm_task_model.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:cmms/domain/repositories/repository.dart';

class AuditTaskUsecase {
  AuditTaskUsecase(this.repository);
  Repository repository;
  Future<List<PmTaskListModel?>?> getAuditTaskList(
          {int? facilityId,
          bool? isLoading,
          bool? isExport,
          dynamic endDate,
          dynamic startDate,
          int? type}) async =>
      await repository.getAuditTaskList(
          facilityId, isLoading, isExport, startDate, endDate, type);
  void clearValue() async => repository.clearData(LocalKeys.auditTaskId);
  void clearTypeValue() async => repository.clearData(LocalKeys.type);

  void saveValue({String? type}) async =>
      repository.saveValue(LocalKeys.type, type);
  Future<String?> getValue() async =>
      await repository.getStringValue(LocalKeys.type);
}
