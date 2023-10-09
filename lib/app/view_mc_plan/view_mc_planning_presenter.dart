import 'package:cmms/domain/models/employee_model.dart';
import 'package:cmms/domain/models/get_pm_plan_detail_model.dart';
import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/usecases/view_mc_planing_usecase.dart';
import '../../domain/models/equipment_list_model.dart';
import '../../domain/models/frequency_model.dart';
import '../../domain/models/inventory_model.dart';
import '../../domain/models/preventive_checklist_model.dart';

class ViewMcPlaningPresenter {
  ViewMcPlaningPresenter(this.viewMcPlaningUsecase);
  ViewMcPlaningUsecase viewMcPlaningUsecase;
  Future<List<InventoryModel?>?> inventoryList(
      {required bool isLoading, int? facilityId, int? categoryId}) async {
    return viewMcPlaningUsecase.inventoryList(
        isLoading: isLoading, facilityId: facilityId, categoryId: categoryId);
  }

  Future<List<FrequencyModel?>?> getFrequencyList({
    bool? isLoading,
  }) async =>
      await viewMcPlaningUsecase.getFrequencyList(
        isLoading: isLoading ?? false,
      );
  Future<List<InventoryCategoryModel?>?> getInventoryCategoryList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await viewMcPlaningUsecase.getInventoryCategoryList();
  Future<Map<String, dynamic>?> createPmPlan({
    createPmPlanJsonString,
    required bool isLoading,
  }) async {
    return viewMcPlaningUsecase.createPmPlan(
      createPmPlanJsonString: createPmPlanJsonString,
      isLoading: isLoading,
    );
  }

  Future<List<EquipmentListModel>> getEquipmentModelList({
    required bool isLoading,
    required int? facilityId,
  }) async {
    return viewMcPlaningUsecase.getEquipmentModelList(
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
      await viewMcPlaningUsecase.getPreventiveCheckListForPm(
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
      await viewMcPlaningUsecase.getAssignedToList(
        auth: auth ?? "",
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );
  Future<PMPlanDetail?> getPmPlanDetails({
    int? pmPlanId,
    bool? isLoading,
  }) async =>
      await viewMcPlaningUsecase.getPmPlanDetails(
        pmPlanId: pmPlanId,
        isLoading: isLoading,
      );
}
