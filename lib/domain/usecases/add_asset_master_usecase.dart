import 'dart:typed_data';

import 'package:cmms/domain/models/country_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/get_notification_by_userid_model.dart';
import 'package:cmms/domain/models/get_notification_model.dart';
import 'package:cmms/domain/models/getuser_access_byId_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

import '../models/access_level_model.dart';
import '../models/add_user_model.dart';
import '../models/asset_category_model.dart';
import '../models/asset_type_list_sm_model.dart';
import '../models/blood_model.dart';
import '../models/city_model.dart';
import '../models/role_model.dart';
import '../models/state_model.dart';
import '../models/unit_measurement_model.dart';
import '../models/user_detail_model.dart';

class AddAssetMasterUsecase {
  AddAssetMasterUsecase(this.repository);
  Repository repository;
  Future<bool> createAssetSM({
    assetListJsonString,
    bool? isLoading,
  }) async =>
      await repository.createAssetSM(
          isLoading: isLoading, assetListJsonString: assetListJsonString);

  Future<List<AssetCategoryModel?>?> getAssetCategoryList({
    bool? isLoading,
  }) async =>
      await repository.getAssetCategoryList(
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
