import '../../domain/models/job_details_model.dart';
import '../../domain/usecases/job_details_usecase.dart';

class JobDetailsPresenter {
  JobDetailsPresenter(this.jobDetailsUsecase);
  JobDetailsUsecase jobDetailsUsecase;
  //   FacilityPresenter(this.facilityUsecase);
  // FacilityUsecase facilityUsecase;

  ///

  Future<List<JobDetailsModel?>?> getJobDetails({
    String? auth,
    int? jobId,
    int? userId,
    bool? isLoading,
  }) async =>
      await jobDetailsUsecase.getJobDetails(
        auth: auth ?? "",
        jobId: jobId ?? 0,
        userId: userId,
        isLoading: isLoading,
      );
}
