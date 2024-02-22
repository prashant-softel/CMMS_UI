import 'package:cmms/domain/models/incident_risk_type_model.dart';
import 'package:cmms/domain/usecases/incident_risk_type_usecase.dart';

import '../../domain/models/body_injured_model.dart';
import '../../domain/usecases/body_injured_usecase.dart';

class IncidentRiskTypePresenter {
  IncidentRiskTypePresenter(this.incidentRiskTypeUsecase);
  IncidentRiskTypeUsecase incidentRiskTypeUsecase;

  // Future<List<FacilityModel?>?> getFacilityList() async =>
  //     await jobTypeListUsecase.getFacilityList();
  // Future<String?> getUserAccessList() async =>
  //     await jobTypeListUsecase.getUserAccessList();

  Future<List<IncidentRiskTypeModell>> getIncidentRiskType({
    required bool isLoading,
  }) async {
    return incidentRiskTypeUsecase.getIncidentRiskType(isLoading: isLoading);
  }

  Future<bool> createIncidentRiskType({
    incidentRiskTypeJsonString,
    required bool isLoading,
  }) async {
    print("presenter Create Facility type function.");
    incidentRiskTypeUsecase.createIncidentRiskType(
      incidentRiskTypeJsonString: incidentRiskTypeJsonString,
      isLoading: isLoading,
    );
    return true;
  }

  deleteIncidentRiskType(String? risktype_id, {required bool isLoading}) async =>
      await incidentRiskTypeUsecase.deleteIncidentRiskType(
        risktype_id: risktype_id ?? 0,
        isLoading: isLoading,
      );
  Future<bool> updateIncidentRiskType(
      {incidentRiskTypeJsonString, required bool isLoading}) async {
    print("presenter");
    incidentRiskTypeUsecase.updateIncidentRiskType(
      incidentRiskTypeJsonString: incidentRiskTypeJsonString,
      isLoading: isLoading,
    );
    return true;
  }
}
