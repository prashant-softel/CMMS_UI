import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/usecases/statutory_usecase.dart';

class StatutoryPresenter {
  StatutoryPresenter(this.statutoryUsecase);
  StatutoryUsecase statutoryUsecase;

  ///

  Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await statutoryUsecase.getFacilityList(isLoading: isLoading);
}
