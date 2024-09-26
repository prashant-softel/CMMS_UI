import 'package:cmms/domain/models/dashboard_model.dart';
import 'package:cmms/domain/models/module_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

class CalendarViewUsecase {
  Repository repository;
  CalendarViewUsecase(this.repository);
  Future<List<DashboardModel?>?> getdashboardList({
    String? facilityId,
    dynamic endDate,
    dynamic startDate,
    bool? isLoading,
  }) async =>
      await repository.getdashboardList(
        facilityId: facilityId,
        endDate: endDate,
        startDate: startDate,
        isLoading: isLoading,
      );
  Future<List<ModuleModel?>?> getModuleList({
    bool? isLoading,
  }) async =>
      await repository.getModule(
        isLoading,
      );
}
