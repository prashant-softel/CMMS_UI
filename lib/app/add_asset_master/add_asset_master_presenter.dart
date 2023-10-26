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
import '../../domain/usecases/add_user_usecase.dart';

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
    Future<List<CountryModel?>?> getCountryList({
    bool? isLoading,
  }) async =>
      await addAssetUsecase.getCountryList(
        isLoading: isLoading ?? false,
      );
  Future<List<BloodModel?>?> getBloodList({
    bool? isLoading,
  }) async =>
      await addAssetUsecase.getBloodList(
        isLoading: isLoading ?? false,
      );
  Future<List<RoleModel?>?> getRoleList({
    bool? isLoading,
  }) async =>
      await addAssetUsecase.getRoleList(
        isLoading: isLoading ?? false,
      );
  Future<List<StateModel?>?> getStateList(
      {bool? isLoading, int? selectedCountryId}) async =>
      await addAssetUsecase.getStateList(
          isLoading: isLoading ?? false, selectedCountryId: selectedCountryId);
  Future<List<CityModel?>?> getCityList(
      {bool? isLoading, int? selectedStateId}) async =>
      await addAssetUsecase.getCityList(
          isLoading: isLoading ?? false, selectedStateId: selectedStateId);
  Future<AccessLevelModel?> getRoleAccessList({
    int? roleId,
    bool? isLoading,
  }) async =>
      await addAssetUsecase.getRoleAccessList(
        roleId: roleId,
        isLoading: isLoading,
      );
  Future<GetNotificationModel?> getRoleNotificationList({
    int? roleId,
    bool? isLoading,
  }) async =>
      await addAssetUsecase.getRoleNotificationList(
        roleId: roleId,
        isLoading: isLoading,
      );
  Future<GetAccessLevelByIdModel?> getUserAccessListById({
    int? userId,
    bool? isLoading,
  }) async =>
      await addAssetUsecase.getUserAccessListById(
        userId: userId,
        isLoading: isLoading,
      );
  Future<GetNotificationByUserIdModel?> getUserNotificationListById({
    int? userId,
    bool? isLoading,
  }) async =>
      await addAssetUsecase.getUserNotificationListById(
        userId: userId,
        isLoading: isLoading,
      );
  Future<Map<String, dynamic>> saveAccessLevel({
    accessLevelJsonString,
    required bool isLoading,
  }) async {
    return addAssetUsecase.saveAccessLevel(
      accessLevelJsonString: accessLevelJsonString,
      isLoading: isLoading,
    );
  }

  Future<bool> addUser({
    adduserJsonString,
    required bool isLoading,
  }) async {
    print("presenter");
    addAssetUsecase.addUser(
      adduserJsonString: adduserJsonString,
      isLoading: isLoading,
    );
    return true;
  }

  Future<UserDetailsModel?> getUserDetails({
    int? userId,
    bool? isLoading,
  }) async =>
      await addAssetUsecase.getUserDetails(
        userId: userId,
        isLoading: isLoading,
      );
  Future<bool> updateUser({
    adduserJsonString,
    required bool isLoading,
  }) async {
    print("presenter");
    addAssetUsecase.updateUser(
      adduserJsonString: adduserJsonString,
      isLoading: isLoading,
    );
    return true;
  }

  Future<AddUserModel?> uploadImge(
      Uint8List? fileBytes, String fileName, bool isLoading) async {
    return await addAssetUsecase.uploadImge(fileBytes, fileName, isLoading);
    // return true;
  }

  Future<Map<String, dynamic>> saveNotification({
    saveNotificationJsonString,
    required bool isLoading,
  }) async {
    return addAssetUsecase.saveNotification(
      saveNotificationJsonString: saveNotificationJsonString,
      isLoading: isLoading,
    );
  }

  Future<List<FacilityModel?>?> getFacilityList({
    required bool isLoading,
  }) async {
    return addAssetUsecase.getFacilityList(
      isLoading: isLoading,
    );
  }
  Future<List<UnitMeasurementModel?>?> getUnitMeasurementList({
    bool? isLoading,
  }) async =>
      await addAssetUsecase.getUnitMeasurementList(
        isLoading: isLoading ?? false,
      );
  Future<List<AssetTypeListSMModel?>?> getAssetType(

      {
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
