import 'package:cmms/domain/models/access_level_model.dart';
import 'package:cmms/domain/models/country_model.dart';

import '../../domain/models/city_model.dart';
import '../../domain/models/role_model.dart';
import '../../domain/models/state_model.dart';
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
  Future<Map<String, dynamic>> saveAccessLevel({
    accessLevelJsonString,
    required bool isLoading,
  }) async {
    return addUserUsecase.saveAccessLevel(
      accessLevelJsonString: accessLevelJsonString,
      isLoading: isLoading,
    );
  }
}
