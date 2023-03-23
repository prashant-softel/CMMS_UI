import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:cmms/app/utils/utils.dart';
import 'package:cmms/app/utils/utility.dart';
import 'package:cmms/data/data.dart';
import 'package:cmms/device/device.dart';
import 'package:cmms/domain/models/employee_model.dart';
import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/models/models.dart';
import 'package:cmms/domain/models/preventive_checklist_model.dart';
import 'package:cmms/domain/models/tools_model.dart';
import 'package:cmms/domain/models/work_type_model.dart';
import 'package:cmms/domain/repositories/repositories.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:get/get.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';

import '../../app/navigators/app_pages.dart';
import '../models/frequency_model.dart';
import '../models/state.dart';
import '../models/user_access_model.dart';

/// The main repository which will get the data from [DeviceRepository] or the
/// [DataRepository].
class Repository {
  /// [_deviceRepository] : the local repository.
  /// [_dataRepository] : the data repository like api and all.
  Repository(this._deviceRepository, this._dataRepository);

  final DeviceRepository _deviceRepository;
  final DataRepository _dataRepository;

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
  Future<String> getSecureValue(String key) async {
    var _value = '';
    try {
      _value = await _deviceRepository.getSecuredValue(key);

      return _value;
    } catch (_) {
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

  /// Save the value to the string.
  ///
  /// [key] : The key to which [value] will be saved.
  /// [value] : The value which needs to be saved.
  void saveSecureValue(String key, String value) async {
    try {
      await _deviceRepository.saveValueSecurely(
        key,
        value,
      );
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
        saveSecureValue(LocalKeys.authToken, decodeRes['token']);
        String userId = decodeRes['user_detail']['id'].toString();
        String token = decodeRes['token'];
        await getUserAccessList(
            userId: userId, auth: token, isLoading: isLoading ?? false);

        // Get.offAllNamed(
        //   Routes.home,
        // );
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
      final auth = await getSecureValue(LocalKeys.authToken);

      log(auth);
      final res = await _dataRepository.getInventoryList(
        facilityId: facilityId,
        blockId: blockId,
        categoryIds: categoryIds,
        isLoading: isLoading,
        auth: auth,
      );

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

  Future<List<WorkTypeModel>> getWorkTypeList(
    bool? isLoading,
    String? categoryIds,
  ) async {
    try {
      final auth = await getSecureValue(LocalKeys.authToken);
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
      final auth = await getSecureValue(LocalKeys.authToken);
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
      final auth = await getSecureValue(LocalKeys.authToken);
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

  ///
  Future<List<JobModel?>?> getJobList(
    String auth,
    int? facilityId,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecureValue(LocalKeys.authToken);
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

  Future<List<FacilityModel?>?> getFacilityList(bool? isLoading) async {
    try {
      final auth = await getSecureValue(LocalKeys.authToken);
      final res = await _dataRepository.getFacilityList(
        auth: auth,
        isLoading: isLoading,
      );

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

  Future<List<BlockModel?>?> getBlocksList(
    String? auth,
    int? facilityId,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecureValue(LocalKeys.authToken);
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
      final auth = await getSecureValue(LocalKeys.authToken);
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
                      Map<String, dynamic>.from(m)),
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
      final auth = await getSecureValue(LocalKeys.authToken);
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
      final auth = await getSecureValue(LocalKeys.authToken);
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
      final auth = await getSecureValue(LocalKeys.authToken);
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
      final auth = await getSecureValue(LocalKeys.authToken);
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
    } catch (error) {
      log(error.toString());

      return [];
    }
  }

  Future<Map<String, dynamic>> saveJob(
    job,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecureValue(LocalKeys.authToken);
      final res = await _dataRepository.saveJob(
        auth: auth,
        job: job,
        isLoading: isLoading ?? false,
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

  Future<AccessListModel?> getUserAccessList(
      {required String auth,
      required String userId,
      required bool isLoading}) async {
    try {
      final res = await _dataRepository.getUserAccessList(
        auth: auth,
        userId: userId,
        isLoading: isLoading,
      );

      if (!res.hasError) {
        final userAccessModelList = jsonDecode(res.data);
        print(res.data);
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

  Future<void> createCheckListNumber({
    bool? isLoading,
  }) async {
    try {
      final auth = await getSecureValue(LocalKeys.authToken);
      log(auth);
      final res = await _dataRepository.createCheckList(
          auth: auth, isLoading: isLoading);
      print({"res.data.toString()", res.data});

      if (!res.hasError) {
        print("successsss");
      }
    } catch (error) {
      log(error.toString());
    }
  }

  Future<List<PreventiveCheckListModel?>?> getPreventiveCheckList(
    int? type,
    int? facilityId,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecureValue(LocalKeys.authToken);
      final res = await _dataRepository.getPreventiveCheckList(
        auth: auth,
        facilityId: facilityId ?? 0,
        type: type,
        isLoading: isLoading ?? false,
      );

      if (!res.hasError) {
        final jsonPreventiveCheckListModelModels = jsonDecode(res.data);

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
}
