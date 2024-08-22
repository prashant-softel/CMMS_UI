import 'package:cmms/domain/models/employee_model.dart';
import 'package:cmms/domain/models/veg_execution_details_model.dart';
import 'package:cmms/domain/models/veg_task_equipment_model.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:cmms/domain/repositories/repository.dart';

class VegExecutionUsecase {
  VegExecutionUsecase(this.repository);
  Repository repository;

  Future<List<EmployeeModel?>?> getAssignedToList({
    String? auth,
    int? facilityId,
    int? featureId,
    bool? isLoading,
  }) async =>
      await repository.getAssignedToEmployee(
        auth,
        facilityId,
        featureId,
        isLoading,
      );

  Future<bool> assignToVeg({
    int? assignId,
    int? taskId,
    required bool isLoading,
  }) async =>
      await repository.assignToVeg(
        assignId: assignId,
        taskId: taskId,
        isLoading: isLoading,
      );

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
    required bool isLoading,
    required int facilityId,
    required int executionId,
  }) async =>
      await repository.getVegTaskEquipmentList(
        isLoading: isLoading,
        executionId: executionId,
        facilityId: facilityId,
       
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

  Future<void> endVegScheduleExecutionButton(
      {int? scheduleId, bool? isLoading, closePtwJsonString}) async {
    await repository.endVegScheduleExecutionButton(
        scheduleId, isLoading, closePtwJsonString);
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

  Future<bool> vegapproveShecduleExecution({
    approvetoJsonString,
    bool? isLoading,
  }) async =>
      await repository.vegapproveShecduleExecution(
          approvetoJsonString: approvetoJsonString, isLoading: isLoading);
  Future<bool> vegrejectShecduleExecution({
    rejecttoJsonString,
    bool? isLoading,
  }) async =>
      await repository.vegrejectShecduleExecution(
          rejecttoJsonString: rejecttoJsonString, isLoading: isLoading);

  Future<bool> endApproveExecution({
    approvetoJsonString,
    bool? isLoading,
  }) async =>
      await repository.vegendApproveExecution(
          approvetoJsonString: approvetoJsonString, isLoading: isLoading);
  Future<bool> endRejectExecution({
    rejecttoJsonString,
    bool? isLoading,
  }) async =>
      await repository.vegendRejectExecution(
          rejecttoJsonString: rejecttoJsonString, isLoading: isLoading);
  Future<bool> abandonedApproveExecution({
    approvetoJsonString,
    bool? isLoading,
  }) async =>
      await repository.vegabandonedApproveExecution(
          approvetoJsonString: approvetoJsonString, isLoading: isLoading);
  Future<bool> abandoneRejectExecution({
    rejecttoJsonString,
    bool? isLoading,
  }) async =>
      await repository.vegabandoneRejectExecution(
          rejecttoJsonString: rejecttoJsonString, isLoading: isLoading);

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
  void clearPermitStoreData() async => repository.clearData(LocalKeys.permitId);
  void clearmcDetailsStoreData() async =>
      repository.clearData(LocalKeys.mcTaskId);
  void clearJobDetailStoreData() async =>
      repository.clearData(LocalKeys.jobModel);
  void clearTypeValue() async => repository.clearData(LocalKeys.types);
  void clearisCheckedValue() async => repository.clearData(LocalKeys.isChecked);
  void clearpmTaskValue() async => repository.clearData(LocalKeys.pmTaskModel);
}
