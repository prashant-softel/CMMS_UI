import 'package:cmms/domain/domain.dart';

import '../models/facility_model.dart';

class AuditUsecase {
  final Repository _repository;

  AuditUsecase(this._repository);

  Future<List<FacilityModel?>?> getFacilityList() async =>
      await _repository.getFacilityList(true);
  void clearValue() async => _repository.clearData(LocalKeys.type);
}
