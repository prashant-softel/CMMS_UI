import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/usecases/module_cleaning_list_plan_usecase.dart';

class ModuleCleaningListPlanPresenter {
  ModuleCleaningListPlanPresenter(this.moduleCleaningListPlanUsecase);
  ModuleCleaningListPlanUsecase moduleCleaningListPlanUsecase;
  Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await moduleCleaningListPlanUsecase.getFacilityList(isLoading: isLoading);
}
