import 'dart:developer';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import 'package:cmms/app/add_user/add_user_presenter.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/access_level_model.dart';
import 'package:cmms/domain/models/add_user_model.dart';
// import 'package:cmms/domain/models/add_user_model.dart';
import 'package:cmms/domain/models/country_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/models/blood_model.dart';
import '../../domain/models/city_model.dart';
import '../../domain/models/role_model.dart';
import '../../domain/models/save_access_level_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../domain/models/user_detail_model.dart';
import '../navigators/app_pages.dart';

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
  RxList<BloodListModel?> bloodList = <BloodListModel>[].obs;
  Rx<String> selectedBlood = 'Select Blood'.obs;
  Rx<bool> isSelectedBlood = true.obs;
  int selectedBloodId = 0;
  RxList<RoleModel?> roleList = <RoleModel>[].obs;
  Rx<String> selectedRole = 'Select Role'.obs;
  Rx<bool> isSelectedRole = true.obs;
  int selectedRoleId = 0;
  Rx<AccessLevelModel?> accessLevelModel = AccessLevelModel().obs;
  RxList<AccessLevel?> accesslevel = <AccessLevel>[].obs;
  RxList<String> moduleNameList = <String>[].obs;
  var selectedImageBytes = Rx<Uint8List>(Uint8List(0));
  final RxBool isChecked = false.obs;
  final RxBool isCheckedmodule = false.obs;
  var gender = 'Select Gender'.obs;
  AccessLevel? selectedItem;
  Rx<UserDetailsModel?> userDetailModel = UserDetailsModel().obs;
  var loginIdCtrlr = TextEditingController();
  var firstNameCtrlr = TextEditingController();
  var mobileNoCtrlr = TextEditingController();
  var secandoryIdCtrlr = TextEditingController();
  var lastNameCtrlr = TextEditingController();
  var dobCtrlr = TextEditingController();
  var landlineCtrlr = TextEditingController();
  var zipcodeCtrlr = TextEditingController();
  var passwordCtrlr = TextEditingController();
  var joingdateCtrlr = TextEditingController();
  int userId = 0;
  double thumbnailSize = Get.height * 0.25;

  ///
  void onInit() async {
    userId = Get.arguments;
    await getBloodList();
    await getCountryList();
    await getRoleList();
    await getUserDetails(userId: userId, isloading: true);
    super.onInit();
  }

  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;

  getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      selectedImageBytes.value = await pickedFile.readAsBytes();
    }
  }

  List<PlatformFile>? paths;

  void pickFiles() async {
    try {
      paths = (await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowMultiple: false,
        onFileLoading: (FilePickerStatus status) => print(status),
        allowedExtensions: ['png', 'jpg', 'jpeg', 'heic'],
      ))
          ?.files;
    } on PlatformException catch (e) {
      log('Unsupported operation' + e.toString());
    } catch (e) {
      log(e.toString());
    }
    // setState(() {
    if (paths != null) {
      if (paths != null) {
        //passing file bytes and file name for API call
        //    ApiClient.uploadFile(_paths!.first.bytes!, _paths!.first.name);
      }
    }
    //});
  }

  Future<void> getUserDetails({int? userId, bool? isloading}) async {
    final _userDetailModel = await addUserPresenter.getUserDetails(
        userId: userId, isLoading: isloading);

    if (_userDetailModel != null) {
      userDetailModel.value = _userDetailModel;
      landlineCtrlr.text = userDetailModel.value?.landline_number ?? "";
      mobileNoCtrlr.text = userDetailModel.value?.contact_no ?? "";
      loginIdCtrlr.text = userDetailModel.value?.user_name ?? "";
      secandoryIdCtrlr.text = userDetailModel.value?.secondaryEmail ?? "";
      firstNameCtrlr.text = userDetailModel.value?.first_name ?? "";
      lastNameCtrlr.text = userDetailModel.value?.last_name ?? "";
      zipcodeCtrlr.text = userDetailModel.value?.zipcode.toString() ?? "";
      dobCtrlr.text = userDetailModel.value?.dob ?? "";
      joingdateCtrlr.text = userDetailModel.value?.joiningDate ?? "";
      selectedCity.value = userDetailModel.value?.city_name ?? "";
      selectedCityId = userDetailModel.value?.city_id ?? 0;
      selectedState.value = userDetailModel.value?.state_name ?? "";
      selectedStateId = userDetailModel.value?.state_id ?? 0;
      selectedCountry.value = userDetailModel.value?.country_name ?? "";
      selectedCountryId = userDetailModel.value?.country_id ?? 0;
      selectedBlood.value = userDetailModel.value?.blood_group_name ?? "";
      selectedBloodId = userDetailModel.value?.blood_group_id ?? 0;
      selectedRole.value = userDetailModel.value?.role_name ?? "";
      selectedRoleId = userDetailModel.value?.role_id ?? 0;

      await getRoleAccessList(roleId: selectedRoleId, isloading: true);
    }
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

  Future<void> getBloodList() async {
    final list = await addUserPresenter.getBloodList();

    if (list != null) {
      for (var _bloodList in list) {
        bloodList.add(_bloodList);
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
      case RxList<BloodListModel>:
        {
          int bloodIndex = bloodList.indexWhere((x) => x?.name == value);
          selectedBloodId = bloodList[bloodIndex]?.id ?? 0;
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
      Get.offNamed(
        Routes.userList,
      );
    } else {
      Fluttertoast.showToast(
          msg: "Unable to update the access level", fontSize: 16.0);
    }
  }

  Future<bool> addUser() async {
    // if (checklistNumberCtrlr.text.trim() == '' ||
    //     selectedEquipmentId == 0 ||
    //     selectedfrequencyId == 0) {
    //   Fluttertoast.showToast(
    //       msg: "Please enter required field", fontSize: 16.0);
    // } else {
    List<AddAccessList> add_accessList = <AddAccessList>[];
    accesslevel.forEach((e) {
      add_accessList.add(AddAccessList(
          feature_id: e?.feature_id.value ?? 0,
          add: e?.add.value ?? 0,
          delete: e?.delete.value ?? 0,
          edit: e?.edit.value ?? 0,
          selfView: e?.selfView.value ?? 0,
          approve: e?.approve.value ?? 0,
          issue: e?.issue.value ?? 0,
          view: e?.view.value ?? 0));
    });
    String _loginId = loginIdCtrlr.text.trim();
    String _firstname = firstNameCtrlr.text.trim();
    String _mobileno = mobileNoCtrlr.text.trim();
    String _secandoryId = secandoryIdCtrlr.text.trim();
    String _lastname = lastNameCtrlr.text.trim();
    String _dob = dobCtrlr.text.trim();
    String _landline = landlineCtrlr.text.trim();
    String _zipcode = zipcodeCtrlr.text.trim();
    String _password = passwordCtrlr.text.trim();
    String _joiningdate = joingdateCtrlr.text.trim();
    Credentials credentials =
        Credentials(password: _password, user_name: _loginId);

    AddUserModel adduser = AddUserModel(
        id: 0,
        secondaryEmail: _secandoryId,
        first_name: _firstname,
        landline_number: _landline,
        last_name: _lastname,
        // add_access_list: [], //add_accessList,
        gender_id: gender.value == "Male"
            ? 1
            : gender.value == "FeMale"
                ? 2
                : 3,
        DOB: _dob,
        city_id: selectedCityId,
        contact_no: _mobileno,
        country_id: selectedCountryId,
        joiningDate: _joiningdate,
        blood_group_id: selectedBloodId,
        state_id: selectedStateId,
        photo_id: 3,
        role_id: selectedRoleId,
        zipcode: int.parse(_zipcode),
        isEmployee: 1,
        credentials: credentials);
    var adduserJsonString = adduser.toJson();

    print({"adduserJsonString", adduserJsonString});
    await addUserPresenter.addUser(
      adduserJsonString: adduserJsonString,
      isLoading: true,
    );
    return true;
  }

  //return true;
  // }
  Future<bool> updateUser() async {
    // if (checklistNumberCtrlr.text.trim() == '' ||
    //     selectedEquipmentId == 0 ||
    //     selectedfrequencyId == 0) {
    //   Fluttertoast.showToast(
    //       msg: "Please enter required field", fontSize: 16.0);
    // } else {
    List<AddAccessList> add_accessList = <AddAccessList>[];
    accesslevel.forEach((e) {
      add_accessList.add(AddAccessList(
          feature_id: e?.feature_id.value ?? 0,
          add: e?.add.value ?? 0,
          delete: e?.delete.value ?? 0,
          edit: e?.edit.value ?? 0,
          selfView: e?.selfView.value ?? 0,
          approve: e?.approve.value ?? 0,
          issue: e?.issue.value ?? 0,
          view: e?.view.value ?? 0));
    });
    String _loginId = loginIdCtrlr.text.trim();
    String _firstname = firstNameCtrlr.text.trim();
    String _mobileno = mobileNoCtrlr.text.trim();
    String _secandoryId = secandoryIdCtrlr.text.trim();
    String _lastname = lastNameCtrlr.text.trim();
    String _dob = dobCtrlr.text.trim();
    String _landline = landlineCtrlr.text.trim();
    String _zipcode = zipcodeCtrlr.text.trim();
    String _password = passwordCtrlr.text.trim();
    String _joiningdate = joingdateCtrlr.text.trim();
    Credentials credentials =
        Credentials(password: _password, user_name: _loginId);

    AddUserModel adduser = AddUserModel(
        id: userDetailModel.value?.id ?? 0,
        secondaryEmail: _secandoryId,
        first_name: _firstname,
        landline_number: _landline,
        last_name: _lastname,
        add_access_list: [], //add_accessList,
        gender_id: gender.value == "Male"
            ? 1
            : gender.value == "FeMale"
                ? 2
                : 3,
        DOB: _dob,
        city_id: selectedCityId,
        contact_no: _mobileno,
        country_id: selectedCountryId,
        joiningDate: _joiningdate,
        blood_group_id: selectedBloodId,
        state_id: selectedStateId,
        photo_id: 3,
        role_id: selectedRoleId,
        zipcode: int.parse(_zipcode),
        isEmployee: 1,
        credentials: credentials);
    var adduserJsonString = adduser.toJson();

    print({"adduserJsonString", adduserJsonString});
    await addUserPresenter.updateUser(
      adduserJsonString: adduserJsonString,
      isLoading: true,
    );
    return true;
  }
}
