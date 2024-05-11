import 'package:cmms/domain/models/employee_model.dart';
import 'package:cmms/domain/models/get_pm_plan_detail_model.dart';
import 'package:cmms/domain/models/inventory_category_model.dart';
import '../../domain/models/frequency_model.dart';
import '../../domain/models/inventory_model.dart';
import '../../domain/models/preventive_checklist_model.dart';
import '../../domain/usecases/create_pm_plan_usecase.dart';

class CreatePmPlanPresenter {
  CreatePmPlanPresenter(this.createPmPlanUsecase);
  CreatePmPlanUsecase createPmPlanUsecase;
  Future<List<InventoryModel?>?> inventoryList(
      {required bool isLoading, int? facilityId, int? categoryId}) async {
    return createPmPlanUsecase.inventoryList(
        isLoading: isLoading, facilityId: facilityId, categoryId: categoryId);
  }

  Future<List<FrequencyModel?>?> getFrequencyList({
    bool? isLoading,
  }) async =>
      await createPmPlanUsecase.getFrequencyList(
        isLoading: isLoading ?? false,
      );
  Future<List<InventoryCategoryModel?>?> getInventoryCategoryList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await createPmPlanUsecase.getInventoryCategoryList();
  Future<Map<String, dynamic>?> createPmPlan({
    createPmPlanJsonString,
    required bool isLoading,
  }) async {
    return createPmPlanUsecase.createPmPlan(
      createPmPlanJsonString: createPmPlanJsonString,
      isLoading: isLoading,
    );
  }

  Future<Map<String, dynamic>?> updatePmPlan({
    createPmPlanJsonString,
    required bool isLoading,
  }) async {
    return createPmPlanUsecase.updatePmPlan(
      createPmPlanJsonString: createPmPlanJsonString,
      isLoading: isLoading,
    );
  }

  Future<List<PreventiveCheckListModel?>?> getPreventiveCheckListForPm(
          {int? facilityId,
          int? type,
          bool? isLoading,
          int? frequencyid,
          int? categoryId}) async =>
      await createPmPlanUsecase.getPreventiveCheckListForPm(
          facilityId: facilityId ?? 0,
          type: type,
          isLoading: isLoading ?? false,
          categoryId: categoryId,
          frequencyid: frequencyid);
  Future<List<EmployeeModel?>?> getAssignedToEmployee({
    String? auth,
    int? facilityId,
    int? featureId,
    bool? isLoading,
  }) async =>
      await createPmPlanUsecase.getAssignedToEmployee(
        auth: auth ?? "",
        facilityId: facilityId ?? 0,
        featureId: featureId,
        isLoading: isLoading ?? false,
      );
  Future<PMPlanDetail?> getPmPlanDetails({
    int? pmPlanId,
    required int facilityId,
    bool? isLoading,
  }) async =>
      await createPmPlanUsecase.getPmPlanDetails(
        pmPlanId: pmPlanId,
        isLoading: isLoading,
        facilityId: facilityId
      );
  void saveValue({String? pmPlanId}) async {
    return createPmPlanUsecase.saveValue(pmPlanId: pmPlanId);
  }

  Future<String?> getValue() async => await createPmPlanUsecase.getValue();
}
