import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/usecases/calender_view_dashboard_usecase.dart';
// ignore: unused_import
import 'package:cmms/domain/usecases/docVersion_dashboard_usecase.dart';

class CalendarViewDashbordPresenter {
  CalendarViewDashbordPresenter(this.calendarViewDashbordUsecase);
  CalendarViewDashbordUsecase calendarViewDashbordUsecase;

  Future<List<FacilityModel?>?> getFacilityList() async =>
      await calendarViewDashbordUsecase.getFacilityList();
  void clearValue() async => calendarViewDashbordUsecase.clearValue();
  void clearStoreUserIdData() async => calendarViewDashbordUsecase.clearStoreUserIdData();
}
