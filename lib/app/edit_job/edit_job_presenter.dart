import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/employee_model.dart';

import '../../domain/models/inventory_category_model.dart';
import '../../domain/models/tools_model.dart';
import '../../domain/models/work_type_model.dart';

class EditJobPresenter {
  EditJobPresenter(this.editJobUsecase);
  EditJobUsecase editJobUsecase;

  ///

  Future<List<BlockModel?>?> getBlocksList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await editJobUsecase.getBlocksList(
        auth: auth ?? "",
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );

  ///

  Future<List<WorkTypeModel?>?> getWorkTypeList({
    String? auth,
    String? categoryIds,
    bool? isLoading,
  }) async =>
      await editJobUsecase.getWorkTypeList(
        categoryIds: categoryIds,
        isLoading: isLoading ?? false,
      );

  ///
  Future<List<InventoryCategoryModel?>?> getInventoryCategoryList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await editJobUsecase.getInventoryCategoryList(
        auth: auth ?? "",
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );

  ///
  Future<List<EmployeeModel?>?> getAssignedToList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await editJobUsecase.getAssignedToList(
        auth: auth ?? "",
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );

  ///
  Future<List<ToolsModel?>?> getToolsRequiredToWorkTypeList({
    String? workTypeIds,
    bool? isLoading,
  }) async {
    return editJobUsecase.getToolsRequiredToWorkTypeList(
      workTypeIds: workTypeIds,
      isLoading: isLoading,
    );
  }

  ///
  Future<Map<String, dynamic>?> updateJob({
    job,
    required bool isLoading,
  }) async {
    return editJobUsecase.updateJob(
      job: job,
      isLoading: isLoading,
    );
  }

  ///
  Future<Map<String, dynamic>?> assignReAssignJob({
    jobId,
    assignedToId,
    required bool isLoading,
  }) async {
    return editJobUsecase.assignReAssignJob(
      jobId,
      assignedToId,
      isLoading,
    );
  }

  ///
}
