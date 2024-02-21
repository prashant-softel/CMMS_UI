import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/veg_execution_details_model.dart';

class ViewVegExecutionUsecase {
  ViewVegExecutionUsecase(this.repository);
  Repository repository;

  Future<VegExecutionDetailsModel?> getVegExecutionDetail({
    bool? isLoading,
    required int executionId,
  }) async =>
      await repository.getVegExecutionDetail(
        executionId: executionId,
        isLoading: isLoading ?? false,
      );  

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
