import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/usecases/observation_list_usecase.dart';

class ObservationListPresenter {
  ObservationListPresenter(this.observationListUsecase);
  ObservationListUsecase observationListUsecase;

  ///

  Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await observationListUsecase.getFacilityList(isLoading: isLoading);

  Future<List<JobModel?>?> getJobList({
    String? auth,
    int? facilityId,
    // int? userId,
    required bool self_view,
    bool? isLoading,
  }) async =>
      await observationListUsecase.getJobList(
        auth: auth ?? "",
        facilityId: facilityId ?? 0,
        self_view: self_view,
        isLoading: isLoading ?? false,
      );
  void clearValue() async => observationListUsecase.clearValue();
}
