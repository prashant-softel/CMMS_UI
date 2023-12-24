import 'package:cmms/domain/models/inventory_model.dart';
import 'package:cmms/domain/usecases/inventory_list_usecase.dart';

import '../../domain/models/facility_model.dart';

class InventoryListPresenter {
  InventoryListPresenter(this.inventoryListUsecase);
  InventoryListUsecase inventoryListUsecase;

  Future<void> generateToken() async {
    return await inventoryListUsecase.generateToken();
  }

  Future<List<InventoryModel>> inventoryList({
    required bool isLoading,
    required int? facilityId,
  }) async {
    return inventoryListUsecase.inventoryList(
      isLoading: isLoading,
      facilityId: facilityId,
    );

    ///
  }

  void clearValueimportType() async =>
      inventoryListUsecase.clearValueimportType();

  Future<List<InventoryModel>> getInventoryAssetsList({
    required bool isLoading,
    required int? facility_id,
  }) async {
    return inventoryListUsecase.getInventoryAssetsList(
      isLoading: isLoading,
      facility_id: facility_id,
    );
  }

  Future<List<FacilityModel?>?> getFacilityList() async =>
      await inventoryListUsecase.getFacilityList();
}
