import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

class FacilityUsecase {
  FacilityUsecase(this.repository);
  Repository repository;

  Future<List<FacilityModel?>?> getFacilityList(isLoading) async =>
      await repository.getFacilityList(isLoading);
}
