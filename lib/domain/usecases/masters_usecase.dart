import 'package:cmms/domain/domain.dart';

import '../models/facility_model.dart';

class MastersUsecase {
   final Repository _repository;

  MastersUsecase(this._repository);

  Future<List<FacilityModel?>?> getFacilityList() async =>
      await _repository.getFacilityList(true);
}
