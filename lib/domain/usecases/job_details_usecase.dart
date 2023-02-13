import 'package:cmms/domain/repositories/repository.dart';

import '../models/job_details_model.dart';

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
}
