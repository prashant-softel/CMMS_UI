import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/end_mc_execution_detail_model.dart';
import 'package:cmms/domain/models/equipment_list_model.dart';
import 'package:cmms/domain/models/history_model.dart';

import '../models/facility_model.dart';
import '../models/get_mc_task_equipment_model.dart';

class ViewModuleCleaningExecutionUsecase {
  final Repository _repository;

  ViewModuleCleaningExecutionUsecase(this._repository);

  Future<void> generateToken() async {
    return await _repository.generateToken();
  }

  Future<List<HistoryModel>?> getMCExecutionHistory({
    moduleType,
    id,
    bool? isLoading,
  }) async =>
      await _repository.getHistory(
        moduleType,
        id,
        isLoading,
      );

  Future<Map<String, dynamic>> mcExecutionApprovedButton({
    mcExecutionApproveJsonString,
    bool? isLoading,
  }) async =>
      await _repository.mcExecutionApprovedButton(
        mcExecutionApproveJsonString,
        isLoading,
      );

  Future<List<GetMCTaskEquipmentList>> getMCTaskEquipmentList({
    required bool isLoading,
    required int? taskId,
  }) async {
    return _repository.getMCTaskEquipmentList(
      isLoading: isLoading,
      taskId: taskId,
    );
  }

  Future<Map<String, dynamic>> rejectMcExecutionApprovedButton({
    rejectMcExecutionApproveJsonString,
    bool? isLoading,
  }) async =>
      await _repository.rejectMcExecutionApprovedButton(
        rejectMcExecutionApproveJsonString,
        isLoading,
      );

  Future<EndMCExecutionDetailsModel?> getMCExecutionDetail({
    bool? isLoading,
    required int executionId,
  }) async =>
      await _repository.getMCExecutionDetail(
        executionId: executionId,
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
