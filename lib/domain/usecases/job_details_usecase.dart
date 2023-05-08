import 'package:cmms/domain/repositories/repository.dart';

import '../models/job_details_model.dart';
import '../models/new_permit_list_model.dart';

class JobDetailsUsecase {
  JobDetailsUsecase(this.repository);
  Repository repository;

  ///

  Future<List<JobDetailsModel?>?> getJobDetails({
    required String auth,
    required int jobId,
    int? userId,
    bool? isLoading,
  }) async =>
      await repository.getJobDetails(
        auth,
        jobId,
        userId,
        isLoading,
      );

  ///
  Future<List<NewPermitModel?>?> getPermitList({
    int? facilityId,
    bool? selfView,
    bool? isLoading,
  }) async =>
      await repository.getPermitList(
        facilityId,
        selfView,
        isLoading,
      );

  ///
  Future<Map<String, dynamic>?> linkToPermit({
    int? jobId,
    int? permitId,
    bool? isLoading,
  }) async =>
      await repository.linkToPermit(
        jobId,
        permitId,
        isLoading,
      );
}
