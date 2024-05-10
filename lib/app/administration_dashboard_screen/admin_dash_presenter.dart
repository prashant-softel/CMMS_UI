import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/usecases/admin_dash_usercase.dart';

class AdminDashboardPresenter {
  AdminDashboardPresenter(this.adminDashboardUsecase);
  AdminDashboardUsecase adminDashboardUsecase;

  Future<List<FacilityModel?>?> getFacilityList(bool isLoading) async =>
      await adminDashboardUsecase.getFacilityList(isLoading);
}
