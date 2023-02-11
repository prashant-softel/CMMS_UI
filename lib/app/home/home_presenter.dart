import 'package:cmms/domain/domain.dart';

import '../../domain/models/inventory_model.dart';

class HomePresenter {
  HomePresenter(this.homeUsecase);
  HomeUsecase homeUsecase;

  Future<void> generateToken() async {
    return homeUsecase.generateToken();
  }

  Future<List<InventoryModel>> getInventoryList({
    required bool isLoading,
    required int facilityId,
    required int categoryId,
  }) async {
    return homeUsecase.getInventoryList(
      isLoading: isLoading,
      facilityId: facilityId,
      categoryId: categoryId,
    );
  }

  Future<List<BlockModel>> getBlockList({
    required bool isLoading,
    required String facilityId,
  }) async {
    return homeUsecase.getBlockList(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }

  Future<List<EquipmentModel>> getEquipmentList({
    required bool isLoading,
    required String facilityId,
  }) async {
    return homeUsecase.getEquipmentList(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }
}
