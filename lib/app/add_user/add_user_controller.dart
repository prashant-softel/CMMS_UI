import 'dart:async';
import 'dart:convert';
import 'package:cmms/app/add_user/view/add_user_msg_dialog.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/utils/utility.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/domain/models/designation_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/get_notification_model.dart';
import 'package:cmms/domain/models/save_user_notification_model.dart';
import 'package:cmms/domain/models/type_model.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';

import 'package:cmms/app/add_user/add_user_presenter.dart';
import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/access_level_model.dart';
import 'package:cmms/domain/models/add_user_model.dart';
import 'package:cmms/domain/models/country_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

import '../../domain/models/blood_model.dart';
import '../../domain/models/business_list_model.dart';
import '../../domain/models/city_model.dart';
import '../../domain/models/get_notification_by_userid_model.dart';
import '../../domain/models/role_model.dart';
import '../../domain/models/save_access_level_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../domain/models/user_detail_model.dart';
import '../navigators/app_pages.dart';
import '../theme/color_values.dart';
import '../widgets/custom_multiselect_dialog_field.dart';

class AddUserController extends GetxController {
  AddUserController(
    this.addUserPresenter,
  );
  StreamSubscription<int>? facilityIdStreamSubscription;
  HomeController homeController = Get.find<HomeController>();
  int facilityId = 0;
  Rx<bool> isFacilitySelected = true.obs;
  AddUserPresenter addUserPresenter;
  RxList<CountryModel?> countryList = <CountryModel>[].obs;

  Rx<String> selectedCountry = ''.obs;
  Rx<String> selectedGender = ''.obs;

  Rx<bool> isSelectedCountry = true.obs;
  Rx<bool> isSelectedGender = true.obs;

  Rx<bool> isLoginIDInvalid = false.obs;

  Rx<bool> isPasswordInvalid = false.obs;
  Rx<bool> isLastNameInvalid = false.obs;
  Rx<bool> isDateofJoiningInvalid = false.obs;
  Rx<bool> isZipCodeInvalid = false.obs;

  Rx<bool> isLandlineInvalid = false.obs;

  Rx<bool> isdobInvalid = false.obs;

  Rx<bool> isFirstNameInvalid = false.obs;
  Rx<bool> isMobileNumberInvalid = false.obs;

  Rx<bool> isSecondaryEmailInvalid = false.obs;

  Rx<bool> isFormInvalid = false.obs;

  int selectedCountryId = 0;
  int selectedGenderId = 0;

  RxList<StateModel?> stateList = <StateModel>[].obs;
  Rx<String> selectedState = ''.obs;
  Rx<bool> isSelectedState = true.obs;
  int selectedStateId = 0;
  RxList<CityModel?> cityList = <CityModel>[].obs;
  Rx<String> selectedCity = ''.obs;
  Rx<bool> isSelectedCity = true.obs;
  int selectedCityId = 0;
  RxList<BloodModel?> bloodList = <BloodModel>[].obs;
  Rx<String> selectedBlood = ''.obs;
  Rx<bool> isSelectedBlood = true.obs;
  int selectedBloodId = 0;
  RxList<RoleModel?> roleList = <RoleModel>[].obs;
  Rx<String> selectedRole = ''.obs;
  Rx<bool> isSelectedRole = true.obs;
  int selectedRoleId = 0;
  Rx<AccessLevelModel?> accessLevelModel = AccessLevelModel().obs;
  RxList<AccessLevel?> accesslevel = <AccessLevel>[].obs;
  RxBool isPasswordVisible = false.obs;
  RxString password = ''.obs;
  RxBool isPasswordValid = true.obs;
  bool isToastVisible = false;

  RxList<GenderModel?> genderList = <GenderModel>[
    GenderModel(name: 'Male', id: 1),
    GenderModel(name: 'Female', id: 2),
    GenderModel(name: 'Other', id: 3),
  ].obs;

  // Rx<GetAccessLevelByIdModel?> accessListModel = GetAccessLevelByIdModel().obs;
  // RxList<GetAccessLevel?> accessList = <GetAccessLevel>[].obs;

  Rx<GetNotificationModel?> notificationModel = GetNotificationModel().obs;
  RxList<NotificationList?> notificationList = <NotificationList>[].obs;
  // Rx<GetNotificationModel?> notificationByUserIdModel =
  //     GetNotificationModel().obs;
  // RxList<NotificationList?> notificationListByUserId = <NotificationList>[].obs;
  RxList<DesignationModel?>? designationList = <DesignationModel?>[].obs;
  RxList<String> moduleNameList = <String>[].obs;
  var selectedImageBytes = Rx<Uint8List>(Uint8List(0));
  final RxBool isChecked = false.obs;
  final RxBool isCheckedmodule = false.obs;
  var gender = 'Select Gender'.obs;
  AccessLevel? selectedItem;
  Rx<UserDetailsModel?> userDetailModel = UserDetailsModel().obs;
  RxList<PlantAccess?> plantListModel = <PlantAccess?>[].obs;
  // RxList<Responsibility?> responsibilitymodel = <Responsibility>[].obs;
  var loginIdCtrlr = TextEditingController();
  FocusNode loginIdFocus = FocusNode();
  ScrollController loginIdScrool = ScrollController();
  var firstNameCtrlr = TextEditingController();
  FocusNode firstNameFocus = FocusNode();
  ScrollController firstNameScrool = ScrollController();
  var mobileNoCtrlr = TextEditingController();
  var secandoryIdCtrlr = TextEditingController();
  FocusNode secondIdFocus = FocusNode();
  ScrollController secondIdScrool = ScrollController();
  var lastNameCtrlr = TextEditingController();
  FocusNode lastNameFocus = FocusNode();
  ScrollController LastNameScrool = ScrollController();
  var dobCtrlr = TextEditingController();
  var landlineCtrlr = TextEditingController();
  var zipcodeCtrlr = TextEditingController();
  var passwordCtrlr = TextEditingController();
  var joingdateCtrlr = TextEditingController();

  bool openDobDatePicker = false;
  bool openDoJDatePicker = false;
  Rx<int> userId = 0.obs;
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
  RxList<BusinessListModel?> businessList = <BusinessListModel>[].obs;
  Rx<String> selectedIBusinessList = 'Select Company'.obs;
  Rx<bool> isBusinessListSelected = true.obs;
  int selectedBusinessTypeId = 0;
  RxList<DesignationModel?> responsList = <DesignationModel>[].obs;
  Rx<String> selectedres = 'Select Responsbility'.obs;
  Rx<bool> isSelectedres = true.obs;
  int selectedresId = 0;
  RxBool isDesignationSelected = true.obs;
  RxInt selectedDesignationId = 0.obs;
  RxString selectedDesignation = ''.obs;
  RxList<int> selectedresIdsList = <int>[].obs;
  RxList<DesignationModel> selectedResNameList = <DesignationModel>[].obs;
  Rx<String> selectedFacility = ''.obs;
  Rx<int> selectedFacilityId = 0.obs;
  Rx<String> address = ''.obs;
  RxBool isEmployee = false.obs;
  void toggleIsEmployee() {
    print("IsEmployee before toogle: $isEmployee");
    isEmployee.toggle();
    print("IsEmployee After toogle: $isEmployee");
  }

  var isEmployeeFacilityList = <IsEmployeeFacilityModel>[].obs;
  void updateFacilityList({
    required int id,
    required String name,
    required String address,
    required bool isEmployee,
  }) {
    isEmployeeFacilityList.add(
      IsEmployeeFacilityModel(
        id: id,
        name: name,
        address: address,
        isEmployee: isEmployee,
      ),
    );
  }

  ///
  void onInit() async {
    try {
      facilityIdStreamSubscription =
          homeController.facilityId$.listen((event) async {
        facilityId = event;
        if (facilityId > 0) {
          isFacilitySelected.value = true;
        }
      });
      await setUserId();
      Future.delayed(Duration(seconds: 1), () {
        getBloodList();
      });
      Future.delayed(Duration(seconds: 1), () {
        getCountryList();
      });
      Future.delayed(Duration(seconds: 1), () {
        getRoleList();
      });
      Future.delayed(Duration(seconds: 1), () {
        getFacilityList();
      });
      Future.delayed(Duration(seconds: 1), () {
        getBusinessList(0, facilityId);
      });
      Future.delayed(Duration(seconds: 1), () {
        getResponsibilityList(true);
      });
      Future.delayed(Duration(seconds: 1), () {
        getDesignationList(true);
      });
      if (userId.value != 0) {
        await getUserDetails();
      }
      super.onInit();
    } catch (e) {
      print(e);
    }
  }

  Future<void> setUserId() async {
    try {
      final _userId = await addUserPresenter.getValue();
      if (_userId == null || _userId == '' || _userId == "null") {
        var dataFromPreviousScreen = Get.arguments;

        userId.value = dataFromPreviousScreen['userId'];
        addUserPresenter.saveValue(userId: userId.value.toString());
      } else {
        userId.value = int.tryParse(_userId) ?? 0;
      }
    } catch (e) {
      print(e.toString() + 'userId');
      //  Utility.showDialog(e.toString() + 'userId');
    }
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

  Future<void> getResponsibilityList(bool isLoading) async {
    responsList.value = <DesignationModel>[];
    final _moduleList =
        await addUserPresenter.getResponsibilityList(isLoading: isLoading);

    if (_moduleList != null) {
      for (var _respList in _moduleList) {
        responsList.add(_respList);
      }
    }
  }

  Future<void> getDesignationList(bool isLoading) async {
    designationList?.value = <DesignationModel>[];
    final _designaiton =
        await addUserPresenter.getDesignationList(isLoading: isLoading);
    if (_designaiton != null) {
      designationList!.value = _designaiton;
    }
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

  Future<void> getBusinessList(ListType, int facilityId) async {
    final list = await addUserPresenter.getBusinessList(
      facilityId: facilityId,
      ListType: ListType,
      isLoading: true,
    );
    if (list!.length > 0) {
      for (var _businessList in list) {
        businessList.add(_businessList);
      }
    }
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

  Future<void> getUserDetails() async {
    final _userDetailModel = await addUserPresenter.getUserDetails(
        userId: userId.value, isLoading: true);
    // final _responsList =
    //     await addUserPresenter.getResponsibilityList(isLoading: true);

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
      selectedGender.value = userDetailModel.value?.gender_name ?? "";
      selectedIBusinessList.value = userDetailModel.value?.company_name ?? "";
      selectedBusinessTypeId = userDetailModel.value?.company_id ?? 0;
      plantListModel.value = _userDetailModel.plant_list ?? [];
      responsList.value = _userDetailModel.responsibility ?? [];
      selectedDesignation.value = _userDetailModel.designation_name ?? "";
      selectedDesignationId.value = userDetailModel.value?.designation_id ?? 0;
      isEmployeeFacilityList.value = _userDetailModel.plant_list!
          .map((e) => IsEmployeeFacilityModel(
                id: e.id ?? 0,
                name: e.name ?? "",
                address: e.location ?? "",
                isEmployee: e.isEmployees,
              ))
          .toList();
      selectedfacilityNameIdList.value =
          filteredfacilityNameList.map((e) => e!.id).toList();
      selectedresIdsList.value = responsList.map((obj) => obj!.id).toList();
      selectedResNameList.value = responsList
          .map((responsibility) => DesignationModel(
                id: responsibility?.id ?? 0,
                name: responsibility?.responsibility ?? "",
              ))
          .toList();
      await getUserAccessListById(userId: userId.value, isloading: true);
      await getUserNotificationListById(userId: userId.value, isloading: true);
    }
    // if (_responsList != null) {
    //   responsList.value = _responsList;
    //   selectedResNameList.value = responsList.value.name ?? "";
    // }
  }

  Future<void> getUserNotificationListById(
      {int? userId, bool? isloading}) async {
    final _notificationListModel = await addUserPresenter
        .getUserNotificationListById(userId: userId, isLoading: isloading);
    if (_notificationListModel != null) {
      notificationModel.value = _notificationListModel;
      notificationList.value = notificationModel.value?.notification_list ?? [];
    }
  }

  Future<void> getUserAccessListById({int? userId, bool? isloading}) async {
    final _accessListModel = await addUserPresenter.getUserAccessListById(
        userId: userId, isLoading: isloading);
    if (_accessListModel != null) {
      accessLevelModel.value = _accessListModel;
      accesslevel.value = accessLevelModel.value?.access_list ?? [];
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
    update(['_bloodList']);
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
    print(value);
    switch (list.runtimeType) {
      case const (RxList<CountryModel>):
        {
          if (value != "Please Select") {
            int countryIndex = countryList.indexWhere((x) => x?.name == value);
            selectedCountryId = countryList[countryIndex]?.id ?? 0;
            cityList.clear();
            stateList.clear();
            selectedCity.value = "Please Select";
            selectedCityId = 0;
            selectedState.value = "Please Select";
            selectedStateId = 0;
            isSelectedCountry.value = true;
            selectedCountry.value = value;

            getStateList(selectedCountryId);
          } else {
            selectedCountryId = 0;
          }
        }

        break;
      case const (RxList<StateModel>):
        {
          int stateIndex = stateList.indexWhere((x) => x?.name == value);
          selectedStateId = stateList[stateIndex]?.id ?? 0;
          cityList.clear();
          selectedCity.value = "Please Select";
          selectedCityId = 0;
          isSelectedState.value = true;
          getCityList(selectedStateId);
        }
        break;
      case const (RxList<DesignationModel?>):
        {
          int descIndex = designationList!.indexWhere((x) => x?.name == value);
          selectedDesignationId.value = designationList?[descIndex]?.id ?? 0;
          isDesignationSelected.value = true;
          selectedDesignation.value = value;
          print(
            "designation id: ${selectedDesignationId.value} \ndesignation: ${selectedDesignationId.value}",
          );
        }
        break;
      case const (RxList<CityModel>):
        {
          int cityIndex = cityList.indexWhere((x) => x?.name == value);
          selectedCityId = cityList[cityIndex]?.id ?? 0;
          isSelectedCity.value = true;
        }

        break;
      case const (RxList<GenderModel>):
        {
          int genderIndex = genderList.indexWhere((x) => x?.name == value);
          selectedGenderId = genderList[genderIndex]?.id ?? 0;
          isSelectedGender.value = true;
          selectedGender.value = value;
        }
        break;
      case const (RxList<BloodModel>):
        {
          int bloodIndex = bloodList.indexWhere((x) => x?.name == value);
          selectedBloodId = bloodList[bloodIndex]?.id ?? 0;
          isSelectedBlood.value = true;
          selectedBlood.value = value;
        }
        break;
      case const (RxList<RoleModel>):
        {
          int roleIndex = roleList.indexWhere((x) => x?.name == value);
          selectedRoleId = roleList[roleIndex]?.id ?? 0;
          isSelectedRole.value = true;
          selectedRole.value = value;
          getRoleAccessList(roleId: selectedRoleId, isloading: true);
          getRoleNotificationList(roleId: selectedRoleId, isloading: true);
        }
        break;
      case const (RxList<BusinessListModel>):
        {
          int equipmentIndex = businessList.indexWhere((x) => x?.name == value);
          selectedBusinessTypeId = businessList[equipmentIndex]?.id ?? 0;
          isBusinessListSelected.value = true;
        }
        break;
      case const (RxList<FacilityModel>):
        {
          for (var facility in facilityNameList) {
            print("facilities ${facility}");
          }
          int facilityIndex =
              facilityNameList.indexWhere((x) => x?.name == value);
          selectedFacility.value = facilityNameList[facilityIndex]?.name ?? '';
          address.value = facilityNameList[facilityIndex]?.address ?? '';
          selectedFacilityId.value = facilityNameList[facilityIndex]?.id ?? 0;
          isFacilitySelected.value = true;

          print({"selected facality11": selectedFacility});
          print("facility selected $selectedFacilityId, $selectedFacility");
        }
        break;
      default:
        {
          //statements;
        }
        break;
    }
  }

  void saveAccessLevel(int? resUserId) async {
    List<SaveAccessList> accesslist = <SaveAccessList>[];
    // userId == null
    //     ?
    accesslevel.forEach((e) {
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
    // : accessList.forEach((e) {
    //     accesslist.add(SaveAccessList(
    //         feature_id: e?.feature_id.value ?? 0,
    //         add: e?.add.value ?? 0,
    //         delete: e?.delete.value ?? 0,
    //         edit: e?.edit.value ?? 0,
    //         selfView: e?.selfView.value ?? 0,
    //         approve: e?.approve.value ?? 0,
    //         issue: e?.issue.value ?? 0,
    //         view: e?.view.value ?? 0));
    //   });
    SaveAccessLevelModel saveAccessLevelModel = SaveAccessLevelModel(
        user_id: userId.value == 0
            ? resUserId ?? 0
            : userId.value, // varUserAccessModel.value.user_id ?? 0,
        access_list: accesslist);
    var accessLevelJsonString = saveAccessLevelModel.toJson();
    print({"accessLevelJsonString", accessLevelJsonString});
    if (accesslist.isNotEmpty) {
      Map<String, dynamic>? responsePmMapCreated =
          await addUserPresenter.saveAccessLevel(
        accessLevelJsonString: accessLevelJsonString,
        isLoading: true,
      );
      // if (responsePmMapCreated != null) {
      //   saveNotification();
      // }
      // userId = 0;
      // Get.offNamed(
      //   Routes.userList,
      // );
    } else {
      Fluttertoast.showToast(
          msg: "Unable to update the access level", fontSize: 16.0);
    }
  }

  void saveNotification(int? resUserId, String? msg) async {
    List<SaveNotificationList> notificationlist = <SaveNotificationList>[];
    notificationList.forEach((e) {
      notificationlist.add(SaveNotificationList(
          notification_id: e?.notification_id.value ?? 0,
          user_flag: e?.default_flag.value ?? 0,
          can_change: e?.can_change.value ?? 0));
    });

    SaveUserNotificationModel saveUserNotificationModel =
        SaveUserNotificationModel(
            user_id: userId.value == 0
                ? resUserId ?? 0
                : userId.value, // varUserAccessModel.value.user_id ?? 0,
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
        // Utility.showDialog(msg, '');
        Get.dialog<void>(AddUserMessageApproveDialog(
            data: msg,
            id: userId.value == 0 ? resUserId ?? 0 : userId.value,
            position: userId.value == 0 ? 1 : 2));
      }
    } else {
      Fluttertoast.showToast(
          msg: "Unable to update the  notification", fontSize: 16.0);
    }
  }

  Future<void> addUser() async {
    checkForm();
    if (isFormInvalid.value) {
      return;
    }

    List<AddAccessList> add_accessList = <AddAccessList>[];
    List<UserResponbility> reslist = <UserResponbility>[];
    List<DesignationModel> newselectedResNameList = []; // Copied list

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
    for (int id in selectedresIdsList) {
      DesignationModel? selectedItem =
          responsList.firstWhere((item) => item?.id == id);
      newselectedResNameList.add(selectedItem!);
    }

    // Display the copied list

    newselectedResNameList.forEach((e) {
      reslist.add(
          UserResponbility(responsibility: e.name, since_when: "2023-11-27"));
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

    if (_joiningdate.isEmpty) {
      return Future.error("Date of Joining cannot be empty.");
    }

    Credentials credentials =
        Credentials(password: _password, user_name: _loginId);

    AddUserModel adduser = AddUserModel(
      id: 0,
      secondaryEmail: _secandoryId,
      first_name: _firstname,
      landline_number: _landline,
      last_name: _lastname,
      add_access_list: [], //add_accessList,
      gender_id: selectedGenderId,
      DOB: _dob,
      designationId: selectedDesignationId.value,
      company_id: selectedBusinessTypeId,
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
      // facilities: selectedfacilityNameIdList,
      facilities: isEmployeeFacilityList,
      user_responsibility_list: reslist,
      credentials: credentials,
    );
    var adduserJsonString = [adduser.toJson()];

    print({"adduserJsonString", adduserJsonString});
    Map<String, dynamic>? responseAddUser = await addUserPresenter.addUser(
      adduserJsonString: adduserJsonString,
      isLoading: true,
    );
    if (responseAddUser != null) {
      var resUserId = 0;
      var msg = '';
      if (responseAddUser["id"] != null && responseAddUser["id"].isNotEmpty) {
        resUserId = responseAddUser["id"][0];
        msg = responseAddUser['message'];
        saveAccessLevel(resUserId);
        saveNotification(resUserId, msg);
      }
    }
    // return true;
  }

  Future<void> updateUser() async {
    // checkForm();
    // if (isFormInvalid.value) {
    //   return true;
    // }
    List<UserResponbility> reslist = <UserResponbility>[];
    List<DesignationModel> newselectedResNameList = []; // Copied list

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
    for (int id in selectedresIdsList) {
      DesignationModel? selectedItem =
          responsList.firstWhereOrNull((item) => item?.id == id);
      if (selectedItem != null) {
        newselectedResNameList.add(selectedItem);
      } else {
        print('DesignationModel with ID $id not found.');
      }
    }

    // Display the copied list

    newselectedResNameList.forEach((e) {
      reslist.add(UserResponbility(
          responsibility: e.responsibility, since_when: "2023-11-27"));
    });
    Credentials credentials =
        Credentials(password: _password, user_name: _loginId);

    AddUserModel adduser = AddUserModel(
      id: userDetailModel.value?.id ?? 0,
      secondaryEmail: _secandoryId,
      first_name: _firstname,
      landline_number: _landline,
      last_name: _lastname,
      add_access_list: [], //add_accessList,
      gender_id: selectedGenderId,
      DOB: _dob,
      city_id: selectedCityId,
      contact_no: _mobileno,
      company_id: selectedBusinessTypeId,
      country_id: selectedCountryId,
      joiningDate: _joiningdate,
      blood_group_id: selectedBloodId,
      state_id: selectedStateId,
      photo_id: photoId,
      role_id: selectedRoleId,
      zipcode: int.parse(_zipcode),
      designationId: selectedDesignationId.value,
      // facilities: selectedfacilityNameIdList,
      facilities: isEmployeeFacilityList,
      isEmployee: 1,
      user_responsibility_list: reslist,
      credentials: credentials,
    );
    var adduserJsonString = adduser.toJson();

    print({"adduserJsonString", adduserJsonString});
    Map<String, dynamic>? responseAddUser = await addUserPresenter.updateUser(
      adduserJsonString: adduserJsonString,
      isLoading: true,
    );
    if (responseAddUser != null) {
      var resUserId = 0;
      var msg = '';
      if (responseAddUser["id"] != null && responseAddUser["id"].isNotEmpty) {
        resUserId = responseAddUser["id"][0];
        msg = responseAddUser['message'];
        saveAccessLevel(resUserId);
        saveNotification(resUserId, msg);
      }
    }
    // return true;
  }

  AddfacilityListAlertBox() {
    return StatefulBuilder(builder: (context, setState) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        insetPadding: Dimens.edgeInsets10_0_10_0,
        contentPadding: EdgeInsets.zero,
        title: Text(
          'Select facility Name',
          textAlign: TextAlign.center,
          // style: TextStyle(color: Colors.green),
        ),
        content: Builder(builder: (context) {
          var height = MediaQuery.of(context).size.height;
          var width = MediaQuery.of(context).size.width;

          return Obx(
            () => Container(
              padding: Dimens.edgeInsets05_0_5_0,
              height: 300, // double.infinity,
              width: 300,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Divider(
                      color: ColorValues.greyLightColour,
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3.5,
                      child: CustomMultiSelectDialogField(
                        buttonText: 'Add Facility',
                        title: 'Select Facility',
                        initialValue: selectedfacilityNameIdList.value,
                        items: facilityNameList
                            .map(
                              (facilityName) => MultiSelectItem(
                                facilityName?.id,
                                facilityName?.name ?? '',
                              ),
                            )
                            .toList(),
                        onConfirm: (selectedOptionsList) {
                          facilityNameSelected(selectedOptionsList);
                          selectedfacilityNameIdList.value =
                              selectedOptionsList.cast<int>().toList();
                          setState(() {});
                        },
                      ),
                    )
                  ]),
            ),
          );
        }),
        actions: [
          Center(
            child: Container(
                height: 45,
                child: CustomElevatedButton(
                  backgroundColor: ColorValues.navyBlueColor,
                  text: "Ok",
                  onPressed: () {
                    Get.back();
                  },
                )),
          ),
        ],
      );
    });
  }

  Widget rowItem(int? defaultValue, {required Function(bool) onCheck}) {
    return Checkbox(
        value: defaultValue == 1 ? true : false,
        checkColor: Colors.white,
        activeColor: ColorValues.blackColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2.0),
        ),
        side: MaterialStateBorderSide.resolveWith(
          (states) => BorderSide(
            width: 1.0,
            color: ColorValues.blackColor,
          ),
        ),
        onChanged: (val) {
          isChecked.value = val!;
          onCheck(val);
        });
  }

  void checkForm() {
    if (loginIdCtrlr.text.trim().length < 3) {
      isLoginIDInvalid.value = true;
      isFormInvalid.value = true;
    }
    if (firstNameCtrlr.text.trim().length < 3) {
      isFirstNameInvalid.value = true;
      isFormInvalid.value = true;
    }
    if (secandoryIdCtrlr.text.trim().length < 3) {
      isSecondaryEmailInvalid.value = true;
      isFormInvalid.value = true;
    }
    if (selectedGenderId == 0) {
      isSelectedGender.value = false;
      isFormInvalid.value = true;
    }
    if (mobileNoCtrlr.text.trim().length < 3) {
      isMobileNumberInvalid.value = true;
      isFormInvalid.value = true;
    }
    if (selectedCountryId == 0) {
      isSelectedCountry.value = false;
      isFormInvalid.value = true;
    }
    if (selectedCityId == 0) {
      isSelectedCity.value = false;
      isFormInvalid.value = true;
    }
    if (selectedRoleId == 0) {
      isSelectedRole.value = false;
      isFormInvalid.value = true;
    }
    if (selectedBusinessTypeId == 0) {
      isBusinessListSelected.value = false;
      isFormInvalid.value = true;
    }
    if (passwordCtrlr.text.trim().length < 3) {
      isPasswordInvalid.value = true;
      isFormInvalid.value = true;
    }
    if (lastNameCtrlr.text.trim().length < 3) {
      isLastNameInvalid.value = true;
      isFormInvalid.value = true;
    }
    if (dobCtrlr.text.trim().length < 3) {
      isdobInvalid.value = true;
      isFormInvalid.value = true;
    }
    if (joingdateCtrlr.text.trim().length < 3) {
      isDateofJoiningInvalid.value = true;
      isFormInvalid.value = true;
    }
    // if (landlineCtrlr.text.trim().length < 3) {
    //   isLandlineInvalid.value = true;
    //   isFormInvalid.value = true;
    // }
    if (selectedStateId == 0) {
      isSelectedState.value = false;
      isFormInvalid.value = true;
    }
    if (zipcodeCtrlr.text.trim().length < 3) {
      isZipCodeInvalid.value = true;
      isFormInvalid.value = true;
    }
    if (selectedBloodId == 0) {
      isSelectedBlood.value = false;
      isFormInvalid.value = true;
    }
    if (selectedDesignationId == 0) {
      isDesignationSelected.value = false;
      isFormInvalid.value = true;
    }
    //            if (selectedFacility.value =="" ) {
    //     isFacilitySelected.value = false;
    //        isFormInvalid.value = true;

    // }
  }
}
