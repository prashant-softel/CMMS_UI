import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/job_model.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:cmms/domain/repositories/repository.dart';

class JobListUsecase {
  JobListUsecase(this.repository);
  Repository repository;

  ///

  Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await repository.getFacilityList(isLoading);

  Future<List<JobModel?>?> getJobList({
    required String auth,
    int? facilityId,
    bool? self_view,
    bool? isExport,
    bool? isLoading,
  }) async =>
      await repository.getJobList(
          auth, facilityId, self_view, isLoading, isExport);
  void clearValue() async => repository.clearData(LocalKeys.jobId);
  void clearTypeValue() async => repository.clearData(LocalKeys.typeEdit);
}
