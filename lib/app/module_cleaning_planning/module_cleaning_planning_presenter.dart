import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/usecases/module_cleaning_planning_usecase.dart';

class ModuleCleaningPlanningPresenter {
  ModuleCleaningPlanningPresenter(this.moduleCleaningPlanningOrdersUsecase);
  ModuleCleaningPlanningUsecase moduleCleaningPlanningOrdersUsecase;
  Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await moduleCleaningPlanningOrdersUsecase.getFacilityList(
          isLoading: isLoading);
}
