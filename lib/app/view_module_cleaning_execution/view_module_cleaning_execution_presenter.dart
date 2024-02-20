import 'package:cmms/domain/models/end_mc_execution_detail_model.dart';
import 'package:cmms/domain/models/equipment_list_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/usecases/view_module_cleaning_execution_usecase.dart';

import '../../domain/models/get_mc_task_equipment_model.dart';

class ViewModuleCleaningExecutionPresenter {
  ViewModuleCleaningExecutionPresenter(this.viewModuleCleaningExecutionUsecase);
  ViewModuleCleaningExecutionUsecase viewModuleCleaningExecutionUsecase;

  Future<List<HistoryModel>?> getMCExecutionHistory(
    moduleType,
    id,
    isLoading,
  ) async =>
      await viewModuleCleaningExecutionUsecase.getMCExecutionHistory(
        moduleType: moduleType,
        id: id,
        isLoading: isLoading,
      );

  Future<Map<String, dynamic>?> mcExecutionApprovedButton({
    mcExecutionApproveJsonString,
    required bool isLoading,
  }) async {
    return viewModuleCleaningExecutionUsecase.mcExecutionApprovedButton(
      mcExecutionApproveJsonString: mcExecutionApproveJsonString,
      isLoading: isLoading,
    );
  }

  Future<List<GetMCTaskEquipmentList>> getMCTaskEquipmentList({
    required bool isLoading,
    required int? taskId,
  }) async {
    return viewModuleCleaningExecutionUsecase.getMCTaskEquipmentList(
      isLoading: isLoading,
      taskId: taskId,
    );
  }

  Future<Map<String, dynamic>?> rejectMcExecutionApprovedButton({
    rejectMcExecutionApproveJsonString,
    required bool isLoading,
  }) async {
    return viewModuleCleaningExecutionUsecase.rejectMcExecutionApprovedButton(
      rejectMcExecutionApproveJsonString: rejectMcExecutionApproveJsonString,
      isLoading: isLoading,
    );
  }

  Future<EndMCExecutionDetailsModel?> getMCExecutionDetail({
    bool? isLoading,
    required int executionId,
  }) async {
    return viewModuleCleaningExecutionUsecase.getMCExecutionDetail(
      executionId: executionId,
      isLoading: isLoading ?? false,
    );
  }

  // Future<List<FacilityModel?>?> getFacilityList() async =>
  //     await addModuleCleaningExecutionUsecase.getFacilityList();

  ///
  ///
  void saveValueMcId({String? mcid}) async {
    return viewModuleCleaningExecutionUsecase.saveValueMcId(mcid: mcid);
  }

  Future<String?> getValueMcId() async =>
      await viewModuleCleaningExecutionUsecase.getValueMcId();
  void saveValuePlanId({String? planId}) async {
    return viewModuleCleaningExecutionUsecase.saveValuePlanId(planId: planId);
  }

  Future<String?> getValuePlanId() async =>
      await viewModuleCleaningExecutionUsecase.getValuePlanId();
}
