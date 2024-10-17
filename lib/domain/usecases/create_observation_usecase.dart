import 'package:cmms/domain/models/employee_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/get_obs_deatils_by_id_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/risk_type_list_model.dart';
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
      await repository.getStringValue(LocalKeys.obsId,);
  Future<String?> getValue1() async =>
      await repository.getStringValue(LocalKeys.checkpointtypeId);
  void saveValue({String? obsId}) async =>
      repository.saveValue(
        LocalKeys.obsId, 
        obsId, 
        // LocalKeys.checkpointtypeId,
        // checkpointtypeId
        );
  void saveValue1({String?checkpointtypeId}) async =>
      repository.saveValue(
        // LocalKeys.obsId, 
        // obsId, 
        LocalKeys.checkpointtypeId,
        checkpointtypeId
        );
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
    required int check_point_type_id,
  }) async =>
      await repository.getObsDetail(
        id: id,
        check_point_type_id:check_point_type_id,
        isLoading: isLoading ?? false,
      );
  Future<Map<String, dynamic>> createObs({
    createObs,
    bool? isLoading,
    int? position,
    int? check_point_type_id,
  }) async =>
      await repository.createObs(
        createObs,
        isLoading,
         position,
         check_point_type_id,
       
      );
  Future<List<RiskTypeModel>> getRiskTypeList(
      {required bool isLoading, required int facility_id}) async {
    return repository.getRiskTypeList(
      isLoading: isLoading,
      facility_id: facility_id,
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
Future<List<EmployeeModel?>?> getAssignedToList({
    String? auth,
    int? facilityId,
    int? featureId,
    int? isattendanceneeded,
    bool? isLoading,
  }) async =>
      await repository.getAssignedToListWOAttend(
        auth,
        facilityId,
        featureId,
        isattendanceneeded,
        isLoading,
      );
       Future<Map<String, dynamic>> viewObsCloseButton({
    viewobsCloseJsonString,
    int? check_point_type_id,
    bool? isLoading,
  }) async =>
      await repository.viewObsCloseButton(
        viewobsCloseJsonString,
        isLoading,
        check_point_type_id,
      );

  Future<Map<String, dynamic>> approveButton({
    goodsOrderApproveJsonString,
    bool? isLoading,
    int?facilityId,
    int?check_point_type_id,
  }) async =>
      await repository.approveButton(
        goodsOrderApproveJsonString,
        isLoading,
        facilityId,
        check_point_type_id,
      );

  Future<Map<String, dynamic>> rejectobsButton({
    goodsOrderApproveJsonString,
    bool? isLoading,
    int? facilityId,
    int? check_point_type_id,
  }) async =>
      await repository.rejectobsButton(
        goodsOrderApproveJsonString,
        isLoading,
        facilityId,
        check_point_type_id,
      );
}
