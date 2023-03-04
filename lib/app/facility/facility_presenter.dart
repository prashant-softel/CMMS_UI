import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/usecases/facility_usecase.dart';

class FacilityPresenter {
  FacilityPresenter(this.facilityUsecase);
  FacilityUsecase facilityUsecase;

  Future<List<FacilityModel?>?> getFacilityList(isLoading) async =>
      await facilityUsecase.getFacilityList(isLoading);
}
