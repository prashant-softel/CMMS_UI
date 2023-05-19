import 'package:cmms/app/add_user/add_user_presenter.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/access_level_model.dart';
import 'package:cmms/domain/models/country_model.dart';
import 'package:get/get.dart';

import '../../domain/models/city_model.dart';
import '../../domain/models/role_model.dart';
import '../../domain/models/save_access_level_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddUserController extends GetxController {
  AddUserController(
    this.addUserPresenter,
  );
  AddUserPresenter addUserPresenter;
  RxList<CountryModel?> countryList = <CountryModel>[].obs;
  Rx<String> selectedCountry = 'Select Country'.obs;
  Rx<bool> isSelectedCountry = true.obs;
  int selectedCountryId = 0;
  RxList<StateModel?> stateList = <StateModel>[].obs;
  Rx<String> selectedState = 'Select State'.obs;
  Rx<bool> isSelectedState = true.obs;
  int selectedStateId = 0;
  RxList<CityModel?> cityList = <CityModel>[].obs;
  Rx<String> selectedCity = 'Select City'.obs;
  Rx<bool> isSelectedCity = true.obs;
  int selectedCityId = 0;

  RxList<RoleModel?> roleList = <RoleModel>[].obs;
  Rx<String> selectedRole = 'Select Role'.obs;
  Rx<bool> isSelectedRole = true.obs;
  int selectedRoleId = 0;
  Rx<AccessLevelModel?> accessLevelModel = AccessLevelModel().obs;
  RxList<AccessLevel?> accesslevel = <AccessLevel>[].obs;
  RxList<String> moduleNameList = <String>[].obs;

  final RxBool isChecked = false.obs;
  final RxBool isCheckedmodule = false.obs;
  var gender = 'Select Gender'.obs;
  AccessLevel? selectedItem;
  void onInit() async {
    await getCountryList();
    await getRoleList();

    super.onInit();
  }

  void updateGender(String value) {
    gender.value = value;
  }

  Future<void> getRoleList() async {
    final list = await addUserPresenter.getRoleList();

    if (list != null) {
      for (var _roleList in list) {
        roleList.add(_roleList);
      }
    }
  }

  Future<void> getCountryList() async {
    final list = await addUserPresenter.getCountryList();

    if (list != null) {
      for (var _countryList in list) {
        countryList.add(_countryList);
      }
    }
  }

  Future<void> getStateList(int selectedCountryId) async {
    final list = await addUserPresenter.getStateList(
        selectedCountryId: selectedCountryId);

    if (list != null) {
      for (var _stateList in list) {
        stateList.add(_stateList);
      }
    }
  }

  Future<void> getCityList(int selectedStateId) async {
    final list =
        await addUserPresenter.getCityList(selectedStateId: selectedStateId);

    if (list != null) {
      for (var _cityList in list) {
        cityList.add(_cityList);
      }
    }
  }

  Future<void> getRoleAccessList({int? roleId, bool? isloading}) async {
    final _accessLevelModel = await addUserPresenter.getRoleAccessList(
        roleId: roleId, isLoading: isloading);
    Set<String> moduleNameSet = {};

    if (_accessLevelModel != null) {
      accessLevelModel.value = _accessLevelModel;
      accesslevel.value = accessLevelModel.value?.access_list ?? [];
      // for (var _accesslevel in accesslevel) {
      //   if (_accesslevel?.feature_name != null) {
      //     moduleNameSet.add(_accesslevel?.feature_name.value ?? "");
      //   }
      // }
      // moduleNameList.addAll(moduleNameSet.toList());
    }
  }

  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {
      case RxList<CountryModel>:
        {
          int countryIndex = countryList.indexWhere((x) => x?.name == value);
          selectedCountryId = countryList[countryIndex]?.id ?? 0;
          cityList.clear();
          stateList.clear();
          selectedCity.value = "Please Select";
          selectedCityId = 0;
          selectedState.value = "Please Select";
          selectedStateId = 0;

          getStateList(selectedCountryId);
        }

        break;
      case RxList<StateModel>:
        {
          int stateIndex = stateList.indexWhere((x) => x?.name == value);
          selectedStateId = stateList[stateIndex]?.id ?? 0;
          cityList.clear();
          selectedCity.value = "Please Select";
          selectedCityId = 0;
          getCityList(selectedStateId);
        }
        break;
      case RxList<CityModel>:
        {
          int cityIndex = cityList.indexWhere((x) => x?.name == value);
          selectedCityId = cityList[cityIndex]?.id ?? 0;
        }
        break;
      case RxList<RoleModel>:
        {
          int roleIndex = roleList.indexWhere((x) => x?.name == value);
          selectedRoleId = roleList[roleIndex]?.id ?? 0;
          getRoleAccessList(roleId: selectedRoleId, isloading: true);
        }
        break;
      default:
        {
          //statements;
        }
        break;
    }
  }

  void saveAccessLevel() async {
    List<AccessList> accessList = <AccessList>[];
    accesslevel.forEach((e) {
      accessList.add(AccessList(
          feature_id: e?.feature_id.value ?? 0,
          add: e?.add.value ?? 0,
          delete: e?.delete.value ?? 0,
          edit: e?.edit.value ?? 0,
          selfView: e?.selfView.value ?? 0,
          approve: e?.approve.value ?? 0,
          issue: e?.issue.value ?? 0,
          view: e?.view.value ?? 0));
    });
    SaveAccessLevelModel saveAccessLevelModel = SaveAccessLevelModel(
        user_id: varUserAccessModel.value.user_id ?? 0,
        access_list: accessList);
    var accessLevelJsonString = saveAccessLevelModel.toJson();
    print({"accessLevelJsonString", accessLevelJsonString});
    if (accessList.isNotEmpty) {
      Map<String, dynamic>? responsePmMapCreated =
          await addUserPresenter.saveAccessLevel(
        accessLevelJsonString: accessLevelJsonString,
        isLoading: true,
      );
      if (responsePmMapCreated != null) {
        getRoleAccessList(roleId: selectedRoleId, isloading: true);
        // isSuccessDialog();
      }
    } else {
      Fluttertoast.showToast(msg: "Please Map the Checklist", fontSize: 16.0);
    }
  }
}
