import 'package:cmms/domain/models/pm_task_model.dart';

import '../../domain/usecases/pm_task_usecase.dart';

class PreventiveMaintenanceTaskPresenter {
  PreventiveMaintenanceTaskPresenter(this.preventiveMaintenanceTaskUsecase);
  PreventiveMaintenanceTaskUsecase preventiveMaintenanceTaskUsecase;
  Future<List<PmTaskListModel?>?> getPmTaskList(
          {int? facilityId,
          bool? isLoading,
          dynamic endDate,
          dynamic startDate,
          bool? isExport,
          bool? self_view
          }) async =>
      await preventiveMaintenanceTaskUsecase.getPmTaskList(
          facilityId: facilityId ?? 0,
          isLoading: isLoading ?? false,
          endDate: endDate,
          startDate: startDate,
           self_view: self_view,
          isExport: isExport);
  void clearValue() async => preventiveMaintenanceTaskUsecase.clearValue();
  void clearValuetype() async =>
      preventiveMaintenanceTaskUsecase.clearValuetype();

  deletePmTask(String? task_id, int? facility_id,
          {required bool isLoading}) async =>
      await preventiveMaintenanceTaskUsecase.deletePmTask(
          task_id: task_id ?? 0,
          isLoading: isLoading,
          facility_id: facility_id);
}
