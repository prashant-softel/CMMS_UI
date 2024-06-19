import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/get_obs_deatils_by_id_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/incident_risk_type_model.dart';
import 'package:cmms/domain/models/source_of_obs_list_model.dart';
import 'package:cmms/domain/models/type_of_obs_list_model.dart';
import 'package:cmms/domain/usecases/create_observation_usecase.dart';

class CreateObservationPresenter {
  CreateObservationPresenter(this.createObservationUsecase);
  CreateObservationUsecase createObservationUsecase;

  ///

  Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await createObservationUsecase.getFacilityList(isLoading: isLoading);
  void saveValue({
    String? obsId,
  }) async {
    return createObservationUsecase.saveValue(obsId: obsId);
  }

  Future<List<IncidentRiskTypeModell>> getIncidentRiskType(
      {required bool isLoading, required int facilityId}) async {
    return createObservationUsecase.getIncidentRiskType(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }

  Future<List<TypeOfObsListModel?>?> getTypeOfObservationList({
    required bool isLoading,
  }) async {
    return createObservationUsecase.getTypeOfObservationList(
        isLoading: isLoading);
  }

  Future<List<SourceOfObservationListModel?>?> getSourceObservationList({
    required bool isLoading,
  }) async {
    return createObservationUsecase.getSourceObservationList(
        isLoading: isLoading);
  }

  Future<String?> getValue() async => await createObservationUsecase.getValue();
  Future<List<HistoryModel>?> getHistory(
    moduleType,
    id,
    isLoading,
  ) async =>
      await createObservationUsecase.getHistory(
        moduleType: moduleType,
        id: id,
        isLoading: isLoading,
      );
  Future<GetObservationById?> getObsDetail(
      {bool? isLoading, required int id}) async {
    return createObservationUsecase.getObsDetail(
      id: id,
      isLoading: isLoading ?? false,
    );
  }

  Future<Map<String, dynamic>?> createObs(
      {createObs, required bool isLoading, int? position}) async {
    return createObservationUsecase.createObs(
      createObs: createObs,
      isLoading: isLoading,
      position: position,
    );
  }
}
