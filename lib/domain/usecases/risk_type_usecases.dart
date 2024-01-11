import 'package:cmms/domain/models/risk_type_list_model.dart';
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

class RiskTypeUsecase {
  RiskTypeUsecase(this.repository);
  Repository repository;

  Future<List<RiskTypeModel>> getRiskTypeList(
      {required bool isLoading, required int? facility_id}) async {
    return repository.getRiskTypeList(
      isLoading: isLoading,
      facility_id: facility_id,
    );
  }

    deleteRiskType(
      {required Object business_id, required bool isLoading}) async =>
      await repository.deleteRiskType(
        business_id,
        isLoading,
      );

  Future<bool> updateRiskType({
    riskTypeJsonString,
    bool? isLoading,
  }) async =>
      await repository.updateRiskType(
        isLoading: isLoading,
        riskTypeJsonString: riskTypeJsonString,
      );

  Future<bool> createRiskType({
    riskTypeJsonString,
    bool? isLoading,
  }) async =>
      await repository.createRiskType(
          isLoading: isLoading, riskTypeJsonString: riskTypeJsonString);
  // Future<List<FacilityModel?>?> getFacilityList() async =>
  //     await repository.getFacilityList(true);
  // Future<String?> getUserAccessList() async =>
  //     await repository.getUserAccessData(LocalKeys.userAccess);
}
