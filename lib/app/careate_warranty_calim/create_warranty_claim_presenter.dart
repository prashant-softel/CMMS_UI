import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/business_list_model.dart';
import 'package:cmms/domain/models/currency_list_model.dart';
import 'package:cmms/domain/models/employee_list_model.dart';
import 'package:cmms/domain/models/employee_list_model2.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/models/inventory_category_model2.dart';
import 'package:cmms/domain/models/inventory_details_model.dart';
import 'package:cmms/domain/models/view_warranty_claim_model.dart';
import 'package:cmms/domain/models/warranty_claim_model.dart';
import 'package:cmms/domain/usecases/warranty_claim_usecase.dart';
import '../../domain/models/facility_model.dart';

class CreateWarrantyClaimPresenter {
  CreateWarrantyClaimPresenter(this.warrantyClaimUsecase);
  WarrantyClaimUsecase warrantyClaimUsecase;

  Future<void> generateToken() async {
    return await warrantyClaimUsecase.generateToken();
  }

  Future<Map<String, dynamic>?> createWarrantyClaim({
    createWarrantyClaim,
    required bool isLoading,
  }) async {
    return warrantyClaimUsecase.createWarrantyClaim(
      createWarrantyClaim: createWarrantyClaim,
      isLoading: isLoading,
    );
  }

  Future<ViewWarrantyClaimModel?> getViewWarrantyClaimDetail({
    bool? isLoading,
    required int wc_id,
  }) async {
    return warrantyClaimUsecase.getViewWarrantyClaimDetail(
      wc_id: wc_id,
      isLoading: isLoading ?? false,
    );
  }

  Future<Map<String, dynamic>?> saveAsDraft({
    createWarrantyClaim,
    required bool isLoading,
  }) async {
    return warrantyClaimUsecase.saveAsDraft(
      createWarrantyClaim: createWarrantyClaim,
      isLoading: isLoading,
    );
  }

  Future<Map<String, dynamic>?> updateWarrantyClaim({
    updateWarrantyClaim,
    required bool isLoading,
  }) async {
    return warrantyClaimUsecase.updateWarrantyClaim(
      updateWarrantyClaim: updateWarrantyClaim,
      isLoading: isLoading,
    );
  }

  Future<Map<String, dynamic>?> resubmitWarrantyClaim({
    updateWarrantyClaim,
    required bool isLoading,
  }) async {
    return warrantyClaimUsecase.resubmitWarrantyClaim(
      updateWarrantyClaim: updateWarrantyClaim,
      isLoading: isLoading,
    );
  }

  Future<List<InventoryModel>> getInventoryList({
    required bool isLoading,
    required int? facilityId,
    int? blockId,
    required String categoryIds,
  }) async {
    return warrantyClaimUsecase.getInventoryList(
      isLoading: isLoading,
      facilityId: facilityId,
      blockId: blockId,
      categoryIds: categoryIds,
    );
  }

  Future<List<HistoryModel>?> getHistory({
    moduleType,
    facilityId,
    wcId,
    isLoading,
  }) async =>
      await warrantyClaimUsecase.getHistory(
        moduleType: moduleType,
        wcId: wcId,
        facilityId: facilityId,
        isLoading: isLoading,
      );

  Future<List<BusinessListModel>> getBusinessList({
    required bool isLoading,
    required int facilityId,
    required int? businessType,
  }) async {
    return warrantyClaimUsecase.getBusinessList(
      isLoading: isLoading,
      facilityId: facilityId,
      businessType: businessType,
    );
  }

  Future<List<CurrencyListModel>> getUnitCurrencyList({
    required bool isLoading,
    required int? facilityId,
  }) async {
    return warrantyClaimUsecase.getUnitCurrencyList(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }

  Future<List<EmployeeListModel>> getEmployeeList({
    required bool isLoading,
    required int? facility_id,
  }) async {
    return warrantyClaimUsecase.getEmployeeList(
      isLoading: isLoading,
      facility_id: facility_id,
    );
  }

  Future<List<EmployeeListModel2>> getEmployeesList({
    required bool isLoading,
    required int? facility_id,
  }) async {
    return warrantyClaimUsecase.getEmployeesList(
      isLoading: isLoading,
      facility_id: facility_id,
    );
  }

  Future<InventoryDetailsModel?> getInventoryDetail({
    bool? isLoading,
    required int id,
  }) async {
    return warrantyClaimUsecase.getInventoryDetail(
      id: id,
      isLoading: isLoading ?? false,
    );
  }

  Future<List<InventoryCategoryModel?>?> getInventoryCategoryList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await warrantyClaimUsecase.getInventoryCategoryList();

  Future<List<InventoryCategoryModel2?>?> getAffectedPartList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await warrantyClaimUsecase.getAffectedPartList();

  Future<List<WarrantyClaimModel>> getWarrantyClaimList({
    required bool isLoading,
    required int? facilityId,
    int? blockId,
    required String categoryIds,
    String? start_date,
    required String end_date,
  }) async {
    return warrantyClaimUsecase.getWarrantyClaimList(
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
    return warrantyClaimUsecase.getBlockList(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }

  Future<List<EquipmentModel>> getEquipmentList({
    required bool isLoading,
    required String facilityId,
  }) async {
    return warrantyClaimUsecase.getEquipmentList(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }

  Future<Map<String, dynamic>?> wcApprovedButton({
    WCApproveJsonString,
    required bool isLoading,
  }) async {
    return warrantyClaimUsecase.wcApprovedButton(
      WCApproveJsonString: WCApproveJsonString,
      isLoading: isLoading,
    );
  }

  Future<Map<String, dynamic>?> wcRejectdButton({
    WCRejectJsonString,
    required bool isLoading,
  }) async {
    return warrantyClaimUsecase.wcRejectdButton(
      WCRejectJsonString: WCRejectJsonString,
      isLoading: isLoading,
    );
  }

  Future<Map<String, dynamic>?> closeWCApprovedButton({
    WCApproveJsonString,
    required bool isLoading,
  }) async {
    return warrantyClaimUsecase.closeWCApprovedButton(
      WCApproveJsonString: WCApproveJsonString,
      isLoading: isLoading,
    );
  }

  Future<Map<String, dynamic>?> closeWCRejectdButton({
    WCRejectJsonString,
    required bool isLoading,
  }) async {
    return warrantyClaimUsecase.closeWCRejectdButton(
      WCRejectJsonString: WCRejectJsonString,
      isLoading: isLoading,
    );
  }

  Future<Map<String, dynamic>?> updateWarranty({
    updateWarrantyClaim,
    required bool isLoading,
  }) async {
    return warrantyClaimUsecase.updateWarranty(
      updateWarrantyClaim: updateWarrantyClaim,
      isLoading: isLoading,
    );
  }

  Future<Map<String, dynamic>?> closeWarranty({
    updateWarrantyClaim,
    required bool isLoading,
  }) async {
    return warrantyClaimUsecase.closeWarranty(
      updateWarrantyClaim: updateWarrantyClaim,
      isLoading: isLoading,
    );
  }

  Future<List<FacilityModel?>?> getFacilityList() async =>
      await warrantyClaimUsecase.getFacilityList();

  void saveValue({String? wc_id}) async {
    return warrantyClaimUsecase.saveValue(wc_id: wc_id);
  }

  void clearValue() async => warrantyClaimUsecase.clearValue();

  Future<String?> getValue() async => await warrantyClaimUsecase.getValue();
  void saveTypeValue({String? wc_type}) async {
    return warrantyClaimUsecase.saveTypeValue(wc_type: wc_type);
  }

  void clearTypeValue() async => warrantyClaimUsecase.clearTypeValue();

  Future<String?> getTypeValue() async =>
      await warrantyClaimUsecase.getTypeValue();

  // Future<String?> getUserAccessList() async =>
  //     await warrantyClaimUsecase.getUserAccessList();

  ///
}
