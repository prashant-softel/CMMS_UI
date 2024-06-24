import 'package:cmms/domain/models/veg_execution_details_model.dart';
import 'package:cmms/domain/usecases/view_veg_execution_usecase.dart';

class ViewVegExecutionPresenter {
  ViewVegExecutionPresenter(this.viewVegExecutionUsecase);

  ViewVegExecutionUsecase viewVegExecutionUsecase;

   Future<VegExecutionDetailsModel?> getVegExecutionDetail({
    bool? isLoading,
    required int facilityId,
    required int executionId,
  }) async {
    return viewVegExecutionUsecase.getVegExecutionDetail(
      executionId: executionId,
      facilityId:facilityId,
      isLoading: isLoading ?? false,
    );
  }

  void saveExecutionId({String? vegexe}) async {
    return viewVegExecutionUsecase.saveExecutionId(vegexe: vegexe);
  }

  Future<String?> getExecutionId() async =>
      await viewVegExecutionUsecase.getExecutionId();

  void clearExecutionId() async => viewVegExecutionUsecase.clearExecutionId();

  void savePlanId({String? vegid}) async {
    return viewVegExecutionUsecase.savePlanId(vegid: vegid);
  }

  Future<String?> getPlanId() async =>
      await viewVegExecutionUsecase.getPlanId();

  void clearPlanId() async => viewVegExecutionUsecase.clearPlanId();
}
