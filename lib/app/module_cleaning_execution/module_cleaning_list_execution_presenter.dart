import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/mc_task_list_model.dart';
import 'package:cmms/domain/usecases/module_cleaning_list_execution_usecase.dart';

class ModuleCleaningListExecutionPresenter {
  ModuleCleaningListExecutionPresenter(this.moduleCleaningExecutionPlanUsecase);
  ModuleCleaningListExecutionUsecase moduleCleaningExecutionPlanUsecase;

   Future<List<MCTaskListModel>> getMCTaskList({
    required bool isLoading,
    required int? facility_id,
    String? start_date,
    required String end_date,
   
  }) async {
    return moduleCleaningExecutionPlanUsecase.getMCTaskList(
      isLoading: isLoading,
      facility_id: facility_id,
      start_date: start_date,
      end_date: end_date,
    );
  }

  Future<void> startMCExecutionButton({
    int? planId,
    bool? isLoading,
  }) async =>
      await moduleCleaningExecutionPlanUsecase.startMCExecutionButton(
        planId: planId,
        isLoading: isLoading ?? false,
      );

  Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await moduleCleaningExecutionPlanUsecase.getFacilityList(
          isLoading: isLoading);
}
