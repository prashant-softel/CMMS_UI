import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/usecases/breakdown_usecase.dart';

class BreakdownMaintenancePresenter {
  BreakdownMaintenancePresenter(this.breakdownMaintenanceUsecase);
  BreakdownMaintenanceUsecase breakdownMaintenanceUsecase;

  Future<List<FacilityModel?>?> getFacilityList(bool isLoading) async =>
      await breakdownMaintenanceUsecase.getFacilityList(isLoading);

  void clearValue() async => breakdownMaintenanceUsecase.clearValue();
  void clearTypeValue() async => breakdownMaintenanceUsecase.clearTypeValue();
  void clearisCheckedValue() async =>
      breakdownMaintenanceUsecase.clearisCheckedValue();
  void clearjobmodelValue() async => breakdownMaintenanceUsecase.clearjobmodelValue();
  void clearpmTaskValue() async => breakdownMaintenanceUsecase.clearpmTaskValue();
}

