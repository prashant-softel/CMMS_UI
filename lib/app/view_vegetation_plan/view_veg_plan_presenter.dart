import 'package:cmms/domain/models/veg_plan_detail_model.dart';
import 'package:cmms/domain/models/vegetation_equipment_model.dart';
import 'package:cmms/domain/usecases/view_veg_plan_usercase.dart';

class ViewVegPlanPresenter {
  ViewVegPlanPresenter(this.viewVegPlanUsecase);

  ViewVegPlanUsecase viewVegPlanUsecase;

  Future<VegPlanDetailModel?> getVegPlanDetail({
    bool? isLoading,
    required int planId,
  }) async {
    return viewVegPlanUsecase.getVegPlanDetail(
      planId: planId,
      isLoading: isLoading ?? false,
    );
  }

  Future<List<VegetationEquipmentModel>> getVegEquipmentModelList({
    required bool isLoading,
    required int? facilityId,
  }) async {
    return viewVegPlanUsecase.getVegEquipmentModelList(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }

  Future<Map<String, dynamic>?> vegPlanApprovedButton({
    vegApproveJsonString,
    required bool isLoading,
  }) async {
    return viewVegPlanUsecase.vegPlanApprovedButton(
      vegApproveJsonString: vegApproveJsonString,
      isLoading: isLoading,
    );
  }

  Future<Map<String, dynamic>?> vegPlanRejectButton({
    vegRejectJsonString,
    required bool isLoading,
  }) async {
    return viewVegPlanUsecase.vegPlanRejectButton(
      vegRejectJsonString: vegRejectJsonString,
      isLoading: isLoading,
    );
  }
}
