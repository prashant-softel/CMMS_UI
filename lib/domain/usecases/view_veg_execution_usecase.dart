import 'package:cmms/domain/domain.dart';
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
        facilityId: facilityId,
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

  void saveExecutionId({String? vegexe}) async =>
      repository.saveValue(LocalKeys.vegexe, vegexe);

  Future<String?> getExecutionId() async =>
      await repository.getStringValue(LocalKeys.vegexe);

  void clearExecutionId() async => repository.clearData(LocalKeys.vegexe);

  void savePlanId({String? vegid}) async =>
      repository.saveValue(LocalKeys.vegid, vegid);

  Future<String?> getPlanId() async =>
      await repository.getStringValue(LocalKeys.vegid);

  void clearPlanId() async => repository.clearData(LocalKeys.vegid);
}
