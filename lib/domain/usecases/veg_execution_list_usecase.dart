import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/veg_task_list_model.dart';

class VegExecutionListUsecase {
  VegExecutionListUsecase(this.repository);
  Repository repository;

  Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await repository.getFacilityList(isLoading);

  // void clearValueMcId() async => repository.clearData(LocalKeys.mcid);
  // void clearValuePlanId() async => repository.clearData(LocalKeys.planId);

  Future<List<VegTaskListModel>> getVegTaskList(
      {required bool isLoading,
      required dynamic? facility_id,
      dynamic endDate,
      dynamic startDate,
      bool? self_view,
      bool? isExport
      // String? start_date,
      // required String end_date,
      }) async {
    return repository.getVegTaskList(
        isLoading: isLoading,
        facility_id: facility_id,
        startDate: startDate,
        endDate: endDate,
        self_view:self_view,
        isExport: isExport
        // start_date: start_date,
        // end_date: end_date,
        );
  }

  void clearPlanId() async => repository.clearData(LocalKeys.vegid);
  void clearExecutionId() async => repository.clearData(LocalKeys.vegexe);
}
