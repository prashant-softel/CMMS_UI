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

  // Future<List<BodyInjuredModel>> getBodyInjuredList({
  //   required bool isLoading,
  // }) async {
  //   return bodyInjuredUsecase.getBodyInjuredList(isLoading: isLoading);
  // }

  // Future<bool> createBodyInjured({
  //   bodyInjuredJsonString,
  //   required bool isLoading,
  // }) async {
  //   print("presenter Create Facility type function.");
  //   bodyInjuredUsecase.createBodyInjured(
  //     bodyInjuredJsonString: bodyInjuredJsonString,
  //     isLoading: isLoading,
  //   );
  //   return true;
  // }

  // deleteBodyInjured(String? bodypart_id, {required bool isLoading}) async =>
  //     await bodyInjuredUsecase.deleteBodyInjured(
  //       bodypart_id: bodypart_id ?? 0,
  //       isLoading: isLoading,
  //     );
  // Future<bool> updateBodyInjured(
  //     {bodyInjuredJsonString, required bool isLoading}) async {
  //   print("presenter");
  //   bodyInjuredUsecase.updateBodyInjured(
  //     bodyInjuredJsonString: bodyInjuredJsonString,
  //     isLoading: isLoading,
  //   );
  //   return true;
  // }
}
