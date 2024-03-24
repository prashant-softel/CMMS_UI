import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/veg_execution_details_model.dart';

class ViewVegExecutionUsecase {
  ViewVegExecutionUsecase(this.repository);
  Repository repository;

  Future<void> generateToken() async {
    return await repository.generateToken();
  }

  Future<VegExecutionDetailsModel?> getVegExecutionDetail({
    bool? isLoading,
    required int facilityId,
    required int executionId,
  }) async =>
      await repository.getVegExecutionDetail(
        executionId: executionId,
        facilityId:facilityId,
        isLoading: isLoading ?? false,
      );  

  // Future<Map<String, dynamic>> vegExecutionApprovedButton({
  //   mcExecutionApproveJsonString,
  //   bool? isLoading,
  // }) async =>
  //     await repository.vegExecutionApprovedButton(
  //       mcExecutionApproveJsonString,
  //       isLoading,
  //     );

  Future<List<FacilityModel?>?> getFacilityList() async =>
      await repository.getFacilityList(true);

  Future<List<FacilityModel?>?> getFacilityPlantList() async =>
      await repository.getFacilityList(true);

  Future<String?> getUserAccessList() async =>
      await repository.getUserAccessData(LocalKeys.userAccess);


  void saveValueVegId({String? vegid}) async =>
      repository.saveValue(LocalKeys.vegid, vegid);

  Future<String?> getValueVegId() async =>
      await repository.getStringValue(LocalKeys.vegid);

  void saveValuePlanId({String? vegplanId}) async =>
      repository.saveValue(LocalKeys.vegplanId, vegplanId);

  Future<String?> getValuePlanId() async =>
      await repository.getStringValue(LocalKeys.vegplanId);
}
