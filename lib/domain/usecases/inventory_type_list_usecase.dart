import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/models/inventory_type_list_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

import '../models/frequency_model.dart';

class InventoryTypeListUsecase {
  InventoryTypeListUsecase(this.repository);
  Repository repository;

  Future<List<InventoryCategoryModel?>?> getInventoryCategoryList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getInventoryCategoryList(auth, facilityId, isLoading, 0);
  Future<List<InventoryTypeListModel?>?> getInventoryTypeList({
    int? type,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getInventoryTypeList(
        facilityId,
        isLoading,
      );
  Future<List<FrequencyModel?>?> getFrequencyList({
    bool? isLoading,
  }) async =>
      await repository.getFrequencyList(
        isLoading,
      );
  Future<bool> createInventoryType({
    checklistJsonString,
    bool? isLoading,
  }) async =>
      await repository.createInventoryType(
          isLoading: isLoading, checklistJsonString: checklistJsonString);
  deleteInventoryType(
          {required Object checklist_id, required bool isLoading}) async =>
      await repository.deleteInventoryType(
        checklist_id,
        isLoading,
      );
  Future<bool> updateInventoryType({
    checklistJsonString,
    bool? isLoading,
  }) async =>
      await repository.updateInventoryType(
        isLoading: isLoading,
        checklistJsonString: checklistJsonString,
      );
}
