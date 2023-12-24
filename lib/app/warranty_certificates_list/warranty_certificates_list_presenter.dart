import 'package:cmms/domain/models/inventory_model.dart';
import 'package:cmms/domain/usecases/inventory_list_usecase.dart';
import 'package:cmms/domain/usecases/warranty_certificates_list_usecase.dart';

class WarrantyCertificatesListPresenter {
  WarrantyCertificatesListPresenter(this.inventoryListUsecase);
  WarrantyCertificatesListUsecase inventoryListUsecase;

  Future<void> generateToken() async {
    return await inventoryListUsecase.generateToken();
  }

  Future<List<InventoryModel>> inventoryList(
      {required bool isLoading,
      required int? facilityId,
      required int? categoryId}) async {
    return inventoryListUsecase.inventoryList(
        isLoading: isLoading, facilityId: facilityId, categoryId: categoryId);

    ///
  }
}
