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
import 'package:cmms/domain/models/currency_list_model.dart';
import 'package:cmms/domain/models/employee_list_model.dart';
import 'package:cmms/domain/models/employee_list_model2.dart';
import 'package:cmms/domain/models/employee_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/models/inventory_detail_model.dart';
import 'package:cmms/domain/models/job_type_list_model.dart';
import 'package:cmms/domain/models/models.dart';
import 'package:cmms/domain/models/new_permit_list_model.dart';
import 'package:cmms/domain/models/permit_issue_model.dart';
import 'package:cmms/domain/models/preventive_checklist_model.dart';
import 'package:cmms/domain/models/safety_measure_list_model.dart';
import 'package:cmms/domain/models/sop_list_model.dart';
import 'package:cmms/domain/models/set_pm_schedule_model.dart';
import 'package:cmms/domain/models/sop_list_model.dart';
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
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.createNewPermit(
        auth: auth,
        newPermit: newPermit,
        isLoading: isLoading ?? false,
      );
      var data = res.data;
      //print('Response Create Permit: ${data}');
      Get.dialog(
        CreateNewPermitDialog(
          createPermitData: 'Dialog Title',
        ),
      );

      data = res.data;
      //print('Response Create Permit: ${data}');

      if (!res.hasError) {
        if (res.errorCode == 200) {
          var responseMap = json.decode(res.data);
          return responseMap;
        }
      } else {
        Utility.showDialog(res.errorCode.toString() + 'createNewPermit');
        //return '';
      }
      return Map();
    } catch (error) {
      print(error.toString());
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
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + 'getStateList');
        return null;
      }
    } catch (error) {
      print(error.toString());
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
      //print(res.data.toString());

      if (!res.hasError) {
        final decodeRes = jsonDecode(res.data);
        await saveSecureValue(LocalKeys.authToken, decodeRes['token']);
        String userId = decodeRes['user_detail']['id'].toString();
        String token = decodeRes['token'];
        await getUserAccessList(
            userId: userId, auth: token, isLoading: isLoading ?? false);
      } else {
        Fluttertoast.showToast(
            msg: "Invalid Email Id and Password", fontSize: 16.0);
      }
    } catch (error) {
      await _deviceRepository.generateToken();
      print(error.toString());
    }
  }

  Future<List<InventoryModel>> getInventoryList({
    required int? facilityId,
    int? blockId,
    String? categoryIds,
    required bool isLoading,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getInventoryList(
        facilityId: facilityId,
        blockId: blockId,
        categoryIds: categoryIds,
        isLoading: isLoading,
        auth: auth,
      );
      // print('Inventory List Data: ${res.data}');

      if (!res.hasError) {
        var inventoryList = inventoryModelFromJson(res.data);
        return inventoryList;
      }
//
      else {
        Utility.showDialog(res.errorCode.toString() + 'getInventoryList');
        return [];
      }
    } catch (error) {
      print(error.toString());
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
      final res = await _dataRepository.getBusinessList(
        businessType: businessType,
        // blockId: blockId,
        // categoryIds: categoryIds ?? "",
        // businessType: businessType,
        isLoading: isLoading,
        auth: auth,
      );
      if (!res.hasError) {
        var businessList = businessListModelFromJson(res.data);
        return businessList;
      }
//
      else {
        Utility.showDialog(res.errorCode.toString() + 'getBusinessList');
        return [];
      }
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

   Future<List<CurrencyListModel>> getUnitCurrencyList({
    required int? facilityId,
    // int? blockId,
    // required String categoryIds,
    required bool isLoading,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      log(auth);
      final res = await _dataRepository.getUnitCurrencyList(
        facilityId: facilityId,
        isLoading: isLoading,
        auth: auth,
      );
      print('Unit Currency List Data: ${res.data}');

      if (!res.hasError) {
        var unitCurrencyList = currencyListModelFromJson(res.data);
        return unitCurrencyList;
      }
      return [];
    } catch (error) {
      log(error.toString());
      return [];
    }
  }

   Future<List<InventoryDetailModel?>?> getInventoryDetailList(
    String auth,
    int? id,
    bool? isLoading,
  ) async {
    try {
       final auth = await getSecuredValue(LocalKeys.authToken);

      log(auth);
      final res = await _dataRepository.getInventoryDetailList(
        // facilityId: facilityId,
        // blockId: blockId,
        // categoryIds: categoryIds,
        id:id,
        isLoading: isLoading,
        auth: auth,
      );
      print('Inventory Detail List5: ${res.data}');

      if (!res.hasError) {
        var inventoryDetailList = inventoryDetailModelFromJson(res.data);
        return inventoryDetailList;
      }
      return [];
    } catch (error) {
      log(error.toString());

      return [];
    }
  }


  Future<List<EmployeeListModel>> getEmployeeList({
    required int? facility_id,
    // int? blockId,
    // required String categoryIds,
    required bool isLoading,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      log(auth);
      final res = await _dataRepository.getEmployeeList(
        facility_id: facility_id,
        isLoading: isLoading,
        auth: auth,
      );
      print('Employee List Data: ${res.data}');

      if (!res.hasError) {
        var employeeList = employeeListModelFromJson(res.data);
        return employeeList;
      }
      return [];
    } catch (error) {
      log(error.toString());
      return [];
    }
  }


   Future<List<EmployeeListModel>> getEmployeePermitList({
    required int? facility_id,
    // int? blockId,
    // required String categoryIds,
    required bool isLoading,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      log(auth);
      final res = await _dataRepository.getEmployeePermitList(
        facility_id: facility_id,
        isLoading: isLoading,
        auth: auth,
      );
      print('Employee List Data: ${res.data}');

      if (!res.hasError) {
        var employeeList = employeeListModelFromJson(res.data);
        return employeeList;
      }
      return [];
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

Future<List<EmployeeListModel>> getPermitIssuerList({
    required int? facility_id,
    // int? blockId,
    // required String categoryIds,
    required bool isLoading,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      log(auth);
      final res = await _dataRepository.getPermitIssuerList(
        facility_id: facility_id,
        isLoading: isLoading,
        auth: auth,
      );
      print('PermitIssuer List Data: ${res.data}');

      if (!res.hasError) {
        var permitIssuerList = employeeListModelFromJson(res.data);
        return permitIssuerList;
      }
      return [];
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

Future<List<EmployeeListModel2>> getPermitApproverList({
    required int? facility_id,
    // int? blockId,
    // required String categoryIds,
    required bool isLoading,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      log(auth);
      final res = await _dataRepository.getPermitApproverList(
        facility_id: facility_id,
        isLoading: isLoading,
        auth: auth,
      );
      print('PermitApprover List Data: ${res.data}');

      if (!res.hasError) {
        var permitApproverList = employeeListModel2FromJson(res.data);
        return permitApproverList;
      }
      return [];
    } catch (error) {
      log(error.toString());
      return [];
    }
  }


   Future<List<JobTypeListModel>> getJobTypePermitList({
    required int? facility_id,
    // int? blockId,
    // required String categoryIds,
    required bool isLoading,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      log(auth);
      final res = await _dataRepository.getJobTypePermitList(
        facility_id: facility_id,
        isLoading: isLoading,
        auth: auth,
      );
      print('Job Type List Data: ${res.data}');

      if (!res.hasError) {
        var jobTypeList = jobTypeListModelFromJson(res.data);
        return jobTypeList;
      }
      return [];
    } catch (error) {
      log(error.toString());
      return [];
    }
  }

  Future<List<SOPListModel>> getSopPermitList({
    required int? job_type_id,
    required bool isLoading,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      log(auth);
      final res = await _dataRepository.getSopPermitList(
        job_type_id: job_type_id,
        isLoading: isLoading,
        auth: auth,
      );
      print('SOP List Data: ${res.data}');

      if (!res.hasError) {
        var sopPermitList = sopListModelFromJson(res.data);
        return sopPermitList;
      }
      return [];
    } catch (error) {
      log(error.toString());
      return [];
    }
  }

  Future<List<SafetyMeasureListModel>> getSafetyMeasureList({
    required int? permit_type_id,
    required bool isLoading,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      log(auth);
      final res = await _dataRepository.getSafetyMeasureList(
        permit_type_id: permit_type_id,
        isLoading: isLoading,
        auth: auth,
      );
      print('Safety Measure List Data: ${res.data}');

      if (!res.hasError) {
        var safetyMeasureList = safetyMeasureListModelFromJson(res.data);
        return safetyMeasureList;
      }
      return [];
    } catch (error) {
      log(error.toString());
      return [];
    }
  }

   Future<List<CurrencyListModel>> getUnitCurrencyList({
    required int? facilityId,
    // int? blockId,
    // required String categoryIds,
    required bool isLoading,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      log(auth);
      final res = await _dataRepository.getUnitCurrencyList(
        facilityId: facilityId,
        isLoading: isLoading,
        auth: auth,
      );
      print('Unit Currency List Data: ${res.data}');

      if (!res.hasError) {
        var unitCurrencyList = currencyListModelFromJson(res.data);
        return unitCurrencyList;
      }
      return [];
    } catch (error) {
      log(error.toString());
      return [];
    }
  }

   Future<List<InventoryDetailModel?>?> getInventoryDetailList(
    String auth,
    int? id,
    bool? isLoading,
  ) async {
    try {
       final auth = await getSecuredValue(LocalKeys.authToken);

      log(auth);
      final res = await _dataRepository.getInventoryDetailList(
        // facilityId: facilityId,
        // blockId: blockId,
        // categoryIds: categoryIds,
        id:id,
        isLoading: isLoading,
        auth: auth,
      );
      print('Inventory Detail List5: ${res.data}');

      if (!res.hasError) {
        var inventoryDetailList = inventoryDetailModelFromJson(res.data);
        return inventoryDetailList;
      }
      return [];
    } catch (error) {
      log(error.toString());

      return [];
    }
  }


  Future<List<EmployeeListModel>> getEmployeeList({
    required int? facility_id,
    // int? blockId,
    // required String categoryIds,
    required bool isLoading,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      log(auth);
      final res = await _dataRepository.getEmployeeList(
        facility_id: facility_id,
        isLoading: isLoading,
        auth: auth,
      );
      print('Employee List Data: ${res.data}');

      if (!res.hasError) {
        var employeeList = employeeListModelFromJson(res.data);
        return employeeList;
      }
      return [];
    } catch (error) {
      log(error.toString());
      return [];
    }
  }


   Future<List<EmployeeListModel>> getEmployeePermitList({
    required int? facility_id,
    // int? blockId,
    // required String categoryIds,
    required bool isLoading,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      log(auth);
      final res = await _dataRepository.getEmployeePermitList(
        facility_id: facility_id,
        isLoading: isLoading,
        auth: auth,
      );
      print('Employee List Data: ${res.data}');

      if (!res.hasError) {
        var employeeList = employeeListModelFromJson(res.data);
        return employeeList;
      }
      return [];
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

Future<List<EmployeeListModel>> getPermitIssuerList({
    required int? facility_id,
    // int? blockId,
    // required String categoryIds,
    required bool isLoading,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      log(auth);
      final res = await _dataRepository.getPermitIssuerList(
        facility_id: facility_id,
        isLoading: isLoading,
        auth: auth,
      );
      print('PermitIssuer List Data: ${res.data}');

      if (!res.hasError) {
        var permitIssuerList = employeeListModelFromJson(res.data);
        return permitIssuerList;
      }
      return [];
    } catch (error) {
      log(error.toString());
      return [];
    }
  }

  Future<List<EmployeeListModel2>> getPermitApproverList({
    required int? facility_id,
    // int? blockId,
    // required String categoryIds,
    required bool isLoading,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      log(auth);
      final res = await _dataRepository.getPermitApproverList(
        facility_id: facility_id,
        isLoading: isLoading,
        auth: auth,
      );
      print('PermitApprover List Data: ${res.data}');

      if (!res.hasError) {
        var permitApproverList = employeeListModel2FromJson(res.data);
        return permitApproverList;
      }
      return [];
    } catch (error) {
      log(error.toString());
      return [];
    }
  }


   Future<List<JobTypeListModel>> getJobTypePermitList({
    required int? facility_id,
    // int? blockId,
    // required String categoryIds,
    required bool isLoading,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      log(auth);
      final res = await _dataRepository.getJobTypePermitList(
        facility_id: facility_id,
        isLoading: isLoading,
        auth: auth,
      );
      print('Job Type List Data: ${res.data}');

      if (!res.hasError) {
        var jobTypeList = jobTypeListModelFromJson(res.data);
        return jobTypeList;
      }
      return [];
    } catch (error) {
      log(error.toString());
      return [];
    }
  }

  Future<List<SOPListModel>> getSopPermitList({
    required int? job_type_id,
    required bool isLoading,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      log(auth);
      final res = await _dataRepository.getSopPermitList(
        job_type_id: job_type_id,
        isLoading: isLoading,
        auth: auth,
      );
      print('SOP List Data: ${res.data}');

      if (!res.hasError) {
        var sopPermitList = sopListModelFromJson(res.data);
        return sopPermitList;
      }
      return [];
    } catch (error) {
      log(error.toString());
      return [];
    }
  }

  Future<List<SafetyMeasureListModel>> getSafetyMeasureList({
    required int? permit_type_id,
    required bool isLoading,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      log(auth);
      final res = await _dataRepository.getSafetyMeasureList(
        permit_type_id: permit_type_id,
        isLoading: isLoading,
        auth: auth,
      );
      print('Safety Measure List Data: ${res.data}');

      if (!res.hasError) {
        var safetyMeasureList = safetyMeasureListModelFromJson(res.data);
        return safetyMeasureList;
      }
      return [];
    } catch (error) {
      log(error.toString());
      return [];
    }
  }


  Future<List<SafetyMeasureListModel>> getSafetyMeasureList({
    required int? permit_type_id,
    required bool isLoading,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      log(auth);
      final res = await _dataRepository.getSafetyMeasureList(
        permit_type_id: permit_type_id,
        isLoading: isLoading,
        auth: auth,
      );
      print('Safety Measure List Data: ${res.data}');

      if (!res.hasError) {
        var safetyMeasureList = safetyMeasureListModelFromJson(res.data);
        return safetyMeasureList;
      }
      return [];
    } catch (error) {
      log(error.toString());
      return [];
    }
  }






   Future<List<CurrencyListModel>> getUnitCurrencyList({
    required int? facilityId,
    // int? blockId,
    // required String categoryIds,
    required bool isLoading,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      log(auth);
      final res = await _dataRepository.getUnitCurrencyList(
        facilityId: facilityId,
        isLoading: isLoading,
        auth: auth,
      );
      print('Unit Currency List Data: ${res.data}');

      if (!res.hasError) {
        var unitCurrencyList = currencyListModelFromJson(res.data);
        return unitCurrencyList;
      }
      return [];
    } catch (error) {
      log(error.toString());
      return [];
    }
  }

   Future<List<InventoryDetailModel?>?> getInventoryDetailList(
    String auth,
    int? id,
    bool? isLoading,
  ) async {
    try {
       final auth = await getSecuredValue(LocalKeys.authToken);

      log(auth);
      final res = await _dataRepository.getInventoryDetailList(
        // facilityId: facilityId,
        // blockId: blockId,
        // categoryIds: categoryIds,
        id:id,
        isLoading: isLoading,
        auth: auth,
      );
      print('Inventory Detail List5: ${res.data}');

      if (!res.hasError) {
        var inventoryDetailList = inventoryDetailModelFromJson(res.data);
        return inventoryDetailList;
      }
      return [];
    } catch (error) {
      log(error.toString());

      return [];
    }
  }


  Future<List<EmployeeListModel>> getEmployeeList({
    required int? facility_id,
    // int? blockId,
    // required String categoryIds,
    required bool isLoading,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      log(auth);
      final res = await _dataRepository.getEmployeeList(
        facility_id: facility_id,
        isLoading: isLoading,
        auth: auth,
      );
      print('Employee List Data: ${res.data}');

      if (!res.hasError) {
        var employeeList = employeeListModelFromJson(res.data);
        return employeeList;
      }
      return [];
    } catch (error) {
      log(error.toString());
      return [];
    }
  }


   Future<List<EmployeeListModel>> getEmployeePermitList({
    required int? facility_id,
    // int? blockId,
    // required String categoryIds,
    required bool isLoading,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      log(auth);
      final res = await _dataRepository.getEmployeePermitList(
        facility_id: facility_id,
        isLoading: isLoading,
        auth: auth,
      );
      print('Employee List Data: ${res.data}');

      if (!res.hasError) {
        var employeeList = employeeListModelFromJson(res.data);
        return employeeList;
      }
      return [];
    } catch (error) {
      log(error.toString());
      return [];
    }
  }

   Future<List<EmployeeListModel>> getPermitIssuerList({
    required int? facility_id,
    // int? blockId,
    // required String categoryIds,
    required bool isLoading,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      log(auth);
      final res = await _dataRepository.getPermitIssuerList(
        facility_id: facility_id,
        isLoading: isLoading,
        auth: auth,
      );
      print('PermitIssuer List Data: ${res.data}');

      if (!res.hasError) {
        var permitIssuerList = employeeListModelFromJson(res.data);
        return permitIssuerList;
      }
      return [];
    } catch (error) {
      log(error.toString());
      return [];
    }
  }

  Future<List<EmployeeListModel2>> getPermitApproverList({
    required int? facility_id,
    // int? blockId,
    // required String categoryIds,
    required bool isLoading,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      log(auth);
      final res = await _dataRepository.getPermitApproverList(
        facility_id: facility_id,
        isLoading: isLoading,
        auth: auth,
      );
      print('PermitApprover List Data: ${res.data}');

      if (!res.hasError) {
        var permitApproverList = employeeListModel2FromJson(res.data);
        return permitApproverList;
      }
      return [];
    } catch (error) {
      log(error.toString());
      return [];
    }
  }


   Future<List<JobTypeListModel>> getJobTypePermitList({
    required int? facility_id,
    // int? blockId,
    // required String categoryIds,
    required bool isLoading,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      log(auth);
      final res = await _dataRepository.getJobTypePermitList(
        facility_id: facility_id,
        isLoading: isLoading,
        auth: auth,
      );
      print('Job Type List Data: ${res.data}');

      if (!res.hasError) {
        var jobTypeList = jobTypeListModelFromJson(res.data);
        return jobTypeList;
      }
      return [];
    } catch (error) {
      log(error.toString());
      return [];
    }
  }

  Future<List<SOPListModel>> getSopPermitList({
    required int? job_type_id,
    required bool isLoading,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      log(auth);
      final res = await _dataRepository.getSopPermitList(
        job_type_id: job_type_id,
        isLoading: isLoading,
        auth: auth,
      );
      print('SOP List Data: ${res.data}');

      if (!res.hasError) {
        var sopPermitList = sopListModelFromJson(res.data);
        return sopPermitList;
      }
      return [];
    } catch (error) {
      log(error.toString());
      return [];
    }
  }

   Future<List<CurrencyListModel>> getUnitCurrencyList({
    required int? facilityId,
    // int? blockId,
    // required String categoryIds,
    required bool isLoading,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      log(auth);
      final res = await _dataRepository.getUnitCurrencyList(
        facilityId: facilityId,
        isLoading: isLoading,
        auth: auth,
      );
      print('Unit Currency List Data: ${res.data}');

      if (!res.hasError) {
        var unitCurrencyList = currencyListModelFromJson(res.data);
        return unitCurrencyList;
      }
      return [];
    } catch (error) {
      log(error.toString());
      return [];
    }
  }

   Future<List<InventoryDetailModel?>?> getInventoryDetailList(
    String auth,
    int? id,
    bool? isLoading,
  ) async {
    try {
       final auth = await getSecuredValue(LocalKeys.authToken);

      log(auth);
      final res = await _dataRepository.getInventoryDetailList(
        // facilityId: facilityId,
        // blockId: blockId,
        // categoryIds: categoryIds,
        id:id,
        isLoading: isLoading,
        auth: auth,
      );
      print('Inventory Detail List5: ${res.data}');

      if (!res.hasError) {
        var inventoryDetailList = inventoryDetailModelFromJson(res.data);
        return inventoryDetailList;
      }
      return [];
    } catch (error) {
      log(error.toString());

      return [];
    }
  }


  Future<List<EmployeeListModel>> getEmployeeList({
    required int? facility_id,
    // int? blockId,
    // required String categoryIds,
    required bool isLoading,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      log(auth);
      final res = await _dataRepository.getEmployeeList(
        facility_id: facility_id,
        isLoading: isLoading,
        auth: auth,
      );
      print('Employee List Data: ${res.data}');

      if (!res.hasError) {
        var employeeList = employeeListModelFromJson(res.data);
        return employeeList;
      }
      return [];
    } catch (error) {
      log(error.toString());
      return [];
    }
  }


   Future<List<EmployeeListModel>> getEmployeePermitList({
    required int? facility_id,
    // int? blockId,
    // required String categoryIds,
    required bool isLoading,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      log(auth);
      final res = await _dataRepository.getEmployeePermitList(
        facility_id: facility_id,
        isLoading: isLoading,
        auth: auth,
      );
      print('Employee List Data: ${res.data}');

      if (!res.hasError) {
        var employeeList = employeeListModelFromJson(res.data);
        return employeeList;
      }
      return [];
    } catch (error) {
      log(error.toString());
      return [];
    }
  }

   Future<List<EmployeeListModel>> getPermitIssuerList({
    required int? facility_id,
    // int? blockId,
    // required String categoryIds,
    required bool isLoading,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      log(auth);
      final res = await _dataRepository.getPermitIssuerList(
        facility_id: facility_id,
        isLoading: isLoading,
        auth: auth,
      );
      print('PermitIssuer List Data: ${res.data}');

      if (!res.hasError) {
        var permitIssuerList = employeeListModelFromJson(res.data);
        return permitIssuerList;
      }
      return [];
    } catch (error) {
      log(error.toString());
      return [];
    }
  }

  Future<List<EmployeeListModel2>> getPermitApproverList({
    required int? facility_id,
    // int? blockId,
    // required String categoryIds,
    required bool isLoading,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      log(auth);
      final res = await _dataRepository.getPermitApproverList(
        facility_id: facility_id,
        isLoading: isLoading,
        auth: auth,
      );
      print('PermitApprover List Data: ${res.data}');

      if (!res.hasError) {
        var permitApproverList = employeeListModel2FromJson(res.data);
        return permitApproverList;
      }
      return [];
    } catch (error) {
      log(error.toString());
      return [];
    }
  }


   Future<List<JobTypeListModel>> getJobTypePermitList({
    required int? facility_id,
    // int? blockId,
    // required String categoryIds,
    required bool isLoading,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      log(auth);
      final res = await _dataRepository.getJobTypePermitList(
        facility_id: facility_id,
        isLoading: isLoading,
        auth: auth,
      );
      print('Job Type List Data: ${res.data}');

      if (!res.hasError) {
        var jobTypeList = jobTypeListModelFromJson(res.data);
        return jobTypeList;
      }
      return [];
    } catch (error) {
      log(error.toString());
      return [];
    }
  }

  Future<List<SOPListModel>> getSopPermitList({
    required int? job_type_id,
    required bool isLoading,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      log(auth);
      final res = await _dataRepository.getSopPermitList(
        job_type_id: job_type_id,
        isLoading: isLoading,
        auth: auth,
      );
      print('SOP List Data: ${res.data}');

      if (!res.hasError) {
        var sopPermitList = sopListModelFromJson(res.data);
        return sopPermitList;
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
        facilityId: facilityId,
        blockId: blockId,
        categoryIds: categoryIds,
        isLoading: isLoading,
        auth: auth,
      );
      // print('WarrantyClaim: ${res.data}');

      if (!res.hasError) {
        var warrantyClaimList = warrantyClaimModelFromJson(res.data);
        return warrantyClaimList;
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + 'getWarrantyClaimList');
        return [];
      }
    } catch (error) {
      print(error.toString());
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
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + 'getWorkTypeList');
        return [];
      }
    } catch (error) {
      print(error.toString());
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
      } else {
        Utility.showDialog(res.errorCode.toString() + 'getBlockList');
        return [];
      }
    } catch (error) {
      print(error.toString());
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
      } else {
        Utility.showDialog(res.errorCode.toString() + 'getEquipmentList');
        return [];
      }
    } catch (error) {
      print(error.toString());
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
      //print({"userdatatat", userAccess.user_id});
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
        // print(_jobModelList.runtimeType);

        return _jobModelList;
      } else {
        Utility.showDialog(res.errorCode.toString() + 'getJobList');
        return [];
      }
    } catch (error) {
      print(error.toString());

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
      final res = await _dataRepository.getNewPermitList(
        auth: auth,
        // facilityId: 45,
        // userId: 33,
        isLoading: isLoading ?? false,
      );
      if (!res.hasError) {
        final jsonNewPermitListModels = jsonDecode(res.data);
        final List<NewPermitListModel> _newPermitModelList =
            jsonNewPermitListModels
                .map<NewPermitListModel>((m) =>
                    NewPermitListModel.fromJson(Map<String, dynamic>.from(m)))
                .toList();

        return _newPermitModelList;
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + 'getNewPermitList');
        return [];
      }
    } catch (error) {
      print(error.toString());

      return [];
    }
  }

  Future<void> permitIssueButton(
    String? comment,
    String? employee_id,
    String? id,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      final res = await _dataRepository.permitIssueButton(
        auth: auth,
       comment: comment,
       id: id,
       employee_id: employee_id,
        isLoading: isLoading ?? false,
      );

      if (!res.hasError) {


      //  return _permitIssueModel;
      } else {
        Utility.showDialog('Something Went Wrong!!');
      }
    } catch (error) {
      print(error.toString());

    }
  }


  // Future<List<NewPermitListModel>> getNewPermitList({
  //   required int? facilityId,
  //   // int? blockId,
  //   // required String categoryIds,
  //   required int? userId,
  //   required bool isLoading,
  // }) async {
  //   try {
  //     final auth = await getSecuredValue(LocalKeys.authToken);
  //     int userId = varUserAccessModel.value.user_id ?? 0;

  //     log(auth);
  //     final res = await _dataRepository.getNewPermitList(
  //       facilityId: facilityId,
  //       userId: 33,
  //       // blockId: blockId,
  //       // categoryIds: categoryIds,
  //       isLoading: isLoading,
  //       auth: auth,
  //     );
  //     print('NewPermitResponseData: ${res.data}');

  //     if (!res.hasError) {
  //       var newPermitList = newPermitListFromJson(res.data);
  //       return newPermitList;
  //     }
  //     return [];
  //   } catch (error) {
  //     log(error.toString());
  //     return [];
  //   }
  // }

  Future<void> permitIssueButton(
    String? comment,
    String? employee_id,
    String? id,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      final res = await _dataRepository.permitIssueButton(
        auth: auth,
       comment: comment,
       id: id,
       employee_id: employee_id,
        isLoading: isLoading ?? false,
      );

      if (!res.hasError) {


      //  return _permitIssueModel;
      } else {
        Utility.showDialog('Something Went Wrong!!');
      }
    } catch (error) {
      print(error.toString());

    }
  }


  // Future<List<NewPermitListModel>> getNewPermitList({
  //   required int? facilityId,
  //   // int? blockId,
  //   // required String categoryIds,
  //   required int? userId,
  //   required bool isLoading,
  // }) async {
  //   try {
  //     final auth = await getSecuredValue(LocalKeys.authToken);
  //     int userId = varUserAccessModel.value.user_id ?? 0;

  //     log(auth);
  //     final res = await _dataRepository.getNewPermitList(
  //       facilityId: facilityId,
  //       userId: 33,
  //       // blockId: blockId,
  //       // categoryIds: categoryIds,
  //       isLoading: isLoading,
  //       auth: auth,
  //     );
  //     print('NewPermitResponseData: ${res.data}');

  //     if (!res.hasError) {
  //       var newPermitList = newPermitListFromJson(res.data);
  //       return newPermitList;
  //     }
  //     return [];
  //   } catch (error) {
  //     log(error.toString());
  //     return [];
  //   }
  // }

  Future<void> permitIssueButton(
    String? comment,
    String? employee_id,
    String? id,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      final res = await _dataRepository.permitIssueButton(
        auth: auth,
       comment: comment,
       id: id,
       employee_id: employee_id,
        isLoading: isLoading ?? false,
      );

      if (!res.hasError) {


      //  return _permitIssueModel;
      } else {
        Utility.showDialog('Something Went Wrong!!');
      }
    } catch (error) {
      print(error.toString());

    }
  }


  // Future<List<NewPermitListModel>> getNewPermitList({
  //   required int? facilityId,
  //   // int? blockId,
  //   // required String categoryIds,
  //   required int? userId,
  //   required bool isLoading,
  // }) async {
  //   try {
  //     final auth = await getSecuredValue(LocalKeys.authToken);
  //     int userId = varUserAccessModel.value.user_id ?? 0;

  //     log(auth);
  //     final res = await _dataRepository.getNewPermitList(
  //       facilityId: facilityId,
  //       userId: 33,
  //       // blockId: blockId,
  //       // categoryIds: categoryIds,
  //       isLoading: isLoading,
  //       auth: auth,
  //     );
  //     print('NewPermitResponseData: ${res.data}');

  //     if (!res.hasError) {
  //       var newPermitList = newPermitListFromJson(res.data);
  //       return newPermitList;
  //     }
  //     return [];
  //   } catch (error) {
  //     log(error.toString());
  //     return [];
  //   }
  // }

  Future<List<PermitIssueModel?>?> getPermitIssueButton(
    String auth,
    String? comment,
    int? employee_id,
    int? id,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      // final newPermitListData =
      //     await getNewPermitAccessData(LocalKeys.userAccess);
      // final newPermitModelList = jsonDecode(newPermitListData);
      // var newPermitList = NewPermitListModel.fromJson(newPermitModelList);
      // int permitId = newPermitList.permitId ?? 0;
      // print({"NewPermitList:", newPermitList.permitId});
      // final userAcessData = await getUserAccessData(LocalKeys.userAccess);
      // final userAccessModelList = jsonDecode(userAcessData);
      // var userAccess = AccessListModel.fromJson(userAccessModelList);
      // int userId = userAccess.user_id ?? 0;
      // int userId = varUserAccessModel.value.user_id ?? 0;

      final res = await _dataRepository.getPermitIssueButton(
        auth: auth,
        comment: comment,
        employee_id: employee_id,
        id: id,
        // userId: 33,
        isLoading: isLoading ?? false,
      );
      print('PermitIssuerResponse5: ${res.data}');

      if (!res.hasError) {
        final jsonPermitIssueModels = jsonDecode(res.data);
        final List<PermitIssueModel> _permitIssueModel =
            jsonPermitIssueModels
                .map<PermitIssueModel>((m) =>
                    PermitIssueModel.fromJson(Map<String, dynamic>.from(m)))
                .toList();
        // var newPermitList = newPermitListFromJson(res.data);
        // print('Permit Data:${newPermitList}');

        // return newPermitList;

        return _permitIssueModel;
      } else {
        Utility.showDialog('Something Went Wrong!!');
        return [];
      }
    } catch (error) {
      log(error.toString());

      return [];
    }
  }


  // Future<List<NewPermitListModel>> getNewPermitList({
  //   required int? facilityId,
  //   // int? blockId,
  //   // required String categoryIds,
  //   required int? userId,
  //   required bool isLoading,
  // }) async {
  //   try {
  //     final auth = await getSecuredValue(LocalKeys.authToken);
  //     int userId = varUserAccessModel.value.user_id ?? 0;

  //     log(auth);
  //     final res = await _dataRepository.getNewPermitList(
  //       facilityId: facilityId,
  //       userId: 33,
  //       // blockId: blockId,
  //       // categoryIds: categoryIds,
  //       isLoading: isLoading,
  //       auth: auth,
  //     );
  //     print('NewPermitResponseData: ${res.data}');

  //     if (!res.hasError) {
  //       var newPermitList = newPermitListFromJson(res.data);
  //       return newPermitList;
  //     }
  //     return [];
  //   } catch (error) {
  //     log(error.toString());
  //     return [];
  //   }
  // }

  Future<List<FacilityModel?>?> getFacilityList(bool? isLoading) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
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
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + 'getFacilityList');
        return null;
      }
    } catch (error) {
      print(error.toString());

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
        return _typePermitModelList;
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + 'getTypePermitList');
        return null;
      }
    } catch (error) {
      print(error.toString());

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
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + 'getBlocksList');
        return null;
      }
    } catch (error) {
      print(error.toString());
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
      } //
      else {
        Utility.showDialog(
            res.errorCode.toString() + 'getInventoryCategoryList');
        return null;
      }
    } catch (error) {
      print(error.toString());

      return [];
    }
  }



   Future<List<InventoryCategoryModel?>?> getInventoryIsolationList(
    String? auth,
    int? facilityId,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getInventoryIsolationList(
        auth: auth,
        isLoading: isLoading,
        facilityId: facilityId,
      );

      if (!res.hasError) {
        final jsonInventoryIsolationModels = jsonDecode(res.data);
        final List<InventoryCategoryModel> _inventoryIsolationModelList =
            jsonInventoryIsolationModels
                .map<InventoryCategoryModel>(
                  (m) => InventoryCategoryModel.fromJson(
                    Map<String, dynamic>.from(m),
                  ),
                )
                .toList();

        return _inventoryIsolationModelList;
      } else {
        Utility.showDialog('Something Went Wrong!!');
        return null;
      }
    } catch (error) {
      log(error.toString());

      return [];
    }
  }



   Future<List<InventoryCategoryModel?>?> getInventoryIsolationList(
    String? auth,
    int? facilityId,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getInventoryIsolationList(
        auth: auth,
        isLoading: isLoading,
        facilityId: facilityId,
      );

      if (!res.hasError) {
        final jsonInventoryIsolationModels = jsonDecode(res.data);
        final List<InventoryCategoryModel> _inventoryIsolationModelList =
            jsonInventoryIsolationModels
                .map<InventoryCategoryModel>(
                  (m) => InventoryCategoryModel.fromJson(
                    Map<String, dynamic>.from(m),
                  ),
                )
                .toList();

        return _inventoryIsolationModelList;
      } else {
        Utility.showDialog('Something Went Wrong!!');
        return null;
      }
    } catch (error) {
      log(error.toString());

      return [];
    }
  }

   Future<List<InventoryModel?>?> getInventoryEquipmentNameList(
     {required bool isLoading,
     int? facilityId,
     int? blockId,
     required String categoryIds}
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getInventoryEquipmentNameList(
      isLoading: isLoading,
      facilityId: facilityId,
      blockId: blockId,
      categoryIds: categoryIds,
      auth: auth
      );

      if (!res.hasError) {
        final jsonInventoryNameModels = jsonDecode(res.data);
        final List<InventoryModel> _inventoryNameModelList =
            jsonInventoryNameModels
                .map<InventoryModel>(
                  (m) => InventoryModel.fromJson(
                    Map<String, dynamic>.from(m),
                  ),
                )
                .toList();

        return _inventoryNameModelList;
      } else {
        Utility.showDialog('Something Went Wrong!!');
        return null;
      }
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

   Future<List<InventoryModel?>?> getInventoryEquipmentNameList(
     {required bool isLoading,
     int? facilityId,
     int? blockId,
     required String categoryIds}
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getInventoryEquipmentNameList(
      isLoading: isLoading,
      facilityId: facilityId,
      blockId: blockId,
      categoryIds: categoryIds,
      auth: auth
      );

      if (!res.hasError) {
        final jsonInventoryNameModels = jsonDecode(res.data);
        final List<InventoryModel> _inventoryNameModelList =
            jsonInventoryNameModels
                .map<InventoryModel>(
                  (m) => InventoryModel.fromJson(
                    Map<String, dynamic>.from(m),
                  ),
                )
                .toList();

        return _inventoryNameModelList;
      } else {
        Utility.showDialog('Something Went Wrong!!');
        return null;
      }
    } catch (error) {
      print(error.toString());

      return [];
    }
  }



   Future<List<InventoryCategoryModel?>?> getInventoryIsolationList(
    String? auth,
    int? facilityId,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getInventoryIsolationList(
        auth: auth,
        isLoading: isLoading,
        facilityId: facilityId,
      );

      if (!res.hasError) {
        final jsonInventoryIsolationModels = jsonDecode(res.data);
        final List<InventoryCategoryModel> _inventoryIsolationModelList =
            jsonInventoryIsolationModels
                .map<InventoryCategoryModel>(
                  (m) => InventoryCategoryModel.fromJson(
                    Map<String, dynamic>.from(m),
                  ),
                )
                .toList();

        return _inventoryIsolationModelList;
      } else {
        Utility.showDialog('Something Went Wrong!!');
        return null;
      }
    } catch (error) {
      log(error.toString());

      return [];
    }
  }



   Future<List<InventoryCategoryModel?>?> getInventoryIsolationList(
    String? auth,
    int? facilityId,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getInventoryIsolationList(
        auth: auth,
        isLoading: isLoading,
        facilityId: facilityId,
      );

      if (!res.hasError) {
        final jsonInventoryIsolationModels = jsonDecode(res.data);
        final List<InventoryCategoryModel> _inventoryIsolationModelList =
            jsonInventoryIsolationModels
                .map<InventoryCategoryModel>(
                  (m) => InventoryCategoryModel.fromJson(
                    Map<String, dynamic>.from(m),
                  ),
                )
                .toList();

        return _inventoryIsolationModelList;
      } else {
        Utility.showDialog('Something Went Wrong!!');
        return null;
      }
    } catch (error) {
      log(error.toString());

      return [];
    }
  }

   Future<List<InventoryModel?>?> getInventoryEquipmentNameList(
     {required bool isLoading,
     int? facilityId,
     int? blockId,
     required String categoryIds}
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getInventoryEquipmentNameList(
      isLoading: isLoading,
      facilityId: facilityId,
      blockId: blockId,
      categoryIds: categoryIds,
      auth: auth
      );

      if (!res.hasError) {
        final jsonInventoryNameModels = jsonDecode(res.data);
        final List<InventoryModel> _inventoryNameModelList =
            jsonInventoryNameModels
                .map<InventoryModel>(
                  (m) => InventoryModel.fromJson(
                    Map<String, dynamic>.from(m),
                  ),
                )
                .toList();

        return _inventoryNameModelList;
      } else {
        Utility.showDialog('Something Went Wrong!!');
        return null;
      }
    } catch (error) {
      log(error.toString());

      return [];
    }
  }

   Future<List<InventoryModel?>?> getInventoryEquipmentNameList(
     {required bool isLoading,
     int? facilityId,
     int? blockId,
     required String categoryIds}
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getInventoryEquipmentNameList(
      isLoading: isLoading,
      facilityId: facilityId,
      blockId: blockId,
      categoryIds: categoryIds,
      auth: auth
      );

      if (!res.hasError) {
        final jsonInventoryNameModels = jsonDecode(res.data);
        final List<InventoryModel> _inventoryNameModelList =
            jsonInventoryNameModels
                .map<InventoryModel>(
                  (m) => InventoryModel.fromJson(
                    Map<String, dynamic>.from(m),
                  ),
                )
                .toList();

        return _inventoryNameModelList;
      } else {
        Utility.showDialog('Something Went Wrong!!');
        return null;
      }
    } catch (error) {
      print(error.toString());
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
        isLoading: isLoading ?? false,
      );

      if (!res.hasError) {
        final jsonFrequencyModels = jsonDecode(res.data);
        final List<FrequencyModel> _frequencyModelList = jsonFrequencyModels
            .map<FrequencyModel>(
              (m) => FrequencyModel.fromJson(Map<String, dynamic>.from(m)),
            )
            .toList();

        return _frequencyModelList;
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + 'getFrequencyList');
        return null;
      }
    } catch (error) {
      print(error.toString());
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
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + 'getJobDetails');
        return [];
      }
    } catch (error) {
      print(error.toString());
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
        Utility.showDialog(res.errorCode.toString() + 'getAssignedToList');
        return null;
      }
    } catch (error) {
      print(error.toString());
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
      } //
      else {
        Utility.showDialog(
            res.errorCode.toString() + 'getToolsRequiredToWorkTypeList');
        return null;
      }
    } //
    catch (error) {
      print(error.toString());
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

      if (!res.hasError) {
        if (res.errorCode == 200) {
          var responseMap = json.decode(res.data);
          return responseMap;
        }
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + 'saveJob');
        return Map();
      }
      return Map();
    } //
    catch (error) {
      print(error.toString());
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
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + 'getUserAccessList');
        return null;
      }
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  Future<bool> createCheckListNumber(
      {bool? isLoading, checklistJsonString}) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.createCheckList(
          auth: auth,
          isLoading: isLoading,
          checklistJsonString: checklistJsonString);

      if (!res.hasError) {
        return true;
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + 'createCheckListNumber');
        return false;
      }
    } catch (error) {
      print(error.toString());
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
        if (res.errorCode == 200) {
          final jsonPreventiveCheckListModelModels = jsonDecode(res.data);
          // print(res.data);
          final List<PreventiveCheckListModel> _PreventiveCheckListModelList =
              jsonPreventiveCheckListModelModels
                  .map<PreventiveCheckListModel>((m) =>
                      PreventiveCheckListModel.fromJson(
                          Map<String, dynamic>.from(m)))
                  .toList();

          return _PreventiveCheckListModelList;
        }
      } else {
        Utility.showDialog(res.errorCode.toString() + 'getPreventiveCheckList');
        return [];
      }
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

  Future<List<CheckPointModel?>?> getCheckPointlist(
    int? selectedchecklistId,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      //print({"checkid", selectedchecklistId});
      final res = await _dataRepository.getCheckPointlist(
        auth: auth,
        selectedchecklistId: selectedchecklistId ?? 0,
        isLoading: isLoading ?? false,
      );
      //print({"checkpoint list", res.data});
      if (!res.hasError) {
        final jsonPreventiveCheckPointModels = jsonDecode(res.data);

        final List<CheckPointModel> _PreventiveCheckPointList =
            jsonPreventiveCheckPointModels
                .map<CheckPointModel>((m) =>
                    CheckPointModel.fromJson(Map<String, dynamic>.from(m)))
                .toList();

        return _PreventiveCheckPointList;
      } else {
        Utility.showDialog(res.errorCode.toString() + 'getCheckPointlist');
        return [];
      }
    } catch (error) {
      print(error.toString());
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

      if (!res.hasError) {
        return true;
      } else {
        Utility.showDialog(res.errorCode.toString() + 'getCheckPointlist');
        return true;
      }
    } catch (error) {
      print(error.toString());
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
        Utility.showDialog(res.errorCode.toString() + 'uploadFiles');
      }
      return Map();
    } //
    catch (error) {
      print(error.toString());
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
        Utility.showDialog(res.errorCode.toString() + 'getJobCardDetails');
        return null;
      }
    } catch (error) {
      print(error.toString());

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
        Utility.showDialog(res.errorCode.toString() + 'createJobCard');
      }
      return Map();
    } catch (error) {
      print(error.toString());
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
        Utility.showDialog(res.errorCode.toString() + 'getPermitDetails');
        return null;
      }
    } //
    catch (error) {
      print(error.toString());
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
        Utility.showDialog(res.errorCode.toString());
        return null;
      }
    } catch (error) {
      print(error.toString());
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
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + 'updateJobCard');
      }
      return Map();
    } //
    catch (error) {
      print(error.toString());
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
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + 'approveJobCard');
      }
      return Map();
    } catch (error) {
      print(error.toString());
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
      print(error.toString());
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
        Utility.showDialog(res.errorCode.toString() + 'getHistory');
        return null;
      }
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

  Future<void> deleteCkeckpoint(Object check_point_id, bool isLoading) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.deleteCkeckpoint(
        auth: auth,
        check_point_id: check_point_id,
        isLoading: isLoading,
      );

      if (!res.hasError) {
        //get delete response back from API
      } else {
        Utility.showDialog(res.errorCode.toString() + 'deleteCkeckpoint');
      }
    } catch (error) {
      print(error.toString());
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
      if (!res.hasError) {
        final jsonPmMappingListModels = jsonDecode(res.data);
        final List<PmMappingListModel> _pmMappingListModel =
            jsonPmMappingListModels
                .map<PmMappingListModel>((m) =>
                    PmMappingListModel.fromJson(Map<String, dynamic>.from(m)))
                .toList();
        return _pmMappingListModel;
      } else {
        Utility.showDialog(res.errorCode.toString() + 'getPmMappingList');
        return [];
      }
    } catch (error) {
      print(error.toString());
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
      if (!res.hasError) {
        if (res.errorCode == 200) {
          var responseMap = json.decode(res.data);
          return responseMap;
        }
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + 'savePmMapping');
      }
      return Map();
    } catch (error) {
      print(error.toString());
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
        Utility.showDialog(res.errorCode.toString() + 'getCalibrationList');
        return [];
      }
    } catch (error) {
      print(error.toString());

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

  Future<List<GetPmScheduleListModel?>?> getPMScheduleData(
    int? selectedEquipmentId,
    int? facilityId,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getPMScheduleData(
        auth: auth,
        facilityId: facilityId ?? 0,
        selectedEquipmentId: selectedEquipmentId,
        isLoading: isLoading ?? false,
      );

      if (!res.hasError) {
        final jsonSetPmSchedultModels = jsonDecode(res.data);
        // print(res.data);
        final List<GetPmScheduleListModel> _setPmSchedultModelList =
            jsonSetPmSchedultModels
                .map<GetPmScheduleListModel>((m) =>
                    GetPmScheduleListModel.fromJson(
                        Map<String, dynamic>.from(m)))
                .toList();

        return _setPmSchedultModelList;
      } else {
        Utility.showDialog(res.errorCode.toString() + 'getPMScheduleData');
        return [];
      }
    } catch (error) {
      print(error.toString());

      return [];
    }
  }

  Future<List<dynamic>> savePmSchedule(
    pmScheduleJsonString,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.savePmSchedule(
        auth: auth,
        pmScheduleJsonString: pmScheduleJsonString,
        isLoading: isLoading ?? false,
      );
      if (!res.hasError) {
        if (res.errorCode == 200) {
          var responseMap = json.decode(res.data);
          return responseMap;
        }
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + 'savePmSchedule');
      }
      return [];
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

  ///
}
