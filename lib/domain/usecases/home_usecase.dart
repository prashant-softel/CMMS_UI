import 'package:cmms/domain/domain.dart';

import '../models/inventory_model.dart';

class HomeUsecase {
  final Repository _repository;

  HomeUsecase(this._repository);

  Future<void> generateToken() async {
    return _repository.generateToken();
  }

  Future<List<InventoryModel>> getInventoryList({
    required bool isLoading,
    required int facilityId,
    required int categoryId,
  }) async {
    return _repository.getInventoryList(
      isLoading: isLoading,
      facilityId: facilityId,
      categoryId: categoryId,
    );
  }

  Future<List<BlockModel>> getBlockList({
    required bool isLoading,
    required String facilityId,
  }) async {
    return _repository.getBlockList(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }

  Future<List<EquipmentModel>> getEquipmentList({
    required bool isLoading,
    required String facilityId,
  }) async {
    return _repository.getEquipmentList(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }
}
