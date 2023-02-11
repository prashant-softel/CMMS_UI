import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/facility_model.dart';

class JobListPresenter {
  JobListPresenter(this.jobUsecase);
  JobListUsecase jobUsecase;

  ///

  Future<List<FacilityModel?>?> getFacilityList() async =>
      await jobUsecase.getFacilityList();

  Future<List<JobModel?>?> getJobList({
    String? auth,
    int? facilityId,
    int? userId,
    bool? isLoading,
  }) async =>
      await jobUsecase.getJobList(
        auth: auth ?? "",
        facilityId: facilityId ?? 0,
        userId: userId ?? 0,
        isLoading: isLoading ?? false,
      );
}
