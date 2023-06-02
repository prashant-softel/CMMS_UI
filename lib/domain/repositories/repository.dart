import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:cmms/app/utils/utils.dart';
import 'package:cmms/app/utils/utility.dart';
import 'package:cmms/app/widgets/warranty_claim_error_dialog.dart';
import 'package:cmms/data/data.dart';
import 'package:cmms/device/device.dart';
import 'package:cmms/domain/models/business_list_model.dart';
import 'package:cmms/domain/models/calibration_list_model.dart';
import 'package:cmms/domain/models/checkpoint_list_model.dart';
import 'package:cmms/domain/models/country_model.dart';
import 'package:cmms/domain/models/create_sop_model.dart';
import 'package:cmms/domain/models/currency_list_model.dart';
import 'package:cmms/domain/models/employee_list_model.dart';
import 'package:cmms/domain/models/employee_list_model2.dart';
import 'package:cmms/domain/models/employee_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/models/inventory_detail_model.dart';
import 'package:cmms/domain/models/inventory_model2.dart';
import 'package:cmms/domain/models/job_type_list_model.dart';
import 'package:cmms/domain/models/manufacturer_model.dart';
import 'package:cmms/domain/models/models.dart';
import 'package:cmms/domain/models/new_permit_details_model.dart';
import 'package:cmms/domain/models/new_permit_list_model.dart';
import 'package:cmms/domain/models/pm_task_model.dart';
import 'package:cmms/domain/models/pm_task_view_list_model.dart';
import 'package:cmms/domain/models/preventive_checklist_model.dart';
import 'package:cmms/domain/models/safety_measure_list_model.dart';
import 'package:cmms/domain/models/sop_list_model.dart';
import 'package:cmms/domain/models/asset_type_list_model.dart';
import 'package:cmms/domain/models/facility_type_list_model.dart';
import 'package:cmms/domain/models/block_type_list_model.dart';
import 'package:cmms/domain/models/set_pm_schedule_model.dart';
import 'package:cmms/domain/models/supplier_name_model.dart';
import 'package:cmms/domain/models/tools_model.dart';
import 'package:cmms/domain/models/type_permit_model.dart';
import 'package:cmms/domain/models/user_detail_model.dart';
import 'package:cmms/domain/models/view_warranty_claim_model.dart';
import 'package:cmms/domain/models/warranty_claim_model.dart';
import 'package:cmms/domain/models/warranty_type_model.dart';
import 'package:cmms/domain/models/warranty_usage_term_list_model.dart';
import 'package:cmms/domain/models/work_type_model.dart';
import 'package:cmms/domain/repositories/repositories.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:get/get.dart';
// import 'package:mixpanel_flutter/mixpanel_flutter.dart';
import '../../app/navigators/app_pages.dart';
import '../models/SPV_list_model.dart';
import '../models/access_level_model.dart';
import '../models/blood_model.dart';
import '../models/city_model.dart';
import '../models/frequency_model.dart';
import '../models/inventory_status_list_model.dart';
import '../models/inventory_type_list_model.dart';
import '../models/job_card_details_model.dart';
import '../models/modulelist_model.dart';
import '../models/permit_details_model.dart';
import '../models/pm_mapping_list_model.dart';
import '../models/role_model.dart';
import '../models/state.dart';
import '../models/user_access_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../models/user_list_model.dart';

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

      var resourceData = res.data;
      // var parsedJson = json.decode(resourceData);
      print('Response Create Permit: ${resourceData}');
      // Get.dialog(
      //   CreateNewPermitDialog(
      //     createPermitData: 'Dialog Title',
      //     data: parsedJson['message'],
      //   ),
      // );

      // data = res.data;
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

  //Update New Permit
  Future<Map<String, dynamic>> updateNewPermit(
    newPermit,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.updateNewPermit(
        auth: auth,
        newPermit: newPermit,
        isLoading: isLoading ?? false,
      );

      var resourceData = res.data;
      // var parsedJson = json.decode(resourceData);
      print('Response Update Permit: ${resourceData}');
      // Get.dialog(
      //   CreateNewPermitDialog(
      //     createPermitData: 'Dialog Title',
      //     data: parsedJson['message'],
      //   ),
      // );

      // data = res.data;
      //print('Response Create Permit: ${data}');

      if (!res.hasError) {
        if (res.errorCode == 200) {
          var responseMap = json.decode(res.data);
          return responseMap;
        }
      } else {
        Utility.showDialog(res.errorCode.toString() + 'updateNewPermit');
        //return '';
      }
      return Map();
    } catch (error) {
      print(error.toString());
      return Map();
    }
  }

  //Create SOP
  Future<Map<String, dynamic>> createSOP(
    createSop,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.createSOP(
        auth: auth,
        createSop: createSop,
        isLoading: isLoading ?? false,
      );

      var resourceData = res.data;
      // var parsedJson = json.decode(resourceData);
      print('Response Create SOp: ${resourceData}');
      // Get.dialog(
      //   CreateNewPermitDialog(
      //     createPermitData: 'Dialog Title',
      //     data: parsedJson['message'],
      //   ),
      // );

      // data = res.data;
      //print('Response Create Permit: ${data}');

      if (!res.hasError) {
        if (res.errorCode == 200) {
          var responseMap = json.decode(res.data);
          return responseMap;
        }
      } else {
        Utility.showDialog(res.errorCode.toString() + 'createSOP');
        //return '';
      }
      return Map();
    } catch (error) {
      print(error.toString());
      return Map();
    }
  }

  //Create Warranty claim
  Future<Map<String, dynamic>> createWarrantyClaim(
    createWarrantyClaim,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.createWarrantyClaim(
        auth: auth,
        createWarrantyClaim: createWarrantyClaim,
        isLoading: isLoading ?? false,
      );

      var resourceData = res.data;
      // var parsedJson = json.decode(resourceData);
      print('Response Create Warranty Claim: ${resourceData}');
      // Get.dialog(
      //   CreateNewPermitDialog(
      //     createPermitData: 'Dialog Title',
      //     data: parsedJson['message'],
      //   ),
      // );

      // data = res.data;
      //print('Response Create Permit: ${data}');

      if (!res.hasError) {
        if (res.errorCode == 200) {
          var responseMap = json.decode(res.data);
          return responseMap;
        } else {
          Get.dialog<void>(WarrantyClaimErrorDialog());
        }
      } else {
        Utility.showDialog(res.errorCode.toString() + 'createWarrantyClaim');
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

  // Mixpanel? mixPanel;

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

  Future<List<InventoryModel2>> getAffectedPartList({
    required int? facilityId,
    int? blockId,
    String? categoryIds,
    required bool isLoading,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getAffectedPartList(
        facilityId: facilityId,
        blockId: blockId,
        categoryIds: categoryIds,
        isLoading: isLoading,
        auth: auth,
      );
      // print('Inventory List Data: ${res.data}');

      if (!res.hasError) {
        var affectedPartList = inventoryModel2FromJson(res.data);
        return affectedPartList;
      }
//
      else {
        Utility.showDialog(res.errorCode.toString() + 'getAffectedPartList');
        return [];
      }
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

  Future<List<BusinessListModel>> getBusinessList({
    required int? businessType,
    // int? blockId,
    // required String categoryIds,
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

  Future<List<ManufacturerModel>> getmanufacturerList({
    required int? BusinessType,
    required bool isLoading,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getmanufacturerList(
        BusinessType: BusinessType,
        isLoading: isLoading,
        auth: auth,
      );
      if (!res.hasError) {
        var businessList = manufacturerListModelFromJson(res.data);
        return businessList;
      }
//
      else {
        Utility.showDialog(res.errorCode.toString() + 'manufacturerList');
        return [];
      }
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

  Future<List<SupplierNameModel>> getSupplierList({
    required int? BusinessType,
    required bool isLoading,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getSupplierList(
        BusinessType: BusinessType,
        isLoading: isLoading,
        auth: auth,
      );
      if (!res.hasError) {
        var businessList = supplierNameListModelFromJson(res.data);
        return businessList;
      }
//
      else {
        Utility.showDialog(res.errorCode.toString() + 'manufacturerList');
        return [];
      }
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

  Future<NewPermitDetailModel?> getViewPermitDetail({
    bool? isLoading,
    int? permitId,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getViewPermitDetail(
        auth: auth,
        permitId: permitId,
        isLoading: isLoading ?? false,
      );

      print({"Viewpermitdetail", res.data});

      if (!res.hasError) {
        if (res.errorCode == 200) {
          final NewPermitDetailModel _viewPermitDetailModel =
              newPermitDetailModelFromJson(res.data);

          var responseMap = _viewPermitDetailModel;
          print({"ViewResponseData", responseMap});
          return responseMap;
        }
      } else {
        Utility.showDialog(res.errorCode.toString() + 'createNewPermit');
        //return '';
      }
      return null;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  Future<ViewWarrantyClaimModel?> getViewWarrantyClaimDetail({
    bool? isLoading,
    int? wc_id,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getViewWarrantyClaimDetail(
        auth: auth,
        wc_id: wc_id,
        isLoading: isLoading ?? false,
      );

      print({"ViewWarrantyClaimdetail", res.data});

      if (!res.hasError) {
        if (res.errorCode == 200) {
          final ViewWarrantyClaimModel _viewWarrantyClaimDetailModel =
              viewWarrantyClaimDetailModelFromJson(res.data);

          var responseMap = _viewWarrantyClaimDetailModel;
          print({"ViewWarrantyResponseData", responseMap});
          return responseMap;
        }
      } else {
        Utility.showDialog(res.errorCode.toString() + 'WarrantyClaimDetail');
        //return '';
      }
      return null;
    } catch (error) {
      print(error.toString());
      return null;
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
        id: id,
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

  Future<List<AssetTypeListModel>> getAssetTypeList({
    required int? job_type_id,
    required bool isLoading,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      log(auth);
      final res = await _dataRepository.getAssetTypeList(
        job_type_id: job_type_id,
        isLoading: isLoading,
        auth: auth,
      );
      print('Asset type List Data: ${res.data}');

      if (!res.hasError) {
        var assetTypeList = assetTypeListModelFromJson(res.data);
        return assetTypeList;
      }
      return [];
    } catch (error) {
      log(error.toString());
      return [];
    }
  }

  Future<List<FacilityTypeListModel>> getFacilityTypeList({
    required int? job_type_id,
    required bool isLoading,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      log(auth);
      final res = await _dataRepository.getFacilityTypeList(
        job_type_id: job_type_id,
        isLoading: isLoading,
        auth: auth,
      );
      print('Asset type List Data: ${res.data}');

      if (!res.hasError) {
        var facilityTypeList = FacilityTypeListModelFromJson(res.data);
        return facilityTypeList;
      }
      return [];
    } catch (error) {
      log(error.toString());
      return [];
    }
  }

  Future<List<SPVListModel>> getSPVList({
    required int? job_type_id,
    required bool isLoading,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      log(auth);
      final res = await _dataRepository.getSPVList(
        job_type_id: job_type_id,
        isLoading: isLoading,
        auth: auth,
      );
      print('Asset type List Data: ${res.data}');

      if (!res.hasError) {
        var facilityTypeList = SPVListModelFromJson(res.data);
        return facilityTypeList;
      }
      return [];
    } catch (error) {
      log(error.toString());
      return [];
    }
  }

  Future<List<BlockTypeListModel>> getBlockTypeList({
    required int? job_type_id,
    required bool isLoading,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      log(auth);
      final res = await _dataRepository.getBlockTypeList(
        job_type_id: job_type_id,
        isLoading: isLoading,
        auth: auth,
      );
      print('Asset type List Data: ${res.data}');

      if (!res.hasError) {
        var blockTypeList = BlockTypeListModelFromJson(res.data);
        return blockTypeList;
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

  Future<List<NewPermitModel?>?> getNewPermitList(
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

      final res = await _dataRepository.getNewPermitList(
        auth: auth,
        // facilityId: 45,
        // userId: 33,
        facilityId: facilityId,
        userId: userId,
        // userId: 33,
        isLoading: isLoading ?? false,
      );
      if (!res.hasError) {
        final jsonNewPermitListModels = jsonDecode(res.data);
        final List<NewPermitModel> _newPermitModelList = jsonNewPermitListModels
            .map<NewPermitModel>(
                (m) => NewPermitModel.fromJson(Map<String, dynamic>.from(m)))
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
      print('PermitIssuerResponse5: ${res.data}');

      if (!res.hasError) {
        //  return _permitIssueModel;
      } else {
        Utility.showDialog('Something Went Wrong!!');
      }
    } catch (error) {
      log(error.toString());
    }
  }

  Future<void> permitApprovedButton(
    String? comment,
    String? employee_id,
    String? id,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      final res = await _dataRepository.permitApprovedButton(
        auth: auth,
        comment: comment,
        id: id,
        employee_id: employee_id,
        isLoading: isLoading ?? false,
      );
      print('PermitApprovedResponse5: ${res.data}');

      if (!res.hasError) {
        //  return _permitIssueModel;
      } else {
        Utility.showDialog(res.errorCode.toString() + 'permitIssueButton');
      }
    } catch (error) {
      log(error.toString());
    }
  }

  Future<void> permitCancelButton(
    String? comment,
    String? id,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      final res = await _dataRepository.permitCancelButton(
        auth: auth,
        comment: comment,
        id: id,
        isLoading: isLoading ?? false,
      );
      print('PermitCancelResponse: ${res.data}');

      if (!res.hasError) {
        //  return _permitIssueModel;
      } else {
        Utility.showDialog(res.errorCode.toString() + 'permitCancelButton');
      }
    } catch (error) {
      log(error.toString());
    }
  }

  Future<void> permitCloseButton(
    String? comment,
    String? id,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      final res = await _dataRepository.permitCloseButton(
        auth: auth,
        comment: comment,
        id: id,
        isLoading: isLoading ?? false,
      );
      print('PermitCloseResponse55: ${res.data}');

      if (!res.hasError) {
        //  return _permitIssueModel;
      } else {
        Utility.showDialog(res.errorCode.toString() + 'permitCloseButton');
      }
    } catch (error) {
      log(error.toString());
    }
  }

  Future<void> permitRejectButton(
    String? comment,
    String? id,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      final res = await _dataRepository.permitRejectButton(
        auth: auth,
        comment: comment,
        id: id,
        isLoading: isLoading ?? false,
      );
      print('PermitRejectResponse55: ${res.data}');

      if (!res.hasError) {
        //  return _permitIssueModel;
      } else {
        Utility.showDialog(res.errorCode.toString() + 'permitRejectButton');
      }
    } catch (error) {
      log(error.toString());
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
        Utility.showDialog(
            res.errorCode.toString() + 'getInventoryIsolationList');
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
      required String categoryIds}) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getInventoryEquipmentNameList(
          isLoading: isLoading,
          facilityId: facilityId,
          blockId: blockId,
          categoryIds: categoryIds,
          auth: auth);

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
        Utility.showDialog(
            res.errorCode.toString() + 'getInventoryEquipmentNameList');
        return null;
      }
    } catch (error) {
      log(error.toString());

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

      final res = await _dataRepository.getJobDetails(
        auth: auth,
        jobId: jobId,
        userId: userId,
        isLoading: isLoading,
      );

      if (!res.hasError) {
        final _jsonJobDetailsModel = jobDetailsModelFromJson(res.data);

        List<JobDetailsModel> _jobDetailsModelList = [];
        _jobDetailsModelList.add(_jsonJobDetailsModel);
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

  Future<List<NewPermitModel>> getPermitList(
    int? facilityId,
    bool? selfView,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      log(auth);
      final res = await _dataRepository.getPermitList(
        auth: auth,
        facilityId: facilityId,
        selfView: selfView,
        isLoading: isLoading,
      );

      if (!res.hasError) {
        final jsonNewPermitModels = jsonDecode(res.data);
        final List<NewPermitModel> _newPermitList = jsonNewPermitModels
            .map<NewPermitModel>(
              (m) => NewPermitModel.fromJson(Map<String, dynamic>.from(m)),
            )
            .toList();

        return _newPermitList;
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

  Future<Map<String, dynamic>> linkToPermit(
    jobId,
    permitId,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.linkToPermit(
        auth: auth,
        jobId: jobId,
        permitId: permitId,
        isLoading: isLoading ?? false,
      );

      if (!res.hasError) {
        if (res.errorCode == 200) {
          var responseMap = json.decode(res.data);
          return responseMap;
        }
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + 'linkToPermit');
        return Map();
      }
      return Map();
    } //
    catch (error) {
      Utility.showDialog(error.toString() + 'linkToPermit');
      return Map();
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
        Utility.showDialog(res.errorCode.toString() + ' saveJob');
        return Map();
      }
      return Map();
    } //
    catch (error) {
      Utility.showDialog(error.toString() + ' saveJob');
      return Map();
    }
  }

  Future<Map<String, dynamic>> updateJob(
    job,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.updateJob(
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
        Utility.showDialog(res.errorCode.toString() + ' updateJob');
        return Map();
      }
      return Map();
    } //
    catch (error) {
      Utility.showDialog(error.toString() + ' updateJob');
      return Map();
    }
  }

  Future<Map<String, dynamic>> assignReAssignJob(
    jobId,
    assignedToId,
    isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.assignReAssignJob(
        auth: auth,
        jobId: jobId,
        assignedToId: assignedToId,
        isLoading: isLoading ?? false,
      );

      if (!res.hasError) {
        if (res.errorCode == 200) {
          var responseMap = json.decode(res.data);
          return responseMap;
        }
      } //
      else {
        Utility.showDialog(
            res.errorCode.toString() + ' repo - assignReAssignJob');
        return Map();
      }
      return Map();
    } //
    catch (error) {
      Utility.showDialog(error.toString() + ' repo - assignReAssignJob');
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
        saveUserAcessData(LocalKeys.userAccess, res.data);
        Get.offAndToNamed(Routes.home);
        return null;
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + ' getUserAccessList');
        return null;
      }
    } catch (error) {
      Utility.showDialog(error.toString() + ' getUserAccessList');
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
        Utility.showDialog(res.errorCode.toString() + ' createCheckListNumber');
        return false;
      }
    } catch (error) {
      print(error.toString());
      return false;
    }
  }

  Future<bool> createModuleListNumber(
      {bool? isLoading, modulelistJsonString}) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.createModuleList(
          auth: auth,
          isLoading: isLoading,
          modulelistJsonString: modulelistJsonString);

      if (!res.hasError) {
        return true;
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + ' createCheckListNumber');
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
        Utility.showDialog(
            res.errorCode.toString() + ' getPreventiveCheckList');
        return [];
      }
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

  Future<List<ModuleListModel?>?> getModuleList(
    int? type,
    int? facilityId,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getModuleList(
        auth: auth,
        facilityId: facilityId ?? 0,
        type: type,
        isLoading: isLoading ?? false,
      );

      if (!res.hasError) {
        final jsonModuleListModelModels = jsonDecode(res.data);
        // print(res.data);
        final List<ModuleListModel> _ModuleListModelList =
            jsonModuleListModelModels
                .map<ModuleListModel>((m) =>
                    ModuleListModel.fromJson(Map<String, dynamic>.from(m)))
                .toList();

        return _ModuleListModelList;
      } else {
        Utility.showDialog(
            res.errorCode.toString() + ' getPreventiveCheckList');
        return [];
      }
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

  Future<List<InventoryTypeListModel?>?> getInventoryTypeList(
    // int? type,
    int? facilityId,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getInventoryTypeList(
        auth: auth,
        facilityId: facilityId ?? 0,
        // type: type,
        isLoading: isLoading ?? false,
      );

      if (!res.hasError) {
        final jsonInventoryTypeListModelModels = jsonDecode(res.data);
        // print(res.data);
        final List<InventoryTypeListModel> _InventoryTypeListModelList =
            jsonInventoryTypeListModelModels
                .map<InventoryTypeListModel>((m) =>
                    InventoryTypeListModel.fromJson(
                        Map<String, dynamic>.from(m)))
                .toList();

        return _InventoryTypeListModelList;
      } else {
        Utility.showDialog(res.errorCode.toString() + ' getinventoryTypeList');
        return [];
      }
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

  Future<List<InventoryStatusListModel?>?> getInventoryStatusList(
    int? facilityId,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getInventoryStatusList(
        auth: auth,
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );

      if (!res.hasError) {
        final jsonInventoryStatusListModel = jsonDecode(res.data);
        // print(res.data);
        final List<InventoryStatusListModel> _InventoryStatusListModelList =
            jsonInventoryStatusListModel
                .map<InventoryStatusListModel>((m) =>
                    InventoryStatusListModel.fromJson(
                        Map<String, dynamic>.from(m)))
                .toList();

        return _InventoryStatusListModelList;
      } else {
        Utility.showDialog(res.errorCode.toString() + ' getinventoryTypeList');
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
    // final res = ResponseModel(data: '', hasError: false);
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
        Utility.showDialog(res.errorCode.toString() + ' repo- updateJobCard');
      }
      return Map();
    } //
    catch (error) {
      print(error.toString());
      Utility.showDialog(error.toString() + ' repo - updateJobCard');
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
      log(error.toString());

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

  Future<List<PmTaskListModel?>?> getPmTaskList(
    int? facilityId,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getPmTaskList(
        auth: auth,
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );
      // print(res.data);
      if (!res.hasError) {
        final jsonPmTaskListModelModels = jsonDecode(res.data);

        final List<PmTaskListModel> _PmTaskListModelList =
            jsonPmTaskListModelModels
                .map<PmTaskListModel>((m) =>
                    PmTaskListModel.fromJson(Map<String, dynamic>.from(m)))
                .toList();
        print({"object", _PmTaskListModelList});
        return _PmTaskListModelList;
      } else {
        Utility.showDialog(res.errorCode.toString() + 'getPmTaskList');
        return [];
      }
    } catch (error) {
      log(error.toString());

      return [];
    }
  }

  Future<NewPermitDetailModel?> getNewPermitDetail({
    bool? isLoading,
    int? permitId,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getNewPermitDetail(
        auth: auth,
        permitId: permitId,
        isLoading: isLoading ?? false,
      );

      print({"permitdetail", res.data});

      if (!res.hasError) {
        if (res.errorCode == 200) {
          final NewPermitDetailModel _newPermitDetailModel =
              newPermitDetailModelFromJson(res.data);

          var responseMap = _newPermitDetailModel;
          print({"responsedata", responseMap});
          return responseMap;
        }
      } else {
        Utility.showDialog(res.errorCode.toString() + 'createNewPermit');
        //return '';
      }
      return null;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  Future<PmtaskViewModel?> getPmtaskViewList(
    int? scheduleId,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getPmtaskViewList(
        auth: auth,
        scheduleId: scheduleId,
        isLoading: isLoading,
      );
      if (!res.hasError) {
        final PmtaskViewModel _permitDetailsModel =
            pmtaskViewModelFromJson(res.data);
        print({"respqwe", _permitDetailsModel});

        return _permitDetailsModel;
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + 'getPmtaskViewList');
        return null;
      }
    } //
    catch (error) {
      print(error.toString());
      return null;
    }
  }

  Future<CreateSOPModel?> browseFiles(
      Uint8List? fileBytes, String fileName, bool isLoading) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.browseFiles(
        auth: auth,
        fileBytes: fileBytes,
        fileName: fileName,
        isLoading: isLoading,
      );
      if (res != null) {
        print("file upload");
        return res;
      } //
      else {
        // Utility.showDialog(res.errorCode.toString() + 'getPmtaskViewList');
        return null;
      }
    } //
    catch (error) {
      print(error.toString());
      return null;
    }
  }

  Future<void> deleteCkecklist(Object checklist_id, bool isLoading) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.deleteCkecklist(
        auth: auth,
        checklist_id: checklist_id,
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

  Future<void> deleteModulelist(Object module_id, bool isLoading) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.deleteModulelist(
        auth: auth,
        module_id: module_id,
        isLoading: isLoading,
      );

      if (!res.hasError) {
        //get delete response back from API
      } else {
        Utility.showDialog(res.errorCode.toString() + 'deleteModuleList');
      }
    } catch (error) {
      print(error.toString());
    }
  }

  Future<bool> updateChecklistNumber({
    bool? isLoading,
    checklistJsonString,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.updateChecklistNumber(
        auth: auth,
        isLoading: isLoading,
        checklistJsonString: checklistJsonString,
      );
      print(res.data);
      if (!res.hasError) {
        return true;
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + 'updateChecklistNumber');
        return false;
      }
    } catch (error) {
      print(error.toString());
      return false;
    }
  }

  Future<bool> updateModulelistNumber({
    bool? isLoading,
    modulelistJsonString,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.updateModulelistNumber(
        auth: auth,
        isLoading: isLoading,
        modulelistJsonString: modulelistJsonString,
      );
      print(res.data);
      if (!res.hasError) {
        return true;
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + 'updateChecklistNumber');
        return false;
      }
    } catch (error) {
      print(error.toString());
      return false;
    }
  }

  Future<bool> updateCheckPoint({bool? isLoading, checkpointJsonString}) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      log(auth);
      final res = await _dataRepository.updateCheckPoint(
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

  Future<List<CountryModel?>?> getCountryList(
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getCountryList(
        auth: auth,
        isLoading: isLoading ?? false,
      );

      if (!res.hasError) {
        final jsonCountryModels = jsonDecode(res.data);
        final List<CountryModel> _countryModelList = jsonCountryModels
            .map<CountryModel>(
              (m) => CountryModel.fromJson(Map<String, dynamic>.from(m)),
            )
            .toList();

        return _countryModelList;
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + 'getCountryList');
        return null;
      }
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

  Future<List<BloodModel?>?> getBloodList(
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getBloodList(
        auth: auth,
        isLoading: isLoading ?? false,
      );

      if (!res.hasError) {
        final jsonBloodModels = jsonDecode(res.data);
        final List<BloodModel> _bloodModelList = jsonBloodModels
            .map<BloodModel>(
              (m) => BloodModel.fromJson(Map<String, dynamic>.from(m)),
            )
            .toList();

        return _bloodModelList;
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + 'getBloodList');
        return null;
      }
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

  Future<List<StateModel?>?> getStateListnew(
      bool? isLoading, int? selectedCountryId) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getStateListnew(
          auth: auth,
          isLoading: isLoading ?? false,
          selectedCountryId: selectedCountryId);

      if (!res.hasError) {
        final jsonStateModels = jsonDecode(res.data);
        final List<StateModel> _stateModelList = jsonStateModels
            .map<StateModel>(
              (m) => StateModel.fromJson(Map<String, dynamic>.from(m)),
            )
            .toList();

        return _stateModelList;
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + 'getStateListnew');
        return null;
      }
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

  Future<List<CityModel?>?> getCityList(
      bool? isLoading, int? selectedStateId) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getCityList(
          auth: auth,
          isLoading: isLoading ?? false,
          selectedStateId: selectedStateId);

      if (!res.hasError) {
        final jsoncityModels = jsonDecode(res.data);
        final List<CityModel> _cityModelList = jsoncityModels
            .map<CityModel>(
              (m) => CityModel.fromJson(Map<String, dynamic>.from(m)),
            )
            .toList();

        return _cityModelList;
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + 'getCityList');
        return null;
      }
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

  Future<AccessLevelModel?> getRoleAccessList(
    int? roleId,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getRoleAccessList(
        auth: auth,
        roleId: roleId,
        isLoading: isLoading,
      );
      if (!res.hasError) {
        final AccessLevelModel _accessLevelModel =
            accessLevelModelFromJson(res.data);
        return _accessLevelModel;
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + 'getRoleAccessList');
        return null;
      }
    } //
    catch (error) {
      print(error.toString());
      return null;
    }
  }

  Future<List<RoleModel?>?> getRoleList(
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getRoleList(
        auth: auth,
        isLoading: isLoading ?? false,
      );

      if (!res.hasError) {
        final jsonRoleModels = jsonDecode(res.data);
        final List<RoleModel> _roleModelList = jsonRoleModels
            .map<RoleModel>(
              (m) => RoleModel.fromJson(Map<String, dynamic>.from(m)),
            )
            .toList();

        return _roleModelList;
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + 'getRoleList');
        return null;
      }
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

  Future<List<UserListModel?>?> getUserList(
    int? facilityId,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getUserList(
        auth: auth,
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );

      if (!res.hasError) {
        final jsonUserListModelModels = jsonDecode(res.data);
        // print(res.data);
        final List<UserListModel> _UserListModelList = jsonUserListModelModels
            .map<UserListModel>(
                (m) => UserListModel.fromJson(Map<String, dynamic>.from(m)))
            .toList();

        return _UserListModelList;
      } else {
        Utility.showDialog(res.errorCode.toString() + ' getUserList');
        return [];
      }
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

  Future<UserDetailsModel?> getUserDetails(
    int? userId,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getUserDetails(
        auth: auth,
        userId: userId,
        isLoading: isLoading,
      );
      if (!res.hasError) {
        final UserDetailsModel _userDetailModel =
            userDetailsModelFromJson(res.data);
        return _userDetailModel;
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + 'getUserDetails');
        return null;
      }
    } //
    catch (error) {
      print(error.toString());
      return null;
    }
  }

  Future<Map<String, dynamic>> saveAccessLevel(
    accessLevelJsonString,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.saveAccessLevel(
        auth: auth,
        accessLevelJsonString: accessLevelJsonString,
        isLoading: isLoading ?? false,
      );
      if (!res.hasError) {
        if (res.errorCode == 200) {
          var responseMap = json.decode(res.data);
          return responseMap;
        }
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + 'saveAccessLevel');
      }
      return Map();
    } catch (error) {
      print(error.toString());
      return Map();
    }
  }

  Future<bool> addUser({bool? isLoading, adduserJsonString}) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.addUser(
          auth: auth,
          isLoading: isLoading,
          adduserJsonString: adduserJsonString);
      print({"resp", res.data});
      if (!res.hasError) {
        return true;
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + ' addUser');
        return false;
      }
    } catch (error) {
      print(error.toString());
      return false;
    }
  }

  Future<bool> updateUser({bool? isLoading, adduserJsonString}) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.updateUser(
          auth: auth,
          isLoading: isLoading,
          adduserJsonString: adduserJsonString);
      print({"resp", res.data});
      if (!res.hasError) {
        return true;
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + ' updateUser');
        return false;
      }
    } catch (error) {
      print(error.toString());
      return false;
    }
  }

  Future<List<WarrantyTypeModel?>?> getWarrantyTypeList(
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getWarrantyTypeList(
        auth: auth,
        isLoading: isLoading,
      );

      if (!res.hasError) {
        final jsongetWarrantyTypeList = jsonDecode(res.data);
        final List<WarrantyTypeModel> _warrantyTypeListModelList =
            jsongetWarrantyTypeList
                .map<WarrantyTypeModel>(
                  (m) => WarrantyTypeModel.fromJson(
                    Map<String, dynamic>.from(m),
                  ),
                )
                .toList();

        return _warrantyTypeListModelList;
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + 'getWarrantyTypeList');
        return null;
      }
    } catch (error) {
      log(error.toString());

      return [];
    }
  }

  Future<List<dynamic>> updatePmExecution(
    pmExecutionJsonString,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.updatePmExecution(
        auth: auth,
        pmExecutionJsonString: pmExecutionJsonString,
        isLoading: isLoading ?? false,
      );
      if (!res.hasError) {
        if (res.errorCode == 200) {
          var responseMap = json.decode(res.data);
          return responseMap;
        }
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + 'updatePmExecution');
      }
      return [];
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

  ///
  Future<List<WarrantyUsageTermListModel?>?> getWarrantyUsageTermList(
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getWarrantyUsageTermList(
        auth: auth,
        isLoading: isLoading,
      );

      if (!res.hasError) {
        final jsongetWarrantyUsageTermList = jsonDecode(res.data);
        final List<WarrantyUsageTermListModel> _warrantyUsageTermListModelList =
            jsongetWarrantyUsageTermList
                .map<WarrantyUsageTermListModel>(
                  (m) => WarrantyUsageTermListModel.fromJson(
                    Map<String, dynamic>.from(m),
                  ),
                )
                .toList();

        return _warrantyUsageTermListModelList;
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + 'getWarrantyTypeList');
        return null;
      }
    } catch (error) {
      log(error.toString());

      return [];
    }
  }

  Future<bool> AddInventory({bool? isLoading, addInventoryJsonString}) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.AddInventory(
          auth: auth,
          isLoading: isLoading,
          addInventoryJsonString: addInventoryJsonString);
      print({"resp", res.data});
      if (!res.hasError) {
        Fluttertoast.showToast(msg: "Data add successfully...", fontSize: 16.0);

        Get.offAndToNamed(Routes.inventoryList);

        return true;
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + ' AddInventory');
        return false;
      }
    } catch (error) {
      print(error.toString());
      return false;
    }
  }
}
