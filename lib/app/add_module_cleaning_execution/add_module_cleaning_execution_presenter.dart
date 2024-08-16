import 'package:cmms/domain/models/employee_model.dart';
import 'package:cmms/domain/models/end_mc_execution_detail_model.dart';
import 'package:cmms/domain/models/get_mc_task_equipment_model.dart';
import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/models/type_permit_model.dart';
import 'package:cmms/domain/usecases/add_module_cleaning_execution_usecase.dart';

import '../../domain/models/facility_model.dart';

class AddModuleCleaningExecutionPresenter {
  AddModuleCleaningExecutionPresenter(this.addModuleCleaningExecutionUsecase);
  AddModuleCleaningExecutionUsecase addModuleCleaningExecutionUsecase;

  Future<void> startMCExecutionButton({
    int? executionId,
    bool? isLoading,
  }) async =>
      await addModuleCleaningExecutionUsecase.startMCExecutionButton(
        executionId: executionId,
        isLoading: isLoading ?? false,
      );

  Future<void> endMcExecutionButton({
    int? executionId,
    bool? isLoading,
  }) async =>
      await addModuleCleaningExecutionUsecase.endMcExecutionButton(
        executionId: executionId,
        isLoading: isLoading ?? false,
      );

  Future<Map<String, dynamic>?> abandonAllExecutionButton({
    abandoneJsonString,
    required bool isLoading,
  }) async {
    return addModuleCleaningExecutionUsecase.abandonAllExecutionButton(
      abandoneJsonString: abandoneJsonString,
      isLoading: isLoading,
    );
  }

  Future<void> startMCExecutionScheduleButton({
    int? scheduleId,
    bool? isLoading,
  }) async =>
      await addModuleCleaningExecutionUsecase.startMCExecutionScheduleButton(
        scheduleId: scheduleId,
        isLoading: isLoading ?? false,
      );

  Future<void> endMCScheduleExecutionButton({
    int? scheduleId,
    bool? isLoading,
    closePtwJsonString,
  }) async =>
      await addModuleCleaningExecutionUsecase.endMCScheduleExecutionButton(
          scheduleId: scheduleId,
          isLoading: isLoading ?? false,
    closePtwJsonString:
          closePtwJsonString);

  Future<List<TypePermitModel?>?> getTypePermitList(
          {required int facility_id}) async =>
      await addModuleCleaningExecutionUsecase.getTypePermitList(
          true, facility_id);

  Future<List<InventoryCategoryModel?>?> getInventoryCategoryList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await addModuleCleaningExecutionUsecase.getInventoryCategoryList();

  Future<EndMCExecutionDetailsModel?> getMCExecutionDetail({
    bool? isLoading,
    required int executionId,
    required int facilityId,
  }) async {
    return addModuleCleaningExecutionUsecase.getMCExecutionDetail(
      executionId: executionId,
      facilityId: facilityId,
      isLoading: isLoading ?? false,
    );
  }

  Future<Map<String, dynamic>?> endMCExecutionButton({
    endJsonString,
    required bool isLoading,
  }) async {
    return addModuleCleaningExecutionUsecase.endMCExecutionButton(
      endJsonString: endJsonString,
      isLoading: isLoading,
    );
  }

  Future<List<GetMCTaskEquipmentList>> getMCTaskEquipmentList({
    required bool isLoading,
    required int facilityId,
    required int? taskId,
  }) async {
    return addModuleCleaningExecutionUsecase.getMCTaskEquipmentList(
        isLoading: isLoading, taskId: taskId, facilityId: facilityId);
  }

  Future<Map<String, dynamic>?> abandonScheduleExecutionButton({
    abandoneScheduleJsonString,
    required bool isLoading,
  }) async {
    return addModuleCleaningExecutionUsecase.abandonScheduleExecutionButton(
      abandoneScheduleJsonString: abandoneScheduleJsonString,
      isLoading: isLoading,
    );
  }

  Future<Map<String, dynamic>?> updateMCScheduleExecution({
    updateMCScheduleExecutionJsonString,
    required bool isLoading,
  }) async {
    return addModuleCleaningExecutionUsecase.updateMCScheduleExecution(
      updateMCScheduleExecutionJsonString: updateMCScheduleExecutionJsonString,
      isLoading: isLoading,
    );
  }

  Future<List<EmployeeModel?>?> getAssignedToList({
    String? auth,
    int? facilityId,
    int? featureId,
    bool? isLoading,
  }) async =>
      await addModuleCleaningExecutionUsecase.getAssignedToList(
        auth: auth ?? "",
        facilityId: facilityId ?? 0,
        featureId: featureId ?? 0,
        isLoading: isLoading ?? false,
      );
  Future<bool> assignToMC({
    int? assignId,
    int? taskId,
    required bool isLoading,
  }) async {
    return addModuleCleaningExecutionUsecase.assignToMC(
      assignId: assignId,
      taskId: taskId,
      isLoading: isLoading,
    );
  }

  Future<List<FacilityModel?>?> getFacilityList() async =>
      await addModuleCleaningExecutionUsecase.getFacilityList();

  void saveValueMcId({String? mcid}) async {
    return addModuleCleaningExecutionUsecase.saveValueMcId(mcid: mcid);
  }

  Future<String?> getValueMcId() async =>
      await addModuleCleaningExecutionUsecase.getValueMcId();
  void saveValuePlanId({String? planId}) async {
    return addModuleCleaningExecutionUsecase.saveValuePlanId(planId: planId);
  }

  Future<String?> getValuePlanId() async =>
      await addModuleCleaningExecutionUsecase.getValuePlanId();
  void clearPermitStoreData() async =>
      addModuleCleaningExecutionUsecase.clearPermitStoreData();
  void clearmcDetailsStoreData() async =>
      addModuleCleaningExecutionUsecase.clearmcDetailsStoreData();

  void clearJobDetailStoreData() async =>
      addModuleCleaningExecutionUsecase.clearJobDetailStoreData();
  void clearTypeValue() async =>
      addModuleCleaningExecutionUsecase.clearTypeValue();
  void clearisCheckedValue() async =>
      addModuleCleaningExecutionUsecase.clearisCheckedValue();
  void clearpmTaskValue() async =>
      addModuleCleaningExecutionUsecase.clearpmTaskValue();
  Future<bool> approveShecduleExecution({
    approvetoJsonString,
    required bool isLoading,
  }) async {
    return addModuleCleaningExecutionUsecase.approveShecduleExecution(
      approvetoJsonString: approvetoJsonString,
      isLoading: isLoading,
    );
  }

  Future<bool> rejectShecduleExecution({
    rejecttoJsonString,
    required bool isLoading,
  }) async {
    return addModuleCleaningExecutionUsecase.rejectShecduleExecution(
      rejecttoJsonString: rejecttoJsonString,
      isLoading: isLoading,
    );
  }

  Future<bool> endApproveExecution({
    approvetoJsonString,
    required bool isLoading,
  }) async {
    return addModuleCleaningExecutionUsecase.endApproveExecution(
      approvetoJsonString: approvetoJsonString,
      isLoading: isLoading,
    );
  }

  Future<bool> endRejectExecution({
    rejecttoJsonString,
    required bool isLoading,
  }) async {
    return addModuleCleaningExecutionUsecase.endRejectExecution(
      rejecttoJsonString: rejecttoJsonString,
      isLoading: isLoading,
    );
  }

  Future<bool> abandonedApproveExecution({
    approvetoJsonString,
    required bool isLoading,
  }) async {
    return addModuleCleaningExecutionUsecase.abandonedApproveExecution(
      approvetoJsonString: approvetoJsonString,
      isLoading: isLoading,
    );
  }

  Future<bool> abandoneRejectExecution({
    rejecttoJsonString,
    required bool isLoading,
  }) async {
    return addModuleCleaningExecutionUsecase.abandoneRejectExecution(
      rejecttoJsonString: rejecttoJsonString,
      isLoading: isLoading,
    );
  }
}
