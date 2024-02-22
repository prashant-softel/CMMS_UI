import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/veg_task_list_model.dart';
import 'package:cmms/domain/usecases/veg_execution_list_usecase.dart';

class VegExecutionListPresenter {
  VegExecutionListPresenter(this.vegExecutionListUsecase);

  VegExecutionListUsecase vegExecutionListUsecase;

  Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await vegExecutionListUsecase.getFacilityList(isLoading: isLoading);
  // void clearValueMcId() async =>
  //     vegExecutionListUsecase.clearValueMcId();
  // void clearValuePlanId() async =>
  //     vegExecutionListUsecase.clearValuePlanId();

  Future<List<VegTaskListModel>> getVegTaskList({
    required bool isLoading,
    required int? facility_id,
    // String? start_date,
    // required String end_date,
  }) async {
    return vegExecutionListUsecase.getVegTaskList(
      isLoading: isLoading,
      facility_id: facility_id,
      // start_date: start_date,
      // end_date: end_date,
    );
  }

  void clearValueVegId() async =>
      vegExecutionListUsecase.clearValueVegId();
  void clearValueVegPlanId() async =>
      vegExecutionListUsecase.clearValueVegPlanId();
}
