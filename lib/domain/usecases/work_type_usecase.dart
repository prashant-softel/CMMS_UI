import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/models/work_type_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

class WorkTypeUsecase {
  WorkTypeUsecase(this.repository);
  Repository repository;

  Future<List<InventoryCategoryModel?>?> getInventoryCategoryList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getInventoryCategoryList(auth, facilityId, isLoading, 0);

  Future<List<WorkTypeModel?>?> getWorkTypeList(
          {bool? isLoading, String? categoryIds}) async =>
      await repository.getWorkTypeList(
        isLoading,
        categoryIds,
      );

  deleteWorkType(
          {required Object worktype_id, required bool isLoading}) async =>
      await repository.deleteWorkType(
        worktype_id,
        isLoading,
      );

  Future<bool> updateWorkType({
    worktypeJsonString,
    bool? isLoading,
  }) async =>
      await repository.updateWorkType(
        isLoading: isLoading,
        worktypeJsonString: worktypeJsonString,
      );

  Future<bool> createWorkType({
    worktypeJsonString,
    bool? isLoading,
  }) async =>
      await repository.createWorkType(
          isLoading: isLoading, worktypeJsonString: worktypeJsonString);
  // Future<List<FacilityModel?>?> getFacilityList() async =>
  //     await repository.getFacilityList(true);
  // Future<String?> getUserAccessList() async =>
  //     await repository.getUserAccessData(LocalKeys.userAccess);
}
