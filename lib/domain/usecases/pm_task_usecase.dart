import 'package:cmms/domain/models/pm_task_model.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:cmms/domain/repositories/repository.dart';

class PreventiveMaintenanceTaskUsecase {
  PreventiveMaintenanceTaskUsecase(this.repository);
  Repository repository;
  Future<List<PmTaskListModel?>?> getPmTaskList(
          {int? facilityId,
          bool? isLoading,
          dynamic endDate,
          dynamic startDate,
          bool? self_view,
          bool? isExport}) async =>
      await repository.getPmTaskList(
          facilityId, isLoading, startDate, endDate, isExport,self_view);
  void clearValue() async => repository.clearData(LocalKeys.pmTaskId);
  void clearValuetype() async => repository.clearData(LocalKeys.type);

  deletePmTask(
          {required Object task_id,
          required bool isLoading,
          int? facility_id}) async =>
      await repository.deletePmTask(task_id, isLoading, facility_id);
}
