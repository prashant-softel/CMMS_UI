import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/usecases/module_cleaning_list_execution_usecase.dart';

class ModuleCleaningListExecutionPresenter {
  ModuleCleaningListExecutionPresenter(this.moduleCleaningExecutionPlanUsecase);
  ModuleCleaningListExecutionUsecase moduleCleaningExecutionPlanUsecase;
  Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await moduleCleaningExecutionPlanUsecase.getFacilityList(
          isLoading: isLoading);
}
