import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/business_list_model.dart';
import 'package:cmms/domain/models/currency_list_model.dart';
import 'package:cmms/domain/models/employee_list_model.dart';
import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/models/type_permit_model.dart';
import 'package:cmms/domain/models/warranty_claim_model.dart';

import '../../domain/models/dashboard_model.dart';
import '../../domain/models/facility_model.dart';

class HomePresenter {
  HomePresenter(this.homeUsecase);
  HomeUsecase homeUsecase;

  Future<void> generateToken() async {
    return await homeUsecase.generateToken();
  }

  void clearValue() async => homeUsecase.clearValue();
  void jobclearValue() async => homeUsecase.jobclearValue();
  void pmclearValue() async => homeUsecase.pmclearValue();
  void iRclearValue() async => homeUsecase.iRclearValue();

  void smclearValue() async => homeUsecase.smclearValue();
  void clearTypeValue() async => homeUsecase.clearTypeValue();
  Future<List<InventoryModel>> getInventoryList({
    required bool isLoading,
    required int? facilityId,
    int? blockId,
    required String categoryIds,
  }) async {
    return homeUsecase.getInventoryList(
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
      await homeUsecase.getBlocksList(
        auth: auth ?? "",
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );
  Future<List<DashboardModel?>?> getdashboardList({
    String? facilityId,
    dynamic endDate,
    dynamic startDate,
    bool? isLoading,
  }) async =>
      await homeUsecase.getdashboardList(
        facilityId: facilityId ?? "",
        endDate: endDate,
        startDate: startDate,
        isLoading: isLoading ?? false,
      );
  Future<List<TypePermitModel?>?> getTypePermitList(
          {required int facility_id}) async =>
      await homeUsecase.getTypePermitList(true, facility_id);

  Future<List<BusinessListModel>> getBusinessList({
    required bool isLoading,
    required int facilityId,
    required int? businessType,
  }) async {
    return homeUsecase.getBusinessList(
        isLoading: isLoading,
        businessType: businessType,
        facilityId: facilityId);
  }

  Future<List<CurrencyListModel>> getUnitCurrencyList({
    required bool isLoading,
    required int? facilityId,
  }) async {
    return homeUsecase.getUnitCurrencyList(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }

  Future<List<EmployeeListModel>> getEmployeeList({
    required bool isLoading,
    required int? facility_id,
  }) async {
    return homeUsecase.getEmployeeList(
      isLoading: isLoading,
      facility_id: facility_id,
    );
  }

  Future<List<InventoryCategoryModel?>?> getInventoryCategoryList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await homeUsecase.getInventoryCategoryList();

  Future<List<WarrantyClaimModel>> getWarrantyClaimList({
    required bool isLoading,
    required int? facilityId,
    int? blockId,
    required String categoryIds,
    String? start_date,
    required String end_date,
  }) async {
    return homeUsecase.getWarrantyClaimList(
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
    return homeUsecase.getBlockList(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }

  Future<List<EquipmentModel>> getEquipmentList({
    required bool isLoading,
    required String facilityId,
  }) async {
    return homeUsecase.getEquipmentList(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }

  Future<List<FacilityModel?>?> getFacilityListByUserId() async =>
      await homeUsecase.getFacilityListByUserId();
  Future<String?> getUserAccessList() async =>
      await homeUsecase.getUserAccessList();
  void saveValue({String? facilitydata}) async {
    return homeUsecase.saveValue(facilitydata: facilitydata);
  }

  Future<String?> getValue() async => await homeUsecase.getValue();
  Future<String?> getUserAcessValue() async =>
      await homeUsecase.getUserAcessValue();

  ///
}
