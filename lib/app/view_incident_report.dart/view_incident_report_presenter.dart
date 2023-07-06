
import 'package:cmms/domain/models/incident_report_list_model.dart';
import 'package:cmms/domain/models/inventory_model.dart';
import 'package:cmms/domain/models/type_permit_model.dart';

import 'package:cmms/domain/usecases/add_incident_report_usecase.dart';
import 'package:cmms/domain/usecases/view_incident_report_usecase.dart';


import '../../domain/models/facility_model.dart';
import '../../domain/models/user_access_model.dart';

class ViewIncidentReportPresenter {
  ViewIncidentReportPresenter(this.viewIncidentReportUsecase);
  ViewIncidentReportUsecase viewIncidentReportUsecase;

  // Future<void> generateToken() async {
  //   return await incidentReportUsecase.generateToken();
  // }


  //  Future<List<TypePermitModel?>?> getTypePermitList(
  //   {required int facility_id}
  //  ) async =>
  //     await incidentReportUsecase.getTypePermitList(
  //       true,
  //       facility_id
  //       );

  // Future<List<InventoryModel>> getInventoryList({
  //   required bool isLoading,
  //   required int? facilityId,
  //   int? blockId,
  //   required String categoryIds,
  // }) async {
  //   return incidentReportUsecase.getInventoryList(
  //     isLoading: isLoading,
  //     facilityId: facilityId,
  //     blockId: blockId,
  //     categoryIds: categoryIds,
  //   );
  // }


  // Future<Map<String, dynamic>?> createWarrantyClaim({
  //   createWarrantyClaim,
  //   required bool isLoading,
  // }) async {
  //   return warrantyClaimUsecase.createWarrantyClaim(
  //     createWarrantyClaim: createWarrantyClaim,
  //     isLoading: isLoading,
  //   );
  // }

  // Future<Map<String, dynamic>?> saveAsDraft({
  //   createWarrantyClaim,
  //   required bool isLoading,
  // }) async {
  //   return warrantyClaimUsecase.saveAsDraft(
  //     createWarrantyClaim: createWarrantyClaim,
  //     isLoading: isLoading,
  //   );
  // }


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

  // // Future<List<InventoryModel2>> getAffectedPartList({
  // //   required bool isLoading,
  // //   required int? facilityId,
  // //   int? blockId,
  // //   required String categoryIds,
  // // }) async {
  // //   return warrantyClaimUsecase.getAffectedPartList(
  // //     isLoading: isLoading,
  // //     facilityId: facilityId,
  // //     blockId: blockId,
  // //     categoryIds: categoryIds,
  // //   );
  // // }

  // Future<List<BusinessListModel>> getBusinessList({
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

  // Future<List<EmployeeListModel>> getEmployeeList({
  //   required bool isLoading,
  //   required int? facility_id,
  // }) async {
  //   return warrantyClaimUsecase.getEmployeeList(
  //     isLoading: isLoading,
  //     facility_id: facility_id,
  //   );
  // }

  // Future<List<EmployeeListModel2>> getEmployeesList({
  //   required bool isLoading,
  //   required int? facility_id,
  // }) async {
  //   return warrantyClaimUsecase.getEmployeesList(
  //     isLoading: isLoading,
  //     facility_id: facility_id,
  //   );
  // }

  // Future<InventoryDetailsModel?> getInventoryDetail({
  
  //   bool? isLoading,  
  //   required int id,
  // }) async {
  //     return warrantyClaimUsecase.getInventoryDetail(
  //       id: id,
  //       isLoading: isLoading ?? false,
  //     );
  // }

  // Future<List<InventoryCategoryModel?>?> getInventoryCategoryList({
  //   String? auth,
  //   int? facilityId,
  //   bool? isLoading,
  // }) async =>
  //     await warrantyClaimUsecase.getInventoryCategoryList();

  // Future<List<InventoryCategoryModel2?>?> getAffectedPartList({
  //   String? auth,
  //   int? facilityId,
  //   bool? isLoading,
  // }) async =>
  //     await warrantyClaimUsecase.getAffectedPartList();

  // Future<List<IncidentReportListModel>> getIncidentReportList({
  //   required bool isLoading,
  //   required int? facility_id,
  //   String? start_date,
  //   required String end_date,
  // }) async {
  //   return incidentReportUsecase.getIncidentReportList(
  //     isLoading: isLoading,
  //     facility_id: facility_id,
  //     start_date: start_date,
  //     end_date: end_date,
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
      await viewIncidentReportUsecase.getFacilityList();

  // Future<List<FacilityModel?>?> getFacilityPlantList() async =>
  //     await incidentReportUsecase.getFacilityPlantList();

  Future<String?> getUserAccessList() async =>
      await viewIncidentReportUsecase.getUserAccessList();

  ///
}
