import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:cmms/app/utils/utils.dart';
import 'package:cmms/app/utils/utility.dart';
import 'package:cmms/app/widgets/create_permit_dialog.dart';
import 'package:cmms/data/data.dart';
import 'package:cmms/device/device.dart';
import 'package:cmms/domain/models/business_list_model.dart';
import 'package:cmms/domain/models/calibration_list_model.dart';
import 'package:cmms/domain/models/checkpoint_list_model.dart';
import 'package:cmms/domain/models/employee_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/models/models.dart';
import 'package:cmms/domain/models/new_permit_list_model.dart';
import 'package:cmms/domain/models/preventive_checklist_model.dart';
import 'package:cmms/domain/models/tools_model.dart';
import 'package:cmms/domain/models/type_permit_model.dart';
import 'package:cmms/domain/models/warranty_claim_model.dart';
import 'package:cmms/domain/models/work_type_model.dart';
import 'package:cmms/domain/repositories/repositories.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:get/get.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';

import '../../app/navigators/app_pages.dart';
import '../models/frequency_model.dart';
import '../models/job_card_details_model.dart';
import '../models/permit_details_model.dart';
import '../models/pm_mapping_list_model.dart';
import '../models/state.dart';
import '../models/user_access_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// The main repository which will get the data from [DeviceRepository] or the
/// [DataRepository].
class Repository {
  /// [_deviceRepository] : the local repository.
  /// [_dataRepository] : the data repository like api and all.
  Repository(
    this._deviceRepository,
    this._dataRepository,
  );

  final DeviceRepository _deviceRepository;
  final DataRepository _dataRepository;

  ///
  var tokenFetchCount = 0;
  var tokenSaveCount = 0;

  /// Clear data from local storage for [key].
  void clearData(dynamic key) {
    try {
      _deviceRepository.clearData(
        key,
      );
    } catch (_) {
      _dataRepository.clearData(
        key,
      );
    }
  }

  /// Get the string value for the [key].
  ///
  /// [key] : The key whose value is needed.
  String getStringValue(String key) {
    try {
      return _deviceRepository.getStringValue(
        key,
      );
    } catch (_) {
      return _dataRepository.getStringValue(
        key,
      );
    }
  }

  /// Save the value to the string.
  ///
  /// [key] : The key to which [value] will be saved.
  /// [value] : The value which needs to be saved.
  void saveValue(dynamic key, dynamic value) {
    try {
      _deviceRepository.saveValue(
        key,
        value,
      );
    } catch (_) {
      _dataRepository.saveValue(
        key,
        value,
      );
    }
  }

  /// Get the bool value for the [key].
  ///
  /// [key] : The key whose value is needed.
  bool getBoolValue(String key) {
    try {
      return _deviceRepository.getBoolValue(
        key,
      );
    } catch (_) {
      return _dataRepository.getBoolValue(
        key,
      );
    }
  }

  /// Get the stored value for the [key].
  ///
  /// [key] : The key whose value is needed.
  bool getStoredValue(String key) {
    try {
      return _deviceRepository.getBoolValue(
        key,
      );
    } catch (_) {
      return _dataRepository.getBoolValue(
        key,
      );
    }
  }

  /// Get the secure value for the [key].
  /// [key] : The key whose value is needed.
  Future<String> getSecuredValue(String key) async {
    var _value = '';

    if (key == "auth-token") {
      tokenFetchCount++;
    }
    try {
      _value = await _deviceRepository.getSecuredValue(key);
      print("Token fetched $tokenFetchCount times, value = $_value");
      return _value;
    } //
    catch (_) {
      _value = await _dataRepository.getSecuredValue(key);
      return _value;
    }
  }

  Future<String> getUserAccessData(String key) async {
    var _value = '';
    try {
      _value = await _deviceRepository.getUserAccessData(key);

      return _value;
    } catch (_) {
      _value = await _dataRepository.getUserAccessData(key);
      return _value;
    }
  }

  Future<String> getNewPermitAccessData(String key) async {
    var _value = '';
    try {
      _value = await _deviceRepository.getNewPermitAccessData(key);

      return _value;
    } catch (_) {
      _value = await _dataRepository.getNewPermitAccessData(key);
      return _value;
    }
  }

  /// Save the value to the string.
  ///
  /// [key] : The key to which [value] will be saved.
  /// [value] : The value which needs to be saved.
  Future<void> saveSecureValue(String key, String value) async {
    try {
      if (key == "auth-token") {
        tokenSaveCount++;
      }
      await _deviceRepository.saveValueSecurely(
        key,
        value,
      );
      print("Token saved $tokenSaveCount times");
    } catch (_) {
      _dataRepository.saveValueSecurely(
        key,
        value,
      );
    }
  }

  void saveUserAcessData(String key, String value) async {
    try {
      await _deviceRepository.saveUserAcessData(
        key,
        value,
      );
    } catch (_) {
      _dataRepository.saveUserAcessData(
        key,
        value,
      );
    }
  }

  /// Clear data from secure storage for [key].
  void deleteSecuredValue(String key) {
    try {
      _deviceRepository.deleteSecuredValue(
        key,
      );
    } catch (_) {
      _dataRepository.deleteSecuredValue(
        key,
      );
    }
  }

  //create New Permit
  Future<Map<String, dynamic>> createNewPermit(
    newPermit,
    bool? isLoading,
  ) async {
    try {
      //  print({"NewPermit",newPermit});
      // final auth = await getSecuredValue(LocalKeys.authToken);
      print({"NewPermit", newPermit});
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.createNewPermit(
        auth: auth,
        newPermit: newPermit,
        isLoading: isLoading ?? false,
      );
      var data = res.data;
      print('Response Create Permit: ${data}');
      Get.dialog(
        CreateNewPermitDialog(
          createPermitData: 'Dialog Title',
        ),
      );
      // CreateNewPermitDialog(createPermitData: 'data',);

      data = res.data;
      print('Response Create Permit: ${data}');

      if (!res.hasError) {
        if (res.errorCode == 200) {
          var responseMap = json.decode(res.data);
          return responseMap;
        }
      } else {
        Utility.showDialog(res.errorCode.toString());
        //return '';
      }
      return Map();
    } catch (error) {
      log(error.toString());
      return Map();
    }
  }

  /// Clear all data from secure storage .
  void deleteAllSecuredValues() {
    try {
      _deviceRepository.deleteAllSecuredValues();
    } catch (_) {
      _dataRepository.deleteAllSecuredValues();
    }
  }

  Mixpanel? mixPanel;

  Future<List<CountryState?>?> getStateList(int countryCode) async {
    try {
      final res = await _dataRepository.getStateList(countryCode);

      if (!res.hasError) {
        return stateFromJson(res.data);
      } else {
        Utility.showDialog('Something Went Wrong!!');
        return null;
      }
    } catch (error) {
      log(error.toString());
      await _deviceRepository.getStateList(countryCode);
      return null;
    }
  }

  Future<void> generateToken({
    auth,
    bool? isLoading,
  }) async {
    try {
      final res =
          await _dataRepository.generateToken(auth: auth, isLoading: isLoading);
      print(res.data.toString());

      if (!res.hasError) {
        final decodeRes = jsonDecode(res.data);
        await saveSecureValue(LocalKeys.authToken, decodeRes['token']);
        String userId = decodeRes['user_detail']['id'].toString();
        String token = decodeRes['token'];
        await getUserAccessList(
            userId: userId, auth: token, isLoading: isLoading ?? false);

        // Get.offAllNamed(
        //   Routes.home,arguments: userId
        // );
      } else {
        Fluttertoast.showToast(
            msg: "Invalid Email Id and Password", fontSize: 16.0);
      }
    } catch (error) {
      await _deviceRepository.generateToken();
      log(error.toString());
    }
  }

  Future<List<InventoryModel>> getInventoryList({
    required int? facilityId,
    int? blockId,
    required String categoryIds,
    required bool isLoading,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      log(auth);
      final res = await _dataRepository.getInventoryList(
        facilityId: facilityId,
        blockId: blockId,
        categoryIds: categoryIds,
        isLoading: isLoading,
        auth: auth,
      );
      print('Inventory List Data: ${res.data}');

      if (!res.hasError) {
        var inventoryList = inventoryModelFromJson(res.data);
        return inventoryList;
      }
      return [];
    } catch (error) {
      log(error.toString());
      return [];
    }
  }

  Future<List<BusinessListModel>> getBusinessList({
    required int? businessType,
    int? blockId,
    String? categoryIds,
    required bool isLoading,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      log(auth);
      final res = await _dataRepository.getBusinessList(
        businessType: businessType,
        blockId: blockId,
        categoryIds: categoryIds ?? "",
        isLoading: isLoading,
        auth: auth,
      );
      //  print('Business List Data: ${res.data}');
//
      if (!res.hasError) {
        var businessList = businessListModelFromJson(res.data);
        return businessList;
      }
      return [];
    } catch (error) {
      log(error.toString());
      return [];
    }
  }

  Future<List<WarrantyClaimModel>> getWarrantyClaimList({
    required int? facilityId,
    int? blockId,
    required String categoryIds,
    required bool isLoading,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      log(auth);
      final res = await _dataRepository.getWarrantyClaimList(
        facilityId: 45,
        blockId: blockId,
        categoryIds: categoryIds,
        isLoading: isLoading,
        auth: auth,
      );
      print('WarrantyClaim: ${res.data}');

      if (!res.hasError) {
        var warrantyClaimList = warrantyClaimModelFromJson(res.data);
        return warrantyClaimList;
      }
      return [];
    } catch (error) {
      log(error.toString());
      return [];
    }
  }

  Future<List<WorkTypeModel>> getWorkTypeList(
    bool? isLoading,
    String? categoryIds,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      log(auth);
      final res = await _dataRepository.getWorkTypeList(
        categoryIds: categoryIds,
        isLoading: isLoading,
        auth: auth,
      );

      if (!res.hasError) {
        var workTypeList = workTypeModelFromJson(res.data);
        return workTypeList;
      }
      return [];
    } catch (error) {
      log(error.toString());
      return [];
    }
  }

  Future<List<BlockModel>> getBlockList({
    required bool isLoading,
    required String facilityId,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      log(auth);
      final res = await _dataRepository.getBlockList(
        isLoading: isLoading,
        auth: auth,
        facilityId: facilityId,
      );

      if (!res.hasError) {
        var _lstBlocks = blockModelFromJson(res.data);
        return _lstBlocks;
      }
      return [];
    } catch (error) {
      log(error.toString());
      return [];
    }
  }

  Future<List<EquipmentModel>> getEquipmentList({
    required bool isLoading,
    required String facilityId,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      log(auth);
      final res = await _dataRepository.getEquipmentList(
        isLoading: isLoading,
        auth: auth,
        facilityId: facilityId,
      );

      if (!res.hasError) {
        return equipmentFromJson(res.data);
      }
      return [];
    } catch (error) {
      log(error.toString());
      return [];
    }
  }

  Future<List<JobModel?>?> getJobList(
    String auth,
    int? facilityId,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final userAcessData = await getUserAccessData(LocalKeys.userAccess);
      final userAccessModelList = jsonDecode(userAcessData);
      var userAccess = AccessListModel.fromJson(userAccessModelList);
      int userId = userAccess.user_id ?? 0;
      print({"userdatatat", userAccess.user_id});
      final res = await _dataRepository.getJobList(
        auth: auth,
        facilityId: facilityId ?? 0,
        userId: userId,
        isLoading: isLoading ?? false,
      );

      if (!res.hasError) {
        final jsonJobModels = jsonDecode(res.data);
        final List<JobModel> _jobModelList = jsonJobModels
            .map<JobModel>(
                (m) => JobModel.fromJson(Map<String, dynamic>.from(m)))
            .toList();
        print(_jobModelList.runtimeType);

        return _jobModelList;
      } else {
        Utility.showDialog('Something Went Wrong!!');
        return [];
      }
    } catch (error) {
      log(error.toString());

      return [];
    }
  }

  Future<List<NewPermitListModel?>?> getNewPermitList(
    String auth,
    int? facilityId,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final newPermitListData =
          await getNewPermitAccessData(LocalKeys.userAccess);
      final newPermitModelList = jsonDecode(newPermitListData);
      var newPermitList = NewPermitListModel.fromJson(newPermitModelList);
      int permitId = newPermitList.permitId ?? 0;
      print({"NewPermitList:", newPermitList.permitId});
      final res = await _dataRepository.getNewPermitList(
        auth: auth,
        facilityId: 45,
        // userId: permitId,
        userId: 33,
        isLoading: isLoading ?? false,
      );
      print('NewPermitResponse5: ${res.data}');

      if (!res.hasError) {
        final jsonNewPermitListModels = jsonDecode(res.data);
        final List<NewPermitListModel> _newPermitModelList =
            jsonNewPermitListModels
                .map<NewPermitListModel>((m) =>
                    NewPermitListModel.fromJson(Map<String, dynamic>.from(m)))
                .toList();
        print('Permit Data:${_newPermitModelList.runtimeType}');

        return _newPermitModelList;
      } else {
        Utility.showDialog('Something Went Wrong!!');
        return [];
      }
    } catch (error) {
      log(error.toString());

      return [];
    }
  }

  Future<List<FacilityModel?>?> getFacilityList(bool? isLoading) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getFacilityList(
        auth: auth,
        isLoading: isLoading,
      );
      print('Facilitydata5: ${res.data}');

      if (!res.hasError) {
        final jsonFacilityModels = jsonDecode(res.data);
        final List<FacilityModel> _facilityModelList = jsonFacilityModels
            .map<FacilityModel>(
                (m) => FacilityModel.fromJson(Map<String, dynamic>.from(m)))
            .toList();

        return _facilityModelList;
      } else {
        Utility.showDialog('Something Went Wrong!!');
        return null;
      }
    } catch (error) {
      log(error.toString());

      return [];
    }
  }

  Future<List<TypePermitModel?>?> getTypePermitList(bool? isLoading) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getTypePermitList(
        auth: auth,
        isLoading: isLoading,
      );

      if (!res.hasError) {
        final jsonTypePermitModels = jsonDecode(res.data);
        final List<TypePermitModel> _typePermitModelList = jsonTypePermitModels
            .map<TypePermitModel>(
                (m) => TypePermitModel.fromJson(Map<String, dynamic>.from(m)))
            .toList();
        print('PermitztypeData: ${res.data}');
        return _typePermitModelList;
      } else {
        Utility.showDialog('Something Went Wrong!!');
        return null;
      }
    } catch (error) {
      log(error.toString());

      return [];
    }
  }

  Future<List<BlockModel?>?> getBlocksList(
    String? auth,
    int? facilityId,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getBlocksList(
        auth: auth,
        isLoading: isLoading ?? false,
        facilityId: facilityId ?? 0,
      );

      if (!res.hasError) {
        final jsonFacilityModels = jsonDecode(res.data);
        final List<BlockModel> _blockModelList = jsonFacilityModels
            .map<BlockModel>(
                (m) => BlockModel.fromJson(Map<String, dynamic>.from(m)))
            .toList();

        return _blockModelList;
      } else {
        Utility.showDialog('Something Went Wrong!!');
        return null;
      }
    } catch (error) {
      log(error.toString());
      //await _deviceRepository.getFacilityList();
      return [];
    }
  }

  Future<List<InventoryCategoryModel?>?> getInventoryCategoryList(
    String? auth,
    int? facilityId,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getInventoryCategoryList(
        auth: auth,
        isLoading: isLoading,
        facilityId: facilityId,
      );

      if (!res.hasError) {
        final jsonInventoryCategoryModels = jsonDecode(res.data);
        final List<InventoryCategoryModel> _inventoryCategoryModelList =
            jsonInventoryCategoryModels
                .map<InventoryCategoryModel>(
                  (m) => InventoryCategoryModel.fromJson(
                    Map<String, dynamic>.from(m),
                  ),
                )
                .toList();

        return _inventoryCategoryModelList;
      } else {
        Utility.showDialog('Something Went Wrong!!');
        return null;
      }
    } catch (error) {
      log(error.toString());

      return [];
    }
  }

  Future<List<FrequencyModel?>?> getFrequencyList(
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getFrequencyList(
        auth: auth,
        isLoading: isLoading,
      );

      if (!res.hasError) {
        final jsonFrequencyModels = jsonDecode(res.data);
        final List<FrequencyModel> _frequencyModelList = jsonFrequencyModels
            .map<FrequencyModel>(
              (m) => FrequencyModel.fromJson(Map<String, dynamic>.from(m)),
            )
            .toList();

        return _frequencyModelList;
      } else {
        Utility.showDialog('Something Went Wrong!!');
        return null;
      }
    } catch (error) {
      log(error.toString());

      return [];
    }
  }

  Future<List<JobDetailsModel>> getJobDetails(
    String? auth,
    int jobId,
    int? userId,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      log(auth);
      final res = await _dataRepository.getJobDetails(
        auth: auth,
        jobId: jobId,
        userId: userId,
        isLoading: isLoading,
      );

      if (!res.hasError) {
        final JobDetailsModel _jobDetailsModel =
            jobDetailsModelFromJson(res.data);
        List<JobDetailsModel> _jobDetailsModelList = [];
        _jobDetailsModelList.add(_jobDetailsModel);

        return _jobDetailsModelList;
      } else {
        Utility.showDialog('Something Went Wrong!!');
        return [];
      }
    } catch (error) {
      print(error.toString());
      log(error.toString());
      return [];
    }
  }

  Future<List<EmployeeModel?>?> getAssignedToList(
    String? auth,
    int? facilityId,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getAssignedToList(
        auth: auth,
        isLoading: isLoading,
        facilityId: facilityId,
      );

      if (!res.hasError) {
        final jsonEmployeeModels = jsonDecode(res.data);
        final List<EmployeeModel> _employeeModelList = jsonEmployeeModels
            .map<EmployeeModel>(
              (m) => EmployeeModel.fromJson(Map<String, dynamic>.from(m)),
            )
            .toList();

        return _employeeModelList;
      } else {
        Utility.showDialog('Something Went Wrong!!');
        return null;
      }
    } catch (error) {
      log(error.toString());

      return [];
    }
  }

  Future<List<ToolsModel?>?> getToolsRequiredToWorkTypeList(
    String? auth,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getToolsRequiredToWorkTypeList(
        auth: auth,
        isLoading: isLoading ?? false,
      );

      if (!res.hasError) {
        final jsonEmployeeModels = jsonDecode(res.data);
        final List<ToolsModel> _employeeModelList = jsonEmployeeModels
            .map<ToolsModel>(
              (m) => ToolsModel.fromJson(Map<String, dynamic>.from(m)),
            )
            .toList();

        return _employeeModelList;
      } else {
        Utility.showDialog('Something Went Wrong!!');
        return null;
      }
    } //
    catch (error) {
      log(error.toString());
      return [];
    }
  }

  Future<Map<String, dynamic>> saveJob(
    job,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.saveJob(
        auth: auth,
        job: job,
        isLoading: isLoading ?? false,
      );
      print('SaveJobData: ${res.data}');

      if (!res.hasError) {
        if (res.errorCode == 200) {
          var responseMap = json.decode(res.data);
          return responseMap;
        }
      } else {
        Utility.showDialog(res.errorCode.toString());
        //return '';
      }
      return Map();
    } catch (error) {
      log(error.toString());
      return Map();
    }
  }

  Future<AccessListModel?> getUserAccessList({
    required String auth,
    required String userId,
    required bool isLoading,
  }) async {
    try {
      final res = await _dataRepository.getUserAccessList(
        auth: auth,
        userId: userId,
        isLoading: isLoading,
      );

      if (!res.hasError) {
        final userAccessModelList = jsonDecode(res.data);
        // print(res.data);
        //  var userAccess = AccessListModel.fromJson(userAccessModelList);
        saveUserAcessData(LocalKeys.userAccess, res.data);

        Get.offAndToNamed(
          Routes.home,
        );
        return null;
      } else {
        Utility.showDialog('Something Went Wrong!!');
        return null;
      }
    } catch (error) {
      log(error.toString());
      return null;
    }
  }

  Future<bool> createCheckListNumber(
      {bool? isLoading, checklistJsonString}) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      log(auth);
      final res = await _dataRepository.createCheckList(
          auth: auth,
          isLoading: isLoading,
          checklistJsonString: checklistJsonString);
      print({"res.data", res.data});
      if (!res.hasError) {
        return true;
      }
      return true;
    } catch (error) {
      log(error.toString());
      return false;
    }
  }

  Future<List<PreventiveCheckListModel?>?> getPreventiveCheckList(
    int? type,
    int? facilityId,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getPreventiveCheckList(
        auth: auth,
        facilityId: facilityId ?? 0,
        type: type,
        isLoading: isLoading ?? false,
      );

      if (!res.hasError) {
        final jsonPreventiveCheckListModelModels = jsonDecode(res.data);
        // print(res.data);
        final List<PreventiveCheckListModel> _PreventiveCheckListModelList =
            jsonPreventiveCheckListModelModels
                .map<PreventiveCheckListModel>((m) =>
                    PreventiveCheckListModel.fromJson(
                        Map<String, dynamic>.from(m)))
                .toList();

        return _PreventiveCheckListModelList;
      } else {
        Utility.showDialog('Something Went Wrong!!');
        return [];
      }
    } catch (error) {
      log(error.toString());

      return [];
    }
  }

  Future<List<CheckPointModel?>?> getCheckPointlist(
    int? selectedchecklistId,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      print({"checkid", selectedchecklistId});
      final res = await _dataRepository.getCheckPointlist(
        auth: auth,
        selectedchecklistId: selectedchecklistId ?? 0,
        isLoading: isLoading ?? false,
      );
      print({"checkpoint list", res.data});
      if (!res.hasError) {
        final jsonPreventiveCheckPointModels = jsonDecode(res.data);

        final List<CheckPointModel> _PreventiveCheckPointList =
            jsonPreventiveCheckPointModels
                .map<CheckPointModel>((m) =>
                    CheckPointModel.fromJson(Map<String, dynamic>.from(m)))
                .toList();

        return _PreventiveCheckPointList;
      } else {
        Utility.showDialog('Something Went Wrong!!');
        return [];
      }
    } catch (error) {
      log(error.toString());

      return [];
    }
  }

  Future<bool> createCheckpoint({bool? isLoading, checkpointJsonString}) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      log(auth);
      final res = await _dataRepository.createCheckpoint(
          auth: auth,
          isLoading: isLoading,
          checkpointJsonString: checkpointJsonString);
      print({"res.data1", res.data});

      if (!res.hasError) {
        return true;
      }
      return true;
    } catch (error) {
      log(error.toString());
      return false;
    }
  }

  Future<Map<String, dynamic>?> uploadFiles(
    fileUploadModel,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.uploadFiles(
        auth: auth,
        fileUploadModel: fileUploadModel,
        isLoading: isLoading,
      );

      if (!res.hasError) {
        if (res.errorCode == 200) {
          var responseMap = json.decode(res.data);
          return responseMap;
        }
      } else {
        Utility.showDialog(res.errorCode.toString());
        //return '';
      }
      return Map();
    } //
    catch (error) {
      log(error.toString());
      return Map();
    }
  }

  Future<List<JobCardDetailsModel>?> getJobCardDetails(
    //String? auth,
    int? jobCardId,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getJobCardDetails(
        auth: auth,
        jobCardId: jobCardId,
        isLoading: isLoading,
      );

      if (!res.hasError) {
        final jsonJobCardDetailsModels = jsonDecode(res.data);
        final List<JobCardDetailsModel> _jobCardDetailsList =
            jsonJobCardDetailsModels
                .map<JobCardDetailsModel>(
                  (m) => JobCardDetailsModel.fromJson(
                    Map<String, dynamic>.from(m),
                  ),
                )
                .toList();

        return _jobCardDetailsList;
      } else {
        Utility.showDialog('Something Went Wrong!!');
        return null;
      }
    } catch (error) {
      log(error.toString());

      return [];
    }
  }

  Future<Map<String, dynamic>> createJobCard(
    auth,
    jobId,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.createJobCard(
        auth: auth,
        jobId: jobId,
        isLoading: isLoading,
      );

      if (!res.hasError) {
        if (res.errorCode == 200) {
          var responseMap = json.decode(res.data);
          return responseMap;
        }
      } else {
        Utility.showDialog(res.errorCode.toString());
        //return '';
      }
      return Map();
    } catch (error) {
      log(error.toString());
      return Map();
    }
  }

  Future<PermitDetailsModel?> getPermitDetails(
    int? permitId,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getPermitDetails(
        auth: auth,
        permitId: permitId,
        isLoading: isLoading,
      );

      if (!res.hasError) {
        final PermitDetailsModel _permitDetailsModel =
            permitDetailsModelFromJson(res.data);
        return _permitDetailsModel;
      } //
      else {
        Utility.showDialog('Something Went Wrong!!');
        return null;
      }
    } //
    catch (error) {
      log(error.toString());
      return null;
    }
  }

  Future<List<HistoryModel>?> getJobCardHistory(
    int? moduleType,
    int? jobCardId,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getJobCardHistory(
        auth: auth,
        moduleType: moduleType,
        jobCardId: jobCardId,
        isLoading: isLoading,
      );

      if (!res.hasError) {
        final jsonJobCardDetailsModels = jsonDecode(res.data);
        final List<HistoryModel> _jobCardDetailsList = jsonJobCardDetailsModels
            .map<HistoryModel>(
              (m) => HistoryModel.fromJson(
                Map<String, dynamic>.from(m),
              ),
            )
            .toList();

        return _jobCardDetailsList;
      } else {
        Utility.showDialog('Something Went Wrong!!');
        return null;
      }
    } catch (error) {
      log(error.toString());
      return [];
    }
  }

  ///
  Future<Map<String, dynamic>> updateJobCard(
    jobCard,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.updateJobCard(
        auth: auth,
        jobCard: jobCard,
        isLoading: isLoading,
      );

      if (!res.hasError) {
        if (res.errorCode == 200) {
          var responseMap = json.decode(res.data);
          return responseMap;
        }
      } else {
        Utility.showDialog(res.errorCode.toString());
        //return '';
      }
      return Map();
    } catch (error) {
      print(error);
      log(error.toString());
      return Map();
    }
  }

  ///
  Future<Map<String, dynamic>> approveJobCard(
    jobCardId,
    comment,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.approveJobCard(
        auth: auth,
        jobCardId: jobCardId,
        comment: comment,
        isLoading: isLoading,
      );

      if (!res.hasError) {
        if (res.errorCode == 200) {
          var responseMap = json.decode(res.data);
          return responseMap;
        }
      } else {
        Utility.showDialog(res.errorCode.toString());
        //return '';
      }
      return Map();
    } catch (error) {
      log(error.toString());
      return Map();
    }
  }

  ///
  Future<Map<String, dynamic>> rejectJobCard(
    jobCardId,
    comment,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.rejectJobCard(
        auth: auth,
        jobCardId: jobCardId,
        comment: comment,
        isLoading: isLoading,
      );

      if (!res.hasError) {
        if (res.errorCode == 200) {
          var responseMap = json.decode(res.data);
          return responseMap;
        }
      } else {
        Utility.showDialog(res.errorCode.toString());
        //return '';
      }
      return Map();
    } catch (error) {
      log(error.toString());
      return Map();
    }
  }

  Future<List<HistoryModel>?> getHistory(
    //String? auth,
    int? moduleType,
    int? id,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getHistory(
        auth: auth,
        isLoading: isLoading,
        moduleType: moduleType,
        id: id,
      );

      if (!res.hasError) {
        final jsonHistoryModels = jsonDecode(res.data);
        final List<HistoryModel> _historyModelList = jsonHistoryModels
            .map<HistoryModel>(
              (m) => HistoryModel.fromJson(Map<String, dynamic>.from(m)),
            )
            .toList();

        return _historyModelList;
      } else {
        Utility.showDialog('Something Went Wrong!!');
        return null;
      }
    } catch (error) {
      log(error.toString());

      return [];
    }
  }

  Future<void> deleteCkeckpoint(Object check_point_id, bool isLoading) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      print({"checkid", check_point_id});
      final res = await _dataRepository.deleteCkeckpoint(
        auth: auth,
        check_point_id: check_point_id,
        isLoading: isLoading,
      );
      print({"checkpoint list", res.data});
      if (!res.hasError) {
        print("jngfjnfj");
      } else {
        Utility.showDialog('Something Went Wrong!!');
      }
    } catch (error) {
      log(error.toString());
    }
  }

  Future<List<PmMappingListModel?>?> getPmMappingList(
    int? facilityId,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getPmMappingList(
        auth: auth,
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );
      print({"restt", res.data});
      if (!res.hasError) {
        final jsonPmMappingListModels = jsonDecode(res.data);
        //print(res.data);
        final List<PmMappingListModel> _pmMappingListModel =
            jsonPmMappingListModels
                .map<PmMappingListModel>((m) =>
                    PmMappingListModel.fromJson(Map<String, dynamic>.from(m)))
                .toList();

        return _pmMappingListModel;
      } else {
        Utility.showDialog('Something Went Wrong!!');
        return [];
      }
    } catch (error) {
      log(error.toString());

      return [];
    }
  }

  Future<Map<String, dynamic>> savePmMapping(
    pmJsonString,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.savePmMapping(
        auth: auth,
        pmJsonString: pmJsonString,
        isLoading: isLoading ?? false,
      );
      print('SaveData: ${res.data}');

      if (!res.hasError) {
        if (res.errorCode == 200) {
          var responseMap = json.decode(res.data);
          return responseMap;
        }
      } else {
        Utility.showDialog(res.errorCode.toString());
        //return '';
      }
      return Map();
    } catch (error) {
      log(error.toString());
      return Map();
    }
  }

  Future<List<CalibrationListModel?>?> getCalibrationList(
    int? facilityId,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getCalibrationList(
        auth: auth,
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );
      // print(res.data);
      if (!res.hasError) {
        final jsonCalibrationListModelModels = jsonDecode(res.data);

        final List<CalibrationListModel> _CalibrationListModelList =
            jsonCalibrationListModelModels
                .map<CalibrationListModel>((m) =>
                    CalibrationListModel.fromJson(Map<String, dynamic>.from(m)))
                .toList();

        return _CalibrationListModelList;
      } else {
        Utility.showDialog('Something Went Wrong!!');
        return [];
      }
    } catch (error) {
      log(error.toString());

      return [];
    }
  }

  Future<bool> StartCalibration({bool? isLoading, startcalibration}) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      log(auth);
      final res = await _dataRepository.StartCalibration(
          auth: auth, isLoading: isLoading, startcalibration: startcalibration);
      print({"res.data", res.data});
      if (!res.hasError) {
        return true;
      }
      return true;
    } catch (error) {
      log(error.toString());
      return false;
    }
  }

  ///
}
