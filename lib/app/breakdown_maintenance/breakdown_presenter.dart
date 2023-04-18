import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/usecases/breakdown_usecase.dart';

class BreakdownMaintenancePresenter {
  BreakdownMaintenancePresenter(this.breakdownMaintenanceUsecase);
  BreakdownMaintenanceUsecase breakdownMaintenanceUsecase;

  Future<List<FacilityModel?>?> getFacilityList() async =>
      await breakdownMaintenanceUsecase.getFacilityList();
}
