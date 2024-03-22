import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/incident_report_details_model.dart';
import 'package:cmms/domain/models/incident_report_list_model.dart';
import 'package:cmms/domain/models/modulelist_model.dart';
import 'package:cmms/domain/models/role_model.dart';
import 'package:cmms/domain/models/type_permit_model.dart';

import '../models/facility_model.dart';

class AddEscalationMatrixUsecase {
  final Repository _repository;

  AddEscalationMatrixUsecase(this._repository);

  Future<void> generateToken() async {
    return await _repository.generateToken();
  }

   Future<List<HistoryModel>?> getIncidentReportHistory({
    moduleType,
    facilityId,
    id,
    bool? isLoading,
  }) async =>
      await _repository.getHistory(
        moduleType,
        id,
        facilityId,
        isLoading,
      );

    Future<Map<String, dynamic>> createEscalationMatrix({
    createEscalationMatrix,
    bool? isLoading,
  }) async =>
      await _repository.createEscalationMatrix(
        createEscalationMatrix,
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

  Future<IncidentReportDetailsModel?> getIncidentReportDetail({
    bool? isLoading,  
    required int id,
  }) async =>
      await _repository.getIncidentReportDetail(
        id: id,
        isLoading: isLoading ?? false,
      );


   Future<List<TypePermitModel?>?> getTypePermitList(
    bool? isLoading,
    int? facility_id
    ) async =>
      await _repository.getTypePermitList(
        isLoading,
        facility_id
        );
    
   Future<List<ModuleListModel?>?> getModuleList({
    int? type,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await _repository.getModuleList(
        type,
        facilityId,
        isLoading,
      );

   Future<List<RoleModel?>?> getRoleList({
    bool? isLoading,
  }) async =>
      await _repository.getRoleList(
        isLoading,
      );

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

  
  Future<List<FacilityModel?>?> getFacilityList() async =>
      await _repository.getFacilityList(true);

   Future<List<FacilityModel?>?> getFacilityPlantList() async =>
      await _repository.getFacilityList(true);

  Future<String?> getUserAccessList() async =>
      await _repository.getUserAccessData(LocalKeys.userAccess);
}
