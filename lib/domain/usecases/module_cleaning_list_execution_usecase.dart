import 'package:cmms/domain/domain.dart';

import '../models/facility_model.dart';

class ModuleCleaningListExecutionUsecase {
  Repository repository;

  ModuleCleaningListExecutionUsecase(this.repository);
  Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await repository.getFacilityList(isLoading);
}
