import 'dart:typed_data';

import 'package:cmms/domain/models/business_list_model.dart';
import 'package:cmms/domain/models/country_model.dart';
import 'package:cmms/domain/models/designation_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/get_notification_by_userid_model.dart';
import 'package:cmms/domain/models/get_notification_model.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:cmms/domain/repositories/repository.dart';

import '../models/access_level_model.dart';
import '../models/add_user_model.dart';
import '../models/blood_model.dart';
import '../models/city_model.dart';
import '../models/role_model.dart';
import '../models/state_model.dart';
import '../models/user_detail_model.dart';

class AddUserUsecase {
  AddUserUsecase(this.repository);
  Repository repository;
  Future<List<CountryModel?>?> getCountryList({
    bool? isLoading,
  }) async =>
      await repository.getCountryList(
        isLoading,
      );
  Future<List<BloodModel?>?> getBloodList({
    bool? isLoading,
  }) async =>
      await repository.getBloodList(
        isLoading,
      );
  Future<List<RoleModel?>?> getRoleList({
    bool? isLoading,
  }) async =>
      await repository.getRoleList(
        isLoading,
      );
  Future<List<StateModel?>?> getStateList(
          {bool? isLoading, int? selectedCountryId}) async =>
      await repository.getStateListnew(isLoading, selectedCountryId);
  Future<List<CityModel?>?> getCityList(
          {bool? isLoading, int? selectedStateId}) async =>
      await repository.getCityList(isLoading, selectedStateId);
  Future<AccessLevelModel?> getRoleAccessList({
    int? roleId,
    bool? isLoading,
  }) async =>
      await repository.getRoleAccessList(
        roleId,
        isLoading,
      );
  Future<GetNotificationModel?> getRoleNotificationList({
    int? roleId,
    bool? isLoading,
  }) async =>
      await repository.getRoleNotificationList(
        roleId,
        isLoading,
      );
  Future<List<DesignationModel?>?> getResponsibilityList({
    int? type,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getResponsibilityList(
        // type,
        // facilityId,
        isLoading,
      );
  Future<List<DesignationModel?>?> getDesignationList({
    bool? isLoading,
  }) async =>
      await repository.getDesignationList(
        isLoading,
      );
  Future<AccessLevelModel?> getUserAccessListById({
    int? userId,
    bool? isLoading,
  }) async =>
      await repository.getUserAccessListByUserId(
        userId,
        isLoading,
      );
  Future<GetNotificationModel?> getUserNotificationListById({
    int? userId,
    bool? isLoading,
  }) async =>
      await repository.getUserNotificationListById(
        userId,
        isLoading,
      );
  Future<Map<String, dynamic>> saveAccessLevel({
    accessLevelJsonString,
    bool? isLoading,
  }) async =>
      await repository.saveAccessLevel(
        accessLevelJsonString,
        isLoading,
      );
  Future<List<BusinessListModel?>?> getBusinessList({
    required int type,
    required int facilityId,
    bool isLoading = true,
  }) async =>
      await repository.getBusinessList(
        businessType: type,
        facilityId: facilityId,
        isLoading: isLoading,
      );
  Future<Map<String, dynamic>> addUser({
    adduserJsonString,
    bool? isLoading,
  }) async =>
      await repository.addUser(
          isLoading: isLoading, adduserJsonString: adduserJsonString);
  Future<UserDetailsModel?> getUserDetails({
    int? userId,
    bool? isLoading,
  }) async =>
      await repository.getUserDetails(
        userId,
        isLoading,
      );
  Future<Map<String, dynamic>> updateUser({
    adduserJsonString,
    bool? isLoading,
  }) async =>
      await repository.updateUser(
          isLoading: isLoading, adduserJsonString: adduserJsonString);

  Future<AddUserModel?> uploadImge(
      Uint8List? fileBytes, String fileName, bool isLoading) async {
    return await repository.uploadImge(
      fileBytes,
      fileName,
      isLoading,
    );
    //  return true;
  }

  Future<Map<String, dynamic>> saveNotification({
    saveNotificationJsonString,
    bool? isLoading,
  }) async =>
      await repository.saveNotification(
        saveNotificationJsonString,
        isLoading,
      );
  Future<List<FacilityModel?>?> getFacilityList({
    required bool isLoading,
  }) async {
    return repository.getFacilityList(isLoading);
  }

  void saveValue({String? userId}) async =>
      repository.saveValue(LocalKeys.userDetailId, userId);
  Future<String?> getValue() async =>
      await repository.getStringValue(LocalKeys.userDetailId);
}
