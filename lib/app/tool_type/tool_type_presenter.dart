import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/models/work_type_model.dart';
import 'package:cmms/domain/usecases/tool_type_usecase.dart';
import 'package:cmms/domain/usecases/work_type_usecase.dart';

class ToolTypePresenter {
  ToolTypePresenter(this.toolTypeUsecase);
  ToolTypeUsecase toolTypeUsecase;

  // Future<List<InventoryCategoryModel?>?> getInventoryCategoryList({
  //   String? auth,
  //   int? facilityId,
  //   bool? isLoading,
  // }) async =>
  //     await toolTypeUsecase.getInventoryCategoryList(
  //       auth: auth ?? "",
  //       facilityId: facilityId ?? 0,
  //       isLoading: isLoading ?? false,
  //     );
  // Future<List<WorkTypeModel?>?> getWorkTypeList({
  //   String? auth,
  //   String? categoryIds,
  //   bool? isLoading,
  // }) async =>
  //     await toolTypeUsecase.getWorkTypeList(
  //       categoryIds: categoryIds,
  //       isLoading: isLoading ?? false,
  //     );

  Future<bool> createToolType({
    required String? tool_name,
    required bool isLoading,
  }) async {
    print("presenter Create tool type function.");
    toolTypeUsecase.createToolType(
      tool_name: tool_name,
      isLoading: isLoading,
    );
    return true;
  }

  // deleteWorkType(String? worktype_id, {required bool isLoading}) async =>
  //     await toolTypeUsecase.deleteWorkType(
  //       worktype_id: worktype_id ?? 0,
  //       isLoading: isLoading,
  //     );
  // Future<bool> updateWorkType(
  //     {worktypeJsonString, required bool isLoading}) async {
  //   print("presenter");
  //   toolTypeUsecase.updateWorkType(
  //     worktypeJsonString: worktypeJsonString,
  //     isLoading: isLoading,
  //   );
  //   return true;
  // }
}
