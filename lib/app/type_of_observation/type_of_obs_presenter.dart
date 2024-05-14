import 'package:cmms/domain/models/type_of_obs_list_model.dart';
import 'package:cmms/domain/usecases/type_of_obs_usecase.dart';


class TypeOfObsPresenter {
  TypeOfObsPresenter(this.typeOfObs);

  // TypeOfObsPresenter typeOfObs;
  TypeOfObsUsecase typeOfObs;


  Future<List<TypeOfObsListModel ?>> getTypeOfObservationList({
    bool? isLoading,
  }) async =>
      await typeOfObs.getTypeOfObservationList(
        isLoading: isLoading ?? false,
      );
  //create Type Of Observation
  Future<bool> createTypeOfObslist({
    facilitylistJsonString,
    required bool isLoading,
  }) async {
    print("presenter Create Facility type function.");
    typeOfObs.createTypeOfObslist(
      facilitylistJsonString: facilitylistJsonString,
      isLoading: isLoading,
    );
    return true;
  }
  //update Type Of Oservation
  Future<bool> updatetypeOfObs(
      {modulelistJsonString, required bool isLoading}) async {
    return typeOfObs.updatetypeOfObs(
      modulelistJsonString: modulelistJsonString,
      isLoading: isLoading,
    );
  }

  //delete Type Of Observation
  deleteTypeOfObs(String? business_id, {required bool isLoading}) async =>
      await typeOfObs.deleteTypeOfObs(
        business_id: business_id ?? 0,
        isLoading: isLoading,
      );

  // //update
  // Future<bool> updatesourceOfObs(
  //     {modulelistJsonString, required bool isLoading}) async {
  //   return typeOfObs.updatesourceOfObs(
  //     modulelistJsonString: modulelistJsonString,
  //     isLoading: isLoading,
  //   );
  // }

  //delete Source Of Observation
  // deleteSourceOfObs(String? business_id, {required bool isLoading}) async =>
  //     await typeOfObs.deleteSourceOfObs(
  //       business_id: business_id ?? 0,
  //       isLoading: isLoading,
  //     );

  // Future<bool> createModulelistNumber({
  //   modulelistJsonString,
  //   required bool isLoading,
  // }) async {
  //   print("presenter");
  //   typeOfObs.createModulelistNumber(
  //     modulelistJsonString: modulelistJsonString,
  //     isLoading: isLoading,
  //   );
  //   return true;
  // }

  // deleteModulelist(String? module_id, {required bool isLoading}) async =>
  //     await typeOfObs.deleteModulelist(
  //       module_id: module_id ?? 0,
  //       isLoading: isLoading,
  //     );
  // Future<bool> updateModulelistNumber(
  //     {modulelistJsonString, required bool isLoading, moduleId}) async {
  //   print("presenter");
  //   typeOfObs.updateModulelistNumber(
  //     modulelistJsonString: modulelistJsonString,
  //     isLoading: isLoading,
  //   );
  //   return true;
  // }
}

