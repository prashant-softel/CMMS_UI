import '../../domain/models/frequency_model.dart';
import '../../domain/models/inventory_category_model.dart';
import '../../domain/models/modulelist_model.dart';
import '../../domain/usecases/module_list_usecase.dart';

class ModuleListPresenter {
  ModuleListPresenter(this.moduleUsecase);
  ModulelistUsecase moduleUsecase;

  Future<List<InventoryCategoryModel?>?> getInventoryCategoryList({
    bool? isLoading,
  }) async =>
      await moduleUsecase.getInventoryCategoryList(
        isLoading: isLoading ?? false,
      );
  Future<List<ModuleListModel?>?> getModuleList({
    bool? isLoading,
  }) async =>
      await moduleUsecase.getModuleList(
        isLoading: isLoading ?? false,
      );
  Future<List<FrequencyModel?>?> getFrequencyList({
    bool? isLoading,
  }) async =>
      await moduleUsecase.getFrequencyList(
        isLoading: isLoading ?? false,
      );
  Future<bool> createModulelistNumber({
    modulelistJsonString,
    required bool isLoading,
  }) async {
    print("presenter");
    moduleUsecase.createModulelistNumber(
      modulelistJsonString: modulelistJsonString,
      isLoading: isLoading,
    );
    return true;
  }

  deleteModulelist(String? module_id, {required bool isLoading}) async =>
      await moduleUsecase.deleteModulelist(
        module_id: module_id ?? 0,
        isLoading: isLoading,
      );
  Future<bool> updateModulelistNumber(
      {modulelistJsonString, required bool isLoading, moduleId}) async {
    print("presenter");
    moduleUsecase.updateModulelistNumber(
      modulelistJsonString: modulelistJsonString,
      isLoading: isLoading,
    );
    return true;
  }
}
