import 'dart:typed_data';

import 'package:cmms/domain/models/access_level_model.dart';
import 'package:cmms/domain/models/add_user_model.dart';
import 'package:cmms/domain/models/country_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/get_notification_by_userid_model.dart';
import 'package:cmms/domain/models/get_notification_model.dart';
import 'package:cmms/domain/models/getuser_access_byId_model.dart';

import '../../domain/models/asset_category_model.dart';
import '../../domain/models/asset_type_list_sm_model.dart';
import '../../domain/models/blood_model.dart';
import '../../domain/models/city_model.dart';
import '../../domain/models/role_model.dart';
import '../../domain/models/state_model.dart';
import '../../domain/models/unit_measurement_model.dart';
import '../../domain/models/user_detail_model.dart';
import '../../domain/usecases/add_asset_master_usecase.dart';

class AddAssetMasterPresenter {
  AddAssetMasterPresenter(this.addAssetUsecase);
  AddAssetMasterUsecase addAssetUsecase;
  Future<bool> createAssetSM({
    assetListJsonString,
    required bool isLoading,
  }) async {
    print("presenter");
    addAssetUsecase.createAssetSM(
      assetListJsonString: assetListJsonString,
      isLoading: isLoading,
    );
    return true;
  }

  Future<List<UnitMeasurementModel?>?> getUnitMeasurementList({
    bool? isLoading,
  }) async =>
      await addAssetUsecase.getUnitMeasurementList(
        isLoading: isLoading ?? false,
      );
  Future<List<AssetTypeListSMModel?>?> getAssetType({
    bool? isLoading,
  }) async =>
      await addAssetUsecase.getAssetType(
        isLoading: isLoading ?? false,
      );

  Future<List<AssetCategoryModel?>?> getAssetCategoryList({
    bool? isLoading,
  }) async =>
      await addAssetUsecase.getAssetCategoryList(
        isLoading: isLoading ?? false,
      );
}
