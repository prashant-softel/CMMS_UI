import 'package:cmms/domain/models/frequency_model.dart';
import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/models/inventory_model.dart';

import 'package:cmms/domain/repositories/repository.dart';

class CreatePmPlanUsecase {
  CreatePmPlanUsecase(this.repository);
  Repository repository;
  Future<List<InventoryModel?>?> inventoryList({
    required bool isLoading,
    required int? facilityId,
  }) async {
    return repository.inventoryList(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }

  Future<List<FrequencyModel?>?> getFrequencyList({
    bool? isLoading,
  }) async =>
      await repository.getFrequencyList(
        isLoading,
      );
  Future<List<InventoryCategoryModel?>?> getInventoryCategoryList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getInventoryCategoryList(
        auth,
        facilityId,
        isLoading,
      );
  Future<Map<String, dynamic>> createPmPlan({
    createPmPlanJsonString,
    bool? isLoading,
  }) async =>
      await repository.createPmPlan(
        createPmPlanJsonString,
        isLoading,
      );
}
