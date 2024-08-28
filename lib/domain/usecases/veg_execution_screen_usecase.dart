import 'package:cmms/domain/models/employee_model.dart';
import 'package:cmms/domain/models/history_model.dart';
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

  Future<bool> assignToVeg(
          {int? assignId,
          int? taskId,
          required bool isLoading,
          int? facilityId}) async =>
      await repository.assignToVeg(
          assignId: assignId,
          taskId: taskId,
          isLoading: isLoading,
          facilityId: facilityId);

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

  Future<void> startVegExecutionButton(
      {int? executionId, bool? isLoading, int? facilityId}) async {
    await repository.startVegExecutionButton(
        executionId, isLoading, facilityId);
  }

  Future<void> endVegExecutionButton(
      {int? executionId, bool? isLoading, int? facilityId}) async {
    await repository.endVegExecutionButton(executionId, isLoading, facilityId);
  }

  Future<Map<String, dynamic>> abandonVegExecutionButton(
          {abandoneJsonString, bool? isLoading, int? facilityId}) async =>
      await repository.abandonVegExecutionButton(
          abandoneJsonString, isLoading, facilityId);

  Future<void> startVegExecutionScheduleButton(
      {int? scheduleId, bool? isLoading, int? facilityId}) async {
    await repository.startVegExecutionScheduleButton(
        scheduleId, isLoading, facilityId);
  }

  Future<void> endVegScheduleExecutionButton(
      {int? scheduleId,
      bool? isLoading,
      closePtwJsonString,
      int? facilityId}) async {
    await repository.endVegScheduleExecutionButton(
        scheduleId, isLoading, closePtwJsonString, facilityId);
  }

  Future<Map<String, dynamic>> abandonVegScheduleButton({
    abandoneScheduleJsonString,
    bool? isLoading,
  }) async =>
      await repository.abandonVegScheduleButton(
        abandoneScheduleJsonString,
        isLoading,
      );

  Future<Map<String, dynamic>?> updateVegScheduleExecution(
      {updateVegJson, required bool isLoading, int? facilityId}) async {
    return repository.updateVegScheduleExecution(
        updateVegJson: updateVegJson,
        isLoading: isLoading,
        facilityId: facilityId);
  }

  Future<bool> vegapproveShecduleExecution(
          {approvetoJsonString, bool? isLoading, int? facilityId}) async =>
      await repository.vegapproveShecduleExecution(
          approvetoJsonString: approvetoJsonString,
          isLoading: isLoading,
          facilityId: facilityId);
  Future<bool> vegrejectShecduleExecution(
          {rejecttoJsonString, bool? isLoading, int? facilityId}) async =>
      await repository.vegrejectShecduleExecution(
          rejecttoJsonString: rejecttoJsonString,
          isLoading: isLoading,
          facilityId: facilityId);

  Future<bool> endApproveExecution(
          {approvetoJsonString, bool? isLoading, int? facilityId}) async =>
      await repository.vegendApproveExecution(
          approvetoJsonString: approvetoJsonString,
          isLoading: isLoading,
          facilityId: facilityId);
  Future<bool> endRejectExecution(
          {rejecttoJsonString, bool? isLoading, int? facilityId}) async =>
      await repository.vegendRejectExecution(
          rejecttoJsonString: rejecttoJsonString,
          isLoading: isLoading,
          facilityId: facilityId);
  Future<bool> abandonedApproveExecution(
          {approvetoJsonString, bool? isLoading, int? facilityId}) async =>
      await repository.vegabandonedApproveExecution(
          approvetoJsonString: approvetoJsonString,
          isLoading: isLoading,
          facilityId: facilityId);
  Future<bool> abandoneRejectExecution(
          {rejecttoJsonString, bool? isLoading, int? facilityId}) async =>
      await repository.vegabandoneRejectExecution(
          rejecttoJsonString: rejecttoJsonString,
          isLoading: isLoading,
          facilityId: facilityId);

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
