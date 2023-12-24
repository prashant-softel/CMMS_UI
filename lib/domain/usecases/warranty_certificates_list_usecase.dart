import 'package:cmms/domain/domain.dart';

class WarrantyCertificatesListUsecase {
  final Repository _repository;

  WarrantyCertificatesListUsecase(this._repository);

  Future<void> generateToken() async {
    return await _repository.generateToken();
  }

  Future<List<InventoryModel>> inventoryList(
      {required bool isLoading,
      required int? facilityId,
      required int? categoryId}) async {
    return _repository.inventoryList(
        isLoading: isLoading, facilityId: facilityId, categoryId: categoryId);
  }
}
