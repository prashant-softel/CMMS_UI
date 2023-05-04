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
    int? userId,
    bool? isLoading,
  }) async =>
      await jobUsecase.getJobList(
        auth: auth ?? "",
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );
      
}
