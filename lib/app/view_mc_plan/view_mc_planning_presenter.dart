import 'package:cmms/domain/models/end_mc_execution_detail_model.dart';
import 'package:cmms/domain/usecases/view_mc_planing_usecase.dart';
import '../../domain/models/inventory_model.dart';

class ViewMcPlaningPresenter {
  ViewMcPlaningPresenter(this.viewMcPlaningUsecase);
  ViewMcPlaningUsecase viewMcPlaningUsecase;

  Future<EndMCExecutionDetailsModel?> getMcPlanDetail({
    bool? isLoading,
    required int planId,
  }) async {
    return viewMcPlaningUsecase.getMcPlanDetail(
      planId: planId,
      isLoading: isLoading ?? false,
    );
  }
}
