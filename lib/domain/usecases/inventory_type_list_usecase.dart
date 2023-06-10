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
      await repository.getInventoryCategoryList(
        auth,
        facilityId,
        isLoading,
      );
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
  Future<bool> createChecklistNumber({
    checklistJsonString,
    bool? isLoading,
  }) async =>
      await repository.createCheckListNumber(
          isLoading: isLoading, checklistJsonString: checklistJsonString);
  deleteCkecklist(
          {required Object checklist_id, required bool isLoading}) async =>
      await repository.deleteCkecklist(
        checklist_id,
        isLoading,
      );
  Future<bool> updateChecklistNumber({
    checklistJsonString,
    bool? isLoading,
  }) async =>
      await repository.updateChecklistNumber(
        isLoading: isLoading,
        checklistJsonString: checklistJsonString,
      );
}
