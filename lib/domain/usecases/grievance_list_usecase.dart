import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/grievance_model.dart';
import 'package:cmms/domain/models/job_model.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:cmms/domain/repositories/repository.dart';

class GrievanceListUsecase {
  GrievanceListUsecase(this.repository);
  Repository repository;

  Future<List<GrievanceModel?>?> getGrievance({
    required String auth,
    int? facilityId,
    bool? self_view,
    bool? isLoading,
  }) async =>
      await repository.getGrievanceList(
        auth,
        facilityId,
        self_view,
        isLoading,
      );
  void clearValue() async => repository.clearData(LocalKeys.jobId);
}
