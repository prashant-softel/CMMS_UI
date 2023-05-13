import 'package:cmms/domain/models/inventory_type_list_model.dart';

import '../../domain/models/frequency_model.dart';
import '../../domain/models/inventory_category_model.dart';
import '../../domain/usecases/inventory_type_list_usecase.dart';

class InventoryTypeListPresenter {
  InventoryTypeListPresenter(this.inventoryTypeListUsecase);
  InventoryTypeListUsecase inventoryTypeListUsecase;

  Future<List<InventoryCategoryModel?>?> getInventoryCategoryList({
    bool? isLoading,
  }) async =>
      await inventoryTypeListUsecase.getInventoryCategoryList(
        isLoading: isLoading ?? false,
      );
  Future<List<InventoryTypeListModel?>?> getInventoryTypeList({
    int? facilityId,
    int? type,
    bool? isLoading,
  }) async =>
      await inventoryTypeListUsecase.getInventoryTypeList(
        facilityId: facilityId ?? 0,
        type: type,
        isLoading: isLoading ?? false,
      );
  Future<List<FrequencyModel?>?> getFrequencyList({
    bool? isLoading,
  }) async =>
      await inventoryTypeListUsecase.getFrequencyList(
        isLoading: isLoading ?? false,
      );
  Future<bool> createChecklistNumber({
    checklistJsonString,
    required bool isLoading,
  }) async {
    print("presenter");
    inventoryTypeListUsecase.createChecklistNumber(
      checklistJsonString: checklistJsonString,
      isLoading: isLoading,
    );
    return true;
  }

  deleteCkecklist(String? checklist_id, {required bool isLoading}) async =>
      await inventoryTypeListUsecase.deleteCkecklist(
        checklist_id: checklist_id ?? 0,
        isLoading: isLoading,
      );
  Future<bool> updateChecklistNumber(
      {checklistJsonString, required bool isLoading, checklistId}) async {
    print("presenter");
    inventoryTypeListUsecase.updateChecklistNumber(
      checklistJsonString: checklistJsonString,
      isLoading: isLoading,
    );
    return true;
  }
}
