import 'package:cmms/domain/models/veg_execution_details_model.dart';
import 'package:cmms/domain/usecases/view_veg_execution_usecase.dart';

class ViewVegExecutionPresenter {
  ViewVegExecutionPresenter(this.viewVegExecutionUsecase);

  ViewVegExecutionUsecase viewVegExecutionUsecase;

   Future<VegExecutionDetailsModel?> getVegExecutionDetail({
    bool? isLoading,
    required int executionId,
  }) async {
    return viewVegExecutionUsecase.getVegExecutionDetail(
      executionId: executionId,
      isLoading: isLoading ?? false,
    );
  }

  void saveValueVegId({String? vegid}) async {
    return viewVegExecutionUsecase.saveValueVegId(vegid: vegid);
  }

  Future<String?> getValueVegId() async =>
      await viewVegExecutionUsecase.getValueVegId();

  void saveValuePlanId({String? vegplanId}) async {
    return viewVegExecutionUsecase.saveValuePlanId(vegplanId: vegplanId);
  }

  Future<String?> getValuePlanId() async =>
      await viewVegExecutionUsecase.getValuePlanId();
}
