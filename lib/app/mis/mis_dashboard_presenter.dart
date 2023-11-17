import 'package:cmms/domain/models/facility_model.dart';

import 'package:cmms/domain/usecases/mis_dashboard_usecase.dart';

class MisDashboardPresenter {
  MisDashboardPresenter(this.misDashboardUsecase);
  MisDashboardUsecase misDashboardUsecase;

  Future<List<FacilityModel?>?> getFacilityList(bool isLoading) async =>
      await misDashboardUsecase.getFacilityList(isLoading);
  void clearValue() async => misDashboardUsecase.clearValue();
}
