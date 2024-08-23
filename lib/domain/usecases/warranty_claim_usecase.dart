import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/business_list_model.dart';
import 'package:cmms/domain/models/currency_list_model.dart';
import 'package:cmms/domain/models/employee_list_model.dart';
import 'package:cmms/domain/models/employee_list_model2.dart';
import 'package:cmms/domain/models/employee_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/models/inventory_category_model2.dart';
import 'package:cmms/domain/models/inventory_details_model.dart';
import 'package:cmms/domain/models/view_warranty_claim_model.dart';
import 'package:cmms/domain/models/warranty_claim_model.dart';

import '../models/facility_model.dart';

class WarrantyClaimUsecase {
  final Repository _repository;

  WarrantyClaimUsecase(this._repository);

  Future<void> generateToken() async {
    return await _repository.generateToken();
  }

  Future<Map<String, dynamic>> createWarrantyClaim({
    createWarrantyClaim,
    bool? isLoading,
  }) async =>
      await _repository.createWarrantyClaim(
        createWarrantyClaim,
        isLoading,
      );

  Future<ViewWarrantyClaimModel?> getViewWarrantyClaimDetail({
    bool? isLoading,
    required int wc_id,
  }) async =>
      await _repository.getViewWarrantyClaimDetail(
        wc_id: wc_id,
        isLoading: isLoading ?? false,
      );

  Future<InventoryDetailsModel?> getInventoryDetail({
    bool? isLoading,
    required int id,
  }) async =>
      await _repository.getInventoryDetail(
        id: id,
        isLoading: isLoading ?? false,
      );

  Future<Map<String, dynamic>> saveAsDraft({
    createWarrantyClaim,
    bool? isLoading,
  }) async =>
      await _repository.createWarrantyClaim(
        createWarrantyClaim,
        isLoading,
      );

  Future<Map<String, dynamic>> updateWarrantyClaim({
    updateWarrantyClaim,
    bool? isLoading,
  }) async =>
      await _repository.updateWarrantyClaim(
        updateWarrantyClaim,
        isLoading,
      );
  Future<Map<String, dynamic>> resubmitWarrantyClaim({
    updateWarrantyClaim,
    bool? isLoading,
  }) async =>
      await _repository.resubmitWarrantyClaim(
        updateWarrantyClaim,
        isLoading,
      );

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

  Future<List<HistoryModel>?> getHistory({
    moduleType,
    wcId,
    facilityId,
    bool? isLoading,
  }) async =>
      await _repository.getHistory(
        moduleType,
        wcId,
        facilityId,
        isLoading,
      );

  Future<List<InventoryCategoryModel2?>?> getAffectedPartList({
    bool? isLoading,
    int? facilityId,
    String? auth,
    // int? blockId,
    // required String categoryIds,
  }) async {
    return _repository.getAffectedPartList(
      auth,
      facilityId,
      isLoading,
      // blockId: blockId,
      // categoryIds: categoryIds,
    );
  }

  Future<List<BusinessListModel>> getBusinessList({
    required bool isLoading,
    required int facilityId,
    required int? businessType,
  }) async {
    return _repository.getBusinessList(
        isLoading: isLoading,
        businessType: businessType,
        facilityId: facilityId);
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

  Future<List<EmployeeListModel2>> getEmployeesList(
      {required bool isLoading, required int? facility_id}) async {
    return _repository.getEmployeesList(
      isLoading: isLoading,
      facility_id: facility_id,
    );
  }
      Future<List<EmployeeModel?>?> getAssignedToList({
    String? auth,
    int? facilityId,
    int? featureId,
    bool? isLoading,
  }) async =>
      await _repository.getAssignedToEmployee(
        auth,
        facilityId,
        featureId,
        isLoading,
      );


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
    String? start_date,
    required String end_date,
  }) async {
    return _repository.getWarrantyClaimList(
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

  Future<Map<String, dynamic>> wcApprovedButton({
    WCApproveJsonString,
    bool? isLoading,
  }) async =>
      await _repository.wcApprovedButton(
        WCApproveJsonString,
        isLoading,
      );

  Future<Map<String, dynamic>> wcRejectdButton({
    WCRejectJsonString,
    bool? isLoading,
  }) async =>
      await _repository.wcRejectdButton(
        WCRejectJsonString,
        isLoading,
      );
  Future<Map<String, dynamic>> closeWCApprovedButton({
    WCApproveJsonString,
    bool? isLoading,
  }) async =>
      await _repository.closeWCApprovedButton(
        WCApproveJsonString,
        isLoading,
      );

  Future<Map<String, dynamic>> closeWCRejectdButton({
    WCRejectJsonString,
    bool? isLoading,
  }) async =>
      await _repository.closeWCRejectdButton(
        WCRejectJsonString,
        isLoading,
      );
  Future<Map<String, dynamic>> updateWarranty({
    updateWarrantyClaim,
    bool? isLoading,
  }) async =>
      await _repository.updateWarranty(
        updateWarrantyClaim,
        isLoading,
      );
  Future<Map<String, dynamic>> closeWarranty({
    updateWarrantyClaim,
    bool? isLoading,
  }) async =>
      await _repository.closeWarranty(
        updateWarrantyClaim,
        isLoading,
      );

  Future<List<FacilityModel?>?> getFacilityList() async =>
      await _repository.getFacilityList(true);
  Future<String?> getValue() async => await _repository.getStringValue(
        LocalKeys.wc_id,
      );
  void saveValue({String? wc_id}) async => _repository.saveValue(
        LocalKeys.wc_id,
        wc_id,
      );
  void clearValue() async => _repository.clearData(
        LocalKeys.wc_id,
      );
  Future<String?> getTypeValue() async => await _repository.getStringValue(
        LocalKeys.wc_type,
      );
  void saveTypeValue({String? wc_type}) async => _repository.saveValue(
        LocalKeys.wc_type,
        wc_type,
      );
  void clearTypeValue() async => _repository.clearData(
        LocalKeys.wc_type,
      );
  // Future<String?> getUserAccessList() async =>
  //     await _repository.getUserAccessData(LocalKeys.userAccess);
}
