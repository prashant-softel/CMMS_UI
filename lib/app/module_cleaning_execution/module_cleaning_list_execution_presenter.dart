import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/mc_task_list_model.dart';
import 'package:cmms/domain/usecases/module_cleaning_list_execution_usecase.dart';

class ModuleCleaningListExecutionPresenter {
  ModuleCleaningListExecutionPresenter(this.moduleCleaningExecutionPlanUsecase);
  ModuleCleaningListExecutionUsecase moduleCleaningExecutionPlanUsecase;

  Future<List<MCTaskListModel>> getMCTaskList({
    required bool isLoading,
    bool? isExport,
    required int? facility_id,
    String? start_date,
    required String end_date,
  }) async {
    return moduleCleaningExecutionPlanUsecase.getMCTaskList(
      isLoading: isLoading,
      isExport: isExport,
      facility_id: facility_id,
      start_date: start_date,
      end_date: end_date,
    );
  }

  Future<Map<String, dynamic>?> abandonExecutionButton(
      {abandoneJsonString, required bool isLoading, int? facility_id}) async {
    return moduleCleaningExecutionPlanUsecase.abandonExecutionButton(
        abandoneJsonString: abandoneJsonString,
        isLoading: isLoading,
        facility_id: facility_id);
  }

  Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await moduleCleaningExecutionPlanUsecase.getFacilityList(
          isLoading: isLoading);
  void clearValueMcId() async =>
      moduleCleaningExecutionPlanUsecase.clearValueMcId();
  void clearValuePlanId() async =>
      moduleCleaningExecutionPlanUsecase.clearValuePlanId();
}
