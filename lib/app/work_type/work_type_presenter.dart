import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/models/work_type_model.dart';
import 'package:cmms/domain/usecases/work_type_usecase.dart';


class WorkTypePresenter {
  WorkTypePresenter(this.workTypeUsecase);
  WorkTypeUsecase workTypeUsecase;
  
Future<List<InventoryCategoryModel?>?> getInventoryCategoryList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await workTypeUsecase.getInventoryCategoryList(
        auth: auth ?? "",
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );
Future<List<WorkTypeModel?>?> getWorkTypeList({
    String? auth,
    String? categoryIds,
    bool? isLoading,
  }) async =>
      await workTypeUsecase.getWorkTypeList(
        categoryIds: categoryIds,
        isLoading: isLoading ?? false,
      );


  Future<bool> createWorkType({
    worktypeJsonString,
    required bool isLoading,
  }) async {
    print("presenter Create fault function.");
    workTypeUsecase.createWorkType(
      worktypeJsonString: worktypeJsonString,
      isLoading: isLoading,
    );
    return true;
  }

  deleteWorkType(String? worktype_id,
          {required bool isLoading}) async =>
      await workTypeUsecase.deleteWorkType(
        worktype_id: worktype_id ?? 0,
        isLoading: isLoading,
      );
  Future<bool> updateWorkType(
      {worktypeJsonString, required bool isLoading}) async {
    print("presenter");
    workTypeUsecase.updateWorkType(
      worktypeJsonString: worktypeJsonString,
      isLoading: isLoading,
    );
    return true;
  }
}
