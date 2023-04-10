import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/business_list_model.dart';
import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/models/user_access_model.dart';
import 'package:cmms/domain/models/warranty_claim_model.dart';

import '../models/facility_model.dart';

class HomeUsecase {
  final Repository _repository;

  HomeUsecase(this._repository);

  Future<void> generateToken() async {
    return await _repository.generateToken();
  }

  Future<List<InventoryModel>> getInventoryList({
    required bool isLoading,
    required int? facilityId,
    int? blockId,
    required String categoryIds,
  }) async {
    return _repository.getInventoryList(
      isLoading: isLoading,
      facilityId: facilityId,
      blockId: blockId,
      categoryIds: categoryIds,
    );
  }

  Future<List<BusinessListModel>> getBusinessList({
    required bool isLoading,
    required int? businessType,
    int? blockId,
    required String categoryIds,
  }) async {
    return _repository.getBusinessList(
      isLoading: isLoading,
      businessType: 5,
      blockId: blockId,
      categoryIds: categoryIds,
    );
  }

   Future<List<InventoryCategoryModel?>?> getInventoryCategoryList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await _repository.getInventoryCategoryList(
        auth,
        facilityId,
        isLoading,
      );

  Future<List<WarrantyClaimModel>> getWarrantyClaimList({
    required bool isLoading,
    required int? facilityId,
    int? blockId,
    required String categoryIds,
  }) async {
    return _repository.getWarrantyClaimList(
      isLoading: isLoading,
      facilityId: 45,
      blockId: blockId,
      categoryIds: categoryIds,
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

  Future<List<FacilityModel?>?> getFacilityList() async =>
      await _repository.getFacilityList(true);
  Future<String?> getUserAccessList() async =>
      await _repository.getUserAccessData(LocalKeys.userAccess);
}
