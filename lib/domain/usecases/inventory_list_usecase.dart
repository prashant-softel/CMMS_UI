import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/facility_model.dart';

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

  Future<List<FacilityModel?>?> getFacilityList() async =>
      await _repository.getFacilityList(true);
  Future<List<InventoryModel>> getInventoryAssetsList({
    required bool isLoading,
    required int? facility_id,
  }) async {
    return _repository.getInventoryAssetsList(
      isLoading: isLoading,
      facility_id: facility_id,
    );
  }
}
