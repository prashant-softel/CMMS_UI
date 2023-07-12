import 'package:cmms/domain/models/SPV_list_model.dart';
import 'package:cmms/domain/models/job_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

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

class SPVListUsecase {
  SPVListUsecase(this.repository);
  Repository repository;

  Future<List<SPVListModel>> getSPVList(
      {required bool isLoading, required int? job_type_id}) async {
    return repository.getSPVList(
      isLoading: isLoading,
      job_type_id: job_type_id,
    );
  }


  deleteSPV(
      {required Object business_id, required bool isLoading}) async =>
      await repository.deleteSPV(
        business_id,
        isLoading,
      );
  Future<bool> updateSPV({
    modulelistJsonString,
    bool? isLoading,
  }) async =>
      await repository.updateSPV(
        isLoading: isLoading,
        modulelistJsonString: modulelistJsonString,
      );

  Future<bool> createSPVlist({
    facilitylistJsonString,
    bool? isLoading,
  }) async =>
      await repository.createSPVlist(
          isLoading: isLoading, businesslistJsonString: facilitylistJsonString);
  // Future<List<FacilityModel?>?> getFacilityList() async =>
  //     await repository.getFacilityList(true);
  // Future<String?> getUserAccessList() async =>
  //     await repository.getUserAccessData(LocalKeys.userAccess);
}
