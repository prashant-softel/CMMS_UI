import '../../domain/models/job_details_model.dart';
import '../../domain/models/new_permit_list_model.dart';
import '../../domain/usecases/job_details_usecase.dart';

class JobDetailsPresenter {
  ///
  JobDetailsPresenter(this.jobDetailsUsecase);
  JobDetailsUsecase jobDetailsUsecase;

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

  ///
  Future<List<NewPermitModel?>?> getPermitList({
    int? facilityId,
    bool? selfView,
    bool? isLoading,
  }) async =>
      await jobDetailsUsecase.getPermitList(
        facilityId: facilityId,
        selfView: selfView,
        isLoading: isLoading,
      );

  ///
  Future<Map<String, dynamic>?> linkToPermit({
    int? jobId,
    int? permitId,
    bool? isLoading,
  }) async =>
      await jobDetailsUsecase.linkToPermit(
        jobId: jobId,
        permitId: permitId,
        isLoading: isLoading,
      );
}
