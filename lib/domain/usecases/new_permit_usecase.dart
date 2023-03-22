import 'package:cmms/domain/domain.dart';

import '../models/facility_model.dart';

class NewPermitUsecase {
   final Repository _repository;

  NewPermitUsecase(this._repository);

  Future<List<FacilityModel?>?> getFacilityList() async =>
      await _repository.getFacilityList(true);
}
