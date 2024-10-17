import 'package:cmms/domain/models/asset_master_model.dart';
import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:cmms/domain/repositories/repository.dart';
// import '../../models/frequency_model.dart';
// import '../../models/modulelist_model.dart';
import '../models/frequency_model.dart';

class AssetMasterUsecase {
  AssetMasterUsecase(this.repository);
  Repository repository;

  Future<List<InventoryCategoryModel?>?> getInventoryCategoryList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getInventoryCategoryList(auth, facilityId, isLoading, 0);

  Future<List<AssetMasterModel?>?> getAssetMasterList({
    int? type,
    int? facilityId,
    bool? isLoading,
    bool? isExport,
  }) async =>
      await repository.getAssetMasterList(
          type, facilityId, isLoading, isExport);

  // Future<List<ModuleListModel?>?> getModuleList({
  //   int? type,
  //   int? facilityId,
  //   bool? isLoading,
  // }) async =>
  //     await repository.getModuleList(
  //       type,
  //       facilityId,
  //       isLoading,
  //     );
  Future<List<FrequencyModel?>?> getFrequencyList({
    bool? isLoading,
  }) async =>
      await repository.getFrequencyList(
        isLoading,
      );
  Future<bool> createModulelistNumber({
    modulelistJsonString,
    bool? isLoading,
  }) async =>
      await repository.createModuleListNumber(
          isLoading: isLoading, modulelistJsonString: modulelistJsonString);
  deleteModulelist(
          {required Object module_id, required bool isLoading}) async =>
      await repository.deleteModulelist(
        module_id,
        isLoading,
      );
  Future<bool> updateModulelistNumber({
    modulelistJsonString,
    bool? isLoading,
  }) async =>
      await repository.updateModulelistNumber(
        isLoading: isLoading,
        modulelistJsonString: modulelistJsonString,
      );

  void clearValue() async => repository.clearData(LocalKeys.mrsId);
  void clearpmTaskValue() async => repository.clearData(LocalKeys.pmTaskModel);
  void clearStoreTaskData() async => repository.clearData(LocalKeys.pmTaskId);
  void clearStoreTaskActivityData() async =>
      repository.clearData(LocalKeys.activity);
  void clearStoreTaskfromActorData() async =>
      repository.clearData(LocalKeys.fromActorTypeId);
  void clearStoreTasktoActorData() async =>
      repository.clearData(LocalKeys.toactortypeid);
  void clearStoreTaskWhereUsedData() async =>
      repository.clearData(LocalKeys.whereUsed);
  void clearStoreDataJobId() async => repository.clearData(LocalKeys.jobId);
  void clearPermitStoreData() async => repository.clearData(LocalKeys.permitId);
}
