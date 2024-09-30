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
  void saveValue1({
    String?checkpointtypeId,
  }) async {
    return createObservationUsecase.saveValue1(checkpointtypeId:checkpointtypeId);
  }

  void clearValue() async => createObservationUsecase.clearValue();
  Future<List<RiskTypeModel>> getRiskTypeList(
      {required bool isLoading, required int facility_id}) async {
    return createObservationUsecase.getRiskTypeList(
      isLoading: isLoading,
      facility_id: facility_id,
    );
  }

  Future<Map<String, dynamic>?> approveButton({
    goodsOrderApproveJsonString,
    required bool isLoading,
    required int facilityId,
    required int check_point_type_id,
    
  }) async {
    return createObservationUsecase.approveButton(
      goodsOrderApproveJsonString: goodsOrderApproveJsonString,
      isLoading: isLoading,
      facilityId:facilityId,
      check_point_type_id:check_point_type_id,
    );
  }
    Future<Map<String, dynamic>?> rejectobsButton({
    goodsOrderApproveJsonString,
    required bool isLoading,
    required int facilityId,
    required int check_point_type_id,
  }) async {
    return createObservationUsecase.rejectobsButton(
      goodsOrderApproveJsonString: goodsOrderApproveJsonString,
      isLoading: isLoading,
       facilityId:facilityId,
      check_point_type_id:check_point_type_id,
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
  Future<String?> getValue1() async => await createObservationUsecase.getValue1();
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
      {bool? isLoading, required int id,required int check_point_type_id,}) async {
    return createObservationUsecase.getObsDetail(
      id: id,
      check_point_type_id:check_point_type_id,
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
      {createObs, required bool isLoading, int? position, required int check_point_type_id,}) async {
    return createObservationUsecase.createObs(
      createObs: createObs,
      check_point_type_id:check_point_type_id,
      isLoading: isLoading,
      position: position,
    );
  }
      Future<Map<String, dynamic>?> viewObsCloseButton({
    ViewObsCloseJsonString,
    required int check_point_type_id,
    required bool isLoading,
  }) async {
    return createObservationUsecase.viewObsCloseButton(
      viewobsCloseJsonString: ViewObsCloseJsonString,
      check_point_type_id:check_point_type_id,
      isLoading: isLoading,
    );
  }
}
