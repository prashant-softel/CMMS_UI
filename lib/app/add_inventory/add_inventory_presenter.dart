import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/add_inventory_details_model.dart';
import 'package:cmms/domain/models/add_inventory_model.dart';
import 'package:cmms/domain/models/business_list_model.dart';
import 'package:cmms/domain/models/business_type_model.dart';
import 'package:cmms/domain/models/currency_list_model.dart';
import 'package:cmms/domain/models/frequency_model.dart';
import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/models/inventory_type_list_model.dart';
import 'package:cmms/domain/models/manufacturer_model.dart';
import 'package:cmms/domain/models/supplier_name_model.dart';
import 'package:cmms/domain/models/type_permit_model.dart';
import 'package:cmms/domain/models/warranty_type_model.dart';
import 'package:cmms/domain/models/warranty_usage_term_list_model.dart';
import 'package:cmms/domain/usecases/add_inventory_usecase.dart';
import 'package:flutter/foundation.dart';

import '../../domain/models/facility_model.dart';
import '../../domain/models/inventory_status_list_model.dart';

class AddInventoryPresenter {
  AddInventoryPresenter(this.addInventoryUsecase);
  AddInventoryUsecase addInventoryUsecase;

  Future<void> generateToken() async {
    return await addInventoryUsecase.generateToken();
  }

  Future<List<TypePermitModel?>?> getTypePermitList(
          {required int facility_id}) async =>
      await addInventoryUsecase.getTypePermitList(true, facility_id);

  Future<AddInventoryDetailsModel?> getAddInventoryDetail(
      {bool? isLoading, required int id}) async {
    return addInventoryUsecase.getAddInventoryDetail(
      id: id,
      isLoading: isLoading ?? false,
    );
  }

  Future<AddInventoryRequestModel?> uploadImgeInventory(
      Uint8List? fileBytes, String fileName, bool isLoading) async {
    return await addInventoryUsecase.uploadImgeInventory(
        fileBytes, fileName, isLoading);
    // return true;
  }

  ///
  Future<List<InventoryCategoryModel?>?> getInventoryCategoryList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await addInventoryUsecase.getInventoryCategoryList();
  Future<List<WarrantyTypeModel?>?> getWarrantyTypeList({
    bool? isLoading,
  }) async =>
      await addInventoryUsecase.getWarrantyTypeList(isLoading: isLoading);

  ///

  Future<bool> AddInventory({
    addInventoryJsonString,
    required bool isLoading,
  }) async {
    print("presenter");
    addInventoryUsecase.AddInventory(
      addInventoryJsonString: addInventoryJsonString,
      isLoading: isLoading,
    );
    return true;
  }

  Future<bool> updateInventory({
    addInventoryJsonString,
    required bool isLoading,
  }) async {
    print("presenter");
    addInventoryUsecase.updateInventory(
      addInventoryJsonString: addInventoryJsonString,
      isLoading: isLoading,
    );
    return true;
  }

  Future<List<WarrantyUsageTermListModel?>?> getWarrantyUsageTermList({
    bool? isLoading,
  }) async =>
      await addInventoryUsecase.getWarrantyUsageTermList(isLoading: isLoading);

  Future<List<BlockModel?>?> getBlocksList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await addInventoryUsecase.getBlocksList(
        auth: auth ?? "",
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );
  Future<List<InventoryStatusListModel?>?> getInventoryStatusList({
    required bool isLoading,
    // required int facilityId,
  }) async {
    return addInventoryUsecase.getInventoryStatusList(
      isLoading: isLoading,
      // facilityId: facilityId,
    );
  }

  Future<List<InventoryTypeListModel?>?> getInventoryTypeList({
    required bool isLoading,
    required int facilityId,
  }) async {
    return addInventoryUsecase.getInventoryTypeList(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }

  Future<List<FrequencyModel?>?> getFrequencyList({
    bool? isLoading,
  }) async =>
      await addInventoryUsecase.getFrequencyList(
        isLoading: isLoading ?? false,
      );

  Future<List<FacilityModel?>?> getFacilityList() async =>
      await addInventoryUsecase.getFacilityList();
  Future<String?> getUserAccessList() async =>
      await addInventoryUsecase.getUserAccessList();

  ///
  Future<List<InventoryModel>> getInventoryList({
    required bool isLoading,
    required int? facilityId,
    int? blockId,
    required String categoryIds,
  }) async {
    return addInventoryUsecase.getInventoryList(
      isLoading: isLoading,
      facilityId: facilityId,
      blockId: blockId,
      categoryIds: categoryIds,
    );
  }

  Future<List<BusinessTypeModel>> getBusinessTypeList({
    int? businessType,
    bool? isLoading,
  }) async =>
      await addInventoryUsecase.getBusinessTypeList(
        isLoading: isLoading ?? false,
        businessType: businessType,
      );
  Future<List<BusinessListModel>> getVenderNameList({
    required bool isLoading,
    required int facilityId,
    required int? businessType,
    int? blockId,
  }) async {
    return addInventoryUsecase.getVenderNameList(
      isLoading: isLoading,
      facilityId: facilityId,
      businessType: businessType,
    );
  }

//
  Future<List<CurrencyListModel>> getUnitCurrencyList({
    required bool isLoading,
    required int? facilityId,
  }) async {
    return addInventoryUsecase.getUnitCurrencyList(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }

  ///
  Future<List<ManufacturerModel>> getmanufacturerList({
    required bool isLoading,
    required int? BusinessType,
  }) async {
    return addInventoryUsecase.getmanufacturerList(
        isLoading: isLoading, BusinessType: BusinessType);
  }

  Future<List<SupplierNameModel>> getSupplierList({
    required bool isLoading,
    required int? BusinessType,
  }) async {
    return addInventoryUsecase.getSupplierList(
        isLoading: isLoading, BusinessType: BusinessType);
  }

  void saveValue({String? inventoryId}) async {
    return addInventoryUsecase.saveValue(inventoryId: inventoryId);
  }

  Future<String?> getValue() async => await addInventoryUsecase.getValue();
}
