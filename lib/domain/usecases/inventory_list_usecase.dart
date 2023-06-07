import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/add_inventory_details_model.dart';

class InventoryListUsecase {
  final Repository _repository;

  InventoryListUsecase(this._repository);

  Future<void> generateToken() async {
    return await _repository.generateToken();
  }

  Future<List<InventoryModel>> inventoryList({
    required bool isLoading,
    required int? facilityId,
  }) async {
    return _repository.inventoryList(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }
}
