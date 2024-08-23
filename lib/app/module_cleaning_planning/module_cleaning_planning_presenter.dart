import 'package:cmms/domain/models/employee_model.dart';
import 'package:cmms/domain/models/mc_details_plan_model.dart';
import '../../domain/models/equipment_list_model.dart';
import '../../domain/models/frequency_model.dart';
import '../../domain/models/inventory_model.dart';
import '../../domain/usecases/module_cleaning_planning_usecase.dart';

class ModuleCleaningPlanningPresenter {
  ModuleCleaningPlanningPresenter(this.moduleCleaningPlanningUsecase);
  ModuleCleaningPlanningUsecase moduleCleaningPlanningUsecase;
  Future<List<InventoryModel?>?> inventoryList(
      {required bool isLoading, int? facilityId, int? categoryId}) async {
    return moduleCleaningPlanningUsecase.inventoryList(
        isLoading: isLoading, facilityId: facilityId, categoryId: categoryId);
  }

  Future<List<FrequencyModel?>?> getFrequencyList({
    bool? isLoading,
  }) async =>
      await moduleCleaningPlanningUsecase.getFrequencyList(
        isLoading: isLoading ?? false,
      );
  Future<Map<String, dynamic>?> createMcPlan(
      {createMcPlans, required bool isLoading, int? facilityId}) async {
    return moduleCleaningPlanningUsecase.createMcPlan(
      createMcPlans: createMcPlans,
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }

  Future<Map<String, dynamic>?> updateMcPlan(
      {updateMcPlans, required bool isLoading, int? facility_id}) async {
    return moduleCleaningPlanningUsecase.updateMcPlan(
        updateMcPlans: updateMcPlans,
        isLoading: isLoading,
        facility_id: facility_id);
  }

  Future<List<EquipmentListModel>> getEquipmentModelList({
    required bool isLoading,
    required int? facilityId,
  }) async {
    return moduleCleaningPlanningUsecase.getEquipmentModelList(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }

  Future<List<EmployeeModel?>?> getAssignedToList({
    String? auth,
    int? facilityId,
    int? featureId,
    bool? isLoading,
  }) async =>
      await moduleCleaningPlanningUsecase.getAssignedToList(
        auth: auth ?? "",
        facilityId: facilityId ?? 0,
        featureId: featureId ?? 0,
        isLoading: isLoading ?? false,
      );
  Future<McPalningDetailsModel?> getMcPlanDetail({
    bool? isLoading,
    required int planId,
    required int facilityId,
  }) async {
    return moduleCleaningPlanningUsecase.getMcPlanDetail(
      planId: planId,
      facilityId: facilityId,
      isLoading: isLoading ?? false,
    );
  }

  void saveValueMcId({String? mcid}) async {
    return moduleCleaningPlanningUsecase.saveValueMcId(mcid: mcid);
  }

  Future<String?> getValueMcId() async =>
      await moduleCleaningPlanningUsecase.getValueMcId();
  void saveValuePlanId({String? planId}) async {
    return moduleCleaningPlanningUsecase.saveValuePlanId(planId: planId);
  }

  Future<String?> getValuePlanId() async =>
      await moduleCleaningPlanningUsecase.getValuePlanId();
}
