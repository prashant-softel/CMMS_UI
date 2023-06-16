import 'package:cmms/domain/models/pm_task_model.dart';

import '../../domain/usecases/pm_task_usecase.dart';

class PreventiveMaintenanceTaskPresenter {
  PreventiveMaintenanceTaskPresenter(this.preventiveMaintenanceTaskUsecase);
  PreventiveMaintenanceTaskUsecase preventiveMaintenanceTaskUsecase;
  Future<List<PmTaskListModel?>?> getPmTaskList(
          {int? facilityId,
          bool? isLoading,
          dynamic endDate,
          dynamic startDate}) async =>
      await preventiveMaintenanceTaskUsecase.getPmTaskList(
          facilityId: facilityId ?? 0,
          isLoading: isLoading ?? false,
          endDate: endDate,
          startDate: startDate);
}
