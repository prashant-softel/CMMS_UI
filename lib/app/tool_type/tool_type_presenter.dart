import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/models/tools_model.dart';
import 'package:cmms/domain/models/work_type_model.dart';
import 'package:cmms/domain/usecases/tool_type_usecase.dart';

class ToolTypePresenter {
  ToolTypePresenter(this.toolTypeUsecase);
  ToolTypeUsecase toolTypeUsecase;

  Future<List<InventoryCategoryModel?>?> getInventoryCategoryList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await toolTypeUsecase.getInventoryCategoryList(
        auth: auth ?? "",
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );
  Future<List<WorkTypeModel?>?> getWorkTypeList({
    String? auth,
    String? categoryIds,
    bool? isLoading,
  }) async =>
      await toolTypeUsecase.getWorkTypeList(
        categoryIds: categoryIds,
        isLoading: isLoading ?? false,
      );

  Future<bool> createWorkTypeTool({
    worktypetoolJsonString,
    required bool isLoading,
  }) async {
    print("presenter Create tooltype function.");
    toolTypeUsecase.createWorkTypeTool(
      worktypetoolJsonString: worktypetoolJsonString,
      isLoading: isLoading,
    );
    return true;
  }

  Future<List<ToolsModel?>?> getToolsRequiredToWorkTypeList({
    String? auth,
    String? workTypeIds,
    bool? isLoading,
  }) async {
    print("Fault id in presenter: $workTypeIds");
    return toolTypeUsecase.getToolsRequiredToWorkTypeList(
      auth: auth ?? "",
      workTypeIds: workTypeIds,
      isLoading: isLoading,
    );
  }

  deleteWorkTypeTool(String? worktypetool_id,
          {required bool isLoading}) async =>
      await toolTypeUsecase.deleteWorkTypeTool(
        worktypetool_id: worktypetool_id ?? 0,
        isLoading: isLoading,
      );
  Future<bool> updateWorkTypeTool(
      {worktypetoolJsonString, required bool isLoading}) async {
    print("presenter");
    toolTypeUsecase.updateWorkTypeTool(
      worktypetoolJsonString: worktypetoolJsonString,
      isLoading: isLoading,
    );
    return true;
  }
}
