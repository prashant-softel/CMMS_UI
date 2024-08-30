import 'package:cmms/domain/domain.dart';

import '../models/facility_model.dart';

class BreakdownMaintenanceUsecase {
  final Repository repository;

  BreakdownMaintenanceUsecase(this.repository);

  Future<List<FacilityModel?>?> getFacilityList(isLoading) async =>
      await repository.getFacilityList(isLoading);

  void clearValue() async => repository.clearData(LocalKeys.permitId);
  void clearTypeValue() async => repository.clearData(LocalKeys.types);
  void clearisCheckedValue() async => repository.clearData(LocalKeys.isChecked);
  void clearjobmodelValue() async => repository.clearData(LocalKeys.jobModel);
  void clearpmTaskValue() async => repository.clearData(LocalKeys.pmTaskModel);
}
