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
    required int facilityId,
  }) async =>
      await repository.getMcPlanDetail(
        planId: planId,
        facilityId: facilityId,
        isLoading: isLoading ?? false,
      );
  Future<Map<String, dynamic>> mcPlanApprovedButton(
          {mcApproveJsonString, bool? isLoading, int? facility_id}) async =>
      await repository.mcPlanApprovedButton(
          mcApproveJsonString, isLoading, facility_id);
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
  Future<List<EquipmentListModel>> getEquipmentModelList({
    required bool isLoading,
    required int? facilityId,
  }) async {
    return repository.getEquipmentModelList(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }

  Future<Map<String, dynamic>> mcPlanRejectButton(
          {mcRejectJsonString, bool? isLoading, int? facility_id}) async =>
      await repository.mcPlanRejectButton(
          mcRejectJsonString, isLoading, facility_id);
  void saveValue({String? mcid}) async =>
      repository.saveValue(LocalKeys.mcid, mcid);
  Future<String?> getValue() async =>
      await repository.getStringValue(LocalKeys.mcid);
}
