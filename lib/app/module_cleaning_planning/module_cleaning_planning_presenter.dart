import 'package:cmms/domain/models/equipment_list_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/frequency_model.dart';
import 'package:cmms/domain/usecases/module_cleaning_planning_usecase.dart';

class ModuleCleaningPlanningPresenter {
  ModuleCleaningPlanningPresenter(this.moduleCleaningPlanningOrdersUsecase);
  ModuleCleaningPlanningUsecase moduleCleaningPlanningOrdersUsecase;
  Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await moduleCleaningPlanningOrdersUsecase.getFacilityList(
          isLoading: isLoading);
  Future<List<FrequencyModel?>?> getFrequencyList({
    bool? isLoading,
  }) async =>
      await moduleCleaningPlanningOrdersUsecase.getFrequencyList(
        isLoading: isLoading ?? false,
      );

  Future<List<EquipmentListModel>> getEquipmentModelList({
    required bool isLoading,
    required int? facilityId,
  }) async {
    return moduleCleaningPlanningOrdersUsecase.getEquipmentModelList(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }
}
