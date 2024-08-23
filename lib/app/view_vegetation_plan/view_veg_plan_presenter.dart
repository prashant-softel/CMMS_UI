import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/veg_plan_detail_model.dart';
import 'package:cmms/domain/models/vegetation_equipment_model.dart';
import 'package:cmms/domain/usecases/view_veg_plan_usercase.dart';

class ViewVegPlanPresenter {
  ViewVegPlanPresenter(this.viewVegPlanUsecase);

  ViewVegPlanUsecase viewVegPlanUsecase;

  Future<VegPlanDetailModel?> getVegPlanDetail({
    bool? isLoading,
    required int planId,
    required int facilityId,
  }) async {
    return viewVegPlanUsecase.getVegPlanDetail(
      planId: planId,
      facilityId: facilityId,
      isLoading: isLoading ?? false,
    );
  }

  Future<List<HistoryModel>?> getHistory(
    moduleType,
    id,
    facilityId,
    isLoading,
  ) async =>
      await viewVegPlanUsecase.getHistory(
        moduleType: moduleType,
        id: id,
        facilityId: facilityId,
        isLoading: isLoading,
      );
  Future<List<VegetationEquipmentModel>> getVegEquipmentModelList({
    required bool isLoading,
    required int? facilityId,
  }) async {
    return viewVegPlanUsecase.getVegEquipmentModelList(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }

  Future<Map<String, dynamic>?> vegPlanApprovedButton(
      {vegApproveJsonString, required bool isLoading, int? facilityId}) async {
    return viewVegPlanUsecase.vegPlanApprovedButton(
        vegApproveJsonString: vegApproveJsonString,
        isLoading: isLoading,
        facilityId: facilityId);
  }

  Future<Map<String, dynamic>?> vegPlanRejectButton(
      {vegRejectJsonString, required bool isLoading, int? facilityId}) async {
    return viewVegPlanUsecase.vegPlanRejectButton(
        vegRejectJsonString: vegRejectJsonString,
        isLoading: isLoading,
        facilityId: facilityId);
  }

  void saveValue({String? vegid}) async {
    return viewVegPlanUsecase.saveValue(vegid: vegid);
  }

  Future<String?> getValue() async => await viewVegPlanUsecase.getValue();
  void clearValue() async => viewVegPlanUsecase.clearValue();
}
