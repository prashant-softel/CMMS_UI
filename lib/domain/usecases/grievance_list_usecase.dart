import 'package:cmms/domain/models/grievance_List_model.dart';
import 'package:cmms/domain/models/grievance_model.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:cmms/domain/repositories/repository.dart';

class GrievanceListUsecase {
  GrievanceListUsecase(this.repository);
  Repository repository;

  Future<List<GrievanceListModel?>?> getGrievanceList({
    required String auth,
    int? facilityId,
    bool? isLoading,
    bool? self_view,
    String? start_date,
    String? end_date,
  }) async =>
      await repository.getGrievanceList(
        auth,
        facilityId,
        isLoading,
        self_view,
        start_date,
        end_date,
      );
  void clearValue() async => repository.clearData(LocalKeys.jobId);
}
