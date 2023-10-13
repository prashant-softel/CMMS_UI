import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/module_cleaning_list_plan_model.dart';

import '../models/facility_model.dart';

class HotoListScreenUsecase {
  Repository repository;

  HotoListScreenUsecase(this.repository);
  Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await repository.getFacilityList(isLoading);
      Future<List<ModuleCleaningListPlanModel>> getModuleCleaningListPlan({
    required bool isLoading,
    required int? facility_id,
  }) async {
    return repository.getModuleCleaningListPlan(
      isLoading: isLoading,
      facility_id: facility_id,
    );
  }
  
}
