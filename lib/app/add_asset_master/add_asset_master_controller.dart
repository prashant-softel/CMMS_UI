import 'package:cmms/domain/models/facility_model.dart';
import 'package:flutter/services.dart';

import 'package:cmms/domain/models/access_level_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

import '../../domain/models/acdclistmodel.dart';
import '../../domain/models/asset_category_model.dart';
import '../../domain/models/asset_type_list_sm_model.dart';
import '../../domain/models/create_asset_sm_model.dart';
import '../../domain/models/pm_task_view_list_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../domain/models/unit_measurement_model.dart';
import '../../domain/models/user_detail_model.dart';
import '../controllers/file_upload_controller.dart';
import 'add_asset_master_presenter.dart';

class AddAssetMasterController extends GetxController {
  AddAssetMasterController(
      this.addAssetPresenter,
      );

  AddAssetMasterPresenter addAssetPresenter;
  var assesDiscriptionCtrlr = TextEditingController();
  // String _assesDiscriptionCtrlr = assesDiscriptionCtrlr.text.trim();
  RxList<UnitMeasurementModel?> unitMeasurementList = <UnitMeasurementModel>[].obs;
  RxList<AssetTypeListSMModel?> materialList = <AssetTypeListSMModel>[].obs;
  RxList<AssetCategoryModel?> materialCategoryList = <AssetCategoryModel>[].obs;

  // RxList<CountryModel?> countryList = <CountryModel>[].obs;
  RxList<ACDCModel?> acdclist = <ACDCModel>[
    ACDCModel(id: 1, name: "AC"),
    ACDCModel(id: 2, name: "DC"),
  ].obs;
  Rx<String> selectedMaterialType = ''.obs;
  Rx<bool> isSelectedMaterialType = true.obs;
  int selectedMaterialTypeId = 0;
  // RxList<StateModel?> stateList = <StateModel>[].obs;
  Rx<String> selectedUnitOfMeasurement = ''.obs;
  Rx<bool> isSelectedUnitOfMeasurement = true.obs;
  int selectedUnitOfMeasurementId = 0;
  // RxList<CountryModel?> countryList = <CountryModel>[].obs;
  Rx<String> selectedMinRequiredQty = ''.obs;
  Rx<bool> isSelectedMinRequiredQty = true.obs;
  int selectedMinRequiredQtyId = 0;
  // RxList<StateModel?> stateList = <StateModel>[].obs;
  Rx<String> selectedMaterialCategory = ''.obs;
  Rx<bool> isSelectedMaterialCategory = true.obs;
  int selectedMaterialCategoryId = 0;
  // RxList<CountryModel?> countryList = <CountryModel>[].obs;
  Rx<String> selectedACDC = ''.obs;
  Rx<bool> isSelectedACDC = true.obs;
  int selectedACDCId = 0;
  // RxList<StateModel?> stateList = <StateModel>[].obs;
  Rx<String> selectedMinReorderQty = ''.obs;
  Rx<bool> isSelectedMinReorderQty = true.obs;
  int selectedMinReorderQtyId = 0;
  Rx<String> selectedDocumentType = ''.obs;
  Rx<bool> isSelectedDocumentType = true.obs;
  int selectedDocumentTypeId = 0;
  // Rx<String> selectedCountry = ''.obs;
  // Rx<bool> isSelectedCountry = true.obs;
  // int selectedCountryId = 0;
  // RxList<StateModel?> stateList = <StateModel>[].obs;
  // Rx<String> selectedState = 'Select State'.obs;
  // Rx<bool> isSelectedState = true.obs;
  // int selectedStateId = 0;
  // RxList<CityModel?> cityList = <CityModel>[].obs;
  // Rx<String> selectedCity = 'Select City'.obs;
  // Rx<bool> isSelectedCity = true.obs;
  // int selectedCityId = 0;
  // RxList<BloodModel?> bloodList = <BloodModel>[].obs;
  // Rx<String> selectedBlood = 'Select Blood'.obs;
  // Rx<bool> isSelectedBlood = true.obs;
  // int selectedBloodId = 0;
  // RxList<RoleModel?> roleList = <RoleModel>[].obs;
  // Rx<String> selectedRole = 'Select Role'.obs;
  // Rx<bool> isSelectedRole = true.obs;
  // int selectedRoleId = 0;
  // Rx<AccessLevelModel?> accessLevelModel = AccessLevelModel().obs;
  // RxList<AccessLevel?> accesslevel = <AccessLevel>[].obs;
  //
  // Rx<GetAccessLevelByIdModel?> accessListModel = GetAccessLevelByIdModel().obs;
  // RxList<GetAccessLevel?> accessList = <GetAccessLevel>[].obs;
  //
  // Rx<GetNotificationModel?> notificationModel = GetNotificationModel().obs;
  // RxList<NotificationList?> notificationList = <NotificationList>[].obs;
  // Rx<GetNotificationByUserIdModel?> notificationByUserIdModel =
  //     GetNotificationByUserIdModel().obs;
  // RxList<NotificationListByUserId?> notificationListByUserId =
  //     <NotificationListByUserId>[].obs;
  PaginationController schedulePaginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  RxString fileName = "".obs;
  RxString filePath = "".obs;
  RxString fileType   = "".obs;
  Uint8List? fileBytes;
  RxList<ScheduleCheckPoint?>? scheduleCheckPoints =
      <ScheduleCheckPoint?>[].obs;
  RxList<String> moduleNameList = <String>[].obs;
  var selectedImageBytes = Rx<Uint8List>(Uint8List(0));
  final RxBool isChecked = false.obs;
  final RxBool isCheckedmodule = false.obs;
  var gender = 'Select Gender'.obs;
  RxBool isTouchable = true.obs;
  AccessLevel? selectedItem;
  Rx<UserDetailsModel?> userDetailModel = UserDetailsModel().obs;
  RxList<PlantList?> plantListModel = <PlantList?>[].obs;
  var matNameCtrlr = TextEditingController();
  var reqQty = TextEditingController();
  var descCtrlr = TextEditingController();
  var reorderQty = TextEditingController();
  var firstNameCtrlr = TextEditingController();
  bool visible = true;
  var mobileNoCtrlr = TextEditingController();
  var mdmcodeCtrlr = TextEditingController();
  var lastNameCtrlr = TextEditingController();
  var dobCtrlr = TextEditingController();
  var landlineCtrlr = TextEditingController();
  var zipcodeCtrlr = TextEditingController();
  var passwordCtrlr = TextEditingController();
  var joingdateCtrlr = TextEditingController();
  int userId = 0;
  double thumbnailSize = Get.height * 0.20;
  RxList<String?> selectedfacilityDataList = <String>[].obs;
  RxList<int?> selectedfacilityIdList = <int>[].obs;
  RxList<FacilityModel?> selectedFacilityNameList = <FacilityModel>[].obs;
  RxList<int> selectedfacilityNameIdList = <int>[].obs;
  RxList<FacilityModel?> facilityNameList = <FacilityModel>[].obs;
  RxList<FacilityModel?> filteredfacilityNameList = <FacilityModel>[].obs;
  Map<dynamic, dynamic> facility_map = {};
  final isSuccess = false.obs;
  Rx<bool> isNameInvalid = false.obs;
  Rx<bool> isCodeInvalid = false.obs;
  Rx<bool> isRequiredInvalid = false.obs;
  Rx<bool> isReorderInvalid = false.obs;
  Rx<bool> isDescriptionInvalid = false.obs;
  Rx<bool> isFormInvalid = false.obs;
  PaginationController facilityNamepaginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );

  ///
  void onInit()  {
    // userId = Get.arguments;
    getUnitMeasurementList();
    getAssetCategoryList();


    getAssetType();
    Get.put(FileUploadController());


    // await getRoleList();
    // await getFacilityList();
    // if (userId != null) {
    //   await getUserDetails(userId: userId, isloading: true);
    // }
    super.onInit();
  }


  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;
  RxString imageName = "".obs;
  var photoId;
  Future<void> getFacilityList() async {
    facilityNameList.value = <FacilityModel>[];
    final _facilityNameList = await addAssetPresenter.getFacilityList(
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
  Future<void> getAssetType() async {

    final list = await addAssetPresenter.getAssetType();

    if (list != null) {
      for (var _materialList in list) {
        materialList.add(_materialList);
      }
    }

  }
  Future<void> getUnitMeasurementList() async {

    final list = await addAssetPresenter.getUnitMeasurementList();

    if (list != null) {
      for (var _unitList in list) {
        unitMeasurementList.add(_unitList);
      }
    }
  }
  // void facilityNameSelected(_selectedfacilityNameIds) {
  //   selectedfacilityNameIdList.value = <int>[];
  //   filteredfacilityNameList.value = <FacilityModel>[];
  //   late int emp_id = 0;
  //   for (var _selectedfacilityNameId in _selectedfacilityNameIds) {
  //     selectedfacilityNameIdList.add(_selectedfacilityNameId);
  //     FacilityModel? e = facilityNameList.firstWhere((element) {
  //       return element?.id == _selectedfacilityNameId;
  //     });
  //     filteredfacilityNameList.add(e);
  //   }
  //
  //   facility_map[emp_id] = selectedfacilityNameIdList;
  // }
  //
  // getImage(ImageSource imageSource) async {
  //   final pickedFile = await ImagePicker().pickImage(source: imageSource);
  //   if (pickedFile != null) {
  //     selectedImagePath.value = pickedFile.path;
  //     imageName.value = pickedFile.name;
  //     selectedImageBytes.value = await pickedFile.readAsBytes();
  //
  //     uploadImge(
  //       fileBytes: selectedImageBytes.value,
  //     );
  //   }
  // }
  //
  // Future<void> uploadImge({Uint8List? fileBytes}) async {
  //   AddUserModel? addUserModel =
  //   await addAssetPresenter.uploadImge(fileBytes, imageName.value, true);
  //   photoId = addUserModel?.photo_id;
  //   print({"photooo", photoId});
  //   // return true;
  // }
  //
  // Future<void> getUserDetails({int? userId, bool? isloading}) async {
  //   final _userDetailModel = await addAssetPresenter.getUserDetails(
  //       userId: userId, isLoading: isloading);
  //
  //   if (_userDetailModel != null) {
  //     userDetailModel.value = _userDetailModel;
  //     landlineCtrlr.text = userDetailModel.value?.landline_number ?? "";
  //     mobileNoCtrlr.text = userDetailModel.value?.contact_no ?? "";
  //     loginIdCtrlr.text = userDetailModel.value?.user_name ?? "";
  //     secandoryIdCtrlr.text = userDetailModel.value?.secondaryEmail ?? "";
  //     firstNameCtrlr.text = userDetailModel.value?.first_name ?? "";
  //     lastNameCtrlr.text = userDetailModel.value?.last_name ?? "";
  //     zipcodeCtrlr.text = userDetailModel.value?.zipcode.toString() ?? "";
  //     dobCtrlr.text = userDetailModel.value?.dob ?? "";
  //     joingdateCtrlr.text = userDetailModel.value?.joiningDate ?? "";
  //     selectedCity.value = userDetailModel.value?.city_name ?? "";
  //     selectedCityId = userDetailModel.value?.city_id ?? 0;
  //     selectedState.value = userDetailModel.value?.state_name ?? "";
  //     selectedStateId = userDetailModel.value?.state_id ?? 0;
  //     selectedCountry.value = userDetailModel.value?.country_name ?? "";
  //     selectedCountryId = userDetailModel.value?.country_id ?? 0;
  //     selectedBlood.value = userDetailModel.value?.blood_group_name ?? "";
  //     selectedBloodId = userDetailModel.value?.blood_group_id ?? 0;
  //     selectedRole.value = userDetailModel.value?.role_name ?? "";
  //     selectedRoleId = userDetailModel.value?.role_id ?? 0;
  //     photoId = userDetailModel.value?.photoId ?? 0;
  //     gender.value = userDetailModel.value?.gender_name ?? "";
  //     plantListModel.value = _userDetailModel.plant_list ?? [];
  //
  //     await getUserAccessListById(userId: userId, isloading: true);
  //     await getUserNotificationListById(userId: userId, isloading: true);
  //   }
  // }
  //
  // Future<void> getUserNotificationListById(
  //     {int? userId, bool? isloading}) async {
  //   final _notificationListModel = await addAssetPresenter
  //       .getUserNotificationListById(userId: userId, isLoading: isloading);
  //   if (_notificationListModel != null) {
  //     notificationByUserIdModel.value = _notificationListModel;
  //     notificationListByUserId.value =
  //         notificationByUserIdModel.value?.notification_list ?? [];
  //   }
  // }
  //
  // Future<void> getUserAccessListById({int? userId, bool? isloading}) async {
  //   final _accessListModel = await addAssetPresenter.getUserAccessListById(
  //       userId: userId, isLoading: isloading);
  //   if (_accessListModel != null) {
  //     accessListModel.value = _accessListModel;
  //     accessList.value = accessListModel.value?.access_list ?? [];
  //   }
  // }
  //
  // void updateGender(String value) {
  //   gender.value = value;
  // }

  // Future<void> getRoleList() async {
  //   final list = await addAssetPresenter.getRoleList();
  //
  //   if (list != null) {
  //     for (var _roleList in list) {
  //       roleList.add(_roleList);
  //     }
  //   }
  // }

  // Future<void> getCountryList() async {
  //   final list = await addAssetPresenter.getCountryList();
  //
  //   if (list != null) {
  //     for (var _countryList in list) {
  //       countryList.add(_countryList);
  //     }
  //   }
  // }


  Future<void> getAssetCategoryList() async {
    final list = await addAssetPresenter.getAssetCategoryList();

    if (list != null) {
      for (var _materialcatList in list) {
        materialCategoryList.add(_materialcatList);
      }
    }
  }

  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {
      case RxList<UnitMeasurementModel>:
        {
          int Index = unitMeasurementList.indexWhere((x) => x?.name == value);
          selectedUnitOfMeasurementId = unitMeasurementList[Index]?.id ?? 0;
          selectedUnitOfMeasurement.value = value;
        }
        break;
      case RxList<AssetCategoryModel>:
        {
          int Index = materialCategoryList.indexWhere((x) => x?.name == value);
          selectedMaterialCategoryId = unitMeasurementList[Index]?.id ?? 0;
          selectedMaterialCategory.value = value;
        }
        break;
      case RxList<ACDCModel>:
        {
          int Index = acdclist.indexWhere((x) => x?.name == value);
          selectedACDCId = unitMeasurementList[Index]?.id ?? 0;
          selectedACDC.value = value;
        }
        break;
      case RxList<AssetTypeListSMModel>:
        {
          int Index = materialList.indexWhere((x) => x?.name == value);
          selectedMaterialTypeId = unitMeasurementList[Index]?.id ?? 0;
          selectedMaterialType.value = value;
        }
        break;
      case RxList<ACDCModel>:
        {
          int Index = acdclist.indexWhere((x) => x?.name == value);
          selectedACDCId = acdclist[Index]?.id ?? 0;
          selectedACDC.value = value;
        }
        break;
      default:
        {
          //statements;
        }
        break;
    }
  }

// void saveAccessLevel() async {
//   List<SaveAccessList> accesslist = <SaveAccessList>[];
//   userId == null
//       ? accesslevel.forEach((e) {
//           accesslist.add(SaveAccessList(
//               feature_id: e?.feature_id.value ?? 0,
//               add: e?.add.value ?? 0,
//               delete: e?.delete.value ?? 0,
//               edit: e?.edit.value ?? 0,
//               selfView: e?.selfView.value ?? 0,
//               approve: e?.approve.value ?? 0,
//               issue: e?.issue.value ?? 0,
//               view: e?.view.value ?? 0));
//         })
//       : accessList.forEach((e) {
//           accesslist.add(SaveAccessList(
//               feature_id: e?.feature_id.value ?? 0,
//               add: e?.add.value ?? 0,
//               delete: e?.delete.value ?? 0,
//               edit: e?.edit.value ?? 0,
//               selfView: e?.selfView.value ?? 0,
//               approve: e?.approve.value ?? 0,
//               issue: e?.issue.value ?? 0,
//               view: e?.view.value ?? 0));
//         });
//   SaveAccessLevelModel saveAccessLevelModel = SaveAccessLevelModel(
//       user_id: userId, // varUserAccessModel.value.user_id ?? 0,
//       access_list: accesslist);
//   var accessLevelJsonString = saveAccessLevelModel.toJson();
//   print({"accessLevelJsonString", accessLevelJsonString});
//   if (accessList.isNotEmpty) {
//     Map<String, dynamic>? responsePmMapCreated =
//         await addAssetPresenter.saveAccessLevel(
//       accessLevelJsonString: accessLevelJsonString,
//       isLoading: true,
//     );
//     if (responsePmMapCreated != null) {
//       saveNotification();
//       // userId = 0;
//       // Get.offNamed(
//       //   Routes.userList,
//       // );
//     }
//   } else {
//     Fluttertoast.showToast(
//         msg: "Unable to update the access level", fontSize: 16.0);
//   }
// }
//
// void saveNotification() async {
//   List<SaveNotificationList> notificationlist = <SaveNotificationList>[];
//   userId == null
//       ? notificationList.forEach((e) {
//           notificationlist.add(SaveNotificationList(
//               notification_id: e?.notification_id.value ?? 0,
//               user_flag: e?.user_flag.value ?? 0));
//         })
//       : notificationListByUserId.forEach((e) {
//           notificationlist.add(SaveNotificationList(
//               notification_id: e?.notification_id.value ?? 0,
//               user_flag: e?.user_flag.value ?? 0));
//         });
//   SaveUserNotificationModel saveUserNotificationModel =
//       SaveUserNotificationModel(
//           user_id: userId, // varUserAccessModel.value.user_id ?? 0,
//           notification_list: notificationlist);
//   var saveNotificationJsonString = saveUserNotificationModel.toJson();
//   print({"saveNotificationJsonString", saveNotificationJsonString});
//   if (notificationlist.isNotEmpty) {
//     Map<String, dynamic>? responseSaveNotification =
//         await addAssetPresenter.saveNotification(
//       saveNotificationJsonString: saveNotificationJsonString,
//       isLoading: true,
//     );
//     if (responseSaveNotification != null) {
//       userId = 0;
//       Get.offNamed(
//         Routes.userList,
//       );
//     }
//   } else {
//     Fluttertoast.showToast(
//         msg: "Unable to update the  notification", fontSize: 16.0);
//   }
// }
//
  Future<bool> addAsset() async {

    if (matNameCtrlr.text.trim() == '' ) {
      isNameInvalid.value = true;
      isFormInvalid.value = true;
    }

    if (mdmcodeCtrlr.text.trim() == '' ) {
      isCodeInvalid.value = true;
      isFormInvalid.value = true;
    }

    if (reqQty.text.trim() == '' ) {
      isRequiredInvalid.value = true;
      isFormInvalid.value = true;
    }

    if (reorderQty.text.trim() == '' ) {
      isReorderInvalid.value = true;
      isFormInvalid.value = true;
    }

    if (descCtrlr.text.trim() == '' ) {
      isDescriptionInvalid.value = true;
      isFormInvalid.value = true;
    }



    checkForm();
    if (isFormInvalid.value) {
      return false;
    }

    if (matNameCtrlr.text.trim() == '' ||
        mdmcodeCtrlr.text.trim() == ''  ||
        reorderQty.text.trim() == '' ||
        reqQty.text.trim() == '' ||
        descCtrlr.text.trim() == ''

    ) {
      Fluttertoast.showToast(
          msg: "Please enter required field", fontSize: 16.0);
    } else {
      String _name = matNameCtrlr.text.trim();
      String _mdmcode = mdmcodeCtrlr.text.trim();
      String _reorderQty = reorderQty.text.trim();
      String _reqQty = reqQty.text.trim();
      String _desc = descCtrlr.text.trim();

      CreateAssetSMModel createAssetSMModel = CreateAssetSMModel
        (
          asset_code : _mdmcode,
          asset_name : _name,
          asset_description : _desc,
          asset_type_ID : selectedMaterialTypeId, 

          item_category_ID: selectedMaterialCategoryId,
          unit_measurement_ID: selectedUnitOfMeasurementId,
          min_req_qty: int.parse(_reqQty),
          reorder_qty: int.parse(_reorderQty),
          approval_required_ID: 1,

          // fileData:
          fileData : {
                "File_path"  : filePath.value,
                "File_name": fileName.value,
                "File_type": fileType.value,
                "File_size": fileBytes.toString(),
            }
      );
      //function to write sum of 2 numbers

      var assetListJsonString =
      createAssetSMModel.toJson(); //createCheckListToJson([createChecklist]);

      print({"checklistJsonString", assetListJsonString});
      await addAssetPresenter.createAssetSM(
        assetListJsonString: assetListJsonString,
        isLoading: true,
      );
      return true;
    }
    return true;
  }

  Future<void> issuccessCreateAssetlist() async {
    isSuccess.toggle();

    // isToggleOn.value = false;
    await {cleardata()};
  }

  void checkForm() {

    if(selectedMaterialType.value == ''){
      isSelectedMaterialType.value = false;
    }
    if(selectedMaterialCategory.value == ''){
      isSelectedMaterialCategory.value = false;
    }
    if(selectedUnitOfMeasurement.value == ''){
      isSelectedUnitOfMeasurement.value = false;
    }
    if(selectedACDC.value == ''){
      isSelectedACDC.value = false;
    }

    if(isNameInvalid.value == true || isSelectedMaterialType.value == false ||
        isSelectedMaterialCategory.value == false || isSelectedUnitOfMeasurement.value == false ||
        isSelectedACDC.value == false ||
        isReorderInvalid.value == true || isRequiredInvalid.value == true || isDescriptionInvalid.value == true || isCodeInvalid.value == true
    ){
      isFormInvalid.value = true;
    } else {
      isFormInvalid.value = false;
    }
  }


  cleardata() {
    matNameCtrlr.text = '';
    mdmcodeCtrlr.text = '';
    descCtrlr.text = '';
    reorderQty.text = '';
    reqQty.text = '';
    // selectedBusinessType.value = '';
    selectedUnitOfMeasurement.value = '';
    selectedMaterialCategory.value = '';
    selectedMaterialType.value = '';
    selectedACDC.value = '';
    selectedItem = null;
    visible = false;
    // Future.delayed(Duration(seconds: 1), () {
    //   getBusinessList(selectedBusinessTypeId, true);
    // });
    Future.delayed(Duration(seconds: 5), () {
      isSuccess.value = false;
    });
  }
// Future<bool> addUser() async {
//   List<AddAccessList> add_accessList = <AddAccessList>[];
//   accesslevel.forEach((e) {
//     add_accessList.add(AddAccessList(
//         feature_id: e?.feature_id.value ?? 0,
//         add: e?.add.value ?? 0,
//         delete: e?.delete.value ?? 0,
//         edit: e?.edit.value ?? 0,
//         selfView: e?.selfView.value ?? 0,
//         approve: e?.approve.value ?? 0,
//         issue: e?.issue.value ?? 0,
//         view: e?.view.value ?? 0));
//   });
//   String _loginId = loginIdCtrlr.text.trim();
//   String _firstname = firstNameCtrlr.text.trim();
//   String _mobileno = mobileNoCtrlr.text.trim();
//   String _secandoryId = secandoryIdCtrlr.text.trim();
//   String _lastname = lastNameCtrlr.text.trim();
//   String _dob = dobCtrlr.text.trim();
//   String _landline = landlineCtrlr.text.trim();
//   String _zipcode = zipcodeCtrlr.text.trim();
//   String _password = passwordCtrlr.text.trim();
//   String _joiningdate = joingdateCtrlr.text.trim();
//   Credentials credentials =
//       Credentials(password: _password, user_name: _loginId);
//
//   AddUserModel adduser = AddUserModel(
//       id: 0,
//       secondaryEmail: _secandoryId,
//       first_name: _firstname,
//       landline_number: _landline,
//       last_name: _lastname,
//       add_access_list: [], //add_accessList,
//       gender_id: gender.value == "Male"
//           ? 1
//           : gender.value == "FeMale"
//               ? 2
//               : 3,
//       DOB: _dob,
//       city_id: selectedCityId,
//       contact_no: _mobileno,
//       country_id: selectedCountryId,
//       joiningDate: _joiningdate,
//       blood_group_id: selectedBloodId,
//       state_id: selectedStateId,
//       photo_id: photoId,
//       role_id: selectedRoleId,
//       zipcode: int.parse(_zipcode),
//       isEmployee: 1,
//       facilities: selectedfacilityNameIdList,
//       credentials: credentials);
//   var adduserJsonString = [adduser.toJson()];
//
//   print({"adduserJsonString", adduserJsonString});
//   await addAssetPresenter.addUser(
//     adduserJsonString: adduserJsonString,
//     isLoading: true,
//   );
//   return true;
// }
//
// Future<bool> updateUser() async {
//   String _loginId = loginIdCtrlr.text.trim();
//   String _firstname = firstNameCtrlr.text.trim();
//   String _mobileno = mobileNoCtrlr.text.trim();
//   String _secandoryId = secandoryIdCtrlr.text.trim();
//   String _lastname = lastNameCtrlr.text.trim();
//   String _dob = dobCtrlr.text.trim();
//   String _landline = landlineCtrlr.text.trim();
//   String _zipcode = zipcodeCtrlr.text.trim();
//   String _password = passwordCtrlr.text.trim();
//   String _joiningdate = joingdateCtrlr.text.trim();
//
//   Credentials credentials =
//       Credentials(password: _password, user_name: _loginId);
//
//   AddUserModel adduser = AddUserModel(
//       id: userDetailModel.value?.id ?? 0,
//       secondaryEmail: _secandoryId,
//       first_name: _firstname,
//       landline_number: _landline,
//       last_name: _lastname,
//       add_access_list: [], //add_accessList,
//       gender_id: gender.value == "Male"
//           ? 1
//           : gender.value == "FeMale"
//               ? 2
//               : 3,
//       DOB: _dob,
//       city_id: selectedCityId,
//       contact_no: _mobileno,
//       country_id: selectedCountryId,
//       joiningDate: _joiningdate,
//       blood_group_id: selectedBloodId,
//       state_id: selectedStateId,
//       photo_id: photoId,
//       role_id: selectedRoleId,
//       zipcode: int.parse(_zipcode),
//       facilities: selectedfacilityNameIdList,
//       isEmployee: 1,
//       credentials: credentials);
//   var adduserJsonString = adduser.toJson();
//
//   print({"adduserJsonString", adduserJsonString});
//   await addAssetPresenter.updateUser(
//     adduserJsonString: adduserJsonString,
//     isLoading: true,
//   );
//   return true;
// }
// Future<void> getBloodList() async {
//   final list = await addAssetPresenter.getBloodList();
//
//   if (list != null) {
//     for (var _bloodList in list) {
//       bloodList.add(_bloodList);
//     }
//   }
// }
//
// Future<void> getStateList(int selectedCountryId) async {
//   final list = await addAssetPresenter.getStateList(
//       selectedCountryId: selectedCountryId);
//
//   if (list != null) {
//     for (var _stateList in list) {
//       stateList.add(_stateList);
//     }
//   }
// }
//
// Future<void> getCityList(int selectedStateId) async {
//   final list =
//   await addAssetPresenter.getCityList(selectedStateId: selectedStateId);
//
//   if (list != null) {
//     for (var _cityList in list) {
//       cityList.add(_cityList);
//     }
//   }
// }
//
// Future<void> getRoleAccessList({int? roleId, bool? isloading}) async {
//   final _accessLevelModel = await addAssetPresenter.getRoleAccessList(
//       roleId: roleId, isLoading: isloading);
//   Set<String> moduleNameSet = {};
//
//   if (_accessLevelModel != null) {
//     accessLevelModel.value = _accessLevelModel;
//     accesslevel.value = accessLevelModel.value?.access_list ?? [];
//     // for (var _accesslevel in accesslevel) {
//     //   if (_accesslevel?.feature_name != null) {
//     //     moduleNameSet.add(_accesslevel?.feature_name.value ?? "");
//     //   }
//     // }
//     // moduleNameList.addAll(moduleNameSet.toList());
//   }
// }
//
// Future<void> getRoleNotificationList({int? roleId, bool? isloading}) async {
//   final _notificationModel = await addAssetPresenter.getRoleNotificationList(
//       roleId: roleId, isLoading: isloading);
//   print({"ddddd", _notificationModel});
//   if (_notificationModel != null) {
//     notificationModel.value = _notificationModel;
//     notificationList.value = notificationModel.value?.notification_list ?? [];
//     // for (var _accesslevel in accesslevel) {
//     //   if (_accesslevel?.feature_name != null) {
//     //     moduleNameSet.add(_accesslevel?.feature_name.value ?? "");
//     //   }
//     // }
//     // moduleNameList.addAll(moduleNameSet.toList());
//   }
// }

}
