
import 'package:cmms/domain/models/material_category_model.dart';
import 'package:cmms/domain/repositories/repository.dart';
import '../models/asset_type_list_sm_model.dart';
import '../models/unit_measurement_model.dart';

class AddAssetMasterUsecase {
  AddAssetMasterUsecase(this.repository);
  Repository repository;
  Future<bool> createAssetSM({
    assetListJsonString,
    bool? isLoading,
  }) async =>
      await repository.createAssetSM(
          isLoading: isLoading, assetListJsonString: assetListJsonString);

  Future<List<MaterialCategoryListModel?>?> getMaterialList({
    bool? isLoading,
  }) async =>
      await repository.getMaterialList(
        isLoading: true,
      );
  Future<List<UnitMeasurementModel?>?> getUnitMeasurementList({
    bool? isLoading,
  }) async =>
      await repository.getUnitMeasurementList(
        isLoading: true,
      );
  Future<List<AssetTypeListSMModel?>?> getAssetType({
    bool? isLoading,
  }) async =>
      await repository.getAssetTypeSMList(
        isLoading: true,
      );
}
