import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/business_list_model.dart';
import 'package:cmms/domain/models/currency_list_model.dart';
import 'package:cmms/domain/models/employee_list_model.dart';
import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/models/view_warranty_claim_model.dart';
import 'package:cmms/domain/models/warranty_claim_model.dart';
import 'package:cmms/domain/usecases/view_warranty_claim_usecase.dart';
import 'package:cmms/domain/usecases/warranty_claim_usecase.dart';

import '../../domain/models/facility_model.dart';
import '../../domain/models/user_access_model.dart';

class ViewWarrantyClaimPresenter {
  ViewWarrantyClaimPresenter(this.viewWarrantyClaimUsecase);
  ViewWarrantyClaimUsecase viewWarrantyClaimUsecase;

  Future<void> generateToken() async {
    return await viewWarrantyClaimUsecase.generateToken();
  }

   Future<ViewWarrantyClaimModel?> getViewWarrantyClaimDetail({
  
    bool? isLoading,  
    required int wc_id,
  }) async {
      return viewWarrantyClaimUsecase.getViewWarrantyClaimDetail(
        wc_id: wc_id,
        isLoading: isLoading ?? false,
      );
  }

  // Future<List<InventoryModel>> getInventoryList({
  //   required bool isLoading,
  //   required int? facilityId,
  //   int? blockId,
  //   required String categoryIds,
  // }) async {
  //   return warrantyClaimUsecase.getInventoryList(
  //     isLoading: isLoading,
  //     facilityId: facilityId,
  //     blockId: blockId,
  //     categoryIds: categoryIds,
  //   );
  // }

  //  Future<List<BusinessListModel>> getBusinessList({
  //   required bool isLoading,
  //   required int? businessType,
  // }) async {
  //   return warrantyClaimUsecase.getBusinessList(
  //     isLoading: isLoading,
  //     businessType: businessType,
  //   );
  // }

  // Future<List<CurrencyListModel>> getUnitCurrencyList({
  //   required bool isLoading,
  //   required int? facilityId,
  // }) async {
  //   return warrantyClaimUsecase.getUnitCurrencyList(
  //     isLoading: isLoading,
  //     facilityId: facilityId,
  //   );
  // }

  //  Future<List<EmployeeListModel>> getEmployeeList({
  //   required bool isLoading,
  //   required int? facility_id,
  // }) async {
  //   return warrantyClaimUsecase.getEmployeeList(
  //     isLoading: isLoading,
  //     facility_id: facility_id,
  //   );
  // }

  //  Future<List<InventoryCategoryModel?>?> getInventoryCategoryList({
  //   String? auth,
  //   int? facilityId,
  //   bool? isLoading,
  // }) async =>
  //     await warrantyClaimUsecase.getInventoryCategoryList(
  //     );

  // Future<List<WarrantyClaimModel>>getWarrantyClaimList({
  //   required bool isLoading,
  //   required int? facilityId,
  //   int? blockId,
  //   required String categoryIds,
  // }) async {
  //   return warrantyClaimUsecase.getWarrantyClaimList(
  //     isLoading: isLoading,
  //     facilityId: facilityId,
  //     blockId: blockId,
  //     categoryIds: categoryIds,
  //   );
  // }

  // Future<List<BlockModel>> getBlockList({
  //   required bool isLoading,
  //   required String facilityId,
  // }) async {
  //   return warrantyClaimUsecase.getBlockList(
  //     isLoading: isLoading,
  //     facilityId: facilityId,
  //   );
  // }

  // Future<List<EquipmentModel>> getEquipmentList({
  //   required bool isLoading,
  //   required String facilityId,
  // }) async {
  //   return warrantyClaimUsecase.getEquipmentList(
  //     isLoading: isLoading,
  //     facilityId: facilityId,
  //   );
  // }

  Future<List<FacilityModel?>?> getFacilityList() async =>
      await viewWarrantyClaimUsecase.getFacilityList();
  Future<String?> getUserAccessList() async =>
      await viewWarrantyClaimUsecase.getUserAccessList();

  ///
}
