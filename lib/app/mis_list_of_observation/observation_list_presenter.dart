import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/get_observation_list_model.dart';
import 'package:cmms/domain/usecases/observation_list_usecase.dart';

class ObservationListPresenter {
  ObservationListPresenter(this.observationListUsecase);
  ObservationListUsecase observationListUsecase;

  ///

  Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await observationListUsecase.getFacilityList(isLoading: isLoading);
  Future<List<GetObservationList>> getObservationDataList({
    required bool isLoading,
    bool? isExport,
    required int? facility_id,
    String? start_date,
    required String end_date,
  }) async {
    return observationListUsecase.getObservationDataList(
      isLoading: isLoading,
      facility_id: facility_id,
      isExport: isExport,
      start_date: start_date,
      end_date: end_date,
    );
  }

  void clearValue() async => observationListUsecase.clearValue();
}
