import 'package:cmms/domain/models/inventory_status_list_model.dart';

import '../../domain/models/frequency_model.dart';
import '../../domain/usecases/inventory_status_list_usecase.dart';

class InventoryStatusListPresenter {
  InventoryStatusListPresenter(this.inventoryStatusListUsecase);
  InventoryStatusListUsecase inventoryStatusListUsecase;

  // Future<List<InventoryCategoryModel?>?> getInventoryCategoryList({
  //   bool? isLoading,
  // }) async =>
  //     await inventoryStatusListUsecase.getInventoryCategoryList(
  //       isLoading: isLoading ?? false,
  //     );
  Future<List<InventoryStatusListModel?>?> getInventoryStatusList({
    int? facilityId,
    int? type,
    bool? isLoading,
  }) async =>
      await inventoryStatusListUsecase.getInventoryStatusList(
        facilityId: facilityId ?? 0,
        type: type,
        isLoading: isLoading ?? false,
      );
  Future<List<FrequencyModel?>?> getFrequencyList({
    bool? isLoading,
  }) async =>
      await inventoryStatusListUsecase.getFrequencyList(
        isLoading: isLoading ?? false,
      );
  Future<bool> createInventoryStatus({
    checklistJsonString,
    required bool isLoading,
  }) async {
    print("presenter");
    inventoryStatusListUsecase.createInventoryStatus(
      checklistJsonString: checklistJsonString,
      isLoading: isLoading,
    );
    return true;
  }

  deleteInventoryStatus(String? checklist_id, {required bool isLoading}) async =>
      await inventoryStatusListUsecase.deleteInventoryStatus(
        checklist_id: checklist_id ?? 0,
        isLoading: isLoading,
      );
  Future<bool> updateInventoryStatus(
      {checklistJsonString, required bool isLoading, checklistId}) async {
    print("presenter");
    inventoryStatusListUsecase.updateInventoryStatus(
      checklistJsonString: checklistJsonString,
      isLoading: isLoading,
    );
    return true;
  }
}
