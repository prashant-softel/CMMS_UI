import 'package:cmms/domain/repositories/repository.dart';

import '../models/body_injured_model.dart';

// class AssetTypeListUsecase {
//   AssetTypeListUsecase(this.repository);
//   Repository repository;

//   ///

//   Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
//       await repository.getFacilityList(isLoading);

//   Future<List<JobModel?>?> getJobList({
//     required String auth,
//     int? facilityId,
//     bool? isLoading,
//   }) async =>
//       await repository.getJobList(
//         auth,
//         facilityId,
//         isLoading,
//       );
// }

class BodyInjuredUsecase {
  BodyInjuredUsecase(this.repository);
  Repository repository;

  Future<List<BodyInjuredModel>> getBodyInjuredList(
      {required bool isLoading}) async {
    return repository.getBodyInjuredList(
      isLoading: isLoading,
    );
  }

  deleteBodyInjured(
          {required Object bodypart_id, required bool isLoading}) async =>
      await repository.deleteBodyInjured(
        bodypart_id,
        isLoading,
      );

  Future<bool> updateBodyInjured({
    bodyInjuredJsonString,
    bool? isLoading,
  }) async =>
      await repository.updateBodyInjured(
        isLoading: isLoading,
        bodyInjuredJsonString: bodyInjuredJsonString,
      );

  Future<bool> createBodyInjured({
    bodyInjuredJsonString,
    bool? isLoading,
  }) async =>
      await repository.createBodyInjured(
          isLoading: isLoading, bodyInjuredJsonString: bodyInjuredJsonString);
  // Future<List<FacilityModel?>?> getFacilityList() async =>
  //     await repository.getFacilityList(true);
  // Future<String?> getUserAccessList() async =>
  //     await repository.getUserAccessData(LocalKeys.userAccess);
}
