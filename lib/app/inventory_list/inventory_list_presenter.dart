import 'package:cmms/domain/models/add_inventory_details_model.dart';
import 'package:cmms/domain/models/inventory_model.dart';
import 'package:cmms/domain/usecases/inventory_list_usecase.dart';

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
}
