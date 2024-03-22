import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/incident_report_details_model.dart';
import 'package:cmms/domain/models/incident_report_list_model.dart';
import 'package:cmms/domain/models/type_permit_model.dart';

import '../models/facility_model.dart';

class ViewIncidentReportUsecase {
  final Repository _repository;

  ViewIncidentReportUsecase(this._repository);

  Future<void> generateToken() async {
    return await _repository.generateToken();
  }

  Future<List<HistoryModel>?> getIncidentReportHistory({
    moduleType,
    id,
    facilityId,
    bool? isLoading,
  }) async =>
      await _repository.getHistory(
        moduleType,
        id,
        facilityId,
        isLoading,
      );

  Future<Map<String, dynamic>> rejectIncidentReportButton({
    incidentReportRejectJsonString,
    bool? isLoading,
  }) async =>
      await _repository.rejectIncidentReportButton(
        incidentReportRejectJsonString,
        isLoading,
      );
  Future<Map<String, dynamic>> rejectIrButton({
    incidentReportRejectJsonString,
    bool? isLoading,
  }) async =>
      await _repository.rejectIrButton(
        incidentReportRejectJsonString,
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

  void saveValue({String? irId}) async =>
      _repository.saveValue(LocalKeys.irId, irId);
  Future<String?> getValue() async =>
      await _repository.getStringValue(LocalKeys.irId);
  // Future<void> incidentReportRejectButton({
  //   String? comment,
  //   String? id,
  //   bool? isLoading,
  // }) async {
  //   await _repository.incidentReportRejectButton(
  //     comment,
  //     id,
  //     isLoading,
  //   );
  // }

  Future<void> incidentReportApproveButton({
    String? incidentId,
    bool? isLoading,
  }) async {
    await _repository.incidentReportApproveButton(
      incidentId,
      isLoading,
    );
  }

  Future<IncidentReportDetailsModel?> getIncidentReportDetail({
    bool? isLoading,
    required int id,
  }) async =>
      await _repository.getIncidentReportDetail(
        id: id,
        isLoading: isLoading ?? false,
      );

  Future<List<TypePermitModel?>?> getTypePermitList(
          bool? isLoading, int? facility_id) async =>
      await _repository.getTypePermitList(isLoading, facility_id);

  // Future<Map<String, dynamic>> createWarrantyClaim({
  //   createWarrantyClaim,
  //   bool? isLoading,
  // }) async =>
  //     await _repository.createWarrantyClaim(
  //       createWarrantyClaim,
  //       isLoading,
  //     );

  //  Future<InventoryDetailsModel?> getInventoryDetail({
  //   bool? isLoading,
  //   required int id,
  // }) async =>
  //     await _repository.getInventoryDetail(
  //       id: id,
  //       isLoading: isLoading ?? false,
  //     );

  //  Future<Map<String, dynamic>> saveAsDraft({
  //   createWarrantyClaim,
  //   bool? isLoading,
  // }) async =>
  //     await _repository.createWarrantyClaim(
  //       createWarrantyClaim,
  //       isLoading,
  //     );

  // Future<List<InventoryModel>> getInventoryList({
  //   required bool isLoading,
  //   required int? facilityId,
  //   int? blockId,
  //   required String categoryIds,
  // }) async {
  //   return _repository.getInventoryList(
  //     isLoading: isLoading,
  //     facilityId: facilityId,
  //     blockId: blockId,
  //     categoryIds: categoryIds,
  //   );
  // }

  // Future<List<InventoryCategoryModel2?>?> getAffectedPartList({
  //    bool? isLoading,
  //    int? facilityId,
  //   String? auth,
  //   // int? blockId,
  //   // required String categoryIds,
  // }) async {
  //   return _repository.getAffectedPartList(
  //      auth,
  //       facilityId,
  //       isLoading,
  //     // blockId: blockId,
  //     // categoryIds: categoryIds,
  //   );
  // }

  // Future<List<BusinessListModel>> getBusinessList({
  //   required bool isLoading,
  //   required int? businessType,
  // }) async {
  //   return _repository.getBusinessList(
  //     isLoading: isLoading,
  //     businessType: businessType,
  //   );
  // }

  // Future<List<CurrencyListModel>> getUnitCurrencyList(
  //     {required bool isLoading, required int? facilityId}) async {
  //   return _repository.getUnitCurrencyList(
  //     isLoading: isLoading,
  //     facilityId: facilityId,
  //   );
  // }

  // Future<List<EmployeeListModel>> getEmployeeList(
  //     {required bool isLoading, required int? facility_id}) async {
  //   return _repository.getEmployeeList(
  //     isLoading: isLoading,
  //     facility_id: facility_id,
  //   );
  // }

  //  Future<List<EmployeeListModel2>> getEmployeesList(
  //     {required bool isLoading, required int? facility_id}) async {
  //   return _repository.getEmployeesList(
  //     isLoading: isLoading,
  //     facility_id: facility_id,
  //   );
  // }

  // Future<List<InventoryCategoryModel?>?> getInventoryCategoryList({
  //   String? auth,
  //   int? facilityId,
  //   bool? isLoading,
  // }) async =>
  //     await _repository.getInventoryCategoryList(
  //       auth,
  //       facilityId,
  //       isLoading,
  //     );

  Future<List<IncidentReportListModel>> getIncidentReportList({
    required bool isLoading,
    required int? facility_id,
    String? start_date,
    required String end_date,
  }) async {
    return _repository.getIncidentReportList(
      isLoading: isLoading,
      facility_id: facility_id,
      start_date: start_date,
      end_date: end_date,
    );
  }

  // Future<List<BlockModel>> getBlockList({
  //   required bool isLoading,
  //   required String facilityId,
  // }) async {
  //   return _repository.getBlockList(
  //     isLoading: isLoading,
  //     facilityId: facilityId,
  //   );
  // }

  // Future<List<EquipmentModel>> getEquipmentList({
  //   required bool isLoading,
  //   required String facilityId,
  // }) async {
  //   return _repository.getEquipmentList(
  //     isLoading: isLoading,
  //     facilityId: facilityId,
  //   );
  // }

  Future<List<FacilityModel?>?> getFacilityList() async =>
      await _repository.getFacilityList(true);

  Future<List<FacilityModel?>?> getFacilityPlantList() async =>
      await _repository.getFacilityList(true);

  Future<String?> getUserAccessList() async =>
      await _repository.getUserAccessData(LocalKeys.userAccess);
  Future<Map<String, dynamic>> approveIncidentReportButton({
    incidentReportApproveJsonString,
    bool? isLoading,
  }) async =>
      await _repository.approveIncidentReportButton(
        incidentReportApproveJsonString,
        isLoading,
      );
  Future<Map<String, dynamic>> approveIrButton({
    incidentReportApproveJsonString,
    bool? isLoading,
  }) async =>
      await _repository.approveIrButton(
        incidentReportApproveJsonString,
        isLoading,
      );
}
