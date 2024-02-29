import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/models/work_type_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

import '../models/tools_model.dart';

class ToolTypeUsecase {
  ToolTypeUsecase(this.repository);
  Repository repository;

  Future<List<InventoryCategoryModel?>?> getInventoryCategoryList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getInventoryCategoryList(
        auth,
        facilityId,
        isLoading,
      );

  Future<List<WorkTypeModel?>?> getWorkTypeList(
          {bool? isLoading, String? categoryIds}) async =>
      await repository.getWorkTypeList(
        isLoading,
        categoryIds,
      );

  deleteWorkTypeTool(
          {required Object worktypetool_id, required bool isLoading}) async =>
      await repository.deleteWorkTypeTool(
        worktypetool_id,
        isLoading,
      );

  // Future<bool> updateWorkType({
  //   worktypeJsonString,
  //   bool? isLoading,
  // }) async =>
  //     await repository.updateWorkType(
  //       isLoading: isLoading,
  //       worktypeJsonString: worktypeJsonString,
  //     );
  Future<List<ToolsModel?>?> getToolsRequiredToWorkTypeList({
    String? auth,
    String? workTypeIds,
    bool? isLoading,
  }) async =>
      await repository.getToolsRequiredToWorkTypeList(
        workTypeIds,
        auth,
        isLoading,
      );
  Future<bool> createWorkTypeTool({
    worktypetoolJsonString,
    bool? isLoading,
  }) async =>
      await repository.createWorkTypeTool(
          isLoading: isLoading, worktypetoolJsonString: worktypetoolJsonString);
  // Future<List<FacilityModel?>?> getFacilityList() async =>
  //     await repository.getFacilityList(true);
  // Future<String?> getUserAccessList() async =>
  //     await repository.getUserAccessData(LocalKeys.userAccess);
}
