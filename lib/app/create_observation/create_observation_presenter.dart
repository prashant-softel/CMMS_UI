import 'package:cmms/domain/models/employee_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/get_obs_deatils_by_id_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/incident_risk_type_model.dart';
import 'package:cmms/domain/models/risk_type_list_model.dart';
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

  void clearValue() async => createObservationUsecase.clearValue();
  Future<List<RiskTypeModel>> getRiskTypeList(
      {required bool isLoading, required int facility_id}) async {
    return createObservationUsecase.getRiskTypeList(
      isLoading: isLoading,
      facility_id: facility_id,
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
  Future<List<EmployeeModel?>?> getAssignedToList({
    String? auth,
    int? facilityId,
    int? featureId,
    bool? isLoading,
  }) async =>
      await createObservationUsecase.getAssignedToList(
        auth: auth ?? "",
        facilityId: facilityId ?? 0,
        featureId: featureId ?? 0,
        isLoading: isLoading ?? false,
      );

  Future<Map<String, dynamic>?> createObs(
      {createObs, required bool isLoading, int? position}) async {
    return createObservationUsecase.createObs(
      createObs: createObs,
      isLoading: isLoading,
      position: position,
    );
  }
      Future<Map<String, dynamic>?> viewObsCloseButton({
    ViewObsCloseJsonString,
    required bool isLoading,
  }) async {
    return createObservationUsecase.viewObsCloseButton(
      viewobsCloseJsonString: ViewObsCloseJsonString,
      isLoading: isLoading,
    );
  }
}
