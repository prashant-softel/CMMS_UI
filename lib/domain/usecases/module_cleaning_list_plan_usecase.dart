import 'package:cmms/domain/domain.dart';

import '../models/facility_model.dart';

class ModuleCleaningListPlanUsecase {
  Repository repository;

  ModuleCleaningListPlanUsecase(this.repository);
  Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await repository.getFacilityList(isLoading);
}
