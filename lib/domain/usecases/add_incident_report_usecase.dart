import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/body_injured_model.dart';
import 'package:cmms/domain/models/business_list_model.dart';
import 'package:cmms/domain/models/designation_model.dart';
import 'package:cmms/domain/models/employee_list_model.dart';
import 'package:cmms/domain/models/employee_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/incident_report_details_model.dart';
import 'package:cmms/domain/models/incident_report_list_model.dart';
import 'package:cmms/domain/models/incident_risk_type_model.dart';
import 'package:cmms/domain/models/risk_type_list_model.dart';
import 'package:cmms/domain/models/type_permit_model.dart';

import '../models/facility_model.dart';

class AddIncidentReportUsecase {
  final Repository _repository;

  AddIncidentReportUsecase(this._repository);

  Future<void> generateToken() async {
    return await _repository.generateToken();
  }

  Future<Map<String, dynamic>> updateIncidentReport({
    updateIncidentReport,
    bool? isLoading,
  }) async =>
      await _repository.updateIncidentReport(
        updateIncidentReport,
        isLoading,
      );
  Future<Map<String, dynamic>> updateIRSecondStep({
    updateIncidentReport,
    bool? isLoading,
  }) async =>
      await _repository.updateIRSecondStep(
        updateIncidentReport,
        isLoading,
      );

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

  Future<IncidentReportDetailsModel?> getIncidentReportDetail({
    bool? isLoading,
    required int id,
  }) async =>
      await _repository.getIncidentReportDetail(
        id: id,
        isLoading: isLoading ?? false,
      );

  Future<List<EmployeeListModel>> getIncidentInvestigationDoneByList(
      {required bool isLoading, required int? facility_id}) async {
    return _repository.getEmployeeList(
      isLoading: isLoading,
      facility_id: facility_id,
    );
  }

  Future<List<BusinessListModel?>?> getBusinessList({
    required int? businessType,
    required int facilityId,
    required bool isLoading,
  }) async =>
      await _repository.getBusinessList(
          businessType: businessType,
          isLoading: isLoading,
          facilityId: facilityId);

  Future<List<EmployeeListModel>>
      getIncidentInvestigationVerificationDoneByList(
          {required bool isLoading, required int? facility_id}) async {
    return _repository.getEmployeeList(
      isLoading: isLoading,
      facility_id: facility_id,
    );
  }

  Future<List<EmployeeListModel>> getVictimNameList(
      {required bool isLoading, required int? facility_id}) async {
    return _repository.getEmployeeList(
      isLoading: isLoading,
      facility_id: facility_id,
    );
  }

  Future<List<BodyInjuredModel?>?> getBodyInjuredData({
    required bool isLoading,
  }) async =>
      await _repository.getBodyInjuredData(
        isLoading: isLoading,
      );

  Future<List<RiskTypeModel>> getRiskTypeList(
      {required bool isLoading, required int? facility_id}) async {
    return _repository.getRiskTypeList(
      isLoading: isLoading,
      facility_id: facility_id,
    );
  }

  Future<List<IncidentRiskTypeModell>> getIncidentRiskType(
      {required bool isLoading, required int facilityId}) async {
    return _repository.getIncidentRiskType(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }

  Future<List<EmployeeListModel>> getAssetRestorationActionTakenByList(
      {required bool isLoading, required int? facility_id}) async {
    return _repository.getEmployeeList(
      isLoading: isLoading,
      facility_id: facility_id,
    );
  }

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

  Future<Map<String, dynamic>> createIncidentReport({
    createIncidentReport,
    bool? isLoading,
  }) async =>
      await _repository.createIncidentReport(
        createIncidentReport,
        isLoading,
      );

  Future<List<TypePermitModel?>?> getTypePermitList(
          bool? isLoading, int? facility_id) async =>
      await _repository.getTypePermitList(isLoading, facility_id);

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


  Future<List<FacilityModel?>?> getFacilityList() async =>
      await _repository.getFacilityList(true);

  Future<List<FacilityModel?>?> getFacilityPlantList() async =>
      await _repository.getFacilityList(true);
  Future<List<DesignationModel?>?> getResponsibilityList({
    bool? isLoading,
  }) async =>
      await _repository.getResponsibilityList(
        isLoading,
      );
  void saveValue({String? irId}) async =>
      _repository.saveValue(LocalKeys.irId, irId);
  Future<String?> getValue() async =>
      await _repository.getStringValue(LocalKeys.irId);
  // Future<String?> getUserAccessList() async =>
  //     await _repository.getUserAccessData(LocalKeys.userAccess);
}
