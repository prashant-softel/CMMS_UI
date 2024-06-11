import 'package:cmms/domain/models/get_asset_data_list_model.dart';
import 'package:cmms/domain/models/get_plant_Stock_list.dart';
import 'package:cmms/domain/repositories/repository.dart';

import '../repositories/local_storage_keys.dart';

class CreateMrsReturnUsecase {
  CreateMrsReturnUsecase(this.repository);
  Repository repository;
  Future<List<PlantStockListModel?>?> getCmmsItemList({
    int? facilityId,
    bool? isLoading,
    int? mrsId,
  }) async =>
      await repository.getPlantStockListReturn(facilityId, isLoading, mrsId);
  Future<Map<String, dynamic>> createReturnMrs({
    createReturnMrsJsonString,
    bool? isLoading,
  }) async =>
      await repository.createReturnMrs(
        createReturnMrsJsonString,
        isLoading,
      );
  Future<List<GetAssetDataModel?>?> getAssetList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getAssetList(
        auth,
        facilityId,
        isLoading,
      );
  void saveValue({String? whereUsedTypeId}) async =>
      repository.saveValue(LocalKeys.pmTaskId, whereUsedTypeId);
  void saveValuee({String? type}) async =>
      repository.saveValue(LocalKeys.type, type);
  Future<String?> getValue() async =>
      await repository.getStringValue(LocalKeys.pmTaskId);
  Future<String?> getValuee() async =>
      await repository.getStringValue(LocalKeys.type);
  void saveactivityValue({String? activity}) async =>
      repository.saveValue(LocalKeys.activity, activity);
  Future<String?> getactivityValue() async =>
      await repository.getStringValue(LocalKeys.activity);
}
