import 'package:cmms/domain/models/block_model.dart';
import 'package:cmms/domain/models/body_injured_model.dart';
import 'package:cmms/domain/models/business_list_model.dart';
import 'package:cmms/domain/models/designation_model.dart';
import 'package:cmms/domain/models/employee_list_model.dart';
import 'package:cmms/domain/models/employee_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/incident_report_details_model.dart';
import 'package:cmms/domain/models/incident_report_list_model.dart';
import 'package:cmms/domain/models/incident_risk_type_model.dart';
import 'package:cmms/domain/models/inventory_model.dart';
import 'package:cmms/domain/models/risk_type_list_model.dart';
import 'package:cmms/domain/models/type_permit_model.dart';

import 'package:cmms/domain/usecases/add_incident_report_usecase.dart';

import '../../domain/models/facility_model.dart';

class AddIncidentReportPresenter {
  AddIncidentReportPresenter(this.incidentReportUsecase);
  AddIncidentReportUsecase incidentReportUsecase;

  Future<void> generateToken() async {
    return await incidentReportUsecase.generateToken();
  }

  Future<List<EmployeeListModel>> getIncidentInvestigationDoneByList({
    required bool isLoading,
    required int? facility_id,
  }) async {
    return incidentReportUsecase.getIncidentInvestigationDoneByList(
      isLoading: isLoading,
      facility_id: facility_id,
    );
  }

  Future<List<BusinessListModel?>?> getBusinessList({
    int? businessType,
    required int facilityId,
    bool? isLoading,
  }) async =>
      await incidentReportUsecase.getBusinessList(
          isLoading: isLoading ?? false,
          businessType: businessType,
          facilityId: facilityId);
  Future<List<BodyInjuredModel?>?> getBodyInjuredData({
    bool? isLoading,
  }) async =>
      await incidentReportUsecase.getBodyInjuredData(
        isLoading: isLoading ?? false,
      );
  Future<IncidentReportDetailsModel?> getIncidentReportDetail({
    bool? isLoading,
    required int id,
  }) async {
    return incidentReportUsecase.getIncidentReportDetail(
      id: id,
      isLoading: isLoading ?? false,
    );
  }

  Future<List<BlockModel?>?> getBlocksList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await incidentReportUsecase.getBlocksList(
        auth: auth ?? "",
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );

  Future<List<EmployeeListModel>>
      getIncidentInvestigationVerificationDoneByList({
    required bool isLoading,
    required int? facility_id,
  }) async {
    return incidentReportUsecase.getIncidentInvestigationVerificationDoneByList(
      isLoading: isLoading,
      facility_id: facility_id,
    );
  }

  Future<List<EmployeeModel?>?> getVictimNameList({
    required bool isLoading,
    required int? facility_id,
    required int? featureId,
  }) async {
    return incidentReportUsecase.getAssignedToList(
      isLoading: isLoading,
      facilityId: facility_id,
      featureId: featureId
    );
  }

  Future<List<RiskTypeModel>> getRiskTypeList({
    required bool isLoading,
    required int? facility_id,
  }) async {
    return incidentReportUsecase.getRiskTypeList(
      isLoading: isLoading,
      facility_id: facility_id,
    );
  }

  Future<List<IncidentRiskTypeModell>> getIncidentRiskType(
      {required bool isLoading, required int facilityId}) async {
    return incidentReportUsecase.getIncidentRiskType(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }

  Future<List<EmployeeListModel>> getAssetRestorationActionTakenByList({
    required bool isLoading,
    required int? facility_id,
  }) async {
    return incidentReportUsecase.getAssetRestorationActionTakenByList(
      isLoading: isLoading,
      facility_id: facility_id,
    );
  }

  Future<Map<String, dynamic>?> createIncidentReport({
    createIncidentReport,
    required bool isLoading,
  }) async {
    return incidentReportUsecase.createIncidentReport(
      createIncidentReport: createIncidentReport,
      isLoading: isLoading,
    );
  }

  Future<Map<String, dynamic>?> updateIncidentReport({
    updateIncidentReport,
    required bool isLoading,
  }) async {
    return incidentReportUsecase.updateIncidentReport(
      updateIncidentReport: updateIncidentReport,
      isLoading: isLoading,
    );
  }

  Future<Map<String, dynamic>?> updateIRSecondStep({
    updateIncidentReport,
    required bool isLoading,
  }) async {
    return incidentReportUsecase.updateIRSecondStep(
      updateIncidentReport: updateIncidentReport,
      isLoading: isLoading,
    );
  }

  Future<List<TypePermitModel?>?> getTypePermitList(
          {required int facility_id}) async =>
      await incidentReportUsecase.getTypePermitList(true, facility_id);

  Future<List<InventoryModel>> getInventoryList({
    required bool isLoading,
    required int? facilityId,
    int? blockId,
    required String categoryIds,
  }) async {
    return incidentReportUsecase.getInventoryList(
      isLoading: isLoading,
      facilityId: facilityId,
      blockId: blockId,
      categoryIds: categoryIds,
    );
  }

  Future<List<HistoryModel>?> getIncidentReportHistory(
    moduleType,
    id,
    isLoading,
  ) async =>
      await incidentReportUsecase.getIncidentReportHistory(
        moduleType: moduleType,
        id: id,
        isLoading: isLoading,
      );

  Future<List<IncidentReportListModel>> getIncidentReportList({
    required bool isLoading,
    required int? facility_id,
    String? start_date,
    required String end_date,
  }) async {
    return incidentReportUsecase.getIncidentReportList(
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
      await incidentReportUsecase.getAssignedToList(
        auth: auth ?? "",
        facilityId: facilityId,
        featureId: featureId,
        isLoading: isLoading,
      );

  Future<List<FacilityModel?>?> getFacilityList() async =>
      await incidentReportUsecase.getFacilityList();

  Future<List<FacilityModel?>?> getFacilityPlantList() async =>
      await incidentReportUsecase.getFacilityPlantList();
  Future<String?> getValue() async => await incidentReportUsecase.getValue();
  void saveValue({String? irId}) async {
    return incidentReportUsecase.saveValue(irId: irId);
  }

  Future<List<DesignationModel?>?> getResponsibilityList({
    bool? isLoading,
  }) async =>
      await incidentReportUsecase.getResponsibilityList(
        isLoading: isLoading ?? false,
      );
  // Future<String?> getUserAccessList() async =>
  //     await incidentReportUsecase.getUserAccessList();

  ///
}
