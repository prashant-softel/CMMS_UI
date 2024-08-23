import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/veg_plan_detail_model.dart';
import 'package:cmms/domain/models/vegetation_equipment_model.dart';

class ViewVegPlanUsecase {
  ViewVegPlanUsecase(this.repository);
  Repository repository;

  Future<VegPlanDetailModel?> getVegPlanDetail({
    bool? isLoading,
    required int planId,
    required int facilityId,
  }) async =>
      await repository.getVegPlanDetail(
        planId: planId,
        facilityId: facilityId,
        isLoading: isLoading ?? false,
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
  Future<Map<String, dynamic>> vegPlanApprovedButton(
          {vegApproveJsonString, bool? isLoading, int? facilityId}) async =>
      await repository.vegPlanApprovedButton(
          vegApproveJsonString, isLoading, facilityId);
  // Future<List<HistoryModel>?> getHistory({
  //   moduleType,
  //   id,
  //   bool? isLoading,
  // }) async =>
  //     await repository.getHistory(
  //       moduleType,
  //       id,
  //       isLoading,
  //     );
  Future<List<VegetationEquipmentModel>> getVegEquipmentModelList({
    required bool isLoading,
    required int? facilityId,
  }) async {
    return repository.getVegEquipmentModelList(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }

  Future<Map<String, dynamic>> vegPlanRejectButton(
          {vegRejectJsonString, bool? isLoading, int? facilityId}) async =>
      await repository.vegPlanRejectButton(
          vegRejectJsonString, isLoading, facilityId);
  void saveValue({String? vegid}) async =>
      repository.saveValue(LocalKeys.vegid, vegid);
  Future<String?> getValue() async =>
      await repository.getStringValue(LocalKeys.vegid);
  void clearValue() async => repository.clearData(
        LocalKeys.vegid,
      );
}
