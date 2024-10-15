import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/facility_model.dart';

class JobListPresenter {
  JobListPresenter(this.jobUsecase);
  JobListUsecase jobUsecase;

  ///

  Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await jobUsecase.getFacilityList(isLoading: isLoading);

  Future<List<JobModel?>?> getJobList({
    String? auth,
    int? facilityId,
    bool? isExport,
    // int? userId,
    required bool self_view,
    bool? isLoading,
    dynamic endDate,
    dynamic startDate,
  }) async =>
      await jobUsecase.getJobList(
          auth: auth ?? "",
          facilityId: facilityId ?? 0,
          self_view: self_view,
          isLoading: isLoading ?? false,
          isExport: isExport,
          endDate: endDate,
          startDate: startDate);
  void clearValue() async => jobUsecase.clearValue();
  void clearTypeValue() async => jobUsecase.clearTypeValue();
}
