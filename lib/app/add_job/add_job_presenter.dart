import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/employee_model.dart';

import '../../domain/models/inventory_category_model.dart';
import '../../domain/models/tools_model.dart';

class AddJobPresenter {
  AddJobPresenter(this.addJobUsecase);
  AddJobUsecase addJobUsecase;

  ///

  Future<List<BlockModel?>?> getBlocksList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await addJobUsecase.getBlocksList(
        auth: auth ?? "",
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );

  ///
  Future<List<InventoryCategoryModel?>?> getInventoryCategoryList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await addJobUsecase.getInventoryCategoryList(
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
      await addJobUsecase.getAssignedToList(
        auth: auth ?? "",
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );

  ///
  Future<List<ToolsModel?>?> getToolsRequiredToWorkTypeList({
    required bool isLoading,
  }) async {
    return addJobUsecase.getToolsRequiredToWorkTypeList(
      isLoading: isLoading,
    );
  }

  ///
  Future<void> saveJob({
    job,
    required bool isLoading,
  }) async {
    return addJobUsecase.saveJob(
      job: job,
      isLoading: isLoading,
    );
  }

  ///
}
