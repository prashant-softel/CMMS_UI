import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/usecases/observation_list_usecase.dart';

class ObservationListPresenter {
  ObservationListPresenter(this.observationListUsecase);
  ObservationListUsecase observationListUsecase;

  ///

  Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await observationListUsecase.getFacilityList(isLoading: isLoading);
}
