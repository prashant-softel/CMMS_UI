import '../../domain/models/facility_model.dart';
import '../../domain/usecases/preventive_usecase.dart';

class PreventivePresenter {
  PreventivePresenter(this.preventiveUsecase);
  PreventiveUsecase preventiveUsecase;
  Future<List<FacilityModel?>?> getFacilityList() async =>
      await preventiveUsecase.getFacilityList();
}
