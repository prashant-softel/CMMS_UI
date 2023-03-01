import 'package:cmms/domain/models/employee_model.dart';
import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/models/work_type_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

import '../models/block_model.dart';
import '../models/tools_model.dart';

class AddJobUsecase {
  AddJobUsecase(this.repository);
  Repository repository;

  ///

  Future<List<BlockModel?>?> getBlocksList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getBlocksList(
        auth,
        facilityId,
        isLoading,
      );

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

  Future<List<EmployeeModel?>?> getAssignedToList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getAssignedToList(
        auth,
        facilityId,
        isLoading,
      );

  ///
  Future<List<ToolsModel?>?> getToolsRequiredToWorkTypeList({
    String? workTypeIds,
    bool? isLoading,
  }) async =>
      await repository.getToolsRequiredToWorkTypeList(
        workTypeIds,
        isLoading,
      );

  ///
  Future<List<WorkTypeModel?>?> getWorkTypeList(
          {bool? isLoading, String? categoryIds}) async =>
      await repository.getWorkTypeList(
        isLoading,
        categoryIds,
      );

  ///
  Future<Map<String, dynamic>> saveJob({
    job,
    bool? isLoading,
  }) async =>
      await repository.saveJob(
        job,
        isLoading,
      );

  ///
}
