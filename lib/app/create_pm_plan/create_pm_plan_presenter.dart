import 'package:cmms/domain/models/get_asset_data_list_model.dart';
import 'package:cmms/domain/models/inventory_category_model.dart';

import '../../domain/models/frequency_model.dart';
import '../../domain/usecases/create_pm_plan_usecase.dart';

class CreatePmPlanPresenter {
  CreatePmPlanPresenter(this.createPmPlanUsecase);
  CreatePmPlanUsecase createPmPlanUsecase;
  Future<List<GetAssetDataModel?>?> getAssetList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await createPmPlanUsecase.getAssetList(
        auth: auth ?? "",
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );
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
