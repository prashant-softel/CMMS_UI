import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:cmms/domain/repositories/repository.dart';

class CreateObservationUsecase {
  CreateObservationUsecase(this.repository);
  Repository repository;

  ///

  Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await repository.getFacilityList(isLoading);
  Future<String?> getValue() async =>
      await repository.getStringValue(LocalKeys.obsId);
  void saveValue({String? obsId}) async =>
      repository.saveValue(LocalKeys.obsId, obsId);
  Future<List<HistoryModel>?> getHistory({
    moduleType,
    id,
    facilityId,
    bool? isLoading,
  }) async =>
      await repository.getHistory(
        moduleType,
        id,
        facilityId,
        isLoading,
      );
}
