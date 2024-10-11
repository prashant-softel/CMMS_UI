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
  Future<List<InventoryCategoryModel?>?> getInventoryCategoryList(
          {String? auth,
          int? facilityId,
          bool? isLoading,
          int? blockId}) async =>
      await editJobUsecase.getInventoryCategoryList(
          auth: auth ?? "",
          facilityId: facilityId ?? 0,
          isLoading: isLoading ?? false,
          blockId: blockId);

  ///
  Future<List<EmployeeModel?>?> getAssignedToEmployee({
    String? auth,
    int? facilityId,
    int? featureId,
    bool? isLoading,
    int? isattendanceneeded,
  }) async =>
      await editJobUsecase.getAssignedToEmployee(
        auth: auth ?? "",
        facilityId: facilityId ?? 0,
        featureId: featureId,
        isattendanceneeded: isattendanceneeded,
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

  void saveValue({String? jobId}) async {
    return editJobUsecase.saveValue(jobId: jobId);
  }

  Future<String?> getValue() async => await editJobUsecase.getValue();
  void saveTypeValue({String? typeEdit}) async {
    return editJobUsecase.saveTypeValue(typeEdit: typeEdit);
  }

  Future<String?> getTypeValue() async => await editJobUsecase.getTypeValue();

  ///
}
