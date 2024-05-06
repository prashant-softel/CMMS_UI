
import 'package:cmms/domain/models/source_of_obs_list_model.dart';
import 'package:cmms/domain/models/type_of_obs_list_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

class  TypeOfObsUsecase {
   TypeOfObsUsecase(this.repository);
  Repository repository;

  Future<Future<List<TypeOfObsListModel>>> getTypeOfObservationList(
      {required bool isLoading}) async {
    return repository.getTypeOfObservationList(
      isLoading: isLoading,
    
    );
  }
  //create
  Future<bool> createTypeOfObslist({
    facilitylistJsonString,
    bool? isLoading,
  }) async =>
      await repository.createTypeOfObslist(
          isLoading: isLoading, businesslistJsonString: facilitylistJsonString);
//update
  Future<bool> updatetypeOfObs({
    modulelistJsonString,
    bool? isLoading,
  }) async =>
      await repository.updatetypeOfObs(
        isLoading: isLoading,
        modulelistJsonString: modulelistJsonString,
      );


// //detele
  deleteTypeOfObs(
      {required Object business_id, required bool isLoading}) async =>
      await repository.deleteTypeOfObs(
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
