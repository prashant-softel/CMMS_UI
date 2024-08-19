import 'package:cmms/domain/models/employee_model.dart';
import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/models/work_type_model.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:cmms/domain/repositories/repository.dart';

import '../models/block_model.dart';
import '../models/tools_model.dart';

class EditJobUsecase {
  EditJobUsecase(this.repository);
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

  Future<List<EmployeeModel?>?> getAssignedToEmployee({
    String? auth,
    int? facilityId,
    int? featureId,
    bool? isLoading,
    int? isattendanceneeded,
  }) async =>
      await repository.getAssignedToListWOAttend(
          auth, facilityId, featureId, isattendanceneeded, isLoading);

  ///
  Future<List<ToolsModel?>?> getToolsRequiredToWorkTypeList({
    String? workTypeIds,
    bool? isLoading,
    String? auth,
  }) async =>
      await repository.getToolsRequiredToWorkTypeList(
        workTypeIds,
        auth,
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
  Future<Map<String, dynamic>> updateJob({
    job,
    bool? isLoading,
  }) async =>
      await repository.updateJob(
        job,
        isLoading,
      );

  ///
  Future<Map<String, dynamic>> assignReAssignJob(
    jobId,
    assignedToId,
    isLoading,
  ) async =>
      await repository.assignReAssignJob(
        jobId,
        assignedToId,
        isLoading,
      );
  void saveValue({String? jobId}) async =>
      repository.saveValue(LocalKeys.jobId, jobId);
  Future<String?> getValue() async =>
      await repository.getStringValue(LocalKeys.jobId);
  void saveTypeValue({String? typeEdit}) async =>
      repository.saveValue(LocalKeys.typeEdit, typeEdit);
  Future<String?> getTypeValue() async =>
      await repository.getStringValue(LocalKeys.typeEdit);

  ///
}
