import 'package:cmms/domain/domain.dart';

import '../models/facility_model.dart';

class BreakdownMaintenanceUsecase {
   final Repository _repository;

  BreakdownMaintenanceUsecase(this._repository);

  Future<List<FacilityModel?>?> getFacilityList() async =>
      await _repository.getFacilityList(true);
}
