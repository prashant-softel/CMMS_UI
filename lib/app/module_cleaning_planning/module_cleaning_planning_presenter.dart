import 'package:cmms/domain/models/employee_model.dart';
import 'package:cmms/domain/models/get_pm_plan_detail_model.dart';
import 'package:cmms/domain/models/inventory_category_model.dart';
import '../../domain/models/equipment_list_model.dart';
import '../../domain/models/frequency_model.dart';
import '../../domain/models/inventory_model.dart';
import '../../domain/models/preventive_checklist_model.dart';
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
  Future<List<InventoryCategoryModel?>?> getInventoryCategoryList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await moduleCleaningPlanningUsecase.getInventoryCategoryList();
  Future<Map<String, dynamic>?> createPmPlan({
    createPmPlanJsonString,
    required bool isLoading,
  }) async {
    return moduleCleaningPlanningUsecase.createPmPlan(
      createPmPlanJsonString: createPmPlanJsonString,
      isLoading: isLoading,
    );
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

  Future<List<PreventiveCheckListModel?>?> getPreventiveCheckListForPm(
          {int? facilityId,
          int? type,
          bool? isLoading,
          int? frequencyid,
          int? categoryId}) async =>
      await moduleCleaningPlanningUsecase.getPreventiveCheckListForPm(
          facilityId: facilityId ?? 0,
          type: type,
          isLoading: isLoading ?? false,
          categoryId: categoryId,
          frequencyid: frequencyid);
  Future<List<EmployeeModel?>?> getAssignedToList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await moduleCleaningPlanningUsecase.getAssignedToList(
        auth: auth ?? "",
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );
  Future<PMPlanDetail?> getPmPlanDetails({
    int? pmPlanId,
    bool? isLoading,
  }) async =>
      await moduleCleaningPlanningUsecase.getPmPlanDetails(
        pmPlanId: pmPlanId,
        isLoading: isLoading,
      );
}
