import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/usecases/check_list_of_observation_usecase.dart';

class CheckListOfObservationPresenter {
  CheckListOfObservationPresenter(this.checkListOfObservationUsecase);
  CheckListOfObservationUsecase checkListOfObservationUsecase;

  ///

  Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await checkListOfObservationUsecase.getFacilityList(isLoading: isLoading);
}
