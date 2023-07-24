import 'package:cmms/domain/domain.dart';

import '../models/facility_model.dart';

class SettingDashboardUsecase {
  final Repository _repository;

  SettingDashboardUsecase(this._repository);

  Future<List<FacilityModel?>?> getFacilityList() async =>
      await _repository.getFacilityList(true);
}
