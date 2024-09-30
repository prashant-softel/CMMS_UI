import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/get_obs_deatils_by_id_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/usecases/view_observation_usecase.dart';

class ViewObservationPresenter {
  ViewObservationPresenter(this.viewObservationUsecase);
  ViewObservationUsecase viewObservationUsecase;

  ///

  Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await viewObservationUsecase.getFacilityList(isLoading: isLoading);
  void saveValue({
    String? obsId,
  }) async {
    return viewObservationUsecase.saveValue(obsId: obsId);
  }

  void clearValue() async => viewObservationUsecase.clearValue();

  Future<String?> getValue() async => await viewObservationUsecase.getValue();
  Future<String?> getValue1() async => await viewObservationUsecase.getValue1();
  Future<List<HistoryModel>?> getHistory(
    moduleType,
    facilityId,
    id,
    isLoading,
  ) async =>
      await viewObservationUsecase.getHistory(
        moduleType: moduleType,
        facilityId: facilityId,
        id: id,
        isLoading: isLoading,
      );
  Future<GetObservationById?> getObsDetail(
      {bool? isLoading, required int id,required int check_point_type_id}) async {
    return viewObservationUsecase.getObsDetail(
      id: id,
      check_point_type_id:check_point_type_id,
      isLoading: isLoading ?? false,
    );
  }

  
  //   Future<Map<String, dynamic>?> viewObsCloseButton({
  //   ViewObsCloseJsonString,
  //   required bool isLoading,
  // }) async {
  //   return viewObservationUsecase.viewObsCloseButton(
  //     viewobsCloseJsonString: ViewObsCloseJsonString,
  //     isLoading: isLoading,
  //   );
  // }
}
