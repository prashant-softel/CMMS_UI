import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/module_cleaning_list_plan_model.dart';
import 'package:cmms/domain/usecases/module_cleaning_list_plan_usecase.dart';

class ModuleCleaningListPlanPresenter {
  ModuleCleaningListPlanPresenter(this.moduleCleaningListPlanUsecase);
  ModuleCleaningListPlanUsecase moduleCleaningListPlanUsecase;
  Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await moduleCleaningListPlanUsecase.getFacilityList(isLoading: isLoading);
  Future<List<ModuleCleaningListPlanModel>> getModuleCleaningListPlan({
    required bool isLoading,
    bool? isExport,
    required int? facility_id,
  }) async {
    return moduleCleaningListPlanUsecase.getModuleCleaningListPlan(
      isLoading: isLoading,
      facility_id: facility_id,
      isExport: isExport
    );
  }

  void clearValueMcId() async => moduleCleaningListPlanUsecase.clearValueMcId();
  void clearValuePlanId() async =>
      moduleCleaningListPlanUsecase.clearValuePlanId();
}
