import 'package:cmms/domain/models/dashboard_model.dart';
import 'package:cmms/domain/models/module_model.dart';
import 'package:cmms/domain/models/view_doc_upload.dart';
import 'package:cmms/domain/usecases/calendar_view_usecase.dart';

class CalendarViewPresenter {
  CalendarViewPresenter(this.calendarViewUsecase);
  CalendarViewUsecase calendarViewUsecase;
  Future<List<DashboardModel?>?> getdashboardList({
    String? facilityId,
    dynamic endDate,
    dynamic startDate,
    bool? isLoading,String?moduleId
  }) async =>
      await calendarViewUsecase.getdashboardList(
        facilityId: facilityId ?? "",
        endDate: endDate,
        startDate: startDate,
        isLoading: isLoading ?? false,moduleId:moduleId,
      );
  Future<List<ModuleModel?>?> getModuleList({
    bool? isLoading,
  }) async =>
      await calendarViewUsecase.getModuleList(
        isLoading: isLoading ?? false,
      );
}
