import 'package:cmms/domain/models/inventory_status_list_model.dart';

import '../../domain/models/frequency_model.dart';
import '../../domain/models/inventory_category_model.dart';
import '../../domain/models/inventory_category_model2.dart';
import '../../domain/usecases/inventory_category_list_usecase.dart';
import '../../domain/usecases/inventory_status_list_usecase.dart';

class InventoryCategoryListPresenter {
  InventoryCategoryListPresenter(this.inventoryStatusListUsecase);
  InventoryCategoryListUsecase inventoryStatusListUsecase;

  Future<List<InventoryCategoryModel2?>?> getInventoryCategoryList({
    bool? isLoading,
  }) async =>
      await inventoryStatusListUsecase.getInventoryCategoryList(
        isLoading: isLoading ?? false,
      );
  // Future<List<InventoryStatusListModel?>?> getInventoryStatusList({
  //   int? facilityId,
  //   int? type,
  //   bool? isLoading,
  // }) async =>
  //     await inventoryStatusListUsecase.getInventoryStatusList(
  //       facilityId: facilityId ?? 0,
  //       type: type,
  //       isLoading: isLoading ?? false,
  //     );
  Future<List<FrequencyModel?>?> getFrequencyList({
    bool? isLoading,
  }) async =>
      await inventoryStatusListUsecase.getFrequencyList(
        isLoading: isLoading ?? false,
      );
  Future<bool> createInventoryCategory({
    checklistJsonString,
    required bool isLoading,
  }) async {
    print("presenter");
    inventoryStatusListUsecase.createInventoryCategory(
      checklistJsonString: checklistJsonString,
      isLoading: isLoading,
    );
    return true;
  }

  deleteInventoryCategory(String? checklist_id, {required bool isLoading}) async =>
      await inventoryStatusListUsecase.deleteInventoryCategory(
        checklist_id: checklist_id ?? 0,
        isLoading: isLoading,
      );
  Future<bool> updateInventoryCategory(
      {checklistJsonString, required bool isLoading, checklistId}) async {
    print("presenter");
    inventoryStatusListUsecase.updateInventoryCategory(
      checklistJsonString: checklistJsonString,
      isLoading: isLoading,
    );
    return true;
  }
}
