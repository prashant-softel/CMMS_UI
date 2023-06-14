import 'package:cmms/domain/models/block_type_list_model.dart';
import 'package:cmms/domain/models/job_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

import '../models/facility_type_list_model.dart';

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

class BlockTypeListUsecase {
  BlockTypeListUsecase(this.repository);
  Repository repository;

  Future<List<BlockTypeListModel>> getBlockTypeList(
      {required bool isLoading, required int? job_type_id}) async {
    return repository.getBlockTypeList(
      isLoading: isLoading,
      job_type_id: job_type_id,
    );
  }

  Future<List<FacilityTypeListModel>> getFacilityList(
      {required bool isLoading, required int? job_type_id}) async {
    return repository.getFacilityTypeList(
      isLoading: isLoading,
      job_type_id: job_type_id,
    );
  }

  Future<bool> createBlockType({
    blockTypeJsonString,
    bool? isLoading,
  }) async =>
      await repository.createBlockType(
          isLoading: isLoading, blockTypeJsonString: blockTypeJsonString);

  // Future<List<FacilityModel?>?> getFacilityList() async =>
  //     await repository.getFacilityList(true);
  // Future<String?> getUserAccessList() async =>
  //     await repository.getUserAccessData(LocalKeys.userAccess);
}
