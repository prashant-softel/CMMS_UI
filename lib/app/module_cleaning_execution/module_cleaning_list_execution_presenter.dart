import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/mc_task_list_model.dart';
import 'package:cmms/domain/usecases/module_cleaning_list_execution_usecase.dart';

class ModuleCleaningListExecutionPresenter {
  ModuleCleaningListExecutionPresenter(this.moduleCleaningExecutionPlanUsecase);
  ModuleCleaningListExecutionUsecase moduleCleaningExecutionPlanUsecase;

   Future<List<MCTaskListModel>> getMCTaskList({
    required bool isLoading,
    required int? facility_id,
   
  }) async {
    return moduleCleaningExecutionPlanUsecase.getMCTaskList(
      isLoading: isLoading,
      facility_id: facility_id,
    );
  }

  Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await moduleCleaningExecutionPlanUsecase.getFacilityList(
          isLoading: isLoading);
}
