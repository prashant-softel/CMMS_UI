import 'package:cmms/domain/domain.dart';

import '../models/facility_model.dart';

class InventoryUsecase {
  final Repository _repository;

  InventoryUsecase(this._repository);

  Future<List<FacilityModel?>?> getFacilityList() async =>
      await _repository.getFacilityList(true);
}
