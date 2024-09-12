import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/add_inventory_details_model.dart';
import 'package:cmms/domain/models/add_inventory_model.dart';

import 'package:cmms/domain/models/business_list_model.dart';
import 'package:cmms/domain/models/business_type_model.dart';
import 'package:cmms/domain/models/currency_list_model.dart';
import 'package:cmms/domain/models/employee_list_model.dart';
import 'package:cmms/domain/models/frequency_model.dart';
import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/models/inventory_status_list_model.dart';
import 'package:cmms/domain/models/inventory_type_list_model.dart';
import 'package:cmms/domain/models/manufacturer_model.dart';
import 'package:cmms/domain/models/safety_measure_list_model.dart';
import 'package:cmms/domain/models/supplier_name_model.dart';
import 'package:cmms/domain/models/type_permit_model.dart';
import 'package:cmms/domain/models/warranty_claim_model.dart';
import 'package:cmms/domain/models/warranty_type_model.dart';
import 'package:cmms/domain/models/warranty_usage_term_list_model.dart';
import 'package:flutter/foundation.dart';

import '../models/facility_model.dart';

class AddInventoryUsecase {
  final Repository repository;

  AddInventoryUsecase(this.repository);

  Future<void> generateToken() async {
    return await repository.generateToken();
  }

  Future<AddInventoryDetailsModel?> getAddInventoryDetail({
    bool? isLoading,
    required int id,
  }) async =>
      await repository.getAddInventoryDetail(
        id: id,
        isLoading: isLoading ?? false,
      );

  Future<List<InventoryModel>> getInventoryList({
    required bool isLoading,
    required int? facilityId,
    int? blockId,
    required String categoryIds,
  }) async {
    return repository.getInventoryList(
      isLoading: isLoading,
      facilityId: facilityId,
      blockId: blockId,
      categoryIds: categoryIds,
    );
  }

  Future<AddInventoryRequestModel?> uploadImgeInventory(
      Uint8List? fileBytes, String fileName, bool isLoading) async {
    return await repository.uploadImgeInventory(
      fileBytes,
      fileName,
      isLoading,
    );
    //  return true;
  }

// getmanufacturerList
  Future<List<ManufacturerModel>> getmanufacturerList({
    required bool isLoading,
    required int? BusinessType,
  }) async {
    return repository.getmanufacturerList(
      isLoading: isLoading,
      BusinessType: BusinessType,
    );
  }

  //getSupplierNameModelList
  Future<List<SupplierNameModel>> getSupplierList({
    required bool isLoading,
    required int? BusinessType,
  }) async {
    return repository.getSupplierList(
      isLoading: isLoading,
      BusinessType: BusinessType,
    );
  }

  void saveValue({String? inventoryId}) async =>
      repository.saveValue(LocalKeys.inventoryId, inventoryId);

  Future<String?> getValue() async =>
      await repository.getStringValue(LocalKeys.inventoryId);

  Future<List<BlockModel?>?> getBlocksList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getBlocksList(
        auth,
        facilityId,
        isLoading,
      );
  Future<List<InventoryStatusListModel?>?> getInventoryStatusList({
    required bool isLoading,
    // required int facilityId,
  }) async {
    return repository.getInventoryStatusList(isLoading);
  }

  Future<List<FrequencyModel?>?> getFrequencyList({
    bool? isLoading,
  }) async =>
      await repository.getFrequencyList(
        isLoading,
      );
  Future<List<InventoryTypeListModel?>?> getInventoryTypeList({
    required bool isLoading,
    required int facilityId,
  }) async {
    return repository.getInventoryTypeList(facilityId, isLoading);
  }

  Future<List<TypePermitModel?>?> getTypePermitList(
          bool? isLoading, int? facility_id) async =>
      await repository.getTypePermitList(isLoading, facility_id);

  Future<List<SafetyMeasureListModel>> getSafetyMeasureList(
      {required bool isLoading, required int? permit_type_id}) async {
    return repository.getSafetyMeasureList(
      isLoading: isLoading,
      permit_type_id: permit_type_id,
    );
  }

  Future<List<BusinessListModel>> getBusinessList({
    required bool isLoading,
    required int facilityId,
    required int? businessType,
  }) async {
    return repository.getBusinessList(
        isLoading: isLoading,
        businessType: businessType,
        facilityId: facilityId);
  }

  Future<List<CurrencyListModel>> getUnitCurrencyList(
      {required bool isLoading, required int? facilityId}) async {
    return repository.getUnitCurrencyList(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }

  Future<List<BusinessTypeModel>> getBusinessTypeList({
    required int? businessType,
    required bool isLoading,
  }) async =>
      await repository.getBusinessTypeList(
        businessType: businessType,
        isLoading: isLoading,
      );
  Future<List<BusinessListModel>> getVenderNameList({
    required bool isLoading,
    required int facilityId,
    required int? businessType,
  }) async {
    return repository.getBusinessList(
      isLoading: isLoading,
      facilityId: facilityId,
      businessType: businessType,
    );
  }

  Future<List<EmployeeListModel>> getEmployeeList(
      {required bool isLoading, required int? facility_id}) async {
    return repository.getEmployeeList(
      isLoading: isLoading,
      facility_id: facility_id,
    );
  }

  Future<List<InventoryCategoryModel?>?> getInventoryCategoryList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getInventoryCategoryList(
        auth,
        facilityId,
        isLoading,
      );

  Future<List<WarrantyTypeModel?>?> getWarrantyTypeList({
    bool? isLoading,
  }) async =>
      await repository.getWarrantyTypeList(
        isLoading,
      );

  //
  Future<List<WarrantyUsageTermListModel?>?> getWarrantyUsageTermList({
    bool? isLoading,
  }) async =>
      await repository.getWarrantyUsageTermList(
        isLoading,
      );
  Future<List<WarrantyClaimModel>> getWarrantyClaimList({
    required bool isLoading,
    required int? facilityId,
    int? blockId,
    required String categoryIds,
    String? start_date,
    required String end_date,
  }) async {
    return repository.getWarrantyClaimList(
      isLoading: isLoading,
      facilityId: facilityId,
      blockId: blockId,
      categoryIds: categoryIds,
      start_date: start_date,
      end_date: end_date,
    );
  }

  Future<List<BlockModel>> getBlockList({
    required bool isLoading,
    required String facilityId,
  }) async {
    return repository.getBlockList(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }

  Future<List<EquipmentModel>> getEquipmentList({
    required bool isLoading,
    required String facilityId,
  }) async {
    return repository.getEquipmentList(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }

  Future<List<FacilityModel?>?> getFacilityList() async =>
      await repository.getFacilityList(true);
  Future<String?> getUserAccessList() async =>
      await repository.getUserAccessData(LocalKeys.userAccess);
  Future<bool> AddInventory({
    addInventoryJsonString,
    bool? isLoading,
  }) async =>
      await repository.AddInventory(
          isLoading: isLoading, addInventoryJsonString: addInventoryJsonString);
  Future<bool> updateInventory({
    addInventoryJsonString,
    bool? isLoading,
  }) async =>
      await repository.updateInventory(
          isLoading: isLoading, addInventoryJsonString: addInventoryJsonString);
}
