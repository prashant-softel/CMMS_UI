import 'package:cmms/domain/models/equipment_list_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/mc_details_plan_model.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';

import 'package:cmms/domain/repositories/repository.dart';

class ViewMcPlaningUsecase {
  ViewMcPlaningUsecase(this.repository);
  Repository repository;
  Future<McPalningDetailsModel?> getMcPlanDetail({
    bool? isLoading,
    required int planId,
  }) async =>
      await repository.getMcPlanDetail(
        planId: planId,
        isLoading: isLoading ?? false,
      );
  Future<Map<String, dynamic>> mcPlanApprovedButton({
    mcApproveJsonString,
    bool? isLoading,
  }) async =>
      await repository.mcPlanApprovedButton(
        mcApproveJsonString,
        isLoading,
      );
  Future<List<HistoryModel>?> getHistory({
    moduleType,
    id,
    bool? isLoading,
  }) async =>
      await repository.getHistory(
        moduleType,
        id,
        isLoading,
      );
  Future<List<EquipmentListModel>> getEquipmentModelList({
    required bool isLoading,
    required int? facilityId,
  }) async {
    return repository.getEquipmentModelList(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }

  Future<Map<String, dynamic>> mcPlanRejectButton({
    mcRejectJsonString,
    bool? isLoading,
  }) async =>
      await repository.mcPlanRejectButton(
        mcRejectJsonString,
        isLoading,
      );
  void saveValue({String? mcid}) async =>
      repository.saveValue(LocalKeys.mcid, mcid);
  Future<String?> getValue() async =>
      await repository.getStringValue(LocalKeys.mcid);
}
