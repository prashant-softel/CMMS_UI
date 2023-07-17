import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/models/inventory_status_list_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

import '../models/frequency_model.dart';
import '../models/inventory_category_model2.dart';

class InventoryCategoryListUsecase {
  InventoryCategoryListUsecase(this.repository);
  Repository repository;

  Future<List<InventoryCategoryModel2?>?> getInventoryCategoryList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getInventoryCategory2List(
        auth,
        facilityId,
        isLoading,
      );
  Future<List<InventoryStatusListModel?>?> getInventoryStatusList({
    int? type,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getInventoryStatusList(
        facilityId,
        isLoading,
      );
  Future<List<FrequencyModel?>?> getFrequencyList({
    bool? isLoading,
  }) async =>
      await repository.getFrequencyList(
        isLoading,
      );
  Future<bool> createInventoryCategory({
    checklistJsonString,
    bool? isLoading,
  }) async =>
      await repository.createInventoryCategory(
          isLoading: isLoading, checklistJsonString: checklistJsonString);
  deleteInventoryCategory(
          {required Object checklist_id, required bool isLoading}) async =>
      await repository.deleteInventoryCategory(
        checklist_id,
        isLoading,
      );
  Future<bool> updateInventoryCategory({
    checklistJsonString,
    bool? isLoading,
  }) async =>
      await repository.updateInventoryCategory(
        isLoading: isLoading,
        checklistJsonString: checklistJsonString,
      );
}
