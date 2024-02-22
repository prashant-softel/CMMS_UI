import 'package:cmms/domain/models/incident_risk_type_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

import '../models/body_injured_model.dart';


class IncidentRiskTypeUsecase {
  IncidentRiskTypeUsecase(this.repository);
  Repository repository;

  Future<List<IncidentRiskTypeModell>> getIncidentRiskType(
      {required bool isLoading}) async {
    return repository.getIncidentRiskType(
      isLoading: isLoading,
    );
  }

  deleteIncidentRiskType(
          {required Object risktype_id, required bool isLoading}) async =>
      await repository.deleteIncidentRiskType(
        risktype_id,
        isLoading,
      );

  Future<bool> updateIncidentRiskType({
    incidentRiskTypeJsonString,
    bool? isLoading,
  }) async =>
      await repository.updateIncidentRiskType(
        isLoading: isLoading,
        incidentRiskTypeJsonString: incidentRiskTypeJsonString,
      );

Future<bool> createIncidentRiskType({
    incidentRiskTypeJsonString,
    bool? isLoading,
  }) async =>
      await repository.createIncidentRiskType(
          isLoading: isLoading,
          incidentRiskTypeJsonString:
              incidentRiskTypeJsonString);
  // Future<List<FacilityModel?>?> getFacilityList() async =>
  //     await repository.getFacilityList(true);
  // Future<String?> getUserAccessList() async =>
  //     await repository.getUserAccessData(LocalKeys.userAccess);
}
