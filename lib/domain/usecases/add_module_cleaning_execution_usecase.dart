import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/end_mc_execution_detail_model.dart';
import 'package:cmms/domain/models/get_mc_task_equipment_model.dart';
import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/models/type_permit_model.dart';

import '../models/facility_model.dart';

class AddModuleCleaningExecutionUsecase {
  final Repository _repository;

  AddModuleCleaningExecutionUsecase(this._repository);

  Future<void> generateToken() async {
    return await _repository.generateToken();
  }

  Future<void> startMCExecutionButton({
    int? executionId,
    bool? isLoading,
  }) async {
    await _repository.startMCExecutionButton(
      executionId,
      isLoading,
    );
  }

  Future<void> endMcExecutionButton({
    int? executionId,
    bool? isLoading,
  }) async {
    await _repository.endMcExecutionButton(
      executionId,
      isLoading,
    );
  }

  Future<Map<String, dynamic>> abandonAllExecutionButton({
    abandoneJsonString,
    bool? isLoading,
  }) async =>
      await _repository.abandonExecutionButton(
        abandoneJsonString,
        isLoading,
      );

  Future<void> startMCExecutionScheduleButton({
    int? scheduleId,
    bool? isLoading,
  }) async {
    await _repository.startMCExecutionScheduleButton(
      scheduleId,
      isLoading,
    );
  }

  Future<void> endMCScheduleExecutionButton({
    int? scheduleId,
    bool? isLoading,
  }) async {
    await _repository.endMCScheduleExecutionButton(
      scheduleId,
      isLoading,
    );
  }

  Future<Map<String, dynamic>> endMCExecutionButton({
    endJsonString,
    bool? isLoading,
  }) async =>
      await _repository.endMCExecutionButton(
        endJsonString,
        isLoading,
      );

  Future<List<GetMCTaskEquipmentList>> getMCTaskEquipmentList({
    required bool isLoading,
    required int? taskId,
    required int facilityId
  }) async {
    return _repository.getMCTaskEquipmentList(
      isLoading: isLoading,
      taskId: taskId,
      facilityId: facilityId
    );
  }

  Future<Map<String, dynamic>> abandonScheduleExecutionButton({
    abandoneScheduleJsonString,
    bool? isLoading,
  }) async =>
      await _repository.abandonScheduleExecutionButton(
        abandoneScheduleJsonString,
        isLoading,
      );
  Future<List<TypePermitModel?>?> getTypePermitList(
          bool? isLoading, int? facility_id) async =>
      await _repository.getTypePermitList(isLoading, facility_id);

  Future<List<InventoryCategoryModel?>?> getInventoryCategoryList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await _repository.getInventoryCategoryList(
        auth,
        facilityId,
        isLoading,
      );

  Future<Map<String, dynamic>> updateMCScheduleExecution({
    updateMCScheduleExecutionJsonString,
    bool? isLoading,
  }) async =>
      await _repository.updateMCScheduleExecution(
        updateMCScheduleExecutionJsonString,
        isLoading,
      );

  Future<EndMCExecutionDetailsModel?> getMCExecutionDetail({
    bool? isLoading,
    required int executionId,
    required int facilityId,
  }) async =>
      await _repository.getMCExecutionDetail(
        executionId: executionId,
        facilityId: facilityId,
        isLoading: isLoading ?? false,
      );

  Future<List<FacilityModel?>?> getFacilityList() async =>
      await _repository.getFacilityList(true);

  Future<List<FacilityModel?>?> getFacilityPlantList() async =>
      await _repository.getFacilityList(true);

  Future<String?> getUserAccessList() async =>
      await _repository.getUserAccessData(LocalKeys.userAccess);
  void saveValueMcId({String? mcid}) async =>
      _repository.saveValue(LocalKeys.mcid, mcid);
  Future<String?> getValueMcId() async =>
      await _repository.getStringValue(LocalKeys.mcid);
  void saveValuePlanId({String? planId}) async =>
      _repository.saveValue(LocalKeys.planId, planId);
  Future<String?> getValuePlanId() async =>
      await _repository.getStringValue(LocalKeys.planId);
}
