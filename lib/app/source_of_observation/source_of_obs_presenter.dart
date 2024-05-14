import 'package:cmms/domain/models/source_of_obs_list_model.dart';
import 'package:cmms/domain/usecases/sourceofobervationusecase.dart';


class SourceOfObsPresenter {
  SourceOfObsPresenter(this.sourecObs);

  SourceListUsecase sourecObs;

  Future<List<SourceOfObservationListModel?>> getSourceObservationList({
    bool? isLoading,
  }) async =>
      await sourecObs.getSourceObservationList(
        isLoading: isLoading ?? false,
      );
  //create
  Future<bool> createSourceOfObslist({
    facilitylistJsonString,
    required bool isLoading,
  }) async {
    print("presenter Create Facility type function.");
    sourecObs.createSourceOfObslist(
      facilitylistJsonString: facilitylistJsonString,
      isLoading: isLoading,
    );
    return true;
  }

  //update
  Future<bool> updatesourceOfObs(
      {modulelistJsonString, required bool isLoading}) async {
    return sourecObs.updatesourceOfObs(
      modulelistJsonString: modulelistJsonString,
      isLoading: isLoading,
    );
  }

  //delete Source Of Observation
  deleteSourceOfObs(String? business_id, {required bool isLoading}) async =>
      await sourecObs.deleteSourceOfObs(
        business_id: business_id ?? 0,
        isLoading: isLoading,
      );

  // Future<bool> createModulelistNumber({
  //   modulelistJsonString,
  //   required bool isLoading,
  // }) async {
  //   print("presenter");
  //   sourecObs.createModulelistNumber(
  //     modulelistJsonString: modulelistJsonString,
  //     isLoading: isLoading,
  //   );
  //   return true;
  // }

  // deleteModulelist(String? module_id, {required bool isLoading}) async =>
  //     await sourecObs.deleteModulelist(
  //       module_id: module_id ?? 0,
  //       isLoading: isLoading,
  //     );
  // Future<bool> updateModulelistNumber(
  //     {modulelistJsonString, required bool isLoading, moduleId}) async {
  //   print("presenter");
  //   sourecObs.updateModulelistNumber(
  //     modulelistJsonString: modulelistJsonString,
  //     isLoading: isLoading,
  //   );
  //   return true;
  // }
}
