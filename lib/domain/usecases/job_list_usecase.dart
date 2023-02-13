import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/job_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

class JobListUsecase {
  JobListUsecase(this.repository);
  Repository repository;

  ///

  Future<List<FacilityModel?>?> getFacilityList() async =>
      await repository.getFacilityList();

  Future<List<JobModel?>?> getJobList({
    required String auth,
    int? facilityId,
    int? userId,
    bool? isLoading,
  }) async =>
      await repository.getJobList(
        auth,
        facilityId,
        userId,
        isLoading,
      );
}
