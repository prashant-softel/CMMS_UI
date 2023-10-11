import 'package:cmms/domain/models/end_mc_execution_detail_model.dart';
import 'package:cmms/domain/models/mc_details_plan_model.dart';
import 'package:cmms/domain/usecases/view_mc_planing_usecase.dart';
import '../../domain/models/inventory_model.dart';

class ViewMcPlaningPresenter {
  ViewMcPlaningPresenter(this.viewMcPlaningUsecase);
  ViewMcPlaningUsecase viewMcPlaningUsecase;

  Future<McPalningDetailsModel?> getMcPlanDetail({
    bool? isLoading,
    required int planId,
  }) async {
    return viewMcPlaningUsecase.getMcPlanDetail(
      planId: planId,
      isLoading: isLoading ?? false,
    );
  }

  Future<Map<String, dynamic>?> mcPlanApprovedButton({
    mcApproveJsonString,
    required bool isLoading,
  }) async {
    return viewMcPlaningUsecase.mcPlanApprovedButton(
      mcApproveJsonString: mcApproveJsonString,
      isLoading: isLoading,
    );
  }

  Future<Map<String, dynamic>?> mcPlanRejectButton({
    mcRejectJsonString,
    required bool isLoading,
  }) async {
    return viewMcPlaningUsecase.mcPlanRejectButton(
      mcRejectJsonString: mcRejectJsonString,
      isLoading: isLoading,
    );
  }
}
