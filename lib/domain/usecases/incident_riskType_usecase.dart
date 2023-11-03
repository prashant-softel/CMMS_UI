import 'package:cmms/domain/repositories/repository.dart';

import '../models/IncidentRiskTypeModel.dart';
import '../models/SPV_list_model.dart';
import '../models/business_list_model.dart';

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

class IncidentRiskTypeUsecase {
  IncidentRiskTypeUsecase(this.repository);
  Repository repository;

  Future<List<IncidentRiskTypeModel>> getIncidentRiskTypeList(
      {required bool isLoading}) async {
    return repository.getIncidentRiskTypeList(
      isLoading: isLoading,
      // job_type_id: job_type_id,
    );
  }
  Future<List<BusinessListModel?>?> getBusinessList({
    required int type,
    bool isLoading = true,
  }) async =>
      await repository.getBusinessList(
        businessType: type,
        isLoading: isLoading,
      );

  Future<List<SPVListModel?>?> getSpvList({
    bool isLoading = true,
  }) async =>
      await repository.getSPVList(
        isLoading: isLoading,
      );
  deleteRiskType(
      {required Object business_id, required bool isLoading}) async =>
      await repository.deleteRiskType(
        business_id,
        isLoading,
      );
  Future<bool> updateBusinesslist({
    modulelistJsonString,
    bool? isLoading,
  }) async =>
      await repository.updateBusinesslist(
        isLoading: isLoading,
        modulelistJsonString: modulelistJsonString,
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
