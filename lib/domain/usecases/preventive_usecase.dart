import 'package:cmms/domain/domain.dart';

import '../models/facility_model.dart';

class PreventiveUsecase {
  final Repository _repository;

  PreventiveUsecase(this._repository);

  Future<List<FacilityModel?>?> getFacilityList() async =>
      await _repository.getFacilityList(true);
  void clearValue() async => _repository.clearData(LocalKeys.type);
  void clearValueimportType() async =>
      _repository.clearData(LocalKeys.importType);
}
