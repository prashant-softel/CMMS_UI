import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/get_observation_list_model.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:cmms/domain/repositories/repository.dart';

class ObservationListUsecase {
  ObservationListUsecase(this.repository);
  Repository repository;

  ///

  Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await repository.getFacilityList(isLoading);
  Future<List<GetObservationList>> getObservationDataList({
    required bool isLoading,
    required int? facility_id,
    bool? isExport,
    String? start_date,
    required String end_date,
  }) async {
    return repository.getObservationDataList(
        isLoading: isLoading,
        facility_id: facility_id,
        start_date: start_date,
        end_date: end_date,
        isExport: isExport);
  }
    void clearValue() async => repository.clearData(LocalKeys.obsId);

}
