import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/usecases/breakdown_usecase.dart';
import 'package:cmms/domain/usecases/masters_usecase.dart';

class MastersPresenter {
  MastersPresenter(this.mastersUsecase);
  MastersUsecase mastersUsecase;

  Future<List<FacilityModel?>?> getFacilityList() async =>
      await mastersUsecase.getFacilityList();
}
