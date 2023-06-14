import 'package:cmms/domain/models/preventive_checklist_model.dart';

import '../../domain/models/asset_master_model.dart';
import '../../domain/models/frequency_model.dart';
import '../../domain/models/inventory_category_model.dart';
import '../../domain/models/modulelist_model.dart';
import '../../domain/usecases/asset_master_usecase.dart';
import '../../domain/usecases/module_list_usecase.dart';

class AssetMasterPresenter {
  AssetMasterPresenter(this.moduleUsecase);
  AssetMasterUsecase moduleUsecase;

  Future<List<InventoryCategoryModel?>?> getInventoryCategoryList({
    bool? isLoading,
  }) async =>
      await moduleUsecase.getInventoryCategoryList(
        isLoading: isLoading ?? false,
      );
  Future<List<AssetMasterModel?>?> getAssetMasterList({
    int? facilityId,
    int? type,
    bool? isLoading,
  }) async =>
      await moduleUsecase.getAssetMasterList(
        facilityId: facilityId ?? 0,
        type: type,
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
