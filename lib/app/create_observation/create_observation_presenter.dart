import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/usecases/create_observation_usecase%20copy.dart';

class CreateObservationPresenter {
  CreateObservationPresenter(this.createObservationUsecase);
  CreateObservationUsecase createObservationUsecase;

  ///

  Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await createObservationUsecase.getFacilityList(isLoading: isLoading);
}
