import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/models/inventory_status_list_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

import '../models/frequency_model.dart';

class InventoryStatusListUsecase {
  InventoryStatusListUsecase(this.repository);
  Repository repository;

  Future<List<InventoryCategoryModel?>?> getInventoryCategoryList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getInventoryCategoryList(auth, facilityId, isLoading, 0);
  Future<List<InventoryStatusListModel?>?> getInventoryStatusList({
    int? type,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getInventoryStatusList(
        // facilityId,
        isLoading,
      );
  Future<List<FrequencyModel?>?> getFrequencyList({
    bool? isLoading,
  }) async =>
      await repository.getFrequencyList(
        isLoading,
      );
  Future<bool> createInventoryStatus({
    checklistJsonString,
    bool? isLoading,
  }) async =>
      await repository.createInventoryStatus(
          isLoading: isLoading, checklistJsonString: checklistJsonString);
  deleteInventoryStatus(
          {required Object checklist_id, required bool isLoading}) async =>
      await repository.deleteInventoryStatus(
        checklist_id,
        isLoading,
      );
  Future<bool> updateInventoryStatus({
    checklistJsonString,
    bool? isLoading,
  }) async =>
      await repository.updateInventoryStatus(
        isLoading: isLoading,
        checklistJsonString: checklistJsonString,
      );
}
