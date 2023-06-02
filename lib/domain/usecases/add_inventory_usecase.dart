import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/business_list_model.dart';
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

import '../models/facility_model.dart';

class AddInventoryUsecase {
  final Repository _repository;

  AddInventoryUsecase(this._repository);

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

// getmanufacturerList
  Future<List<ManufacturerModel>> getmanufacturerList({
    required bool isLoading,
    required int? BusinessType,
  }) async {
    return _repository.getmanufacturerList(
      isLoading: isLoading,
      BusinessType: BusinessType,
    );
  }

  //getSupplierNameModelList
  Future<List<SupplierNameModel>> getSupplierList({
    required bool isLoading,
    required int? BusinessType,
  }) async {
    return _repository.getSupplierList(
      isLoading: isLoading,
      BusinessType: BusinessType,
    );
  }

  Future<List<BlockModel?>?> getBlocksList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await _repository.getBlocksList(
        auth,
        facilityId,
        isLoading,
      );
  Future<List<InventoryStatusListModel?>?> getInventoryStatusList({
    required bool isLoading,
    required int facilityId,
  }) async {
    return _repository.getInventoryStatusList(facilityId, isLoading);
  }

  Future<List<FrequencyModel?>?> getFrequencyList({
    bool? isLoading,
  }) async =>
      await _repository.getFrequencyList(
        isLoading,
      );
  Future<List<InventoryTypeListModel?>?> getInventoryTypeList({
    required bool isLoading,
    required int facilityId,
  }) async {
    return _repository.getInventoryTypeList(facilityId, isLoading);
  }

  Future<List<TypePermitModel?>?> getTypePermitList(bool? isLoading) async =>
      await _repository.getTypePermitList(isLoading);

  Future<List<SafetyMeasureListModel>> getSafetyMeasureList(
      {required bool isLoading, required int? permit_type_id}) async {
    return _repository.getSafetyMeasureList(
      isLoading: isLoading,
      permit_type_id: permit_type_id,
    );
  }

  Future<List<BusinessListModel>> getBusinessList({
    required bool isLoading,
    required int? businessType,
  }) async {
    return _repository.getBusinessList(
      isLoading: isLoading,
      businessType: businessType,
    );
  }

  Future<List<CurrencyListModel>> getUnitCurrencyList(
      {required bool isLoading, required int? facilityId}) async {
    return _repository.getUnitCurrencyList(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }

  Future<List<EmployeeListModel>> getEmployeeList(
      {required bool isLoading, required int? facility_id}) async {
    return _repository.getEmployeeList(
      isLoading: isLoading,
      facility_id: facility_id,
    );
  }

  Future<bool> AddInventory({
    addInventoryJsonString,
    bool? isLoading,
  }) async =>
      await _repository.AddInventory(
          isLoading: isLoading, addInventoryJsonString: addInventoryJsonString);

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

  Future<List<WarrantyTypeModel?>?> getWarrantyTypeList({
    bool? isLoading,
  }) async =>
      await _repository.getWarrantyTypeList(
        isLoading,
      );

  //
  Future<List<WarrantyUsageTermListModel?>?> getWarrantyUsageTermList({
    bool? isLoading,
  }) async =>
      await _repository.getWarrantyUsageTermList(
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
      facilityId: facilityId,
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
