import 'package:cmms/domain/models/block_type_list_model.dart';
import 'package:cmms/domain/usecases/block_type_list_usecase.dart';

import '../../domain/models/facility_type_list_model.dart';

class BlockTypeListPresenter {
  BlockTypeListPresenter(this.blockTypeListUsecase);
  BlockTypeListUsecase blockTypeListUsecase;

  // Future<List<FacilityModel?>?> getFacilityList() async =>
  //     await jobTypeListUsecase.getFacilityList();
  // Future<String?> getUserAccessList() async =>
  //     await jobTypeListUsecase.getUserAccessList();

  Future<List<BlockTypeListModel>> getBlockTypeList({
    required bool isLoading,
    required int? job_type_id,
  }) async {
    return blockTypeListUsecase.getBlockTypeList(
        isLoading: isLoading, job_type_id: job_type_id);
  }

  Future<List<FacilityTypeListModel>> getFacilityList({
    required bool isLoading,
    required int? job_type_id,
  }) async {
    return blockTypeListUsecase.getFacilityList(
        isLoading: isLoading, job_type_id: job_type_id);
  }

  Future<bool> createBlockType({
    blocktypelistJsonString,
    required bool isLoading,
  }) async {
    print("presenter Create Facility type function.");
    blockTypeListUsecase.createBlockType(
      blockTypeJsonString: blocktypelistJsonString,
      isLoading: isLoading,
    );
    return true;
  }
}
