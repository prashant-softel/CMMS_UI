import '../../domain/models/facility_model.dart';
import '../../domain/usecases/setting_dashboard_usecase.dart';

class SettingDashboardPresenter {
  SettingDashboardPresenter(this.settingDashboardUsecase);
  SettingDashboardUsecase settingDashboardUsecase;
  Future<List<FacilityModel?>?> getFacilityList() async =>
      await settingDashboardUsecase.getFacilityList();
  void clearValue() async => settingDashboardUsecase.clearValue();
}
