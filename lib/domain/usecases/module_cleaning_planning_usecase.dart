import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/facility_model.dart';

class ModuleCleaningPlanningUsecase {
  final Repository repository;

  ModuleCleaningPlanningUsecase(this.repository);
  Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await repository.getFacilityList(isLoading);
}
