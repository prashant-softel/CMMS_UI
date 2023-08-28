import 'package:cmms/domain/models/mrs_list_by_jobId.dart';

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
  Future<List<JobAssociatedModel?>?> getjobDetailsModel({
    String? auth,
    int? jobId,
    int? userId,
    bool? isLoading,
  }) async =>
      await jobDetailsUsecase.getjobDetailsModel(
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

   Future<List<MRSListByJobIdModel>?> getMrsListByModule(
    jobId,
    isLoading,
  ) async =>
      await jobDetailsUsecase.getMrsListByModule(
        jobId: jobId,
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
  Future<Map<String, dynamic>?> createJobCard({
    String? auth,
    int? jobId,
    bool? isLoading,
  }) async =>
      await jobDetailsUsecase.createJobCard(
        auth: auth,
        jobId: jobId,
        isLoading: isLoading,
      );
}
