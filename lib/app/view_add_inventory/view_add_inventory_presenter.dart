import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/add_inventory_details_model.dart';
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
import 'package:cmms/domain/usecases/view_add_inventory_usecase.dart';

import '../../domain/models/facility_model.dart';
import '../../domain/models/inventory_status_list_model.dart';
import '../../domain/models/inventory_type_model.dart';

class ViewAddInventoryPresenter {
  ViewAddInventoryPresenter(this.viewaddInventoryUsecase);
  ViewAddInventoryUsecase viewaddInventoryUsecase;

  Future<void> generateToken() async {
    return await viewaddInventoryUsecase.generateToken();
  }

  Future<List<TypePermitModel?>?> getTypePermitList(
          {required int facility_id}) async =>
      await viewaddInventoryUsecase.getTypePermitList(true, facility_id);

  Future<AddInventoryDetailsModel?> getAddInventoryDetail(
      {bool? isLoading, required int id}) async {
    return viewaddInventoryUsecase.getAddInventoryDetail(
      id: id,
      isLoading: isLoading ?? false,
    );
  }

  ///
  Future<List<InventoryCategoryModel?>?> getInventoryCategoryList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await viewaddInventoryUsecase.getInventoryCategoryList();
  Future<List<WarrantyTypeModel?>?> getWarrantyTypeList({
    bool? isLoading,
  }) async =>
      await viewaddInventoryUsecase.getWarrantyTypeList(isLoading: isLoading);

  ///

  Future<bool> AddInventory({
    addInventoryJsonString,
    required bool isLoading,
  }) async {
    print("presenter");
    viewaddInventoryUsecase.AddInventory(
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
    viewaddInventoryUsecase.updateInventory(
      addInventoryJsonString: addInventoryJsonString,
      isLoading: isLoading,
    );
    return true;
  }

  Future<List<WarrantyUsageTermListModel?>?> getWarrantyUsageTermList({
    bool? isLoading,
  }) async =>
      await viewaddInventoryUsecase.getWarrantyUsageTermList(
          isLoading: isLoading);

  Future<List<BlockModel?>?> getBlocksList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await viewaddInventoryUsecase.getBlocksList(
        auth: auth ?? "",
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );
  Future<List<InventoryStatusListModel?>?> getInventoryStatusList({
    required bool isLoading,
    required int facilityId,
  }) async {
    return viewaddInventoryUsecase.getInventoryStatusList(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }

  Future<List<InventoryTypeListModel?>?> getInventoryTypeList({
    required bool isLoading,
    required int facilityId,
  }) async {
    return viewaddInventoryUsecase.getInventoryTypeList(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }

  Future<List<FrequencyModel?>?> getFrequencyList({
    bool? isLoading,
  }) async =>
      await viewaddInventoryUsecase.getFrequencyList(
        isLoading: isLoading ?? false,
      );

  Future<List<FacilityModel?>?> getFacilityList() async =>
      await viewaddInventoryUsecase.getFacilityList();
  Future<String?> getUserAccessList() async =>
      await viewaddInventoryUsecase.getUserAccessList();

  ///
  Future<List<InventoryModel>> getInventoryList({
    required bool isLoading,
    required int? facilityId,
    int? blockId,
    required String categoryIds,
  }) async {
    return viewaddInventoryUsecase.getInventoryList(
      isLoading: isLoading,
      facilityId: facilityId,
      blockId: blockId,
      categoryIds: categoryIds,
    );
  }

//
  Future<List<CurrencyListModel>> getUnitCurrencyList({
    required bool isLoading,
    required int? facilityId,
  }) async {
    return viewaddInventoryUsecase.getUnitCurrencyList(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }

  ///
  Future<List<ManufacturerModel>> getmanufacturerList({
    required bool isLoading,
    required int? BusinessType,
  }) async {
    return viewaddInventoryUsecase.getmanufacturerList(
        isLoading: isLoading, BusinessType: BusinessType);
  }

  Future<List<SupplierNameModel>> getSupplierList({
    required bool isLoading,
    required int? BusinessType,
  }) async {
    return viewaddInventoryUsecase.getSupplierList(
        isLoading: isLoading, BusinessType: BusinessType);
  }
}
