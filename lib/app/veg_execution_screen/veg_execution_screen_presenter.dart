import 'package:cmms/domain/models/employee_model.dart';
import 'package:cmms/domain/models/veg_execution_details_model.dart';
import 'package:cmms/domain/models/veg_task_equipment_model.dart';
import 'package:cmms/domain/usecases/veg_execution_screen_usecase.dart';

class VegExecutionPresenter {
  VegExecutionPresenter(this.vegExecutionUsecase);
  VegExecutionUsecase vegExecutionUsecase;

  Future<List<EmployeeModel?>?> getAssignedToList({
    String? auth,
    int? facilityId,
    int? featureId,
    bool? isLoading,
  }) async =>
      await vegExecutionUsecase.getAssignedToList(
        auth: auth ?? "",
        facilityId: facilityId ?? 0,
        featureId: featureId ?? 0,
        isLoading: isLoading ?? false,
      );
  Future<bool> assignToVeg(
      {int? assignId,
      int? taskId,
      required bool isLoading,
      int? facilityId}) async {
    return vegExecutionUsecase.assignToVeg(
        assignId: assignId,
        taskId: taskId,
        isLoading: isLoading,
        facilityId: facilityId);
  }

  void clearPermitStoreData() async =>
      vegExecutionUsecase.clearPermitStoreData();
  void clearmcDetailsStoreData() async =>
      vegExecutionUsecase.clearmcDetailsStoreData();

  void clearJobDetailStoreData() async =>
      vegExecutionUsecase.clearJobDetailStoreData();
  void clearTypeValue() async => vegExecutionUsecase.clearTypeValue();
  void clearisCheckedValue() async => vegExecutionUsecase.clearisCheckedValue();
  void clearpmTaskValue() async => vegExecutionUsecase.clearpmTaskValue();

  Future<VegExecutionDetailsModel?> getVegExecutionDetail({
    bool? isLoading,
    required int facilityId,
    required int executionId,
  }) async {
    return vegExecutionUsecase.getVegExecutionDetail(
      executionId: executionId,
      facilityId: facilityId,
      isLoading: isLoading ?? false,
    );
  }

  Future<List<VegTaskEquipmentList?>> getVegTaskEquipmentList({
    required bool isLoading,
    required int facilityId,
    required int executionId,
  }) async {
    return vegExecutionUsecase.getVegTaskEquipmentList(
      isLoading: isLoading,
      executionId: executionId,
      facilityId: facilityId,
    );
  }

  Future<void> startVegExecutionButton(
          {int? executionId, bool? isLoading, int? facilityId}) async =>
      await vegExecutionUsecase.startVegExecutionButton(
          executionId: executionId,
          isLoading: isLoading ?? false,
          facilityId: facilityId);

  Future<void> endVegExecutionButton(
          {int? executionId, bool? isLoading, int? facilityId}) async =>
      await vegExecutionUsecase.endVegExecutionButton(
          executionId: executionId,
          isLoading: isLoading ?? false,
          facilityId: facilityId);

  Future<Map<String, dynamic>?> abandonVegExecutionButton(
      {abandoneJsonString, required bool isLoading, int? facilityId}) async {
    return vegExecutionUsecase.abandonVegExecutionButton(
        abandoneJsonString: abandoneJsonString,
        isLoading: isLoading,
        facilityId: facilityId);
  }

  Future<void> startVegExecutionScheduleButton(
          {int? scheduleId, bool? isLoading, int? facilityId}) async =>
      await vegExecutionUsecase.startVegExecutionScheduleButton(
          scheduleId: scheduleId,
          isLoading: isLoading ?? false,
          facilityId: facilityId);

  Future<void> endVegScheduleExecutionButton(
          {int? scheduleId,
          bool? isLoading,
          closePtwJsonString,
          int? facilityId}) async =>
      await vegExecutionUsecase.endVegScheduleExecutionButton(
          scheduleId: scheduleId,
          isLoading: isLoading ?? false,
          closePtwJsonString: closePtwJsonString,
          facilityId: facilityId);

  Future<Map<String, dynamic>?> abandonVegScheduleButton({
    abandoneScheduleJsonString,
    required bool isLoading,
  }) async {
    return vegExecutionUsecase.abandonVegScheduleButton(
      abandoneScheduleJsonString: abandoneScheduleJsonString,
      isLoading: isLoading,
    );
  }

  Future<Map<String, dynamic>?> updateVegScheduleExecution(
      {updateVegJson, required bool isLoading, int? facilityId}) async {
    return vegExecutionUsecase.updateVegScheduleExecution(
        updateVegJson: updateVegJson,
        isLoading: isLoading,
        facilityId: facilityId);
  }

  Future<bool> vegapproveShecduleExecution(
      {approvetoJsonString, required bool isLoading, int? facilityId}) async {
    return vegExecutionUsecase.vegapproveShecduleExecution(
        approvetoJsonString: approvetoJsonString,
        isLoading: isLoading,
        facilityId: facilityId);
  }

  Future<bool> vegrejectShecduleExecution(
      {rejecttoJsonString, required bool isLoading, int? facilityId}) async {
    return vegExecutionUsecase.vegrejectShecduleExecution(
        rejecttoJsonString: rejecttoJsonString,
        isLoading: isLoading,
        facilityId: facilityId);
  }

  Future<bool> endApproveExecution(
      {approvetoJsonString, required bool isLoading, int? facilityId}) async {
    return vegExecutionUsecase.endApproveExecution(
        approvetoJsonString: approvetoJsonString,
        isLoading: isLoading,
        facilityId: facilityId);
  }

  Future<bool> endRejectExecution(
      {rejecttoJsonString, required bool isLoading, int? facilityId}) async {
    return vegExecutionUsecase.endRejectExecution(
        rejecttoJsonString: rejecttoJsonString,
        isLoading: isLoading,
        facilityId: facilityId);
  }

  Future<bool> abandonedApproveExecution(
      {approvetoJsonString, required bool isLoading, int? facilityId}) async {
    return vegExecutionUsecase.abandonedApproveExecution(
        approvetoJsonString: approvetoJsonString,
        isLoading: isLoading,
        facilityId: facilityId);
  }

  Future<bool> abandoneRejectExecution(
      {rejecttoJsonString, required bool isLoading, int? facilityId}) async {
    return vegExecutionUsecase.abandoneRejectExecution(
        rejecttoJsonString: rejecttoJsonString,
        isLoading: isLoading,
        facilityId: facilityId);
  }

  void savePlanId({String? vegid}) async =>
      vegExecutionUsecase.savePlanId(vegid: vegid);
  Future<String?> getPlanId() async => await vegExecutionUsecase.getPlanId();
  void saveExecutionId({String? vegexe}) async =>
      vegExecutionUsecase.saveExecutionId(vegexe: vegexe);
  Future<String?> getExecutionId() async =>
      await vegExecutionUsecase.getExecutionId();
  void clearExecutionId() => vegExecutionUsecase.clearExecutionId();
  void clearPlanId() => vegExecutionUsecase.clearPlanId();
}
