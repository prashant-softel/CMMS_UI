import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:cmms/app/utils/utils.dart';
import 'package:cmms/app/utils/utility.dart';
import 'package:cmms/data/data.dart';
import 'package:cmms/device/device.dart';
import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/models/models.dart';
import 'package:cmms/domain/repositories/repositories.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';

import '../models/state.dart';

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
  Future<String> getSecureValue(String key) {
    try {
      return _deviceRepository.getSecuredValue(
        key,
      );
    } catch (_) {
      return _dataRepository.getSecuredValue(
        key,
      );
    }
  }

  /// Save the value to the string.
  ///
  /// [key] : The key to which [value] will be saved.
  /// [value] : The value which needs to be saved.
  void saveSecureValue(String key, String value) {
    try {
      _deviceRepository.saveValueSecurely(
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

  Future<void> generateToken() async {
    try {
      final res = await _dataRepository.generateToken();
      print(res.data.toString());

      if (!res.hasError) {
        final decodeRes = jsonDecode(res.data);
        saveSecureValue(LocalKeys.authToken, decodeRes['token']);
      }
    } catch (error) {
      await _deviceRepository.generateToken();
      log(error.toString());
    }
  }

  Future<List<InventoryList>> getInventoryList({
    required bool isLoading,
  }) async {
    try {
      final auth = await getSecureValue(LocalKeys.authToken);
      log(auth);
      final res = await _dataRepository.getInventoryList(
        isLoading: isLoading,
        auth: auth,
      );

      if (!res.hasError) {
        return inventoryListFromJson(res.data);
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
        return blockModelFromJson(res.data);
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
    int? userId,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecureValue(LocalKeys.authToken);
      log(auth);
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

  Future<List<FacilityModel?>?> getFacilityList() async {
    try {
      //final auth = await getSecureValue(LocalKeys.authToken);
      final res = await _dataRepository.getFacilityList();

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
        isLoading: isLoading ?? false,
        facilityId: facilityId ?? 0,
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
        final jsonJobDetailsModels = jsonDecode(res.data);
        final List<JobDetailsModel> _jobDetailsModelList = jsonJobDetailsModels
            .map<JobDetailsModel>(
              (m) => JobDetailsModel.fromJson(Map<String, dynamic>.from(m)),
            )
            .toList();

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

  ///
}
