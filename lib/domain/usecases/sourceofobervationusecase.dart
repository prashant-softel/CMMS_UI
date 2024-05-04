
import 'package:cmms/domain/models/source_of_obs_list_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

class SourceListUsecase {
  SourceListUsecase(this.repository);
  Repository repository;

  Future<List<SourceOfObservationListModel>> getSourceObservationList(
      {required bool isLoading}) async {
    return repository.getSourceObservationList(
      isLoading: isLoading,
    
    );
  }
  //create
  Future<bool> createSourceOfObslist({
    facilitylistJsonString,
    bool? isLoading,
  }) async =>
      await repository.createSourceOfObslist(
          isLoading: isLoading, businesslistJsonString: facilitylistJsonString);
//update
  Future<bool> updatesourceOfObs({
    modulelistJsonString,
    bool? isLoading,
  }) async =>
      await repository.updatesourceOfObs(
        isLoading: isLoading,
        modulelistJsonString: modulelistJsonString,
      );


//detele
  deleteSourceOfObs(
      {required Object business_id, required bool isLoading}) async =>
      await repository.deleteSourceOfObs(
        business_id,
        isLoading,
      );


  // deleteSourceOfObservation(
  //     {required Object business_id, required bool isLoading}) async =>
  //     await repository.deleteSPV(
  //       business_id,
  //       isLoading,
  //     );
  // Future<bool> updateSourceOfObservation({
  //   modulelistJsonString,
  //   bool? isLoading,
  // }) async =>
  //     await repository.updateSourceOfObservation(
  //       isLoading: isLoading,
  //       modulelistJsonString: modulelistJsonString,
  //     );

  // Future<bool> createSourceOfObservationList({
  //   facilitylistJsonString,
  //   bool? isLoading,
  // }) async =>
  //     await repository.createSourceOfObservationList(
  //         isLoading: isLoading, businesslistJsonString: facilitylistJsonString);
  // Future<List<FacilityModel?>?> getFacilityList() async =>
  //     await repository.getFacilityList(true);
  // Future<String?> getUserAccessList() async =>
  //     await repository.getUserAccessData(LocalKeys.userAccess);
}
