import 'package:cmms/domain/models/veg_execution_details_model.dart';
import 'package:cmms/domain/models/veg_task_equipment_model.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:cmms/domain/repositories/repository.dart';

class VegExecutionUsecase {
  VegExecutionUsecase(this.repository);
  Repository repository;

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

  Future<List<VegTaskEquipmentList?>> getVegTaskEquipmentList({
    bool? isLoading,
    required int facilityId,
    required int executionId,
  }) async =>
      await repository.getVegTaskEquipmentList(
        executionId: executionId,
        facilityId: facilityId,
        isLoading: isLoading ?? false,
      );

  Future<void> startVegExecutionButton({
    int? executionId,
    bool? isLoading,
  }) async {
    await repository.startVegExecutionButton(
      executionId,
      isLoading,
    );
  }

  Future<void> endVegExecutionButton({
    int? executionId,
    bool? isLoading,
  }) async {
    await repository.endVegExecutionButton(
      executionId,
      isLoading,
    );
  }

  Future<Map<String, dynamic>> abandonVegExecutionButton({
    abandoneJsonString,
    bool? isLoading,
  }) async =>
      await repository.abandonVegExecutionButton(
        abandoneJsonString,
        isLoading,
      );

  Future<void> startVegExecutionScheduleButton({
    int? scheduleId,
    bool? isLoading,
  }) async {
    await repository.startVegExecutionScheduleButton(
      scheduleId,
      isLoading,
    );
  }

  Future<void> endVegScheduleExecutionButton({
    int? scheduleId,
    bool? isLoading,
  }) async {
    await repository.endVegScheduleExecutionButton(
      scheduleId,
      isLoading,
    );
  }

  Future<Map<String, dynamic>> abandonVegScheduleButton({
    abandoneScheduleJsonString,
    bool? isLoading,
  }) async =>
      await repository.abandonVegScheduleButton(
        abandoneScheduleJsonString,
        isLoading,
      );
      
  Future<Map<String, dynamic>?> updateVegScheduleExecution({
    updateVegJson,
    required bool isLoading,
  }) async {
    return repository.updateVegScheduleExecution(
      updateVegJson: updateVegJson,
      isLoading: isLoading,
    );
  }

  void savePlanId({String? vegid}) async =>
      repository.saveValue(LocalKeys.vegid, vegid);
  Future<String?> getPlanId() async =>
      await repository.getStringValue(LocalKeys.vegid);
  void clearPlanId() => repository.clearData(LocalKeys.vegid);
  void saveExecutionId({String? vegexe}) async =>
      repository.saveValue(LocalKeys.vegexe, vegexe);
  Future<String?> getExecutionId() async =>
      await repository.getStringValue(LocalKeys.vegexe);
  void clearExecutionId() => repository.clearData(LocalKeys.vegexe);
}
