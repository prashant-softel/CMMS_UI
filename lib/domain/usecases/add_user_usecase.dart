import 'package:cmms/domain/models/country_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

import '../models/access_level_model.dart';
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
  Future<List<BloodListModel?>?> getBloodList({
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
  Future<Map<String, dynamic>> saveAccessLevel({
    accessLevelJsonString,
    bool? isLoading,
  }) async =>
      await repository.saveAccessLevel(
        accessLevelJsonString,
        isLoading,
      );
  Future<bool> addUser({
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
  Future<bool> updateUser({
    adduserJsonString,
    bool? isLoading,
  }) async =>
      await repository.updateUser(
          isLoading: isLoading, adduserJsonString: adduserJsonString);
}
