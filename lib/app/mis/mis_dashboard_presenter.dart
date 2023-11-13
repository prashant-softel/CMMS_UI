import 'package:cmms/domain/models/facility_model.dart';

import 'package:cmms/domain/usecases/list_of_observation_usecase.dart';

class ListOfObservationPresenter {
  ListOfObservationPresenter(this.listOfObservationUsecase);
  ListOfObservationUsecase listOfObservationUsecase;

  Future<List<FacilityModel?>?> getFacilityList(bool isLoading) async =>
      await listOfObservationUsecase.getFacilityList(isLoading);
}
