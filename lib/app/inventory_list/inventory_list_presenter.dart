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
  void clearValue() async => inventoryListUsecase.clearValue();
  Future<List<InventoryModel>> getInventoryAssetsList({
    required bool isLoading,
    required int? facility_id,
    bool? isExport,
  }) async {
    return inventoryListUsecase.getInventoryAssetsList(
        isLoading: isLoading, facility_id: facility_id, isExport: isExport);
  }

  Future<List<FacilityModel?>?> getFacilityList() async =>
      await inventoryListUsecase.getFacilityList();
}
