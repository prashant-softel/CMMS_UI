
import '../../domain/models/blood_model.dart';
import '../../domain/models/frequency_model.dart';
import '../../domain/models/inventory_category_model.dart';
import '../../domain/models/modulelist_model.dart';
import '../../domain/usecases/blood_list_usecase.dart';

class BloodListPresenter {
  BloodListPresenter(this.bloodUsecase);
  BloodlistUsecase bloodUsecase;

  // Future<List<InventoryCategoryModel?>?> getInventoryCategoryList({
  //   bool? isLoading,
  // }) async =>
  //     await bloodUsecase.getInventoryCategoryList(
  //       isLoading: isLoading ?? false,
  //     );
  // Future<List<ModuleListModel?>?> getModuleList({
  //   int? facilityId,
  //   int? type,
  //   bool? isLoading,
  // }) async =>
  //     await bloodUsecase.getModuleList(
  //       facilityId: facilityId ?? 0,
  //       type: type,
  //       isLoading: isLoading ?? false,
  //     );
  Future<List<BloodModel?>?> getBloodList({

    bool? isLoading,
  }) async =>
      await bloodUsecase.getBloodList(
        isLoading: isLoading ?? false,
      );
  Future<List<FrequencyModel?>?> getFrequencyList({
    bool? isLoading,
  }) async =>
      await bloodUsecase.getFrequencyList(
        isLoading: isLoading ?? false,
      );
  Future<bool> createModulelistNumber({
    modulelistJsonString,
    required bool isLoading,
  }) async {
    print("presenter");
    bloodUsecase.createModulelistNumber(
      modulelistJsonString: modulelistJsonString,
      isLoading: isLoading,
    );
    return true;
  }

  deleteModulelist(String? module_id, {required bool isLoading}) async =>
      await bloodUsecase.deleteModulelist(
        module_id: module_id ?? 0,
        isLoading: isLoading,
      );
  Future<bool> updateModulelistNumber(
      {modulelistJsonString, required bool isLoading, moduleId}) async {
    print("presenter");
    bloodUsecase.updateModulelistNumber(
      modulelistJsonString: modulelistJsonString,
      isLoading: isLoading,
    );
    return true;
  }
}
