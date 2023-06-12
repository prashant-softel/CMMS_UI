import 'dart:typed_data';

import 'package:cmms/domain/models/access_level_model.dart';
import 'package:cmms/domain/models/add_user_model.dart';
import 'package:cmms/domain/models/country_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/get_notification_by_userid_model.dart';
import 'package:cmms/domain/models/get_notification_model.dart';
import 'package:cmms/domain/models/getuser_access_byId_model.dart';

import '../../domain/models/blood_model.dart';
import '../../domain/models/city_model.dart';
import '../../domain/models/role_model.dart';
import '../../domain/models/state_model.dart';
import '../../domain/models/user_detail_model.dart';
import '../../domain/usecases/add_user_usecase.dart';

class AddUserPresenter {
  AddUserPresenter(this.addUserUsecase);
  AddUserUsecase addUserUsecase;
  Future<List<CountryModel?>?> getCountryList({
    bool? isLoading,
  }) async =>
      await addUserUsecase.getCountryList(
        isLoading: isLoading ?? false,
      );
  Future<List<BloodModel?>?> getBloodList({
    bool? isLoading,
  }) async =>
      await addUserUsecase.getBloodList(
        isLoading: isLoading ?? false,
      );
  Future<List<RoleModel?>?> getRoleList({
    bool? isLoading,
  }) async =>
      await addUserUsecase.getRoleList(
        isLoading: isLoading ?? false,
      );
  Future<List<StateModel?>?> getStateList(
          {bool? isLoading, int? selectedCountryId}) async =>
      await addUserUsecase.getStateList(
          isLoading: isLoading ?? false, selectedCountryId: selectedCountryId);
  Future<List<CityModel?>?> getCityList(
          {bool? isLoading, int? selectedStateId}) async =>
      await addUserUsecase.getCityList(
          isLoading: isLoading ?? false, selectedStateId: selectedStateId);
  Future<AccessLevelModel?> getRoleAccessList({
    int? roleId,
    bool? isLoading,
  }) async =>
      await addUserUsecase.getRoleAccessList(
        roleId: roleId,
        isLoading: isLoading,
      );
  Future<GetNotificationModel?> getRoleNotificationList({
    int? roleId,
    bool? isLoading,
  }) async =>
      await addUserUsecase.getRoleNotificationList(
        roleId: roleId,
        isLoading: isLoading,
      );
  Future<GetAccessLevelByIdModel?> getUserAccessListById({
    int? userId,
    bool? isLoading,
  }) async =>
      await addUserUsecase.getUserAccessListById(
        userId: userId,
        isLoading: isLoading,
      );
  Future<GetNotificationByUserIdModel?> getUserNotificationListById({
    int? userId,
    bool? isLoading,
  }) async =>
      await addUserUsecase.getUserNotificationListById(
        userId: userId,
        isLoading: isLoading,
      );
  Future<Map<String, dynamic>> saveAccessLevel({
    accessLevelJsonString,
    required bool isLoading,
  }) async {
    return addUserUsecase.saveAccessLevel(
      accessLevelJsonString: accessLevelJsonString,
      isLoading: isLoading,
    );
  }

  Future<bool> addUser({
    adduserJsonString,
    required bool isLoading,
  }) async {
    print("presenter");
    addUserUsecase.addUser(
      adduserJsonString: adduserJsonString,
      isLoading: isLoading,
    );
    return true;
  }

  Future<UserDetailsModel?> getUserDetails({
    int? userId,
    bool? isLoading,
  }) async =>
      await addUserUsecase.getUserDetails(
        userId: userId,
        isLoading: isLoading,
      );
  Future<bool> updateUser({
    adduserJsonString,
    required bool isLoading,
  }) async {
    print("presenter");
    addUserUsecase.updateUser(
      adduserJsonString: adduserJsonString,
      isLoading: isLoading,
    );
    return true;
  }

  Future<AddUserModel?> uploadImge(
      Uint8List? fileBytes, String fileName, bool isLoading) async {
    return await addUserUsecase.uploadImge(fileBytes, fileName, isLoading);
    // return true;
  }

  Future<Map<String, dynamic>> saveNotification({
    saveNotificationJsonString,
    required bool isLoading,
  }) async {
    return addUserUsecase.saveNotification(
      saveNotificationJsonString: saveNotificationJsonString,
      isLoading: isLoading,
    );
  }

  Future<List<FacilityModel?>?> getFacilityList({
    required bool isLoading,
  }) async {
    return addUserUsecase.getFacilityList(
      isLoading: isLoading,
    );
  }
}
