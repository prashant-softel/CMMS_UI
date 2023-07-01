import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/get_notification_model.dart';
import 'package:cmms/domain/models/getuser_access_byId_model.dart';
import 'package:cmms/domain/models/save_user_notification_model.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import 'package:cmms/app/add_user/add_user_presenter.dart';
import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/access_level_model.dart';
import 'package:cmms/domain/models/add_user_model.dart';
import 'package:cmms/domain/models/country_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

import '../../domain/models/blood_model.dart';
import '../../domain/models/city_model.dart';
import '../../domain/models/get_notification_by_userid_model.dart';
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
  RxList<BloodModel?> bloodList = <BloodModel>[].obs;
  Rx<String> selectedBlood = 'Select Blood'.obs;
  Rx<bool> isSelectedBlood = true.obs;
  int selectedBloodId = 0;
  RxList<RoleModel?> roleList = <RoleModel>[].obs;
  Rx<String> selectedRole = 'Select Role'.obs;
  Rx<bool> isSelectedRole = true.obs;
  int selectedRoleId = 0;
  Rx<AccessLevelModel?> accessLevelModel = AccessLevelModel().obs;
  RxList<AccessLevel?> accesslevel = <AccessLevel>[].obs;
  RxBool isPasswordVisible = false.obs;
  RxString password = ''.obs;
  RxBool isPasswordValid = true.obs;
  bool isToastVisible = false;

  Rx<GetAccessLevelByIdModel?> accessListModel = GetAccessLevelByIdModel().obs;
  RxList<GetAccessLevel?> accessList = <GetAccessLevel>[].obs;

  Rx<GetNotificationModel?> notificationModel = GetNotificationModel().obs;
  RxList<NotificationList?> notificationList = <NotificationList>[].obs;
  Rx<GetNotificationByUserIdModel?> notificationByUserIdModel =
      GetNotificationByUserIdModel().obs;
  RxList<NotificationListByUserId?> notificationListByUserId =
      <NotificationListByUserId>[].obs;

  RxList<String> moduleNameList = <String>[].obs;
  var selectedImageBytes = Rx<Uint8List>(Uint8List(0));
  final RxBool isChecked = false.obs;
  final RxBool isCheckedmodule = false.obs;
  var gender = 'Select Gender'.obs;
  AccessLevel? selectedItem;
  Rx<UserDetailsModel?> userDetailModel = UserDetailsModel().obs;
  RxList<PlantList?> plantListModel = <PlantList?>[].obs;
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
  RxList<String?> selectedfacilityDataList = <String>[].obs;
  RxList<int?> selectedfacilityIdList = <int>[].obs;
  RxList<FacilityModel?> selectedFacilityNameList = <FacilityModel>[].obs;
  RxList<int> selectedfacilityNameIdList = <int>[].obs;
  RxList<FacilityModel?> facilityNameList = <FacilityModel>[].obs;
  RxList<FacilityModel?> filteredfacilityNameList = <FacilityModel>[].obs;
  Map<dynamic, dynamic> facility_map = {};
  PaginationController facilityNamepaginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );

  ///
  void onInit() async {
    userId = Get.arguments;
    await getBloodList();
    await getCountryList();
    await getRoleList();
    await getFacilityList();
    if (userId != null) {
      await getUserDetails(userId: userId, isloading: true);
    }
    super.onInit();
  }

  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;
  RxString imageName = "".obs;
  var photoId;
  Future<void> getFacilityList() async {
    facilityNameList.value = <FacilityModel>[];
    final _facilityNameList = await addUserPresenter.getFacilityList(
      isLoading: true,
      // categoryIds: categoryIds,
    );
    for (var facility_list in _facilityNameList!) {
      facilityNameList.add(facility_list);
    }
    facilityNamepaginationController = PaginationController(
      rowCount: facilityNameList.length,
      rowsPerPage: 10,
    );
    update(['permit_facility_list']);
  }

  void togglePasswordVisibility() {
    isPasswordVisible.toggle();
  }

  // void validatePassword(String value) {
  //   password.value = value;
  //   isPasswordValid.value = isPasswordValidated(password.value);

  //   if (!isPasswordValid.value && !isToastVisible) {
  //     Fluttertoast.showToast(
  //       msg:
  //           'Password must have at least one special character, one number, and a minimum length of 8 characters.',
  //       toastLength: Toast.LENGTH_LONG,
  //       gravity: ToastGravity.BOTTOM,
  //       timeInSecForIosWeb: 86400, // 24 hours
  //       backgroundColor: Colors.red,
  //       textColor: Colors.white,
  //     );

  //     isToastVisible = true;
  //   } else if (isPasswordValid.value && isToastVisible) {
  //     Fluttertoast.cancel();
  //     isToastVisible = false;
  //   }
  // }

  // bool isPasswordValidated(String password) {
  //   final RegExp passwordRegex = RegExp(
  //       r'^(?=.*?[A-Za-z])(?=.*?[0-9])(?=.*?[!@#$%^&*])[A-Za-z0-9!@#$%^&*]{8,}$');
  //   return passwordRegex.hasMatch(password);
  // }

  void facilityNameSelected(_selectedfacilityNameIds) {
    selectedfacilityNameIdList.value = <int>[];
    filteredfacilityNameList.value = <FacilityModel>[];
    late int emp_id = 0;
    for (var _selectedfacilityNameId in _selectedfacilityNameIds) {
      selectedfacilityNameIdList.add(_selectedfacilityNameId);
      FacilityModel? e = facilityNameList.firstWhere((element) {
        return element?.id == _selectedfacilityNameId;
      });
      filteredfacilityNameList.add(e);
    }

    facility_map[emp_id] = selectedfacilityNameIdList;
  }

  getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      imageName.value = pickedFile.name;
      selectedImageBytes.value = await pickedFile.readAsBytes();

      uploadImge(
        fileBytes: selectedImageBytes.value,
      );
    }
  }

  Future<void> uploadImge({Uint8List? fileBytes}) async {
    AddUserModel? addUserModel =
        await addUserPresenter.uploadImge(fileBytes, imageName.value, true);
    photoId = addUserModel?.photo_id;
    print({"photooo", photoId});
    // return true;
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
      photoId = userDetailModel.value?.photoId ?? 0;
      gender.value = userDetailModel.value?.gender_name ?? "";
      plantListModel.value = _userDetailModel.plant_list ?? [];

      await getUserAccessListById(userId: userId, isloading: true);
      await getUserNotificationListById(userId: userId, isloading: true);
    }
  }

  Future<void> getUserNotificationListById(
      {int? userId, bool? isloading}) async {
    final _notificationListModel = await addUserPresenter
        .getUserNotificationListById(userId: userId, isLoading: isloading);
    if (_notificationListModel != null) {
      notificationByUserIdModel.value = _notificationListModel;
      notificationListByUserId.value =
          notificationByUserIdModel.value?.notification_list ?? [];
    }
  }

  Future<void> getUserAccessListById({int? userId, bool? isloading}) async {
    final _accessListModel = await addUserPresenter.getUserAccessListById(
        userId: userId, isLoading: isloading);
    if (_accessListModel != null) {
      accessListModel.value = _accessListModel;
      accessList.value = accessListModel.value?.access_list ?? [];
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

  Future<void> getRoleNotificationList({int? roleId, bool? isloading}) async {
    final _notificationModel = await addUserPresenter.getRoleNotificationList(
        roleId: roleId, isLoading: isloading);
    print({"ddddd", _notificationModel});
    if (_notificationModel != null) {
      notificationModel.value = _notificationModel;
      notificationList.value = notificationModel.value?.notification_list ?? [];
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
      case RxList<BloodModel>:
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
          getRoleNotificationList(roleId: selectedRoleId, isloading: true);
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
    List<SaveAccessList> accesslist = <SaveAccessList>[];
    userId == null
        ? accesslevel.forEach((e) {
            accesslist.add(SaveAccessList(
                feature_id: e?.feature_id.value ?? 0,
                add: e?.add.value ?? 0,
                delete: e?.delete.value ?? 0,
                edit: e?.edit.value ?? 0,
                selfView: e?.selfView.value ?? 0,
                approve: e?.approve.value ?? 0,
                issue: e?.issue.value ?? 0,
                view: e?.view.value ?? 0));
          })
        : accessList.forEach((e) {
            accesslist.add(SaveAccessList(
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
        user_id: userId, // varUserAccessModel.value.user_id ?? 0,
        access_list: accesslist);
    var accessLevelJsonString = saveAccessLevelModel.toJson();
    print({"accessLevelJsonString", accessLevelJsonString});
    if (accessList.isNotEmpty) {
      Map<String, dynamic>? responsePmMapCreated =
          await addUserPresenter.saveAccessLevel(
        accessLevelJsonString: accessLevelJsonString,
        isLoading: true,
      );
      if (responsePmMapCreated != null) {
        saveNotification();
        // userId = 0;
        // Get.offNamed(
        //   Routes.userList,
        // );
      }
    } else {
      Fluttertoast.showToast(
          msg: "Unable to update the access level", fontSize: 16.0);
    }
  }

  void saveNotification() async {
    List<SaveNotificationList> notificationlist = <SaveNotificationList>[];
    userId == null
        ? notificationList.forEach((e) {
            notificationlist.add(SaveNotificationList(
                notification_id: e?.notification_id.value ?? 0,
                user_flag: e?.user_flag.value ?? 0));
          })
        : notificationListByUserId.forEach((e) {
            notificationlist.add(SaveNotificationList(
                notification_id: e?.notification_id.value ?? 0,
                user_flag: e?.user_flag.value ?? 0));
          });
    SaveUserNotificationModel saveUserNotificationModel =
        SaveUserNotificationModel(
            user_id: userId, // varUserAccessModel.value.user_id ?? 0,
            notification_list: notificationlist);
    var saveNotificationJsonString = saveUserNotificationModel.toJson();
    print({"saveNotificationJsonString", saveNotificationJsonString});
    if (notificationlist.isNotEmpty) {
      Map<String, dynamic>? responseSaveNotification =
          await addUserPresenter.saveNotification(
        saveNotificationJsonString: saveNotificationJsonString,
        isLoading: true,
      );
      if (responseSaveNotification != null) {
        userId = 0;
        Get.toNamed(
          Routes.userList,
        );
      }
    } else {
      Fluttertoast.showToast(
          msg: "Unable to update the  notification", fontSize: 16.0);
    }
  }

  Future<bool> addUser() async {
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
        photo_id: photoId,
        role_id: selectedRoleId,
        zipcode: int.parse(_zipcode),
        isEmployee: 1,
        facilities: selectedfacilityNameIdList,
        credentials: credentials);
    var adduserJsonString = [adduser.toJson()];

    print({"adduserJsonString", adduserJsonString});
    await addUserPresenter.addUser(
      adduserJsonString: adduserJsonString,
      isLoading: true,
    );
    return true;
  }

  Future<bool> updateUser() async {
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
        photo_id: photoId,
        role_id: selectedRoleId,
        zipcode: int.parse(_zipcode),
        facilities: selectedfacilityNameIdList,
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
