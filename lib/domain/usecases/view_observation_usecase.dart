import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/get_obs_deatils_by_id_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:cmms/domain/repositories/repository.dart';

class ViewObservationUsecase {
  ViewObservationUsecase(this.repository);
  Repository repository;

  ///

  Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await repository.getFacilityList(isLoading);
  Future<String?> getValue() async =>
      await repository.getStringValue(LocalKeys.obsId);
  void saveValue({String? obsId}) async =>
      repository.saveValue(LocalKeys.obsId, obsId);
  Future<String?> getValue1() async =>
      await repository.getStringValue(LocalKeys.checkpointtypeId);
  // void saveValue({String? obsId}) async =>
  //     repository.saveValue(LocalKeys.obsId, obsId);
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
  Future<GetObservationById?> getObsDetail({
    bool? isLoading,
    required int id,
    required int check_point_type_id,

  }) async =>
      await repository.getObsDetail(
        id: id,
        check_point_type_id:check_point_type_id,
        isLoading: isLoading ?? false,
      );

  void clearValue() async => repository.clearData(
        LocalKeys.obsId,
      );
      
  //     Future<Map<String, dynamic>> viewObsCloseButton({
  //   viewobsCloseJsonString,
  //   bool? isLoading,
  // }) async =>
  //     await repository.viewObsCloseButton(
  //       viewobsCloseJsonString,
  //       isLoading,
  //     );
}
