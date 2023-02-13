import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/inventory_category_model.dart';

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

  Future<List<InventoryTypeModel>> getInventoryTypeList({
    required bool isLoading,
    required int facilityId,
  }) async {
    return _repository.getInventoryTypeList(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }

  Future<List<InventoryCategoryModel>> getInventoryCategoryList({
    required bool isLoading,
    required int facilityId,
  }) async {
    return _repository.getInventoryCategoryList(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }

  Future<List<InventoryTypeModel>> getInventoryStatusList({
    required bool isLoading,
    required int facilityId,
  }) async {
    return _repository.getInventoryStatusList(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }

  Future<List<BusinessModel>> getBusinessList({
    required bool isLoading,
    required int businessType,
  }) async {
    return _repository.getBusinessList(
      isLoading: isLoading,
      businessType: businessType,
    );
  }

  Future<ResponseModel> addInventory({
    required AddInventoryRequestModel requestBody,
    required bool isLoading,
  }) async {
    return _repository.addInventory(
      requestBody: requestBody,
      isLoading: isLoading,
    );
  }
}
