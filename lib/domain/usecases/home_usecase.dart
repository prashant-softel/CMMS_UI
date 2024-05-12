import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/business_list_model.dart';
import 'package:cmms/domain/models/currency_list_model.dart';
import 'package:cmms/domain/models/dashboard_model.dart';
import 'package:cmms/domain/models/employee_list_model.dart';
import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/models/safety_measure_list_model.dart';
import 'package:cmms/domain/models/type_permit_model.dart';
import 'package:cmms/domain/models/warranty_claim_model.dart';

import '../models/facility_model.dart';

class HomeUsecase {
  final Repository _repository;

  HomeUsecase(this._repository);

  Future<void> generateToken() async {
    return await _repository.generateToken();
  }

  void clearValue() async => _repository.clearData(LocalKeys.userDetailId);

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
  Future<List<DashboardModel?>?> getdashboardList({
    String? facilityId,
    bool? isLoading,
  }) async =>
      await _repository.getdashboardList(
        facilityId: facilityId,
        isLoading: isLoading,
      );
  Future<List<TypePermitModel?>?> getTypePermitList(
          bool? isLoading, int? facility_id) async =>
      await _repository.getTypePermitList(isLoading, facility_id);

  Future<List<SafetyMeasureListModel>> getSafetyMeasureList(
      {required bool isLoading, required int? permit_type_id}) async {
    return _repository.getSafetyMeasureList(
      isLoading: isLoading,
      permit_type_id: permit_type_id,
    );
  }

  Future<List<BusinessListModel>> getBusinessList({
    required bool isLoading,
    required int facilityId,
    required int? businessType,
  }) async {
    return _repository.getBusinessList(
      isLoading: isLoading,
      facilityId: facilityId,
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

  Future<List<FacilityModel?>?> getFacilityListByUserId() async =>
      await _repository.getFacilityListByUserId(true);
  Future<String?> getUserAccessList() async =>
      await _repository.getUserAccessData(LocalKeys.userAccess);
  void saveValue({String? facilitydata}) async =>
      _repository.saveValue(LocalKeys.selectFacalityDropdowndata, facilitydata);
  Future<String?> getValue() async =>
      await _repository.getStringValue(LocalKeys.selectFacalityDropdowndata);
  Future<String?> getUserAcessValue() async =>
      await _repository.getStringValue(LocalKeys.setUserAccess);
}
