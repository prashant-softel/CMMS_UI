import 'package:cmms/domain/models/inventory_category_model.dart';
import '../../domain/models/frequency_model.dart';
import '../../domain/models/inventory_model.dart';
import '../../domain/usecases/create_pm_plan_usecase.dart';

class CreatePmPlanPresenter {
  CreatePmPlanPresenter(this.createPmPlanUsecase);
  CreatePmPlanUsecase createPmPlanUsecase;
  Future<List<InventoryModel?>?> inventoryList({
    required bool isLoading,
    required int? facilityId,
  }) async {
    return createPmPlanUsecase.inventoryList(
      isLoading: isLoading,
      facilityId: facilityId,
    );
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
}
