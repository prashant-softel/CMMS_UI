import 'package:cmms/domain/domain.dart';

import '../models/facility_model.dart';

class MisDashboardUsecase {
  final Repository _repository;

  MisDashboardUsecase(this._repository);

  Future<List<FacilityModel?>?> getFacilityList(isLoading) async =>
      await _repository.getFacilityList(isLoading);
  void clearValue() async => _repository.clearData(LocalKeys.type);
}
