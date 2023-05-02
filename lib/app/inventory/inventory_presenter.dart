import '../../domain/models/facility_model.dart';
import '../../domain/usecases/inventory_usecase.dart';

class InventoryPresenter {
  InventoryPresenter(this.inventoryUsecase);
  InventoryUsecase inventoryUsecase;
  Future<List<FacilityModel?>?> getFacilityList() async =>
      await inventoryUsecase.getFacilityList();
}
