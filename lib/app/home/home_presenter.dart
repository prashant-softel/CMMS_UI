import 'package:cmms/domain/domain.dart';

class HomePresenter {
  HomePresenter(this.homeUsecase);
  HomeUsecase homeUsecase;

  Future<void> generateToken() async {
    return homeUsecase.generateToken();
  }

  Future<List<InventoryList>> getInventoryList({
    required bool isLoading,
  }) async {
    return homeUsecase.getInventoryList(isLoading: isLoading);
  }

  Future<List<Block>> getBlockList({
    required bool isLoading,
    required String facilityId,
  }) async {
    return homeUsecase.getBlockList(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }

  Future<List<Equipment>> getEquipmentList({
    required bool isLoading,
    required String facilityId,
  }) async {
    return homeUsecase.getEquipmentList(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }
}
