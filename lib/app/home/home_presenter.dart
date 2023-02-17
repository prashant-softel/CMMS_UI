import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/inventory_category_model.dart';

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

  Future<List<InventoryTypeModel>> getInventoryTypeList({
    required bool isLoading,
    required int facilityId,
  }) async {
    return homeUsecase.getInventoryTypeList(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }

  Future<List<InventoryCategoryModel>> getInventoryCategoryList({
    required bool isLoading,
    required int facilityId,
  }) async {
    return homeUsecase.getInventoryCategoryList(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }

  Future<List<InventoryTypeModel>> getInventoryStatusList({
    required bool isLoading,
    required int facilityId,
  }) async {
    return homeUsecase.getInventoryStatusList(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }

  Future<List<BusinessModel>> getBusinessList({
    required bool isLoading,
    required int businessType,
  }) async {
    return homeUsecase.getBusinessList(
      isLoading: isLoading,
      businessType: businessType,
    );
  }

  Future<CommonResponseModel> addInventory({
    required AddInventoryRequestModel requestBody,
    required bool isLoading,
  }) async {
    return homeUsecase.addInventory(
      requestBody: requestBody,
      isLoading: isLoading,
    );
  }

  Future<List<InventoryDetailsModel>> inventoryDetails({
    required int inventoryId,
    required bool isLoading,
  }) async {
    return homeUsecase.inventoryDetails(
      inventoryId: inventoryId,
      isLoading: isLoading,
    );
  }


  Future<CommonResponseModel> updateInventory({
    required AddInventoryRequestModel requestBody,
    required bool isLoading,
  }) async {
    return homeUsecase.updateInventory(
      requestBody: requestBody,
      isLoading: isLoading,
    );
  }
}
