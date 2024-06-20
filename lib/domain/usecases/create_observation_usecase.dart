import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/get_obs_deatils_by_id_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/incident_risk_type_model.dart';
import 'package:cmms/domain/models/source_of_obs_list_model.dart';
import 'package:cmms/domain/models/type_of_obs_list_model.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:cmms/domain/repositories/repository.dart';

class CreateObservationUsecase {
  CreateObservationUsecase(this.repository);
  Repository repository;

  ///

  Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await repository.getFacilityList(isLoading);
  Future<String?> getValue() async =>
      await repository.getStringValue(LocalKeys.obsId);
  void saveValue({String? obsId}) async =>
      repository.saveValue(LocalKeys.obsId, obsId);
  Future<List<HistoryModel>?> getHistory({
    moduleType,
    id,
    facilityId,
    bool? isLoading,
  }) async =>
      await repository.getHistory(
        moduleType,
        id,
        facilityId,
        isLoading,
      );
  Future<GetObservationById?> getObsDetail({
    bool? isLoading,
    required int id,
  }) async =>
      await repository.getObsDetail(
        id: id,
        isLoading: isLoading ?? false,
      );
  Future<Map<String, dynamic>> createObs({
    createObs,
    bool? isLoading,
    int? position,
  }) async =>
      await repository.createObs(
        createObs,
        isLoading,
        position,
      );
  Future<List<IncidentRiskTypeModell>> getIncidentRiskType(
      {required bool isLoading, required int facilityId}) async {
    return repository.getIncidentRiskType(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }
 void clearValue() async => repository.clearData(
        LocalKeys.obsId,
      );
  Future<List<TypeOfObsListModel?>?> getTypeOfObservationList({
    bool isLoading = true,
  }) async =>
      await repository.getTypeOfObservationList(
        isLoading: isLoading,
      );
  Future<List<SourceOfObservationListModel?>?> getSourceObservationList({
    bool isLoading = true,
  }) async =>
      await repository.getSourceObservationList(
        isLoading: isLoading,
      );
}
