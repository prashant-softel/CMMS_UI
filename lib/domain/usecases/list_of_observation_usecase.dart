import 'package:cmms/domain/domain.dart';

import '../models/facility_model.dart';

class ListOfObservationUsecase {
  final Repository _repository;

  ListOfObservationUsecase(this._repository);

  Future<List<FacilityModel?>?> getFacilityList(isLoading) async =>
      await _repository.getFacilityList(isLoading);
}
