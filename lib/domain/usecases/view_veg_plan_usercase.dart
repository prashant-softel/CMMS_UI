import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/veg_plan_detail_model.dart';
import 'package:cmms/domain/models/vegetation_equipment_model.dart';

class ViewVegPlanUsecase {
  ViewVegPlanUsecase(this.repository);
  Repository repository;

  Future<VegPlanDetailModel?> getVegPlanDetail({
    bool? isLoading,
    required int planId,
  }) async =>
      await repository.getVegPlanDetail(
        planId: planId,
        isLoading: isLoading ?? false,
      );
  Future<Map<String, dynamic>> vegPlanApprovedButton({
    vegApproveJsonString,
    bool? isLoading,
  }) async =>
      await repository.vegPlanApprovedButton(
        vegApproveJsonString,
        isLoading,
      );
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

  Future<Map<String, dynamic>> vegPlanRejectButton({
    vegRejectJsonString,
    bool? isLoading,
  }) async =>
      await repository.vegPlanRejectButton(
        vegRejectJsonString,
        isLoading,
      );
}
