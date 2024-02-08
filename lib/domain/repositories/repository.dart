import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:cmms/domain/models/module_cleaning_list_plan_model.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/utils/utils.dart';
import 'package:cmms/app/utils/utility.dart';
import 'package:cmms/app/widgets/warranty_claim_error_dialog.dart';
import 'package:cmms/data/data.dart';
import 'package:cmms/device/device.dart';
import 'package:cmms/domain/models/add_inventory_details_model.dart';
import 'package:cmms/domain/models/add_inventory_model.dart';
import 'package:cmms/domain/models/add_user_model.dart';
import 'package:cmms/domain/models/audit_plan_detail_model.dart';
import 'package:cmms/domain/models/audit_plan_list_model.dart';
import 'package:cmms/domain/models/business_list_model.dart';
import 'package:cmms/domain/models/calibration_detail_model.dart';
import 'package:cmms/domain/models/calibration_list_model.dart';
import 'package:cmms/domain/models/checkpoint_list_model.dart';
import 'package:cmms/domain/models/country_model.dart';
import 'package:cmms/domain/models/create_sop_model.dart';
import 'package:cmms/domain/models/currency_list_model.dart';
import 'package:cmms/domain/models/employee_list_model.dart';
import 'package:cmms/domain/models/employee_list_model2.dart';
import 'package:cmms/domain/models/employee_model.dart';
import 'package:cmms/domain/models/end_mc_execution_detail_model.dart';
import 'package:cmms/domain/models/equipment_list_model.dart';
import 'package:cmms/domain/models/get_asset_data_list_model.dart';
import 'package:cmms/domain/models/get_asset_items_model.dart';
import 'package:cmms/domain/models/get_faulty_material_report_model.dart';
import 'package:cmms/domain/models/get_notification_by_userid_model.dart';
import 'package:cmms/domain/models/get_notification_model.dart';
import 'package:cmms/domain/models/get_plant_Stock_list.dart';
import 'package:cmms/domain/models/get_pm_plan_detail_model.dart';
import 'package:cmms/domain/models/get_purchase_details_model.dart';
import 'package:cmms/domain/models/get_return_mrs_detail.dart';
import 'package:cmms/domain/models/get_return_mrs_list.dart';
import 'package:cmms/domain/models/getuser_access_byId_model.dart';
import 'package:cmms/domain/models/grievance_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/incident_report_details_model.dart';
import 'package:cmms/domain/models/incident_report_list_model.dart';
import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/models/inventory_category_model2.dart';
import 'package:cmms/domain/models/inventory_detail_model.dart';
import 'package:cmms/domain/models/inventory_details_model.dart';
import 'package:cmms/domain/models/job_card_model.dart';
import 'package:cmms/domain/models/job_type_list_model.dart';
import 'package:cmms/domain/models/linked_jobs_to_permit_model.dart';
import 'package:cmms/domain/models/manufacturer_model.dart';
import 'package:cmms/domain/models/mc_details_plan_model.dart';
import 'package:cmms/domain/models/mc_task_list_model.dart';
import 'package:cmms/domain/models/models.dart';
import 'package:cmms/domain/models/mrs_list_by_jobId.dart';
import 'package:cmms/domain/models/new_permit_details_model.dart';
import 'package:cmms/domain/models/new_permit_list_model.dart';
import 'package:cmms/domain/models/paiyed_model.dart';
import 'package:cmms/domain/models/permit_cancel_condition_list_model.dart';
import 'package:cmms/domain/models/pm_plan_list_model.dart';
import 'package:cmms/domain/models/pm_task_model.dart';
import 'package:cmms/domain/models/pm_task_view_list_model.dart';
import 'package:cmms/domain/models/preventive_checklist_model.dart';
import 'package:cmms/domain/models/req_order_details_by_id_model.dart';
import 'package:cmms/domain/models/request_order_list.model.dart';
import 'package:cmms/domain/models/risk_type_list_model.dart';
import 'package:cmms/domain/models/safety_measure_list_model.dart';
import 'package:cmms/domain/models/sop_list_model.dart';
import 'package:cmms/domain/models/asset_type_list_model.dart';
import 'package:cmms/domain/models/facility_type_list_model.dart';
import 'package:cmms/domain/models/block_type_list_model.dart';
import 'package:cmms/domain/models/set_pm_schedule_model.dart';
import 'package:cmms/domain/models/stock_management_update_goods_orders_model.dart';
import 'package:cmms/domain/models/supplier_name_model.dart';
import 'package:cmms/domain/models/tools_model.dart';
import 'package:cmms/domain/models/transaction_report_list_model.dart';
import 'package:cmms/domain/models/type_permit_model.dart';
import 'package:cmms/domain/models/user_detail_model.dart';
import 'package:cmms/domain/models/veg_plan_detail_model.dart';
import 'package:cmms/domain/models/vegetation_equipment_model.dart';
import 'package:cmms/domain/models/vegetation_list_plan_model.dart';
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
import '../models/IncidentRiskTypeModel.dart';
import '../models/InsuranceProviderModel.dart';
import '../models/SPV_list_model.dart';
import '../models/access_level_model.dart';
import '../models/asset_category_model.dart';
import '../models/asset_master_model.dart';
import '../models/asset_type_list_sm_model.dart';
import '../models/blood_model.dart';
import '../models/body_injured_model.dart';
import '../models/business_type_model.dart';
import '../models/calibration_certificate_model.dart';
import '../models/city_model.dart';
import '../models/competency_model.dart';
import '../models/designation_model.dart';
import '../models/document_manager_model.dart';
import '../models/employe_stock_model.dart';
import '../models/frequency_model.dart';
import '../models/get_mrs_list_model.dart';
import '../models/insurance_status_model.dart';
import '../models/inventory_status_list_model.dart';
import '../models/inventory_type_list_model.dart';
import '../models/job_card_details_model.dart';
import '../models/modulelist_model.dart';
import '../models/mrs_detail_model.dart';
import '../models/permit_details_model.dart';
import '../models/pm_mapping_list_model.dart';
import '../models/role_model.dart';
import '../models/state.dart';
import '../models/unit_measurement_model.dart';
import '../models/user_access_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../models/user_list_model.dart';
import '../models/warranty_certificate_model.dart';
import '../models/warranty_model.dart';

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

  //create New Permit For Job
  Future<Map<String, dynamic>> createNewPermitForJob(
    newPermit,
    jobId,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.createNewPermitForJob(
        auth: auth,
        newPermit: newPermit,
        jobId: jobId,
        isLoading: isLoading ?? false,
      );

      var resourceData = res.data;
      // var parsedJson = json.decode(resourceData);
      print('Response Create Permit For Job: ${resourceData}');
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
          var permitForJob = responseMap['id'];
          print('CreateForJobPermitResponse:${permitForJob[0]}');
          if (jobId != null) {
            linkToPermit(jobId, permitForJob[0], true);
          }
          return responseMap;
        }
      } else {
        Utility.showDialog(res.errorCode.toString() + 'createNewPermitForJOb');
        //return '';
      }
      return Map();
    } catch (error) {
      print(error.toString());
      return Map();
    }
  }

  Future<Map<String, dynamic>> createNewPermitForPm(
    newPermit,
    pmTaskId,
    activity,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.createNewPermitForPm(
        auth: auth,
        newPermit: newPermit,
        pmTaskId: pmTaskId,
        isLoading: isLoading ?? false,
      );

      var resourceData = res.data;
      // var parsedJson = json.decode(resourceData);
      print('Response Create Permit For Job: ${resourceData}');
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
          var permitForJob = responseMap['id'];
          print('CreateForJobPermitResponse:${permitForJob[0]}');
          if (pmTaskId != null) {
            scheduleLinkToPermit(pmTaskId, activity, permitForJob[0], true);
          }
          return responseMap;
        }
      } else {
        Utility.showDialog(res.errorCode.toString() + 'createNewPermitForJOb');
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
      newPermit, bool? isLoading, bool? resubmit) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.updateNewPermit(
        auth: auth,
        newPermit: newPermit,
        isLoading: isLoading ?? false,
        resubmit: resubmit,
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

  /// sesubmit permit
  Future<Map<String, dynamic>> resubmitPermit(
      newPermit, bool? isLoading, bool? resubmit) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.resubmitPermit(
        auth: auth,
        newPermit: newPermit,
        isLoading: isLoading ?? false,
        resubmit: resubmit,
      );

      var resourceData = res.data;
      // var parsedJson = json.decode(resourceData);
      print('Response resubmitPermit : ${resourceData}');
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
        Utility.showDialog(res.errorCode.toString() + 'resubmitPermit');
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

  //Create Incident Report
  Future<Map<String, dynamic>> createIncidentReport(
    createIncidentReport,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.createIncidentReport(
        auth: auth,
        createIncidentReport: createIncidentReport,
        isLoading: isLoading ?? false,
      );

      var resourceData = res.data;
      // var parsedJson = json.decode(resourceData);
      print('Response Create Incident Report: ${resourceData}');
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
        } else {}
      } else {
        Utility.showDialog(res.errorCode.toString() + 'createIncidentReport');
        //return '';
      }
      return Map();
    } catch (error) {
      print(error.toString());
      return Map();
    }
  }

  //Create Escalation Matrix
  Future<Map<String, dynamic>> createEscalationMatrix(
    createEscalationMatrix,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.createEscalationMatrix(
        auth: auth,
        createEscalationMatrix: createEscalationMatrix,
        isLoading: isLoading ?? false,
      );

      var resourceData = res.data;
      // var parsedJson = json.decode(resourceData);
      print('Response Escalation Matrix Report: ${resourceData}');
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
        } else {}
      } else {
        Utility.showDialog(res.errorCode.toString() + 'createEscalationMatrix');
        //return '';
      }
      return Map();
    } catch (error) {
      print(error.toString());
      return Map();
    }
  }

  //Create or  add Goods order
  Future<Map<String, dynamic>> createGoodsOrder(
    createGo,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.createGoodsOrder(
        auth: auth,
        createGo: createGo,
        isLoading: isLoading ?? false,
      );

      var resourceData = res.data;

      print('Response Create Goods order : ${resourceData}');

      if (!res.hasError) {
        Fluttertoast.showToast(
            msg: " Goods Order Add Successfully...", fontSize: 16.0);
        Get.offNamed(
          Routes.stockManagementGoodsOrdersScreen,
        );

        // if (res.errorCode == 200) {
        //   var responseMap = json.decode(res.data);
        //   return responseMap;
        // }

        // Fluttertoast.showToast(msg: "Data add successfully...", fontSize: 16.0);
      } else {
        Utility.showDialog(res.errorCode.toString() + 'createGoodsOrder');
        //return '';
      }
      return Map();
    } catch (error) {
      print(error.toString());
      return Map();
    }
  }

  Future<Map<String, dynamic>> submitPurchaseOrderData(
    createGoReq,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.submitPurchaseOrderData(
        auth: auth,
        createGoReq: createGoReq,
        isLoading: isLoading ?? false,
      );

      var resourceData = res.data;

      print('Response Create Goods order req  : ${resourceData}');

      if (!res.hasError) {
        Fluttertoast.showToast(
            msg: " Request  Orders Add Successfully...", fontSize: 16.0);
        Get.offNamed(
          Routes.purchaseGoodsorder,
        );

        // if (res.errorCode == 200) {
        //   var responseMap = json.decode(res.data);
        //   return responseMap;
        // }

        // Fluttertoast.showToast(msg: "Data add successfully...", fontSize: 16.0);
      } else {
        Utility.showDialog(res.errorCode.toString() + 'createGoodsOrder');
        //return '';
      }
      return Map();
    } catch (error) {
      print(error.toString());
      return Map();
    }
  }

  Future<Map<String, dynamic>> updatePurchaseOrderData(
    createGoReq,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.updatePurchaseOrderData(
        auth: auth,
        createGoReq: createGoReq,
        isLoading: isLoading ?? false,
      );

      var resourceData = res.data;

      print('Response update  req order : ${resourceData}');

      if (!res.hasError) {
        Fluttertoast.showToast(
            msg: " Update Req Order Add Successfully...", fontSize: 16.0);

        // if (res.errorCode == 200) {
        //   var responseMap = json.decode(res.data);
        //   return responseMap;
        // }

        // Fluttertoast.showToast(msg: "Data add successfully...", fontSize: 16.0);
      } else {
        Utility.showDialog(res.errorCode.toString() + 'createGoodsOrder');
        //return '';
      }
      return Map();
    } catch (error) {
      print(error.toString());
      return Map();
    }
  }

  Future<Map<String, dynamic>> updateGoodsOrder(
    createGo,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.updateGoodsOrder(
        auth: auth,
        createGo: createGo,
        isLoading: isLoading ?? false,
      );

      var resourceData = res.data;

      print('Response update Goods order : ${resourceData}');

      if (!res.hasError) {
        Fluttertoast.showToast(
            msg: " GO  update Successfully...", fontSize: 16.0);

        Get.offAllNamed(
          Routes.stockManagementGoodsOrdersScreen,
        );
        // Fluttertoast.showToast(msg: "Data add successfully...", fontSize: 16.0);
      } else {
        Utility.showDialog(res.errorCode.toString() + 'updateGoodsOrder');
        //return '';
      }
      return Map();
    } catch (error) {
      print(error.toString());
      return Map();
    }
  }

  //
  Future<Map<String, dynamic>> updateGOReceive(
    createGo,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.updateGOReceive(
        auth: auth,
        createGo: createGo,
        isLoading: isLoading ?? false,
      );

      var resourceData = res.data;

      print('Response update Goods order : ${resourceData}');

      if (!res.hasError) {
        Fluttertoast.showToast(
            msg: " Recive GO  update Successfully...", fontSize: 16.0);

        Get.offAllNamed(
          Routes.stockManagementGoodsOrdersScreen,
        );
        // Fluttertoast.showToast(msg: "Data add successfully...", fontSize: 16.0);
      } else {
        Utility.showDialog(res.errorCode.toString() + 'reciveUpdateGoodsOrder');
        //return '';
      }
      return Map();
    } catch (error) {
      print(error.toString());
      return Map();
    }
  }

  Future<Map<String, dynamic>> updateGOReceiveIsSubmit0(
    createGo,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.updateGOReceiveIsSubmit0(
        auth: auth,
        createGo: createGo,
        isLoading: isLoading ?? false,
      );

      var resourceData = res.data;

      print('Response update Goods order : ${resourceData}');

      if (!res.hasError) {
        Fluttertoast.showToast(
            msg: " Recive GO  update Successfully...", fontSize: 16.0);

        Get.offAllNamed(
          Routes.stockManagementGoodsOrdersScreen,
        );
        // Fluttertoast.showToast(msg: "Data add successfully...", fontSize: 16.0);
      } else {
        Utility.showDialog(res.errorCode.toString() + 'reciveUpdateGoodsOrder');
        //return '';
      }
      return Map();
    } catch (error) {
      print(error.toString());
      return Map();
    }
  }

  //Update Warranty claim
  Future<Map<String, dynamic>> updateWarrantyClaim(
    updateWarrantyClaim,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.updateWarrantyClaim(
        auth: auth,
        updateWarrantyClaim: updateWarrantyClaim,
        isLoading: isLoading ?? false,
      );

      var resourceData = res.data;
      // var parsedJson = json.decode(resourceData);
      print('Response Update Warranty Claim: ${resourceData}');
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
          // Get.dialog<void>(WarrantyClaimErrorDialog());
        }
      } else {
        Utility.showDialog(res.errorCode.toString() + 'updateWarrantyClaim');
        //return '';
      }
      return Map();
    } catch (error) {
      print(error.toString());
      return Map();
    }
  }

  //Update Incident Report
  Future<Map<String, dynamic>> updateIncidentReport(
    updateIncidentReport,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.updateIncidentReport(
        auth: auth,
        updateIncidentReport: json.encode(updateIncidentReport),
        isLoading: isLoading ?? false,
      );

      var resourceData = res.data;
      // var parsedJson = json.decode(resourceData);
      print('Response Update Incident Report: ${resourceData}');
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
          // Get.dialog<void>(WarrantyClaimErrorDialog());
        }
      } else {
        Utility.showDialog(res.errorCode.toString() + 'updateIncidentReport');
        //return '';
      }
      return Map();
    } catch (error) {
      print(error.toString());
      return Map();
    }
  }

  //Update MC Schedule Execution
  Future<Map<String, dynamic>> updateMCScheduleExecution(
    updateMCScheduleExecutionJsonString,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.updateMCScheduleExecution(
        auth: auth,
        updateMCScheduleExecutionJsonString:
            json.encode(updateMCScheduleExecutionJsonString),
        isLoading: isLoading ?? false,
      );

      var resourceData = res.data;
      // var parsedJson = json.decode(resourceData);
      print('Response MC Schedule Execution Report: ${resourceData}');
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
          // Get.dialog<void>(WarrantyClaimErrorDialog());
        }
      } else {
        Utility.showDialog(res.errorCode.toString() + 'updateMCExecution');
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
        return countrystateFromJson(res.data);
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
            msg: res.data, // "Invalid Email Id and Password",
            fontSize: 16.0);
      }
    } catch (error) {
      await _deviceRepository.generateToken();
      print(error.toString());
    }
  }

  Future<List<InventoryModel>> getInventoryAssetsList({
    required int? facility_id,
    required bool isLoading,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      log(auth);
      final res = await _dataRepository.getInventoryAssetsList(
        facility_id: facility_id,
        isLoading: isLoading,
        auth: auth,
      );
      print('getinventoryList: ${res.data}');

      if (!res.hasError) {
        final jsoninventoryListModels = jsonDecode(res.data);
        // print(res.data); `6
        final List<InventoryModel> _inventoryModelList = jsoninventoryListModels
            .map<InventoryModel>(
                (m) => InventoryModel.fromJson(Map<String, dynamic>.from(m)))
            .toList();

        return _inventoryModelList.reversed.toList();
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + 'getInventoryList');
        return [];
      }
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

  Future<List<GoodsOrdersListModel>> getGoodsOrdersList({
    required int? facility_id,
    String? start_date,
    required String end_date,
    required bool isLoading,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      log(auth);
      final res = await _dataRepository.getGoodsOrdersList(
        facility_id: facility_id,
        start_date: start_date,
        end_date: end_date,
        isLoading: isLoading,
        auth: auth,
      );
      print('getGoodsOrdersList: ${res.data}');

      if (!res.hasError) {
        final jsonGoodsOrdersListModels = jsonDecode(res.data);
        // print(res.data); `6
        final List<GoodsOrdersListModel> _goodOrderModelList =
            jsonGoodsOrdersListModels
                .map<GoodsOrdersListModel>((m) =>
                    GoodsOrdersListModel.fromJson(Map<String, dynamic>.from(m)))
                .toList();

        return _goodOrderModelList.reversed.toList();
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + 'getIncidentReportList');
        return [];
      }
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

  Future<List<TransactionReportListModel>> transactionReport({
    int? actorID,
    int? actorType,
    required int? facility_id,
    String? start_date,
    required String end_date,
    required bool isLoading,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      log(auth);
      final res = await _dataRepository.transactionReport(
        facility_id: facility_id,
        start_date: start_date,
        end_date: end_date,
        isLoading: isLoading,
        actorID: actorID,
        actorType: actorType,
        auth: auth,
      );
      print('getGoodsOrdersList: ${res.data}');

      if (!res.hasError) {
        final jsonTransactionReportListModels = jsonDecode(res.data);
        // print(res.data); `6
        final List<TransactionReportListModel> _transactionReportList =
            jsonTransactionReportListModels
                .map<TransactionReportListModel>((m) =>
                    TransactionReportListModel.fromJson(
                        Map<String, dynamic>.from(m)))
                .toList();

        return _transactionReportList.reversed.toList();
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + 'getIncidentReportList');
        return [];
      }
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

  Future<List<GetRequestOrderListModel>> getRequestOrderList({
    required int? facility_id,
    String? start_date,
    required String end_date,
    required bool isLoading,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      log(auth);
      final res = await _dataRepository.getRequestOrderList(
        facility_id: facility_id,
        start_date: start_date,
        end_date: end_date,
        isLoading: isLoading,
        auth: auth,
      );
      print('getGoodsOrdersList: ${res.data}');

      if (!res.hasError) {
        final jsonGoodsOrdersListModels = jsonDecode(res.data);
        // print(res.data);
        final List<GetRequestOrderListModel> _goodOrderModelList =
            jsonGoodsOrdersListModels
                .map<GetRequestOrderListModel>((m) =>
                    GetRequestOrderListModel.fromJson(
                        Map<String, dynamic>.from(m)))
                .toList();

        return _goodOrderModelList.reversed.toList();
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + 'getIncidentReportList');
        return [];
      }
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

  Future<List<ModuleCleaningListPlanModel>> getModuleCleaningListPlan({
    required int? facility_id,
    required bool isLoading,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      log(auth);
      final res = await _dataRepository.getModuleCleaningListPlan(
        facility_id: facility_id,
        isLoading: isLoading,
        auth: auth,
      );
      print('getModuleCleaningListPlan: ${res.data}');

      if (!res.hasError) {
        final jsonModuleCleaningListPlan = jsonDecode(res.data);
        // print(res.data);
        final List<ModuleCleaningListPlanModel> _moduleCleaningListPlan =
            jsonModuleCleaningListPlan
                .map<ModuleCleaningListPlanModel>((m) =>
                    ModuleCleaningListPlanModel.fromJson(
                        Map<String, dynamic>.from(m)))
                .toList();

        return _moduleCleaningListPlan.reversed.toList();
      } //
      else {
        Utility.showDialog(
            res.errorCode.toString() + 'getModuleCleaningListPlan');
        return [];
      }
    } catch (error) {
      print(error.toString());
      return [];
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

//   Future<List<InventoryModel2>> getAffectedPartList({
//     required int? facilityId,
//     int? blockId,
//     String? categoryIds,
//     required bool isLoading,
//   }) async {
//     try {
//       final auth = await getSecuredValue(LocalKeys.authToken);
//       final res = await _dataRepository.getAffectedPartList(
//         facilityId: facilityId,
//         // blockId: blockId,
//         // categoryIds: categoryIds,
//         isLoading: isLoading,
//         auth: auth,
//       );
//       // print('Inventory List Data: ${res.data}');

//       if (!res.hasError) {
//         var affectedPartList = inventoryModel2FromJson(res.data);
//         return affectedPartList;
//       }
// //
//       else {
//         Utility.showDialog(res.errorCode.toString() + 'getAffectedPartList');
//         return [];
//       }
//     } catch (error) {
//       print(error.toString());
//       return [];
//     }
//   }

  Future<List<BusinessListModel>> getBusinessList({
    int? businessType,
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

  ///MC Execution Details
  Future<EndMCExecutionDetailsModel?> getMCExecutionDetail({
    bool? isLoading,
    int? executionId,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getMCExecutionDetail(
        auth: auth,
        executionId: executionId,
        isLoading: isLoading ?? false,
      );

      print({"MCExecutiondetail", res.data});

      if (!res.hasError) {
        if (res.errorCode == 200) {
          final EndMCExecutionDetailsModel _endMCExecutionDetailModel =
              endMCExecutionDetailsModelFromJson(res.data);

          var responseMap = _endMCExecutionDetailModel;
          print({"MCExecutionResponseData", responseMap});
          return responseMap;
        }
      } else {
        Utility.showDialog(res.errorCode.toString() + 'MCExecutionDetail');
        //return '';
      }
      return null;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  Future<McPalningDetailsModel?> getMcPlanDetail({
    bool? isLoading,
    int? planId,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getMcPlanDetail(
        auth: auth,
        planId: planId,
        isLoading: isLoading ?? false,
      );

      // print({"MCPlandetail", res.data});

      if (!res.hasError) {
        if (res.errorCode == 200) {
          final McPalningDetailsModel _mcPlanDetailModel =
              mcPlaningDetailsModelFromJson(res.data);

          var responseMap = _mcPlanDetailModel;
          print({"MCPlandetail", responseMap});
          return responseMap;
        }
      } else {
        Utility.showDialog(res.errorCode.toString() + 'MCPlanDetail');
        //return '';
      }
      return null;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  Future<IncidentReportDetailsModel?> getIncidentReportDetail({
    bool? isLoading,
    int? id,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getIncidentReportDetail(
        auth: auth,
        id: id,
        isLoading: isLoading ?? false,
      );

      print({"IncidentReportdetail", res.data});

      if (!res.hasError) {
        if (res.errorCode == 200) {
          final IncidentReportDetailsModel _incidentReportDetailModel =
              incidentReportDetailModelFromJson(res.data);

          var responseMap = _incidentReportDetailModel;
          print({"IncidentReportDetailResponseData", responseMap});
          return responseMap;
        }
      } else {
        Utility.showDialog(res.errorCode.toString() + 'IncidentReportDetail');
        //return '';
      }
      return null;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  Future<GetPurchaseDetailsByIDModel?> getPurchaseDetailsById({
    bool? isLoading,
    int? id,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getPurchaseDetailsById(
        auth: auth,
        id: id,
        isLoading: isLoading ?? false,
      );

      print({"getPurchaseDetailsByID", res.data});

      if (!res.hasError) {
        if (res.errorCode == 200) {
          final GetPurchaseDetailsByIDModel
              _getPurchaseDetailsByIDModelFromJson =
              getPurchaseDetailsByIDModelFromJson(res.data);

          var responseMap = _getPurchaseDetailsByIDModelFromJson;
          // print({"ViewgetPurchaseDetailsByID", responseMap});
          return responseMap;
        }
      } else {
        Utility.showDialog(res.errorCode.toString() + 'GetPurchaseDetailsByID');
        //return '';
      }
      return null;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  Future<GetRODetailsByIDModel?> getRoDetailsByID({
    bool? isLoading,
    int? requestID,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getRoDetailsByID(
        auth: auth,
        requestID: requestID,
        isLoading: isLoading ?? false,
      );

      print({"getRoDetailsByID", res.data});

      if (!res.hasError) {
        if (res.errorCode == 200) {
          final GetRODetailsByIDModel _getPurchaseDetailsByIDModelFromJson =
              getRODetailsByIDModelFromJson(res.data);

          var responseMap = _getPurchaseDetailsByIDModelFromJson;
          print({"getRoDetailsByID", responseMap});
          return responseMap;
        }
      } else {
        Utility.showDialog(res.errorCode.toString() + 'GetPurchaseDetailsByID');
        //return '';
      }
      return null;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  /// Inventory Details
  Future<InventoryDetailsModel?> getInventoryDetail({
    bool? isLoading,
    int? id,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getInventoryDetail(
        auth: auth,
        id: id,
        isLoading: isLoading ?? false,
      );

      print({"inventorydetail", res.data});

      if (!res.hasError) {
        if (res.errorCode == 200) {
          final InventoryDetailsModel _inventoryDetailModel =
              inventoryDetailsModelFromJson(res.data);

          var responseMap = _inventoryDetailModel;
          print({"InventoryDetailsResponseData", responseMap});
          return responseMap;
        }
      } else {
        Utility.showDialog(res.errorCode.toString() + 'InventoryDetail');
        //return '';
      }
      return null;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  ///Add Inventory Details

  Future<AddInventoryDetailsModel?> getAddInventoryDetail({
    bool? isLoading,
    int? id,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getAddInventoryDetail(
        auth: auth,
        id: id,
        isLoading: isLoading ?? false,
      );

      print({"AddInventorydetail", res.data});

      if (!res.hasError) {
        final AddInventoryDetailsModel _addInventoryDetailModel =
            addInventoryDetailModelFromJson(res.data);

        // var responseMap = _addInventoryDetailModel;
        print({"ViewWarrantyResponseData", _addInventoryDetailModel});
        return _addInventoryDetailModel;
      } else {
        Utility.showDialog(res.errorCode.toString() + 'AddInventoryDetail');
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

  Future<Map<String, dynamic>> goodsOrderApprovedButton(
    goodsOrderApproveJsonString,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.goodsOrderApprovedButton(
        auth: auth,
        goodsOrderApproveJsonString: goodsOrderApproveJsonString,
        isLoading: isLoading ?? false,
      );

      var resourceData = res.data;

      print('Response Goods Order Approve: ${resourceData}');

      if (!res.hasError) {
        if (res.errorCode == 200) {
          var responseMap = json.decode(res.data);
          return responseMap;
        } else {
          // Get.dialog<void>(WarrantyClaimErrorDialog());
        }
      } else {
        Utility.showDialog(
            res.errorCode.toString() + 'goodsOrderApprovedButton');
        //return '';
      }
      return Map();
    } catch (error) {
      print(error.toString());
      return Map();
    }
  }

  Future<Map<String, dynamic>> approveIncidentReportButton(
    incidentReportApproveJsonString,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.approveIncidentReportButton(
        auth: auth,
        incidentReportApproveJsonString: incidentReportApproveJsonString,
        isLoading: isLoading ?? false,
      );

      var resourceData = res.data;

      print('Response Incident Report Approve: ${resourceData}');

      if (!res.hasError) {
        if (res.errorCode == 200) {
          var responseMap = json.decode(res.data);
          return responseMap;
        } else {
          // Get.dialog<void>(WarrantyClaimErrorDialog());
        }
      } else {
        Utility.showDialog(
            res.errorCode.toString() + 'approveIncidentReportButton');
        //return '';
      }
      return Map();
    } catch (error) {
      print(error.toString());
      return Map();
    }
  }

  Future<Map<String, dynamic>> approveIrButton(
    incidentReportApproveJsonString,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.approveIrButton(
        auth: auth,
        incidentReportApproveJsonString: incidentReportApproveJsonString,
        isLoading: isLoading ?? false,
      );

      var resourceData = res.data;

      print('Response IR Approve: ${resourceData}');

      if (!res.hasError) {
        if (res.errorCode == 200) {
          var responseMap = json.decode(res.data);
          return responseMap;
        } else {
          // Get.dialog<void>(WarrantyClaimErrorDialog());
        }
      } else {
        Utility.showDialog(res.errorCode.toString() + 'approveIrButton');
        //return '';
      }
      return Map();
    } catch (error) {
      print(error.toString());
      return Map();
    }
  }

  Future<Map<String, dynamic>> mcPlanRejectButton(
    mcRejectJsonString,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.mcPlanRejectButton(
        auth: auth,
        mcRejectJsonString: json.encode(mcRejectJsonString),
        isLoading: isLoading ?? false,
      );

      var resourceData = res.data;

      print('Response MC Reject: ${resourceData}');

      if (!res.hasError) {
        if (res.errorCode == 200) {
          var responseMap = json.decode(res.data);
          return responseMap;
        } else {
          // Get.dialog<void>(WarrantyClaimErrorDialog());
        }
      } else {
        Utility.showDialog(res.errorCode.toString() + 'mcRejectButton');
        //return '';
      }
      return Map();
    } catch (error) {
      print(error.toString());
      return Map();
    }
  }

  Future<Map<String, dynamic>> mcPlanApprovedButton(
    mcApproveJsonString,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.mcPlanApprovedButton(
        auth: auth,
        mcApproveJsonString: json.encode(mcApproveJsonString),
        isLoading: isLoading ?? false,
      );

      var resourceData = res.data;

      print('Response MC Approve: ${resourceData}');

      if (!res.hasError) {
        if (res.errorCode == 200) {
          var responseMap = json.decode(res.data);
          return responseMap;
        } else {
          // Get.dialog<void>(WarrantyClaimErrorDialog());
        }
      } else {
        Utility.showDialog(res.errorCode.toString() + 'mcApprovedButton');
        //return '';
      }
      return Map();
    } catch (error) {
      print(error.toString());
      return Map();
    }
  }

  Future<Map<String, dynamic>> mcExecutionApprovedButton(
    mcExecutionApproveJsonString,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.mcExecutionApprovedButton(
        auth: auth,
        mcExecutionApproveJsonString: json.encode(mcExecutionApproveJsonString),
        isLoading: isLoading ?? false,
      );

      var resourceData = res.data;

      print('Response MC Execution Approve: ${resourceData}');

      if (!res.hasError) {
        if (res.errorCode == 200) {
          var responseMap = json.decode(res.data);
          return responseMap;
        } else {
          // Get.dialog<void>(WarrantyClaimErrorDialog());
        }
      } else {
        Utility.showDialog(
            res.errorCode.toString() + 'mcExecutionApprovedButton');
        //return '';
      }
      return Map();
    } catch (error) {
      print(error.toString());
      return Map();
    }
  }

  //Approve warranty Claim
  Future<Map<String, dynamic>> wcApprovedButton(
    WCApproveJsonString,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.wcApprovedButton(
        auth: auth,
        WCApproveJsonString: WCApproveJsonString,
        isLoading: isLoading ?? false,
      );

      var resourceData = res.data;

      print('Response WC Approve: ${resourceData}');

      if (!res.hasError) {
        if (res.errorCode == 200) {
          var responseMap = json.decode(res.data);
          return responseMap;
        } else {
          // Get.dialog<void>(WarrantyClaimErrorDialog());
        }
      } else {
        Utility.showDialog(res.errorCode.toString() + 'WcApprovedButton');
        //return '';
      }
      return Map();
    } catch (error) {
      print(error.toString());
      return Map();
    }
  }

  //Reject warranty Claim
  Future<Map<String, dynamic>> wcRejectdButton(
    WCRejectJsonString,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.wcRejectdButton(
        auth: auth,
        WCRejectJsonString: json.encode(WCRejectJsonString),
        isLoading: isLoading ?? false,
      );

      var resourceData = res.data;

      print('Response WC Reject: ${resourceData}');

      if (!res.hasError) {
        if (res.errorCode == 200) {
          var responseMap = json.decode(res.data);
          return responseMap;
        } else {
          // Get.dialog<void>(WarrantyClaimErrorDialog());
        }
      } else {
        Utility.showDialog(res.errorCode.toString() + 'WcRejectButton');
        //return '';
      }
      return Map();
    } catch (error) {
      print(error.toString());
      return Map();
    }
  }

  Future<Map<String, dynamic>> rejectMcExecutionApprovedButton(
    rejectMcExecutionApproveJsonString,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.rejectMcExecutionApprovedButton(
        auth: auth,
        rejectMcExecutionApproveJsonString:
            json.encode(rejectMcExecutionApproveJsonString),
        isLoading: isLoading ?? false,
      );

      var resourceData = res.data;

      print('Response MC Execution Reject: ${resourceData}');

      if (!res.hasError) {
        if (res.errorCode == 200) {
          var responseMap = json.decode(res.data);
          return responseMap;
        } else {
          // Get.dialog<void>(WarrantyClaimErrorDialog());
        }
      } else {
        Utility.showDialog(
            res.errorCode.toString() + 'mcExecutionRejectButton');
        //return '';
      }
      return Map();
    } catch (error) {
      print(error.toString());
      return Map();
    }
  }

  Future<Map<String, dynamic>> pmPlanApprovedButton(
    pmPlanApproveJsonString,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.pmPlanApprovedButton(
        auth: auth,
        pmPlanApproveJsonString: json.encode(pmPlanApproveJsonString),
        isLoading: isLoading ?? false,
      );

      var resourceData = res.data;

      print('Response Goods Order Approve: ${resourceData}');

      if (!res.hasError) {
        if (res.errorCode == 200) {
          var responseMap = json.decode(res.data);
          return responseMap;
        } else {
          // Get.dialog<void>(WarrantyClaimErrorDialog());
        }
      } else {
        Utility.showDialog(res.errorCode.toString() + 'pmPlanApprovedButton');
        //return '';
      }
      return Map();
    } catch (error) {
      print(error.toString());
      return Map();
    }
  }

  Future<Map<String, dynamic>> goodsOrderRejectButton(
    goodsOrderRejectJsonString,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.goodsOrderRejectButton(
        auth: auth,
        goodsOrderRejectJsonString: goodsOrderRejectJsonString,
        isLoading: isLoading ?? false,
      );

      var resourceData = res.data;

      print('Response Goods Order Approve: ${resourceData}');

      if (!res.hasError) {
        if (res.errorCode == 200) {
          var responseMap = json.decode(res.data);
          return responseMap;
        } else {
          // Get.dialog<void>(WarrantyClaimErrorDialog());
        }
      } else {
        Utility.showDialog(
            res.errorCode.toString() + 'goodsOrderApprovedButton');
        //return '';
      }
      return Map();
    } catch (error) {
      print(error.toString());
      return Map();
    }
  }

  Future<Map<String, dynamic>> rejectIncidentReportButton(
    incidentReportRejectJsonString,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.rejectIncidentReportButton(
        auth: auth,
        incidentReportRejectJsonString: incidentReportRejectJsonString,
        isLoading: isLoading ?? false,
      );

      var resourceData = res.data;

      print('Response Incident report Reject: ${resourceData}');

      if (!res.hasError) {
        if (res.errorCode == 200) {
          var responseMap = json.decode(res.data);
          return responseMap;
        } else {
          // Get.dialog<void>(WarrantyClaimErrorDialog());
        }
      } else {
        Utility.showDialog(res.errorCode.toString() + 'incidentReportReject');
        //return '';
      }
      return Map();
    } catch (error) {
      print(error.toString());
      return Map();
    }
  }

  Future<Map<String, dynamic>> rejectIrButton(
    incidentReportRejectJsonString,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.rejectIrButton(
        auth: auth,
        incidentReportRejectJsonString: incidentReportRejectJsonString,
        isLoading: isLoading ?? false,
      );

      var resourceData = res.data;

      print('Response Incident report Reject: ${resourceData}');

      if (!res.hasError) {
        if (res.errorCode == 200) {
          var responseMap = json.decode(res.data);
          return responseMap;
        } else {
          // Get.dialog<void>(WarrantyClaimErrorDialog());
        }
      } else {
        Utility.showDialog(res.errorCode.toString() + 'incidentReportReject');
        //return '';
      }
      return Map();
    } catch (error) {
      print(error.toString());
      return Map();
    }
  }

  Future<Map<String, dynamic>> approveGOReceiveButton(
    goodsOrderApproveJsonString,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.approveGOReceiveButton(
        auth: auth,
        goodsOrderApproveJsonString: goodsOrderApproveJsonString,
        isLoading: isLoading ?? false,
      );

      var resourceData = res.data;

      print('Response Goods Order Approve: ${resourceData}');

      if (!res.hasError) {
        if (res.errorCode == 200) {
          var responseMap = json.decode(res.data);
          return responseMap;
        } else {
          // Get.dialog<void>(WarrantyClaimErrorDialog());
        }
      } else {
        Utility.showDialog(res.errorCode.toString() + 'approveGOReceiveButton');
        //return '';
      }
      return Map();
    } catch (error) {
      print(error.toString());
      return Map();
    }
  }

  Future<Map<String, dynamic>> rejectGOReceiveButton(
    goodsOrderApproveJsonString,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.rejectGOReceiveButton(
        auth: auth,
        goodsOrderApproveJsonString: goodsOrderApproveJsonString,
        isLoading: isLoading ?? false,
      );

      var resourceData = res.data;

      print('Response Goods Order Approve: ${resourceData}');

      if (!res.hasError) {
        if (res.errorCode == 200) {
          var responseMap = json.decode(res.data);
          return responseMap;
        } else {
          // Get.dialog<void>(WarrantyClaimErrorDialog());
        }
      } else {
        Utility.showDialog(res.errorCode.toString() + 'rejectGOReceiveButton');
        //return '';
      }
      return Map();
    } catch (error) {
      print(error.toString());
      return Map();
    }
  }

  Future<Map<String, dynamic>> pmPlanRejectButton(
    pmPlanRejectJsonString,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.pmPlanRejectButton(
        auth: auth,
        pmPlanRejectJsonString: json.encode(pmPlanRejectJsonString),
        isLoading: isLoading ?? false,
      );

      var resourceData = res.data;

      print('Response Goods Order Approve: ${resourceData}');

      if (!res.hasError) {
        if (res.errorCode == 200) {
          var responseMap = json.decode(res.data);
          return responseMap;
        } else {
          // Get.dialog<void>(WarrantyClaimErrorDialog());
        }
      } else {
        Utility.showDialog(res.errorCode.toString() + 'pmPlanRejectButton');
        //return '';
      }
      return Map();
    } catch (error) {
      print(error.toString());
      return Map();
    }
  }

  Future<Map<String, dynamic>> goodsOrderCloseButton(
    goodsOrderCloseJsonString,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.goodsOrderCloseButton(
        auth: auth,
        goodsOrderCloseJsonString: goodsOrderCloseJsonString,
        isLoading: isLoading ?? false,
      );

      var resourceData = res.data;

      print('Response Goods Order Approve: ${resourceData}');

      if (!res.hasError) {
        if (res.errorCode == 200) {
          var responseMap = json.decode(res.data);
          return responseMap;
        } else {
          // Get.dialog<void>(WarrantyClaimErrorDialog());
        }
      } else {
        Utility.showDialog(
            res.errorCode.toString() + 'goodsOrderApprovedButton');
        //return '';
      }
      return Map();
    } catch (error) {
      print(error.toString());
      return Map();
    }
  }

  Future<List<PaiedModel?>?> updatePaidBy({
    required int? facilityId,
    required bool isLoading,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      log(auth);
      final res = await _dataRepository.updatePaidBy(
        facilityId: facilityId,
        isLoading: isLoading,
        auth: auth,
      );
      print('Paid List Data: ${res.data}');

      if (!res.hasError) {
        final jsonFacilityModels = jsonDecode(res.data);
        final List<PaiedModel> _paid = jsonFacilityModels
            .map<PaiedModel>(
                (m) => PaiedModel.fromJson(Map<String, dynamic>.from(m)))
            .toList();
        return _paid;
      }
    } catch (error) {
      log(error.toString());
      return [];
    }
    return null;
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

  ///Risk Type List
  Future<List<RiskTypeModel>> getRiskTypeList({
    required int? facility_id,
    // int? blockId,
    // required String categoryIds,
    required bool isLoading,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      log(auth);
      final res = await _dataRepository.getRiskTypeList(
        facility_id: facility_id,
        isLoading: isLoading,
        auth: auth,
      );
      print('Risk Type List Data: ${res.data}');

      if (!res.hasError) {
        var riskTypeList = riskTypeModelFromJson(res.data);
        return riskTypeList;
      }
      return [];
    } catch (error) {
      log(error.toString());
      return [];
    }
  }

  ///Employees List
  Future<List<EmployeeListModel2>> getEmployeesList({
    required int? facility_id,
    // int? blockId,
    // required String categoryIds,
    required bool isLoading,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      log(auth);
      final res = await _dataRepository.getEmployeesList(
        facility_id: facility_id,
        isLoading: isLoading,
        auth: auth,
      );
      print('Employee List Data: ${res.data}');

      if (!res.hasError) {
        var employeeList = employeeListModel2FromJson(res.data);
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
    // required int? job_type_id,
    required bool isLoading,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      log(auth);
      final res = await _dataRepository.getFacilityTypeList(
        // job_type_id: job_type_id,
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
    int? job_type_id,
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
        return facilityTypeList.reversed.toList();
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

  ///Permit Cancel Condition List
  Future<List<PermitCancelListModel>> getPermitConditionList({
    required int? isCancle,
    required bool isLoading,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      log(auth);
      final res = await _dataRepository.getPermitConditionList(
        isCancle: isCancle,
        isLoading: isLoading,
        auth: auth,
      );
      print('PermitCondition List Data: ${res.data}');

      if (!res.hasError) {
        var permitConditionList = permitCancelListModelFromJson(res.data);
        return permitConditionList;
      }
      return [];
    } catch (error) {
      log(error.toString());
      return [];
    }
  }

  ///Permit Close Condition List
  Future<List<PermitCancelListModel>> getPermitCloseConditionList({
    required int? isClose,
    required bool isLoading,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      log(auth);
      final res = await _dataRepository.getPermitCloseConditionList(
        isClose: isClose,
        isLoading: isLoading,
        auth: auth,
      );
      print('PermitCloseCondition List Data: ${res.data}');

      if (!res.hasError) {
        var permitCloseConditionList = permitCancelListModelFromJson(res.data);
        return permitCloseConditionList;
      }
      return [];
    } catch (error) {
      log(error.toString());
      return [];
    }
  }

  ///Permit Extend Condition List
  Future<List<PermitCancelListModel>> getPermitExtendConditionList({
    required int? isExtend,
    required bool isLoading,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      log(auth);
      final res = await _dataRepository.getPermitExtendConditionList(
        isExtend: isExtend,
        isLoading: isLoading,
        auth: auth,
      );
      print('PermitExtendCondition List Data: ${res.data}');

      if (!res.hasError) {
        var permitExtendConditionList = permitCancelListModelFromJson(res.data);
        return permitExtendConditionList;
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
    String? start_date,
    required String end_date,
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
        start_date: start_date,
        end_date: end_date,
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

// inventory list

  ///Incident Report List

  Future<List<IncidentReportListModel>> getIncidentReportList({
    required int? facility_id,
    String? start_date,
    required String end_date,
    required bool isLoading,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      log(auth);
      final res = await _dataRepository.getIncidentReportList(
        facility_id: facility_id,
        start_date: start_date,
        end_date: end_date,
        isLoading: isLoading,
        auth: auth,
      );
      print('IncidentReportList: ${res.data}');

      if (!res.hasError) {
        var incidentReportList = incidentReportListModelFromJson(res.data);
        return incidentReportList.reversed.toList();
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + 'getIncidentReportList');
        return [];
      }
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

  ///Equipment Model List 26
  Future<List<EquipmentListModel>> getEquipmentModelList({
    required int? facilityId,
    required bool isLoading,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      log(auth);
      final res = await _dataRepository.getEquipmentModelList(
        facilityId: facilityId,
        isLoading: isLoading,
        auth: auth,
      );
      print('EquipmentModelList:${res.data}');

      if (!res.hasError) {
        var equipmentList = equipmentListModelFromJson(res.data);
        return equipmentList;
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + 'getEquipmentModelList');
        return [];
      }
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

  ///Module Cleaning Task List
  Future<List<MCTaskListModel>> getMCTaskList({
    required int? facility_id,
    required bool isLoading,
    String? start_date,
    required String end_date,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      log(auth);
      final res = await _dataRepository.getMCTaskList(
        facility_id: facility_id,
        isLoading: isLoading,
        start_date: start_date,
        end_date: end_date,
        auth: auth,
      );
      print('MCTaskList: ${res.data}');

      if (!res.hasError) {
        var mcTaskList = mcTaskListModelFromJson(res.data);
        return mcTaskList.reversed.toList();
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + 'getMCTaskList');
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
    bool? self_view,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      int userId = varUserAccessModel.value.user_id ?? 0;

      final res = await _dataRepository.getJobList(
        auth: auth,
        facilityId: facilityId ?? 0,
        userId: userId,
        self_view: self_view,
        isLoading: isLoading ?? false,
      );
      // print({"res.data", res.data});
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

  Future<List<GrievanceModel?>?> getGrievanceList(
    String auth,
    int? facilityId,
    bool? isLoading,
    bool? self_view,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      int userId = varUserAccessModel.value.user_id ?? 0;

      final res = await _dataRepository.getGrievanceList(
        auth: auth,
        facilityId: facilityId ?? 0,
        userId: userId,
        self_view: self_view,
        isLoading: isLoading ?? false,
      );
      // print({"res.data", res.data});
      if (!res.hasError) {
        final jsonGrievanceModels = jsonDecode(res.data);
        final List<GrievanceModel> _grievanceModelList = jsonGrievanceModels
            .map<GrievanceModel>(
                (m) => GrievanceModel.fromJson(Map<String, dynamic>.from(m)))
            .toList();

        return _grievanceModelList;
      } else {
        Utility.showDialog(res.errorCode.toString() + 'getGrievanceList');
        return [];
      }
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

  Future<Map<String, dynamic>> createGrievanceData(
    createGoReq,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.submitPurchaseOrderData(
        auth: auth,
        createGoReq: createGoReq,
        isLoading: isLoading ?? false,
      );

      var resourceData = res.data;

      print('Response Create Goods order req  : ${resourceData}');

      if (!res.hasError) {
        Fluttertoast.showToast(
            msg: " Grievance added successfully...", fontSize: 16.0);
        Get.offNamed(
          Routes.addGrievance,
        );

        // if (res.errorCode == 200) {
        //   var responseMap = json.decode(res.data);
        //   return responseMap;
        // }

        // Fluttertoast.showToast(msg: "Data add successfully...", fontSize: 16.0);
      } else {
        Utility.showDialog(res.errorCode.toString() + 'createGrievance');
        //return '';
      }
      return Map();
    } catch (error) {
      print(error.toString());
      return Map();
    }
  }

  Future<List<NewPermitModel>> getNewPermitList(
    String auth,
    int? facilityId,
    bool? isLoading,
    bool? self_view,
    bool? non_expired,
    String? start_date,
    String end_date,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      int userId = varUserAccessModel.value.user_id ?? 0;

      final res = await _dataRepository.getNewPermitList(
        auth: auth,
        // facilityId: 45,
        // userId: 33,
        facilityId: facilityId,
        start_date: start_date,
        self_view: self_view,
        non_expired: non_expired,
        end_date: end_date,
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
        //  Utility.showDialog(res.errorCode.toString() + 'getNewPermitList');
        return [];
      }
    } catch (error) {
      print(error.toString());

      return [];
    }
  }

  Future<void> permitIssueButton(
    String? comment,
    String? id,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      final res = await _dataRepository.permitIssueButton(
        auth: auth,
        comment: comment,
        id: id,
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

  Future<Map<String, dynamic>> permitApprovedButton(
    rejectCancelPermitJsonString,
    String? ptwStatus,
    int? jobId,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.permitApprovedButton(
        auth: auth,
        rejectCancelPermitJsonString: json.encode(rejectCancelPermitJsonString),
        ptwStatus: ptwStatus,
        jobId: jobId,
        isLoading: isLoading ?? false,
      );

      var resourceData = res.data;

      print('Response Approve Extened Response: ${resourceData}');

      if (!res.hasError) {
        if (res.errorCode == 200) {
          var responseMap = json.decode(res.data);
          return responseMap;
        } else {
          // Get.dialog<void>(WarrantyClaimErrorDialog());
        }
      } else {
        Utility.showDialog(res.errorCode.toString() + 'ApproveExtenedResponse');
        //return '';
      }
      return Map();
    } catch (error) {
      print(error.toString());
      return Map();
    }
  }
  // Future<void> permitApprovedButton(
  //   String? comment,
  //   String? id,
  //   String? ptwStatus,
  //   int? jobId,
  //   bool? isLoading,
  // ) async {
  //   try {
  //     final auth = await getSecuredValue(LocalKeys.authToken);

  //     final res = await _dataRepository.permitApprovedButton(
  //       auth: auth,
  //       comment: comment,
  //       id: id,
  //       ptwStatus: ptwStatus,
  //       jobId: jobId,
  //       isLoading: isLoading ?? false,
  //     );
  //     print('PermitApproved&ExtendApproveResponse5: ${res.data}');

  //     if (!res.hasError) {
  //       //  return _permitIssueModel;
  //     } else {
  //       Utility.showDialog(res.errorCode.toString() + 'permitIssueButton');
  //     }
  //   } catch (error) {
  //     log(error.toString());
  //   }
  // }

  Future<void> permitCancelByIssuerButton(
    String? comment,
    String? id,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      final res = await _dataRepository.permitCancelByIssuerButton(
        auth: auth,
        comment: comment,
        id: id,
        isLoading: isLoading ?? false,
      );
      print('PermitCancelByIssuerResponse: ${res.data}');

      if (!res.hasError) {
        //  return _permitIssueModel;
      } else {
        Utility.showDialog(
            res.errorCode.toString() + 'permitCancelByIssuerButton');
      }
    } catch (error) {
      log(error.toString());
    }
  }

  ///Cancel Permit
  Future<Map<String, dynamic>> permitCancelRequestButton(
      // String? comment,
      // String? id,
      cancelPermitJsonString,
      bool? isLoading,
      int? jobId) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      final res = await _dataRepository.permitCancelRequestButton(
          auth: auth,
          cancelPermitJsonString: json.encode(cancelPermitJsonString),
          isLoading: isLoading ?? false,
          jobId: jobId);
      print('PermitCancelRequestResponse: ${res.data}');

      if (!res.hasError) {
        //  return _permitIssueModel;
      } else {
        Utility.showDialog(
            res.errorCode.toString() + 'permitCancelRequestButton');
      }
      return Map();
    } catch (error) {
      log(error.toString());
      return Map();
    }
  }

  Future<Map<String, dynamic>> permitCancelByApproverButton(
    String? ptwStatus,
    cancelByApproverJsonString,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.permitCancelByApproverButton(
        auth: auth,
        ptwStatus: ptwStatus,
        cancelByApproverJsonString: json.encode(cancelByApproverJsonString),
        isLoading: isLoading ?? false,
      );

      var resourceData = res.data;

      print('PermitCancelByApprover Response: ${resourceData}');

      if (!res.hasError) {
        if (res.errorCode == 200) {
          var responseMap = json.decode(res.data);
          return responseMap;
        } else {
          // Get.dialog<void>(WarrantyClaimErrorDialog());
        }
      } else {
        Utility.showDialog(
            res.errorCode.toString() + 'PermitCancelByApproverResponse');
        //return '';
      }
      return Map();
    } catch (error) {
      print(error.toString());
      return Map();
    }
  }

  Future<Map<String, dynamic>> permitCancelRejectButton(
    rejectCancelPermitJsonString,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.permitCancelRejectButton(
        auth: auth,
        rejectCancelPermitJsonString: json.encode(rejectCancelPermitJsonString),
        isLoading: isLoading ?? false,
      );

      var resourceData = res.data;

      print('Response Permit Cancel Reject Response: ${resourceData}');

      if (!res.hasError) {
        if (res.errorCode == 200) {
          var responseMap = json.decode(res.data);
          return responseMap;
        } else {
          // Get.dialog<void>(WarrantyClaimErrorDialog());
        }
      } else {
        Utility.showDialog(
            res.errorCode.toString() + 'PermitCancelRejectResponse');
        //return '';
      }
      return Map();
    } catch (error) {
      print(error.toString());
      return Map();
    }
  }
  // Future<void> permitCancelRejectButton(
  //   String? comment,
  //   String? id,
  //   bool? isLoading,
  // ) async {
  //   try {
  //     final auth = await getSecuredValue(LocalKeys.authToken);

  //     final res = await _dataRepository.permitCancelRejectButton(
  //       auth: auth,
  //       comment: comment,
  //       id: id,
  //       isLoading: isLoading ?? false,
  //     );
  //     print('PermitCancelRejectResponse: ${res.data}');

  //     if (!res.hasError) {
  //       //  return _permitIssueModel;
  //     } else {
  //       Utility.showDialog(
  //           res.errorCode.toString() + 'permitCancelRejectButton');
  //     }
  //   } catch (error) {
  //     log(error.toString());
  //   }
  // }

  ///Extend Permit
  Future<Map<String, dynamic>> permitExtendButton(
    // String? comment,
    // String? id,
    extendPermitJsonString,
    bool? isLoading,
    int? jobId,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      final res = await _dataRepository.permitExtendButton(
          auth: auth,
          extendPermitJsonString: json.encode(extendPermitJsonString),
          isLoading: isLoading ?? false,
          jobId: jobId);
      print('PermitExtendRequestResponse: ${res.data}');

      if (!res.hasError) {
        //  return _permitIssueModel;
      } else {
        Utility.showDialog(res.errorCode.toString() + 'permitExtendtButton');
      }
      return Map();
    } catch (error) {
      log(error.toString());
      return Map();
    }
  }

  ///Close Permit
  Future<Map<String, dynamic>> permitCloseButton(
    // String? comment,
    // String? id,
    closePermitJsonString,
    bool? isLoading,
    int? jobId,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      final res = await _dataRepository.permitCloseButton(
        auth: auth,
        closePermitJsonString: json.encode(closePermitJsonString),
        isLoading: isLoading ?? false,
        jobId: jobId,
      );
      print('PermitCloseRequestResponse: ${res.data}');

      if (!res.hasError) {
        //  return _permitIssueModel;
      } else {
        Utility.showDialog(res.errorCode.toString() + 'permitCloseButton');
      }
      return Map();
    } catch (error) {
      log(error.toString());
      return Map();
    }
  }

  ///Abandon MC Execution
  Future<Map<String, dynamic>> abandonExecutionButton(
    abandoneJsonString,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.abandonExecutionButton(
        auth: auth,
        abandoneJsonString: json.encode(abandoneJsonString),
        isLoading: isLoading ?? false,
      );

      var resourceData = res.data;
      // var parsedJson = json.decode(resourceData);
      print('Response Abandon Execution: ${resourceData}');
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
          // Get.dialog<void>(WarrantyClaimErrorDialog());
        }
      } else {
        Utility.showDialog(res.errorCode.toString() + 'abandonExecutionButton');
        //return '';
      }
      return Map();
    } catch (error) {
      print(error.toString());
      return Map();
    }
  }

  ///Abandon Schedule Execution
  Future<Map<String, dynamic>> abandonScheduleExecutionButton(
    abandoneScheduleJsonString,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.abandonScheduleExecutionButton(
        auth: auth,
        abandoneScheduleJsonString: json.encode(abandoneScheduleJsonString),
        isLoading: isLoading ?? false,
      );

      var resourceData = res.data;
      // var parsedJson = json.decode(resourceData);
      print('Response Abandon Schedule Execution: ${resourceData}');
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
          // Get.dialog<void>(WarrantyClaimErrorDialog());
        }
      } else {
        Utility.showDialog(
            res.errorCode.toString() + 'abandonScheduleExecutionButton');
        //return '';
      }
      return Map();
    } catch (error) {
      print(error.toString());
      return Map();
    }
  }

  ///End MC Execution
  Future<Map<String, dynamic>> endMCExecutionButton(
    endJsonString,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.endMCExecutionButton(
        auth: auth,
        endJsonString: json.encode(endJsonString),
        isLoading: isLoading ?? false,
      );

      var resourceData = res.data;
      // var parsedJson = json.decode(resourceData);
      print('Response END Execution: ${resourceData}');
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
          // Get.dialog<void>(WarrantyClaimErrorDialog());
        }
      } else {
        Utility.showDialog(res.errorCode.toString() + 'endExecutionButton');
        //return '';
      }
      return Map();
    } catch (error) {
      print(error.toString());
      return Map();
    }
  }

  Future<void> startMCExecutionButton(
    int? executionId,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      final res = await _dataRepository.startMCExecutionButton(
        auth: auth,
        executionId: executionId,
        isLoading: isLoading ?? false,
      );
      print('StartExecutionResponse55: ${res.data}');

      if (!res.hasError) {
        //  return _permitIssueModel;
      } else {
        Utility.showDialog(res.errorCode.toString() + 'startMCExecutionButton');
      }
    } catch (error) {
      log(error.toString());
    }
  }

  Future<void> endMcExecutionButton(
    int? executionId,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      final res = await _dataRepository.endMcExecutionButton(
        auth: auth,
        executionId: executionId,
        isLoading: isLoading ?? false,
      );
      print('endExecutionResponse55: ${res.data}');

      if (!res.hasError) {
        //  return _permitIssueModel;
      } else {
        Utility.showDialog(res.errorCode.toString() + 'endMCExecutionButton');
      }
    } catch (error) {
      log(error.toString());
    }
  }

  Future<void> startMCExecutionScheduleButton(
    int? scheduleId,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      final res = await _dataRepository.startMCExecutionScheduleButton(
        auth: auth,
        scheduleId: scheduleId,
        isLoading: isLoading ?? false,
      );
      print('StartScheduleExecutionResponse55: ${res.data}');

      if (!res.hasError) {
        //  return _permitIssueModel;
      } else {
        Utility.showDialog(
            res.errorCode.toString() + 'startMCScheduleExecutionButton');
      }
    } catch (error) {
      log(error.toString());
    }
  }

  Future<void> endMCScheduleExecutionButton(
    int? scheduleId,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      final res = await _dataRepository.endMCScheduleExecutionButton(
        auth: auth,
        scheduleId: scheduleId,
        isLoading: isLoading ?? false,
      );
      print('EndScheduleExecutionResponse55: ${res.data}');

      if (!res.hasError) {
        //  return _permitIssueModel;
      } else {
        Utility.showDialog(
            res.errorCode.toString() + 'endMCScheduleExecutionButton');
      }
    } catch (error) {
      log(error.toString());
    }
  }

  // Future<void> permitRejectButton(
  //   String? comment,
  //   String? id,
  //   String? ptwStatus,
  //   int? jobId,
  //   bool? isLoading,
  // ) async {
  //   try {
  //     final auth = await getSecuredValue(LocalKeys.authToken);

  //     final res = await _dataRepository.permitRejectButton(
  //       auth: auth,
  //       comment: comment,
  //       id: id,
  //       ptwStatus: ptwStatus,
  //       jobId: jobId,
  //       isLoading: isLoading ?? false,
  //     );
  //     // print('PermitRejectResponse55: ${res.data}');

  //     if (!res.hasError) {
  //       //  return _permitIssueModel;
  //     } else {
  //       Utility.showDialog(res.errorCode.toString() + 'permitRejectButton');
  //     }
  //   } catch (error) {
  //     log(error.toString());
  //   }
  // }

  Future<Map<String, dynamic>> permitRejectButton(
    rejectExtendPermitJsonString,
    int? id,
    String? ptwStatus,
    int? jobId,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.permitRejectButton(
        auth: auth,
        rejectExtendPermitJsonString: json.encode(rejectExtendPermitJsonString),
        id: id,
        ptwStatus: ptwStatus,
        jobId: jobId,
        isLoading: isLoading ?? false,
      );

      var resourceData = res.data;

      print('Response Permit Extend Reject Response: ${resourceData}');

      if (!res.hasError) {
        if (res.errorCode == 200) {
          var responseMap = json.decode(res.data);
          return responseMap;
        } else {
          // Get.dialog<void>(WarrantyClaimErrorDialog());
        }
      } else {
        Utility.showDialog(
            res.errorCode.toString() + 'PermitExtendRejectResponse');
        //return '';
      }
      return Map();
    } catch (error) {
      print(error.toString());
      return Map();
    }
  }

  ///Incident Report Reject Button
  Future<void> incidentReportRejectButton(
    String? comment,
    String? id,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      final res = await _dataRepository.incidentReportRejectButton(
        auth: auth,
        comment: comment,
        id: id,
        isLoading: isLoading ?? false,
      );
      // print('IncidentReportRejectResponse: ${res.data}');

      if (!res.hasError) {
        //  return _permitIssueModel;
      } else {
        Utility.showDialog(
            res.errorCode.toString() + 'incidentReportRejectButton');
      }
    } catch (error) {
      log(error.toString());
    }
  }

  ///Incident Report Approve Button
  Future<void> incidentReportApproveButton(
    String? incidentId,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      final res = await _dataRepository.incidentReportApproveButton(
        auth: auth,
        incidentId: incidentId,
        isLoading: isLoading ?? false,
      );
      // print('IncidentReportApproveResponse: ${res.data}');

      if (!res.hasError) {
        //  return _permitIssueModel;
      } else {
        Utility.showDialog(
            res.errorCode.toString() + 'incidentReportApproveButton');
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

  Future<List<TypePermitModel?>?> getTypePermitList(
      bool? isLoading, int? facility_id) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getTypePermitList(
          auth: auth, isLoading: isLoading, facility_id: facility_id);

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

  Future<List<ModuleListModel?>?> getModulesList(
      bool? isLoading, int? facility_id) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getModulesList(
          auth: auth, isLoading: isLoading, facility_id: facility_id);

      if (!res.hasError) {
        final jsonModuleListModels = jsonDecode(res.data);
        final List<ModuleListModel> _typePermitModelList = jsonModuleListModels
            .map<ModuleListModel>(
                (m) => ModuleListModel.fromJson(Map<String, dynamic>.from(m)))
            .toList();
        return _typePermitModelList;
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + 'getModulesList');
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

  Future<List<InventoryCategoryModel2?>?> getInventoryCategory2List(
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
        final List<InventoryCategoryModel2> _inventoryCategoryModelList =
            jsonInventoryCategoryModels
                .map<InventoryCategoryModel2>(
                  (m) => InventoryCategoryModel2.fromJson(
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

  Future<List<InventoryCategoryModel2?>?> getAffectedPartList(
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
        final List<InventoryCategoryModel2> _inventoryCategoryModelList =
            jsonInventoryCategoryModels
                .map<InventoryCategoryModel2>(
                  (m) => InventoryCategoryModel2.fromJson(
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

  Future<Map<String, dynamic>> createMcPlan(
    createMcPlans,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.createMcPlan(
        auth: auth,
        createMcPlans: createMcPlans,
        isLoading: isLoading ?? false,
      );

      var resourceData = res.data;

      print('Response Create MC  : ${resourceData}');

      if (!res.hasError) {
        Fluttertoast.showToast(
            msg: " paln  Add Successfully...", fontSize: 16.0);
        Get.offNamed(
          Routes.moduleCleaningListPlan,
        );

        // if (res.errorCode == 200) {
        //   var responseMap = json.decode(res.data);
        //   return responseMap;
        // }

        // Fluttertoast.showToast(msg: "Data add successfully...", fontSize: 16.0);
      } else {
        Utility.showDialog(res.errorCode.toString() + 'createMC');
        //return '';
      }
      return Map();
    } catch (error) {
      print(error.toString());
      return Map();
    }
  }

  Future<Map<String, dynamic>> updateMcPlan(
    updateMcPlans,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.updateMcPlan(
        auth: auth,
        updateMcPlans: updateMcPlans,
        isLoading: isLoading ?? false,
      );

      var resourceData = res.data;

      print('Response Update MC : ${resourceData}');

      if (!res.hasError) {
        // Fluttertoast.showToast(
        //     msg: " paln  Add Successfully...", fontSize: 16.0);
        // Get.offNamed(
        //   Routes.moduleCleaningListPlan,
        // );

        if (res.errorCode == 200) {
          var responseMap = json.decode(res.data);
          return responseMap;
        }

        // Fluttertoast.showToast(msg: "Data add successfully...", fontSize: 16.0);
      } else {
        Utility.showDialog(res.errorCode.toString() + 'updateMC');
        //return '';
      }
      return Map();
    } catch (error) {
      print(error.toString());
      return Map();
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

  Future<List<JobAssociatedModel>> getjobDetailsModel(
    String? auth,
    int jobId,
    int? userId,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      final res = await _dataRepository.getjobDetailsModel(
        auth: auth,
        jobId: jobId,
        userId: userId,
        isLoading: isLoading,
      );

      if (!res.hasError) {
        final jsonCalibrationListModelModels = jsonDecode(res.data);

        final List<JobAssociatedModel> _CalibrationListModelList =
            jsonCalibrationListModelModels
                .map<JobAssociatedModel>((m) =>
                    JobAssociatedModel.fromJson(Map<String, dynamic>.from(m)))
                .toList();

        return _CalibrationListModelList.reversed.toList();
        // final _jsonJobDetailsModel = jobAssociatedModelFromJson(res.data);

        // List<JobAssociatedModel> _jobAssociatedModel = [];
        // _jobAssociatedModel.add(_jsonJobDetailsModel);
        // return _jobAssociatedModel;
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
    String? workTypeIds,
    String? auth,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getToolsRequiredToWorkTypeList(
        workTypeIds: workTypeIds,
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
        isLoading: isLoading,
      );

      if (!res.hasError) {
        if (res.errorCode == 200) {
          var responseMap = json.decode(res.data);
          createJobCard(auth, jobId, true);
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
        saveValue(LocalKeys.setUserAccess, res.data);
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

  Future<List<PreventiveCheckListModel?>?> getPreventiveCheckListForPm(
      {int? type,
      int? facilityId,
      bool? isLoading,
      int? frequencyid,
      int? categoryId}) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getPreventiveCheckListForPm(
          auth: auth,
          facilityId: facilityId ?? 0,
          type: type,
          isLoading: isLoading ?? false,
          categoryId: categoryId,
          frequencyid: frequencyid);

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
            res.errorCode.toString() + ' getPreventiveCheckListForPm');
        return [];
      }
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

  Future<List<PreventiveCheckListModel?>?> getPreventiveCheckListForAudit(
      {int? type,
      int? facilityId,
      bool? isLoading,
      int? frequencyid,
      int? categoryId}) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getPreventiveCheckListForAudit(
          auth: auth,
          facilityId: facilityId ?? 0,
          type: type,
          isLoading: isLoading ?? false,
          categoryId: categoryId,
          frequencyid: frequencyid);

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
            res.errorCode.toString() + ' getPreventiveCheckListForPm');
        return [];
      }
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

  Future<List<PreventiveCheckListModel?>?> getPreventiveCheckList(
      {int? type,
      int? facilityId,
      bool? isLoading,
      int? frequencyid,
      int? categoryId}) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getPreventiveCheckList(
          auth: auth,
          facilityId: facilityId ?? 0,
          type: type,
          isLoading: isLoading ?? false,
          categoryId: categoryId,
          frequencyid: frequencyid);

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
    // int? facilityId,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getInventoryStatusList(
        auth: auth,
        // facilityId: facilityId ?? 0,
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
      int? selectedchecklistId, bool? isLoading, int? facilityId) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      //print({"checkid", selectedchecklistId});
      final res = await _dataRepository.getCheckPointlist(
          auth: auth,
          selectedchecklistId: selectedchecklistId ?? 0,
          isLoading: isLoading ?? false,
          facilityId: facilityId);
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

  Future<bool> saveRoleAccess({bool? isLoading, saveRolelistJsonString}) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      log(auth);
      final res = await _dataRepository.saveRoleAccess(
          auth: auth,
          isLoading: isLoading,
          saveRolelistJsonString: saveRolelistJsonString);

      if (!res.hasError) {
        return true;
      } else {
        Utility.showDialog(res.errorCode.toString() + 'saveRoleAccess');
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
        // if (res.errorCode == 200) {
        //   var responseMap = json.decode(res.data);
        //   var jcId = responseMap["id"];
        //   // Get.toNamed(Routes.createMrs,
        //   //     arguments: {"whereUsedId": jcId[0], "whereUsed": 4});
        //   // Get.toNamed(
        //   //   Routes.newPermit,
        //   //   arguments: {"jcId":jcId[0]},
        //   // );
        //   print('jcId:${jcId[0]}');
        //   print('JobCard:${res.data}');
        //   return responseMap;
        // }
      } else {
        Utility.showDialog(res.errorCode.toString() + 'createJobCard');
      }
      return Map();
    } catch (error) {
      print(error.toString());
      return Map();
    }
  }

  Future<Map<String, dynamic>> startJobCard(
    auth,
    jcCard,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.startJobCard(
        auth: auth,
        jcCard: jcCard,
        isLoading: isLoading,
      );

      if (!res.hasError) {
        if (res.errorCode == 200) {
          var responseMap = json.decode(res.data);
          return responseMap;
        }
      } else {
        Utility.showDialog(res.errorCode.toString() + 'startJobCard');
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

  ///Permit History
  Future<List<HistoryModel>?> getPermitHistory(
    int? moduleType,
    int? permitId,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getPermitHistory(
        auth: auth,
        moduleType: moduleType,
        permitId: permitId,
        isLoading: isLoading,
      );
      // print('Permit History: ${res.data}');

      if (!res.hasError) {
        final jsonPermitDetailsModels = jsonDecode(res.data);
        final List<HistoryModel> _permitDetailsList = jsonPermitDetailsModels
            .map<HistoryModel>(
              (m) => HistoryModel.fromJson(
                Map<String, dynamic>.from(m),
              ),
            )
            .toList();

        return _permitDetailsList;
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
        jobCard: json.encode(jobCard),
        isLoading: isLoading,
      );
      print({"res.data", res.data});
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

  Future<Map<String, dynamic>> carryForwardJob(
    jobCard,
    bool? isLoading,
  ) async {
    // final res = ResponseModel(data: '', hasError: false);
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.carryForwardJob(
        auth: auth,
        jobCard: json.encode(jobCard),
        isLoading: isLoading,
      );

      if (!res.hasError) {
        if (res.errorCode == 200) {
          var responseMap = json.decode(res.data);
          return responseMap;
        }
      } //
      else {
        Utility.showDialog(
            res.errorCode.toString() + ' repo- carryForwardJobCard');
      }
      return Map();
    } //
    catch (error) {
      print(error.toString());
      Utility.showDialog(error.toString() + ' repo - carryForwardJobCard');
      return Map();
    }
  }

  Future<Map<String, dynamic>> closeJob(
    jobCard,
    bool? isLoading,
  ) async {
    // final res = ResponseModel(data: '', hasError: false);
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.closeJob(
        auth: auth,
        jobCard: json.encode(jobCard),
        isLoading: isLoading,
      );

      if (!res.hasError) {
        if (res.errorCode == 200) {
          var responseMap = json.decode(res.data);
          return responseMap;
        }
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + ' repo- closeJobCard');
      }
      return Map();
    } //
    catch (error) {
      print(error.toString());
      Utility.showDialog(error.toString() + ' repo - closeJobCard');
      return Map();
    }
  }

  ///

  ///
  Future<bool> approveRequestCalibration(
      {bool? isLoading, approveCalibrationtoJsonString}) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      log(auth);
      final res = await _dataRepository.approveRequestCalibration(
          auth: auth,
          isLoading: isLoading,
          approveCalibrationtoJsonString:
              json.encode(approveCalibrationtoJsonString));
      print({"res.data", res.data});
      if (!res.hasError) {
        Fluttertoast.showToast(msg: res.data, fontSize: 45.0);

        return true;
      } else {
        Fluttertoast.showToast(msg: res.data, fontSize: 45.0);
        return false;
      }
    } catch (error) {
      log(error.toString());
      return false;
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
        print({"_historyModelList", _historyModelList});
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

  Future<List<LinkedJobsToPermitModel>?> getJobsLinkdToPermitList(
    //String? auth,
    int? permitId,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getJobsLinkdToPermitList(
        auth: auth,
        isLoading: isLoading,
        permitId: permitId,
      );

      if (!res.hasError) {
        final jsonLinkedJobsToPermitModel = jsonDecode(res.data);
        final List<LinkedJobsToPermitModel> _linkedJobsToPermit =
            jsonLinkedJobsToPermitModel
                .map<LinkedJobsToPermitModel>(
                  (m) => LinkedJobsToPermitModel.fromJson(
                      Map<String, dynamic>.from(m)),
                )
                .toList();
        print({"_linkedJobsToPermit", _linkedJobsToPermit});
        return _linkedJobsToPermit;
      } else {
        Utility.showDialog(res.errorCode.toString() + 'getLinkedJobsToPermit');
        return null;
      }
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

  Future<List<MRSListByJobIdModel>?> getMrsListByModule(
    //String? auth,
    int? jobId,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getMrsListByModule(
        auth: auth,
        isLoading: isLoading,
        jobId: jobId,
      );

      if (!res.hasError) {
        final jsonMrsListByModuleModel = jsonDecode(res.data);
        final List<MRSListByJobIdModel> _mrsListByModule =
            jsonMrsListByModuleModel
                .map<MRSListByJobIdModel>(
                  (m) => MRSListByJobIdModel.fromJson(
                      Map<String, dynamic>.from(m)),
                )
                .toList();
        print({"_mrsListByModule", _mrsListByModule});
        return _mrsListByModule;
      } else {
        Utility.showDialog(res.errorCode.toString() + 'getMrsListByModule');
        return null;
      }
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

  Future<List<MRSListByJobIdModel>?> getMrsListByModuleTask(
    //String? auth,
    int? taskId,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getMrsListByModuleTask(
        auth: auth,
        isLoading: isLoading,
        taskId: taskId,
      );
      if (!res.hasError) {
        final jsonMrsListByModuleModel = jsonDecode(res.data);
        final List<MRSListByJobIdModel> _mrsListByModule =
            jsonMrsListByModuleModel
                .map<MRSListByJobIdModel>(
                  (m) => MRSListByJobIdModel.fromJson(
                      Map<String, dynamic>.from(m)),
                )
                .toList();
        print({"_mrsListByModule", _mrsListByModule});
        return _mrsListByModule;
      } else {
        Utility.showDialog(res.errorCode.toString() + 'getMrsListByModuleTask');
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

  Future<void> deletePmPlan(Object planId, bool isLoading) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.deletePmPlan(
        auth: auth,
        planId: planId,
        isLoading: isLoading,
      );

      if (!res.hasError) {
        //get delete response back from API
      } else {
        Utility.showDialog(res.errorCode.toString() + 'deletePmPlan');
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

        return _CalibrationListModelList.reversed.toList();
      } else {
        Utility.showDialog(res.errorCode.toString() + 'getCalibrationList');
        return [];
      }
    } catch (error) {
      log(error.toString());

      return [];
    }
  }

  Future<bool> requestCalibration({bool? isLoading, requestCalibration}) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      log(auth);
      final res = await _dataRepository.requestCalibration(
          auth: auth,
          isLoading: isLoading,
          requestCalibration: requestCalibration);
      print({"res.data", res.data});
      if (!res.hasError) {
        Fluttertoast.showToast(msg: res.data, fontSize: 45.0);

        return true;
      } else {
        Fluttertoast.showToast(msg: res.data, fontSize: 45.0);
        return false;
      }
      // return true;
    } catch (error) {
      log(error.toString());
      return false;
    }
  }

  Future<bool> rejectRequestCalibration(
      {bool? isLoading, rejectCalibrationtoJsonString}) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      log(auth);
      final res = await _dataRepository.rejectRequestCalibration(
          auth: auth,
          isLoading: isLoading,
          rejectCalibrationtoJsonString:
              json.encode(rejectCalibrationtoJsonString));
      print({"res.data", res.data});
      if (!res.hasError) {
        Fluttertoast.showToast(msg: res.data, fontSize: 45.0);

        return true;
      } else {
        Fluttertoast.showToast(msg: res.data, fontSize: 45.0);
        return false;
      }
    } catch (error) {
      log(error.toString());
      return false;
    }
  }

  Future<bool> approveJobCards({bool? isLoading, approveJsonString}) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      log(auth);
      final res = await _dataRepository.approveJobCards(
          auth: auth,
          isLoading: isLoading,
          approveJsonString: json.encode(approveJsonString));
      print({"res.data", res.data});
      if (!res.hasError) {
        Fluttertoast.showToast(msg: res.data, fontSize: 45.0);
        Get.offAllNamed(Routes.jobList);

        return true;
      } else {
        Fluttertoast.showToast(msg: res.data, fontSize: 45.0);
        return false;
      }
    } catch (error) {
      log(error.toString());
      return false;
    }
  }

  Future<bool> rejectJobCard({bool? isLoading, rejectJsonString}) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      log(auth);
      final res = await _dataRepository.rejectJobCard(
          auth: auth,
          isLoading: isLoading,
          rejectJsonString: json.encode(rejectJsonString));
      print({"res.data", res.data});
      if (!res.hasError) {
        Fluttertoast.showToast(msg: res.data, fontSize: 45.0);

        return true;
      } else {
        Fluttertoast.showToast(msg: res.data, fontSize: 45.0);
        return false;
      }
    } catch (error) {
      log(error.toString());
      return false;
    }
  }

  Future<bool> approvecloseJob({bool? isLoading, approveJsonString}) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      log(auth);
      final res = await _dataRepository.approvecloseJob(
          auth: auth,
          isLoading: isLoading,
          approveJsonString: json.encode(approveJsonString));
      print({"res.data", res.data});
      if (!res.hasError) {
        Fluttertoast.showToast(msg: res.data, fontSize: 45.0);
        Get.offAllNamed(Routes.jobList);

        return true;
      } else {
        Fluttertoast.showToast(msg: res.data, fontSize: 45.0);
        return false;
      }
    } catch (error) {
      log(error.toString());
      return false;
    }
  }

  Future<bool> rejectcloseJob({bool? isLoading, rejectJsonString}) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      log(auth);
      final res = await _dataRepository.rejectcloseJob(
          auth: auth,
          isLoading: isLoading,
          rejectJsonString: json.encode(rejectJsonString));
      print({"res.data", res.data});
      if (!res.hasError) {
        Fluttertoast.showToast(msg: res.data, fontSize: 45.0);

        return true;
      } else {
        Fluttertoast.showToast(msg: res.data, fontSize: 45.0);
        return false;
      }
    } catch (error) {
      log(error.toString());
      return false;
    }
  }

  Future<bool> approveCloseCalibration(
      {bool? isLoading, approveCalibrationtoJsonString}) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      log(auth);
      final res = await _dataRepository.approveCloseCalibration(
          auth: auth,
          isLoading: isLoading,
          approveCalibrationtoJsonString:
              json.encode(approveCalibrationtoJsonString));
      print({"res.data", res.data});
      if (!res.hasError) {
        Fluttertoast.showToast(msg: res.data, fontSize: 45.0);

        return true;
      } else {
        Fluttertoast.showToast(msg: res.data, fontSize: 45.0);
        return false;
      }
    } catch (error) {
      log(error.toString());
      return false;
    }
  }

  Future<bool> rejectCloseCalibration(
      {bool? isLoading, rejectCalibrationtoJsonString}) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      log(auth);
      final res = await _dataRepository.rejectCloseCalibration(
          auth: auth,
          isLoading: isLoading,
          rejectCalibrationtoJsonString:
              json.encode(rejectCalibrationtoJsonString));
      print({"res.data", res.data});
      if (!res.hasError) {
        Fluttertoast.showToast(msg: res.data, fontSize: 45.0);

        return true;
      } else {
        Fluttertoast.showToast(msg: res.data, fontSize: 45.0);
        return false;
      }
    } catch (error) {
      log(error.toString());
      return false;
    }
  }

  Future<bool> closeCalibration(
      {bool? isLoading, closeCalibrationtoJsonString}) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      log(auth);
      final res = await _dataRepository.closeCalibration(
          auth: auth,
          isLoading: isLoading,
          closeCalibrationtoJsonString:
              json.encode(closeCalibrationtoJsonString));
      print({"res.data", res.data});
      if (!res.hasError) {
        Fluttertoast.showToast(msg: res.data, fontSize: 45.0);

        return true;
      } else {
        Fluttertoast.showToast(msg: res.data, fontSize: 45.0);
        return false;
      }
    } catch (error) {
      log(error.toString());
      return false;
    }
  }

  Future<bool> completeCalibration(
      {bool? isLoading, completeCalibrationtoJsonString}) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      log(auth);
      final res = await _dataRepository.completeCalibration(
          auth: auth,
          isLoading: isLoading,
          completeCalibrationtoJsonString:
              json.encode(completeCalibrationtoJsonString));
      print({"res.data", res.data});
      if (!res.hasError) {
        Fluttertoast.showToast(msg: res.data, fontSize: 45.0);

        return true;
      } else {
        Fluttertoast.showToast(msg: res.data, fontSize: 45.0);
        return false;
      }
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

  Future<List<PmTaskListModel?>?> getPmTaskList(int? facilityId,
      bool? isLoading, dynamic startDate, dynamic endDate) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getPmTaskList(
          auth: auth,
          facilityId: facilityId ?? 0,
          isLoading: isLoading ?? false,
          startDate: startDate,
          endDate: endDate);
      // print(res.data);
      if (!res.hasError) {
        final jsonPmTaskListModelModels = jsonDecode(res.data);

        final List<PmTaskListModel> _PmTaskListModelList =
            jsonPmTaskListModelModels
                .map<PmTaskListModel>((m) =>
                    PmTaskListModel.fromJson(Map<String, dynamic>.from(m)))
                .toList();
        // print({"object", _PmTaskListModelList});
        return _PmTaskListModelList.reversed.toList();
      } else {
        Utility.showDialog(res.errorCode.toString() + 'getPmTaskList');
        return [];
      }
    } catch (error) {
      log(error.toString());

      return [];
    }
  }

  Future<List<PmTaskListModel?>?> getAuditTaskList(int? facilityId,
      bool? isLoading, dynamic startDate, dynamic endDate) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getAuditTaskList(
          auth: auth,
          facilityId: facilityId ?? 0,
          isLoading: isLoading ?? false,
          startDate: startDate,
          endDate: endDate);
      // print(res.data);
      if (!res.hasError) {
        final jsonPmTaskListModelModels = jsonDecode(res.data);

        final List<PmTaskListModel> _PmTaskListModelList =
            jsonPmTaskListModelModels
                .map<PmTaskListModel>((m) =>
                    PmTaskListModel.fromJson(Map<String, dynamic>.from(m)))
                .toList();
        // print({"object", _PmTaskListModelList});
        return _PmTaskListModelList.reversed.toList();
      } else {
        Utility.showDialog(res.errorCode.toString() + 'getAuditTaskList');
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
      // print(res.data);
      if (!res.hasError) {
        final PmtaskViewModel _permitDetailsModel =
            pmtaskViewModelFromJson(res.data);
        // print({"respqwe", _permitDetailsModel});

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

  Future<CreateSOPModel?> browseFiles(Uint8List? fileBytes, String fileName,
      int? importType, bool isLoading, int facilityId) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.browseFiles(
          auth: auth,
          fileBytes: fileBytes,
          fileName: fileName,
          importType: importType ?? 0,
          isLoading: isLoading,
          facilityId: facilityId);
      if (res != null) {
        print("file upload:${res}");
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

  Future<bool> updateSafetyMeasure(
      {bool? isLoading, createSafetyMeasureJsonString}) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      log(auth);
      final res = await _dataRepository.updateSafetyMeasure(
          auth: auth,
          isLoading: isLoading,
          createSafetyMeasureJsonString: createSafetyMeasureJsonString);

      print('Response updateSafetyMeasure: ${res.data}');
      if (!res.hasError) {
        return true;
      } else {
        Utility.showDialog(res.errorCode.toString() + 'getSafetyMeasureList');
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

  Future<GetNotificationModel?> getRoleNotificationList(
    int? roleId,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getRoleNotificationList(
        auth: auth,
        roleId: roleId,
        isLoading: isLoading,
      );
      if (!res.hasError) {
        final GetNotificationModel _getNotificationModel =
            getNotificationModelFromJson(res.data);
        return _getNotificationModel;
      } //
      else {
        Utility.showDialog(
            res.errorCode.toString() + 'getRoleNotificationList');
        return null;
      }
    } //
    catch (error) {
      print(error.toString());
      return null;
    }
  }

  Future<GetAccessLevelByIdModel?> getUserAccessListById(
    int? userId,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getUserAccessListById(
        auth: auth,
        userId: userId,
        isLoading: isLoading,
      );
      if (!res.hasError) {
        final GetAccessLevelByIdModel _accessLevelModel =
            getaccessLevelModelFromJson(res.data);
        return _accessLevelModel;
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + 'getUserAccessListById');
        return null;
      }
    } //
    catch (error) {
      print(error.toString());
      return null;
    }
  }

  Future<GetNotificationByUserIdModel?> getUserNotificationListById(
    int? userId,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getUserNotificationListById(
        auth: auth,
        userId: userId,
        isLoading: isLoading,
      );
      if (!res.hasError) {
        final GetNotificationByUserIdModel _getNotificationByUserIdModel =
            getNotificationByUserIdModelFromJson(res.data);
        return _getNotificationByUserIdModel;
      } //
      else {
        Utility.showDialog(
            res.errorCode.toString() + 'getUserNotificationListById');
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

  Future<List<UserListModel>?> getUserList(
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

        return _UserListModelList.reversed.toList();
      } else {
        Utility.showDialog(res.errorCode.toString() + ' getUserList');
        return [];
      }
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

  Future<List<JobCardModel?>?> jobCardList(
    int? facilityId,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.jobCardList(
        auth: auth,
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );

      if (!res.hasError) {
        final jsonJobCardListModelModels = jsonDecode(res.data);
        // print(res.data);
        final List<JobCardModel> _JobCardListModelList =
            jsonJobCardListModelModels
                .map<JobCardModel>(
                    (m) => JobCardModel.fromJson(Map<String, dynamic>.from(m)))
                .toList();

        return _JobCardListModelList.reversed.toList();
      } else {
        Utility.showDialog(res.errorCode.toString() + ' getjobcardList');
        return [];
      }
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

  Future<List<DocumentManagerModel?>?> getDocumentManager(
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
        final List<DocumentManagerModel> _UserListModelList =
            jsonUserListModelModels
                .map<DocumentManagerModel>((m) =>
                    DocumentManagerModel.fromJson(Map<String, dynamic>.from(m)))
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
        // Get.offNamed(Routes.userList);
        Get.offAndToNamed(Routes.userList);

        //   print("hellooooo");
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

  Future<AddUserModel?> uploadImge(
      Uint8List? fileBytes, String fileName, bool isLoading) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.uploadImge(
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

  Future<AddInventoryRequestModel?> uploadImgeInventory(
      Uint8List? fileBytes, String fileName, bool isLoading) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.uploadImgeInventory(
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

  Future<List<WarrantyModel?>?> getWarrantyList(
    int? type,
    int? facilityId,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getWarrantyList(
        auth: auth,
        facilityId: facilityId ?? 0,
        type: type,
        isLoading: isLoading ?? false,
      );

      if (!res.hasError) {
        final jsonModuleListModelModels = jsonDecode(res.data);
        // print(res.data);
        final List<WarrantyModel> _ModuleListModelList =
            jsonModuleListModelModels
                .map<WarrantyModel>(
                    (m) => WarrantyModel.fromJson(Map<String, dynamic>.from(m)))
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

  Future<List<BusinessTypeModel>> getBusinessTypeList({
    required int? businessType,
    // int? blockId,
    // required String categoryIds,
    int? blockId,
    String? categoryIds,
    required bool isLoading,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getBusinessTypeList(
        businessType: businessType,
        isLoading: isLoading,
        auth: auth,
      );
      if (!res.hasError) {
        var businessList = BusinessTypeModelFromJson(res.data);
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

  Future<List<GetAssetDataModel?>?> getAssetList(
    String? auth,
    int? facilityId,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getAssetList(
        auth: auth,
        isLoading: isLoading ?? false,
        facilityId: facilityId ?? 0,
      );

      if (!res.hasError) {
        final jsonFacilityModels = jsonDecode(res.data);
        final List<GetAssetDataModel> _getAssetList = jsonFacilityModels
            .map<GetAssetDataModel>(
                (m) => GetAssetDataModel.fromJson(Map<String, dynamic>.from(m)))
            .toList();

        return _getAssetList;
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + 'getAssetList');
        return null;
      }
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

  Future<Map<String, dynamic>> approveGoodsOrder(
    goodsOrderApproveJsonString,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.approveGoodsOrder(
        auth: auth,
        goodsOrderApproveJsonString: goodsOrderApproveJsonString,
        isLoading: isLoading ?? false,
      );

      var resourceData = res.data;

      print('Response Goods Order Approve: ${resourceData}');

      if (!res.hasError) {
        if (res.errorCode == 200) {
          var responseMap = json.decode(res.data);
          return responseMap;
        } else {
          // Get.dialog<void>(WarrantyClaimErrorDialog());
        }
      } else {
        Utility.showDialog(
            res.errorCode.toString() + 'goodsOrderApprovedButton');
        //return '';
      }
      return Map();
    } catch (error) {
      print(error.toString());
      return Map();
    }
  }
  // Future<bool> approveGoodsOrder({bool? isLoading, approvetoJsonString}) async {
  //   try {
  //     final auth = await getSecuredValue(LocalKeys.authToken);
  //     log(auth);
  //     final res = await _dataRepository.approveGoodsOrder(
  //         auth: auth,
  //         isLoading: isLoading,
  //         approvetoJsonString: approvetoJsonString);
  //     print({"res.data", res.data});
  //     if (!res.hasError) {
  //       Fluttertoast.showToast(msg: res.data, fontSize: 45.0);

  //       return true;
  //     } else {
  //       Fluttertoast.showToast(msg: res.data, fontSize: 45.0);
  //       return false;
  //     }
  //   } catch (error) {
  //     log(error.toString());
  //     return false;
  //   }
  // }

  Future<Map<String, dynamic>> rejectGoodsOrder(
    goodsOrderRejectJsonString,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.rejectGoodsOrder(
        auth: auth,
        goodsOrderRejectJsonString: goodsOrderRejectJsonString,
        isLoading: isLoading ?? false,
      );

      var resourceData = res.data;

      print('Response Goods Order Approve: ${resourceData}');

      if (!res.hasError) {
        if (res.errorCode == 200) {
          var responseMap = json.decode(res.data);
          return responseMap;
        } else {
          // Get.dialog<void>(WarrantyClaimErrorDialog());
        }
      } else {
        Utility.showDialog(res.errorCode.toString() + 'reqOrderRejectedButton');
        //return '';
      }
      return Map();
    } catch (error) {
      print(error.toString());
      return Map();
    }
  }

  Future<List<HistoryModel>?> getRoHistory(
    int? moduleType,
    int? id,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getRoHistory(
        auth: auth,
        moduleType: moduleType,
        id: id,
        isLoading: isLoading,
      );
      // print('Permit History: ${res.data}');

      if (!res.hasError) {
        final jsonGoDetailsModels = jsonDecode(res.data);
        final List<HistoryModel> _goDetailsList = jsonGoDetailsModels
            .map<HistoryModel>(
              (m) => HistoryModel.fromJson(
                Map<String, dynamic>.from(m),
              ),
            )
            .toList();

        return _goDetailsList;
      } else {
        Utility.showDialog(res.errorCode.toString());
        return null;
      }
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

  // Future<bool> rejectGoodsOrder({bool? isLoading, rejecttoJsonString}) async {
  //   try {
  //     final auth = await getSecuredValue(LocalKeys.authToken);
  //     log(auth);
  //     final res = await _dataRepository.rejectGoodsOrder(
  //         auth: auth,
  //         isLoading: isLoading,
  //         rejecttoJsonString: rejecttoJsonString);
  //     print({"res.data", res.data});
  //     if (!res.hasError) {
  //       Fluttertoast.showToast(msg: res.data, fontSize: 45.0);

  //       return true;
  //     } else {
  //       Fluttertoast.showToast(msg: res.data, fontSize: 45.0);
  //       return false;
  //     }
  //   } catch (error) {
  //     log(error.toString());
  //     return false;
  //   }
  // }

  Future<bool> createBusinessListNumber(
      {bool? isLoading, businesslistJsonString}) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.createBusinessList(
          auth: auth,
          isLoading: isLoading,
          businesslistJsonString: businesslistJsonString);

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

  Future<bool> createSPVlist({bool? isLoading, businesslistJsonString}) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.createSPVlist(
          auth: auth,
          isLoading: isLoading,
          businesslistJsonString: businesslistJsonString);

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

  Future<Map<String, dynamic>> saveNotification(
    saveNotificationJsonString,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.saveNotification(
        auth: auth,
        saveNotificationJsonString: saveNotificationJsonString,
        isLoading: isLoading ?? false,
      );
      if (!res.hasError) {
        if (res.errorCode == 200) {
          var responseMap = json.decode(res.data);
          return responseMap;
        }
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + 'saveNotification');
      }
      return Map();
    } catch (error) {
      print(error.toString());
      return Map();
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

  Future<bool> updateInventory(
      {bool? isLoading, addInventoryJsonString}) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.updateInventory(
          auth: auth,
          isLoading: isLoading,
          addInventoryJsonString: json.encode(addInventoryJsonString));
      print({"resp", res.data});
      if (!res.hasError) {
        Fluttertoast.showToast(
            msg: "Data update successfully...", fontSize: 16.0);

        Get.offAllNamed(
          Routes.inventoryList,
        );
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

  Future<List<InventoryModel>> inventoryList(
      {required int? facilityId,
      required bool isLoading,
      int? categoryId}) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.inventoryList(
          facilityId: facilityId,
          isLoading: isLoading,
          auth: auth,
          categoryId: categoryId);
      // print('Inventory List Data: ${res.data}');

      if (!res.hasError) {
        var inventoryList = inventoryModelFromJson(res.data);
        return inventoryList.reversed.toList();
      }
//
      else {
        Utility.showDialog(res.errorCode.toString() + 'inventoryList');
        return [];
      }
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

  Future<List<InventoryModel>> inventoryListviaCategory(
      {required int? facilityId,
      required bool isLoading,
      int? categoryId}) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.inventoryListviaCategory(
          facilityId: facilityId,
          isLoading: isLoading,
          auth: auth,
          categoryId: categoryId);
      // print('Inventory List Data: ${res.data}');

      if (!res.hasError) {
        var inventoryList = inventoryModelFromJson(res.data);
        return inventoryList.reversed.toList();
      }
//
      else {
        Utility.showDialog(res.errorCode.toString() + 'inventoryList');
        return [];
      }
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

  Future<bool> startCalibration(Object calibrationId, bool isLoading) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.startCalibration(
        auth: auth,
        calibrationId: calibrationId,
        isLoading: isLoading,
      );

      if (!res.hasError) {
        return true;
        //get delete response back from API
      } else {
        Utility.showDialog(res.errorCode.toString() + 'deleteCkeckpoint');
        return false;
      }
    } catch (error) {
      print(error.toString());
      return false;
    }
  }

  Future<bool> createFacilityType(
      {bool? isLoading, facilitylistJsonString}) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.createFacilityType(
          auth: auth,
          isLoading: isLoading,
          facilitylistJsonString: facilitylistJsonString);

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

/////
  Future<CalibrationDetailModel?> getCalibrationView(
    int? calibrationId,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getCalibrationView(
        auth: auth,
        calibrationId: calibrationId,
        isLoading: isLoading,
      );
      if (!res.hasError) {
        final CalibrationDetailModel _calibrationDetailsModel =
            calibrationDetailModelFromJson(res.data);
        // print({"calibrationDetailsModel", _calibrationDetailsModel});

        return _calibrationDetailsModel;
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + 'calibrationDetail');
        return null;
      }
    } //
    catch (error) {
      print(error.toString());
      return null;
    }
  }

  //end

  Future<bool> createBlockType({bool? isLoading, blockTypeJsonString}) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.createBlockType(
          auth: auth,
          isLoading: isLoading,
          facilitylistJsonString: blockTypeJsonString);

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

  Future<List<AssetMasterModel?>?> getAssetMasterList(
    int? type,
    int? facilityId,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getAssetMasterList(
        auth: auth,
        facilityId: facilityId ?? 0,
        type: type,
        isLoading: isLoading ?? false,
      );

      if (!res.hasError) {
        final jsonModuleListModelModels = jsonDecode(res.data);
        // print(res.data);
        final List<AssetMasterModel> _ModuleListModelList =
            jsonModuleListModelModels
                .map<AssetMasterModel>((m) =>
                    AssetMasterModel.fromJson(Map<String, dynamic>.from(m)))
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

  Future<List<DesignationModel?>?> getDesignationList(
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getDesignationList(
        auth: auth,
        isLoading: isLoading ?? false,
      );

      if (!res.hasError) {
        final jsonRoleModels = jsonDecode(res.data);
        final List<DesignationModel> _roleModelList = jsonRoleModels
            .map<DesignationModel>(
              (m) => DesignationModel.fromJson(Map<String, dynamic>.from(m)),
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

  Future<void> deleteBusinessList(Object business_id, bool isLoading) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.deleteBusinessList(
        auth: auth,
        business_id: business_id,
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

  Future<void> deleteBlock(Object business_id, bool isLoading) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.deleteBlock(
        auth: auth,
        business_id: business_id,
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

  Future<void> deleteSPV(Object business_id, bool isLoading) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.deleteSPV(
        auth: auth,
        business_id: business_id,
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

  Future<void> deleteGoodsOrders(Object id, bool isLoading) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.deleteGoodsOrders(
        auth: auth,
        id: id,
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

  Future<bool> updateBusinesslist({
    bool? isLoading,
    modulelistJsonString,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.updateBusinesslist(
        auth: auth,
        isLoading: isLoading,
        modulelistJsonString: modulelistJsonString,
      );
      print(res.data);
      if (!res.hasError) {
        return true;
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + 'updateBusinesslist');
        return false;
      }
    } catch (error) {
      print(error.toString());
      return false;
    }
  }

  Future<bool> updateSPV({
    bool? isLoading,
    modulelistJsonString,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.updateSPV(
        auth: auth,
        isLoading: isLoading,
        modulelistJsonString: modulelistJsonString,
      );
      print(res.data);
      if (!res.hasError) {
        return true;
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + 'updateBusinesslist');
        return false;
      }
    } catch (error) {
      print(error.toString());
      return false;
    }
  }

  Future<bool> updateFacilityList({
    bool? isLoading,
    modulelistJsonString,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.updateFacilityList(
        auth: auth,
        isLoading: isLoading,
        modulelistJsonString: modulelistJsonString,
      );
      print(res.data);
      if (!res.hasError) {
        return true;
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + 'updateBusinesslist');
        return false;
      }
    } catch (error) {
      print(error.toString());
      return false;
    }
  }

  Future<List<CompetencyModel?>?> getCompetencyList(
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getCompetencyList(
        auth: auth,
        isLoading: isLoading ?? false,
      );

      if (!res.hasError) {
        final jsonPreventiveCheckListModelModels = jsonDecode(res.data);
        // print(res.data);
        final List<CompetencyModel> _PreventiveCheckListModelList =
            jsonPreventiveCheckListModelModels
                .map<CompetencyModel>((m) =>
                    CompetencyModel.fromJson(Map<String, dynamic>.from(m)))
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

  Future<bool> createCompetency({bool? isLoading, competencyJsonString}) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.createCompetency(
          auth: auth,
          isLoading: isLoading,
          competencyJsonString: competencyJsonString);

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

  Future<bool> updateCompetency({
    bool? isLoading,
    competencyJsonString,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.updateCompetency(
        auth: auth,
        isLoading: isLoading,
        competencyJsonString: competencyJsonString,
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

  Future<void> deleteCompetencyList(Object checklist_id, bool isLoading) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.deleteCompetencyList(
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

  Future<bool> createPermitType({bool? isLoading, checklistJsonString}) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.createPermitType(
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

  Future<void> deletePermitType(Object permit_id, bool isLoading) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.deletePermitType(
        auth: auth,
        permit_id: permit_id,
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

  Future<void> deleteSafetyMeasure(Object id, bool isLoading) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.deleteSafetyMeasure(
        auth: auth,
        id: id,
        isLoading: isLoading,
      );

      if (!res.hasError) {
        //get delete response back from API
      } else {
        Utility.showDialog(res.errorCode.toString() + 'deleteSafetyMeasure');
      }
    } catch (error) {
      print(error.toString());
    }
  }

  Future<bool> updatePermitType({
    bool? isLoading,
    checklistJsonString,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.updatePermitType(
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

  Future<bool> createRoleList({bool? isLoading, modulelistJsonString}) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.createRoleList(
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

  Future<bool> updateRoleList({
    bool? isLoading,
    modulelistJsonString,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.updateRoleList(
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

  Future<void> deleteRole(Object module_id, bool isLoading) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.deleteRole(
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

  Future<bool> createDesignation(
      {bool? isLoading, designationJsonString}) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.createDesignation(
          auth: auth,
          isLoading: isLoading,
          designationJsonString: designationJsonString);

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

  Future<bool> createResponsibility(
      {bool? isLoading, designationJsonString}) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.createResponsibility(
          auth: auth,
          isLoading: isLoading,
          designationJsonString: designationJsonString);

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

  Future<bool> updateDesignation({
    bool? isLoading,
    designationJsonString,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.updateDesignation(
        auth: auth,
        isLoading: isLoading,
        designationJsonString: designationJsonString,
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

  Future<bool> updateResponsibility({
    bool? isLoading,
    designationJsonString,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.updateResponsibility(
        auth: auth,
        isLoading: isLoading,
        designationJsonString: json.encode(designationJsonString),
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

  Future<void> deleteDesignation(Object module_id, bool isLoading) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.deleteDesignation(
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

  Future<void> deleteResponsibility(Object module_id, bool isLoading) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.deleteResponsibility(
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

  Future<bool> createBusinessType(
      {bool? isLoading, businessTypeJsonString}) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.createBusinessType(
          auth: auth,
          isLoading: isLoading,
          businessTypeJsonString: businessTypeJsonString);

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

  Future<void> deleteBusinessType(
      Object businesstype_id, bool isLoading) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.deleteBusinessType(
        auth: auth,
        businesstype_id: businesstype_id,
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

  Future<bool> updateBusinessType({
    bool? isLoading,
    businessTypeJsonString,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.updateBusinessType(
        auth: auth,
        isLoading: isLoading,
        businessTypeJsonString: businessTypeJsonString,
      );
      print(res.data);
      if (!res.hasError) {
        return true;
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + 'updateBusinesslist');
        return false;
      }
    } catch (error) {
      print(error.toString());
      return false;
    }
  }

  Future<List<MrsListModel?>?> getMrsList(int? facilityId, bool? isLoading,
      dynamic startDate, dynamic endDate) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      int userId = varUserAccessModel.value.user_id ?? 0;
      final res = await _dataRepository.getMrsList(
          auth: auth,
          facilityId: facilityId ?? 0,
          isLoading: isLoading ?? false,
          startDate: startDate,
          endDate: endDate,
          userId: userId);

      if (!res.hasError) {
        final jsonMrsListModelModels = jsonDecode(res.data);
        // print(res.data);
        final List<MrsListModel> _MrsListModelList = jsonMrsListModelModels
            .map<MrsListModel>(
                (m) => MrsListModel.fromJson(Map<String, dynamic>.from(m)))
            .toList();

        return _MrsListModelList.reversed.toList();
      } else {
        Utility.showDialog(res.errorCode.toString() + ' getMrsList');
        return [];
      }
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

  Future<List<PlantStockListModel?>?> getPlantStockList(
      int? facilityId,
      bool? isLoading,
      dynamic startDate,
      dynamic endDate,
      List<int>? selectedAssetsNameIdList) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      int userId = varUserAccessModel.value.user_id ?? 0;
      final res = await _dataRepository.getPlantStockList(
          auth: auth,
          facilityId: facilityId ?? 0,
          isLoading: isLoading ?? false,
          startDate: startDate,
          endDate: endDate,
          userId: userId,
          selectedAssetsNameIdList: selectedAssetsNameIdList);

      if (!res.hasError) {
        final jsonPlantStockListModels = jsonDecode(res.data);
        // print(res.data);
        final List<PlantStockListModel> _plantStockListModels =
            jsonPlantStockListModels
                .map<PlantStockListModel>((m) =>
                    PlantStockListModel.fromJson(Map<String, dynamic>.from(m)))
                .toList();

        return _plantStockListModels;
      } else {
        Utility.showDialog(res.errorCode.toString() + ' getPlantStockList');
        return [];
      }
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

  Future<List<GetAssetItemsModel?>?> getEquipmentAssetsList(
    int? facilityId,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getEquipmentAssetsList(
        auth: auth,
        isLoading: isLoading ?? false,
        facilityId: facilityId ?? 0,
      );

      if (!res.hasError) {
        final jsonFacilityModels = jsonDecode(res.data);
        final List<GetAssetItemsModel> _getAssetList = jsonFacilityModels
            .map<GetAssetItemsModel>((m) =>
                GetAssetItemsModel.fromJson(Map<String, dynamic>.from(m)))
            .toList();

        return _getAssetList;
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + 'getAssetList');
        return null;
      }
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

  Future<void> deleteFacility(Object business_id, bool isLoading) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.deleteFacility(
        auth: auth,
        business_id: business_id,
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

  Future<Map<String, dynamic>> createMrs(
    createMrsJsonString,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.createMrs(
        auth: auth,
        createMrsJsonString: createMrsJsonString,
        isLoading: isLoading ?? false,
      );

      var resourceData = res.data;

      print('Response Create Goods order : ${resourceData}');

      if (!res.hasError) {
        Fluttertoast.showToast(msg: " Mrs Add Successfully...", fontSize: 16.0);

        // if (res.errorCode == 200) {
        //   var responseMap = json.decode(res.data);
        //   return responseMap;
        // }

        // Fluttertoast.showToast(msg: "Data add successfully...", fontSize: 16.0);
      } else {
        Utility.showDialog(res.errorCode.toString() + 'createMrs');
        //return '';
      }
      return Map();
    } catch (error) {
      print(error.toString());
      return Map();
    }
  }

  Future<List<IncidentRiskTypeModel>> getIncidentRiskTypeList({
    // required int? job_type_id,
    required bool isLoading,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      log(auth);
      final res = await _dataRepository.getIncidentRiskTypeList(
        // job_type_id: job_type_id,
        isLoading: isLoading,
        auth: auth,
      );
      print('Asset type List Data: ${res.data}');

      if (!res.hasError) {
        var facilityTypeList = IncidentRiskTypeListModelFromJson(res.data);
        return facilityTypeList;
      }
      return [];
    } catch (error) {
      log(error.toString());
      return [];
    }
  }

  Future<List<InsuranceProviderModel>> getInsuranceProvider({
    // required int? job_type_id,
    required bool isLoading,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      log(auth);
      final res = await _dataRepository.getInsuranceProvider(
        // job_type_id: job_type_id,
        isLoading: isLoading,
        auth: auth,
      );
      print('Asset type List Data: ${res.data}');

      if (!res.hasError) {
        var facilityTypeList = InsuranceProviderModelFromJson(res.data);
        return facilityTypeList;
      }
      return [];
    } catch (error) {
      log(error.toString());
      return [];
    }
  }

  Future<bool> createRiskType({bool? isLoading, riskTypeJsonString}) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.createRiskType(
          auth: auth,
          isLoading: isLoading,
          riskTypeJsonString: riskTypeJsonString);

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

  Future<void> deleteRiskType(Object businesstype_id, bool isLoading) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.deleteRiskType(
        auth: auth,
        businesstype_id: businesstype_id,
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

  Future<bool> updateRiskType({
    bool? isLoading,
    riskTypeJsonString,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.updateRiskType(
        auth: auth,
        isLoading: isLoading,
        riskTypeJsonString: riskTypeJsonString,
      );
      print(res.data);
      if (!res.hasError) {
        return true;
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + 'updateBusinesslist');
        return false;
      }
    } catch (error) {
      print(error.toString());
      return false;
    }
  }

  Future<MrsDetailsModel?> getMrsDetails(
    int? mrsId,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getMrsDetails(
        auth: auth,
        mrsId: mrsId,
        isLoading: isLoading,
      );
      if (!res.hasError) {
        final MrsDetailsModel _mrsDetailModel =
            mrsDetailsModelFromJson(res.data);
        return _mrsDetailModel;
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + 'getMrsDetails');
        return null;
      }
    } //
    catch (error) {
      print(error.toString());
      return null;
    }
  }

  Future<PMPlanDetail?> getPmPlanDetails(
    int? pmPlanId,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getPmPlanDetails(
        auth: auth,
        pmPlanId: pmPlanId,
        isLoading: isLoading,
      );
      if (!res.hasError) {
        final PMPlanDetail _pmPlanDetailModel = pmPlanDetailFromJson(res.data);
        return _pmPlanDetailModel;
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + 'getPmPlanDetails');
        return null;
      }
    } //
    catch (error) {
      print(error.toString());
      return null;
    }
  }

  Future<bool> updateInventoryStatus({
    bool? isLoading,
    checklistJsonString,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.updateInventoryStatus(
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

  Future<void> deleteInventoryStatus(
      Object check_point_id, bool isLoading) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.deleteInventoryStatus(
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

  Future<bool> createInventoryStatus(
      {bool? isLoading, required checklistJsonString}) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      log(auth);
      final res = await _dataRepository.createInventoryStatus(
          auth: auth,
          isLoading: isLoading,
          checkpointJsonString: checklistJsonString);

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

  Future<bool> updateInventoryType({
    bool? isLoading,
    checklistJsonString,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.updateInventoryType(
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

  Future<void> deleteInventoryType(
      Object check_point_id, bool isLoading) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.deleteInventoryType(
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

  Future<bool> createInventoryType(
      {bool? isLoading, required checklistJsonString}) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      log(auth);
      final res = await _dataRepository.createInventoryType(
          auth: auth,
          isLoading: isLoading,
          checkpointJsonString: checklistJsonString);

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

  Future<bool> updateInventoryCategory({
    bool? isLoading,
    checklistJsonString,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.updateInventoryCategory(
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

  Future<void> deleteInventoryCategory(
      Object check_point_id, bool isLoading) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.deleteInventoryCategory(
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

  Future<bool> createInventoryCategory(
      {bool? isLoading, required checklistJsonString}) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      log(auth);
      final res = await _dataRepository.createInventoryCategory(
          auth: auth,
          isLoading: isLoading,
          checkpointJsonString: checklistJsonString);

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

  Future<bool> approveMrs({bool? isLoading, approvetoJsonString}) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      log(auth);
      final res = await _dataRepository.approveMrs(
          auth: auth,
          isLoading: isLoading,
          approvetoJsonString: approvetoJsonString);
      print({"res.data", res.data});
      if (!res.hasError) {
        Fluttertoast.showToast(msg: res.data, fontSize: 45.0);

        return true;
      } else {
        Fluttertoast.showToast(msg: res.data, fontSize: 45.0);
        return false;
      }
    } catch (error) {
      log(error.toString());
      return false;
    }
  }

  Future<bool> updateBlockType({
    bool? isLoading,
    modulelistJsonString,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.updateBlockType(
        auth: auth,
        isLoading: isLoading,
        checklistJsonString: modulelistJsonString,
      );
      print(res.data);
      if (!res.hasError) {
        return true;
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + 'updateBusinesslist');
        return false;
      }
    } catch (error) {
      print(error.toString());
      return false;
    }
  }

  Future<bool> rejectMrs({bool? isLoading, rejecttoJsonString}) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      log(auth);
      final res = await _dataRepository.rejectMrs(
          auth: auth,
          isLoading: isLoading,
          rejecttoJsonString: rejecttoJsonString);
      print({"res.data", res.data});
      if (!res.hasError) {
        Fluttertoast.showToast(msg: res.data, fontSize: 45.0);

        return true;
      } else {
        Fluttertoast.showToast(msg: res.data, fontSize: 45.0);
        return false;
      }
    } catch (error) {
      log(error.toString());
      return false;
    }
  }

  Future<Map<String, dynamic>> editMrs(
    editMrsJsonString,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.editMrs(
        auth: auth,
        editMrsJsonString: editMrsJsonString,
        isLoading: isLoading ?? false,
      );

      if (!res.hasError) {
        Fluttertoast.showToast(
            msg: " Mrs edit Successfully...", fontSize: 16.0);
      } else {
        Utility.showDialog(res.errorCode.toString() + 'editMrs');
        //return '';
      }
      return Map();
    } catch (error) {
      print(error.toString());
      return Map();
    }
  }

  Future<List<InsuranceStatusModel>> getInsuranceStatus({
    // required int? job_type_id,
    required bool isLoading,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      log(auth);
      final res = await _dataRepository.getInsuranceStatus(
        isLoading: isLoading,
        auth: auth,
      );
      print('Asset type List Data: ${res.data}');

      if (!res.hasError) {
        var facilityTypeList = InsuranceStatusModelFromJson(res.data);
        return facilityTypeList;
      }
      return [];
    } catch (error) {
      log(error.toString());
      return [];
    }
  }

  Future<List<CalibrationCertificateModel?>?> getCalibrationCertificate(
    int? type,
    int? facilityId,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getCalibrationCertificate(
        auth: auth,
        facilityId: facilityId ?? 0,
        type: type,
        isLoading: isLoading ?? false,
      );

      if (!res.hasError) {
        final jsonCalibrationCertificate = jsonDecode(res.data);
        // print(res.data);
        final List<CalibrationCertificateModel> _CalibrationListModelList =
            jsonCalibrationCertificate
                .map<CalibrationCertificateModel>((m) =>
                    CalibrationCertificateModel.fromJson(
                        Map<String, dynamic>.from(m)))
                .toList();

        return _CalibrationListModelList;
      } else {
        Utility.showDialog(
            res.errorCode.toString() + ' getCalibrationCertificate');
        return [];
      }
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

  Future<List<WarrantyCertificateModel?>?> getWarrantyCertificate(
    int? type,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getWarrantyCertificate(
        auth: auth,
        type: type,
        isLoading: isLoading ?? false,
      );

      if (!res.hasError) {
        final jsonWarrantyCertificate = jsonDecode(res.data);
        // print(res.data);
        final List<WarrantyCertificateModel> _warrantyModel =
            jsonWarrantyCertificate
                .map<WarrantyCertificateModel>((m) =>
                    WarrantyCertificateModel.fromJson(
                        Map<String, dynamic>.from(m)))
                .toList();

        return _warrantyModel;
      } else {
        Utility.showDialog(
            res.errorCode.toString() + ' getWarrantyCertificate');
        return [];
      }
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

  Future<bool> saveRoleNotification(
      {bool? isLoading, saveRoleNotificationJsonString}) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      log(auth);
      final res = await _dataRepository.saveRoleNotification(
          auth: auth,
          isLoading: isLoading,
          saveRoleNotificationJsonString: saveRoleNotificationJsonString);

      if (!res.hasError) {
        return true;
      } else {
        Utility.showDialog(res.errorCode.toString() + 'saveRoleNotification');
        return true;
      }
    } catch (error) {
      print(error.toString());
      return false;
    }
  }

  Future<bool> issueMrs({bool? isLoading, issuetoJsonString}) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      log(auth);
      final res = await _dataRepository.issueMrs(
          auth: auth,
          isLoading: isLoading,
          issuetoJsonString: issuetoJsonString);
      print({"res.data", res.data});
      if (!res.hasError) {
        Fluttertoast.showToast(msg: res.data, fontSize: 45.0);

        return true;
      } else {
        Fluttertoast.showToast(msg: res.data, fontSize: 45.0);
        return false;
      }
    } catch (error) {
      log(error.toString());
      return false;
    }
  }

  Future<bool> approveIssueMrs(
      {bool? isLoading, issuemrsapprovetoJsonString}) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      log(auth);
      final res = await _dataRepository.approveIssueMrs(
          auth: auth,
          isLoading: isLoading,
          issuemrsapprovetoJsonString: issuemrsapprovetoJsonString);
      print({"res.data", res.data});
      if (!res.hasError) {
        Fluttertoast.showToast(msg: res.data, fontSize: 45.0);

        return true;
      } else {
        Fluttertoast.showToast(msg: res.data, fontSize: 45.0);
        return false;
      }
    } catch (error) {
      log(error.toString());
      return false;
    }
  }

  Future<bool> rejectIssueMrs(
      {bool? isLoading, rejectIssuetoJsonString}) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      log(auth);
      final res = await _dataRepository.rejectIssueMrs(
          auth: auth,
          isLoading: isLoading,
          rejectIssuetoJsonString: rejectIssuetoJsonString);
      print({"res.data", res.data});
      if (!res.hasError) {
        Fluttertoast.showToast(msg: res.data, fontSize: 45.0);

        return true;
      } else {
        Fluttertoast.showToast(msg: res.data, fontSize: 45.0);
        return false;
      }
    } catch (error) {
      log(error.toString());
      return false;
    }
  }

  Future<List<ReturnMrsListModel?>?> getReturnMrsList(
    int? facilityId,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      int userId = varUserAccessModel.value.user_id ?? 0;
      final res = await _dataRepository.getReturnMrsList(
          auth: auth,
          facilityId: facilityId ?? 0,
          isLoading: isLoading ?? false,
          userId: userId);

      if (!res.hasError) {
        final jsonReturnMrsListModelModels = jsonDecode(res.data);
        // print(res.data);
        final List<ReturnMrsListModel> _ReturnMrsListModelList =
            jsonReturnMrsListModelModels
                .map<ReturnMrsListModel>((m) =>
                    ReturnMrsListModel.fromJson(Map<String, dynamic>.from(m)))
                .toList();

        return _ReturnMrsListModelList.reversed.toList();
      } else {
        Utility.showDialog(res.errorCode.toString() + ' getMrsList');
        return [];
      }
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

  Future<Map<String, dynamic>> scheduleLinkToPermit(
    scheduleId,
    activity,
    permitId,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.scheduleLinkToPermit(
        auth: auth,
        scheduleId: scheduleId,
        permitId: permitId,
        activity: activity,
        isLoading: isLoading ?? false,
      );

      if (!res.hasError) {
        if (res.errorCode == 200) {
          var responseMap = json.decode(res.data);
          return responseMap;
        }
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + 'scheduleLinkToPermit');
        return Map();
      }
      return Map();
    } //
    catch (error) {
      Utility.showDialog(error.toString() + 'scheduleLinkToPermit');
      return Map();
    }
  }

  Future<Map<String, dynamic>> setPmTask(
    scheduleId,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.setPmTask(
        auth: auth,
        scheduleId: scheduleId,
        isLoading: isLoading ?? false,
      );

      if (!res.hasError) {
        if (res.errorCode == 200) {
          var responseMap = json.decode(res.data);
          return responseMap;
        }
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + 'setPmTask');
        return Map();
      }
      return Map();
    } //
    catch (error) {
      Utility.showDialog(error.toString() + 'setPmTask');
      return Map();
    }
  }

  Future<bool> approveReturnMrs({bool? isLoading, approvetoJsonString}) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      log(auth);
      final res = await _dataRepository.approveReturnMrs(
          auth: auth,
          isLoading: isLoading,
          approvetoJsonString: approvetoJsonString);
      print({"res.data", res.data});
      if (!res.hasError) {
        Fluttertoast.showToast(msg: res.data, fontSize: 45.0);

        return true;
      } else {
        Fluttertoast.showToast(msg: res.data, fontSize: 45.0);
        return false;
      }
    } catch (error) {
      log(error.toString());
      return false;
    }
  }

  Future<bool> rejectRetrunMrs({bool? isLoading, rejecttoJsonString}) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      log(auth);
      final res = await _dataRepository.rejectRetrunMrs(
          auth: auth,
          isLoading: isLoading,
          rejecttoJsonString: rejecttoJsonString);
      print({"res.data", res.data});
      if (!res.hasError) {
        Fluttertoast.showToast(msg: res.data, fontSize: 45.0);

        return true;
      } else {
        Fluttertoast.showToast(msg: res.data, fontSize: 45.0);
        return false;
      }
    } catch (error) {
      log(error.toString());
      return false;
    }
  }

  Future<ReturnMrsDetailsModel?> getReturnMrsDetails(
    int? mrsId,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getReturnMrsDetails(
        auth: auth,
        mrsId: mrsId,
        isLoading: isLoading,
      );
      if (!res.hasError) {
        final ReturnMrsDetailsModel _returnMrsDetailModel =
            returnMrsDetailsModelFromJson(res.data);
        return _returnMrsDetailModel;
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + 'getMrsDetails');
        return null;
      }
    } //
    catch (error) {
      print(error.toString());
      return null;
    } //end
    //end
  }

  Future<bool> createJobType({bool? isLoading, jobTypeJsonString}) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.createJobType(
          auth: auth,
          isLoading: isLoading,
          jobTypeJsonString: jobTypeJsonString);

      if (!res.hasError) {
        return true;
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + ' jobTypeJsonString');
        return false;
      }
    } catch (error) {
      print(error.toString());
      return false;
    }
  }

  ///Create Safety Measure
  Future<bool> createSafetyMeasure(
      {bool? isLoading, safetyMeasurelistJsonString}) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.createSafetyMeasure(
          auth: auth,
          isLoading: isLoading,
          safetyMeasurelistJsonString: safetyMeasurelistJsonString);
      print({"SafetyMeasureResponse:", res.data});

      if (!res.hasError) {
        return true;
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + ' SafetyMeasureString');
        return false;
      }
    } catch (error) {
      print(error.toString());
      return false;
    }
  }

  Future<void> deleteJobType(Object check_point_id, bool isLoading) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.deleteJobType(
        auth: auth,
        check_point_id: check_point_id,
        isLoading: isLoading,
      );

      if (!res.hasError) {
        //get delete response back from API
      } else {
        Utility.showDialog(res.errorCode.toString() + 'deleteJobType');
      }
    } catch (error) {
      print(error.toString());
    }
  }

  Future<bool> updateTbt({
    bool? isLoading,
    tbtJsonString,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.updateTbt(
        auth: auth,
        isLoading: isLoading,
        tbtJsonString: tbtJsonString,
      );
      print(res.data);
      if (!res.hasError) {
        return true;
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + 'tbtJsonString');
        return false;
      }
    } catch (error) {
      print(error.toString());
      return false;
    }
  }

  Future<void> deleteSopType(Object check_point_id, bool isLoading) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.deleteSopType(
        auth: auth,
        check_point_id: check_point_id,
        isLoading: isLoading,
      );

      if (!res.hasError) {
        //get delete response back from API
      } else {
        Utility.showDialog(res.errorCode.toString() + 'deleteSopType');
      }
    } catch (error) {
      print(error.toString());
    }
  }

  Future<bool> updateSop({
    bool? isLoading,
    tbtJsonString,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.updateSop(
        auth: auth,
        isLoading: isLoading,
        tbtJsonString: tbtJsonString,
      );
      print(res.data);
      if (!res.hasError) {
        return true;
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + 'updateSop');
        return false;
      }
    } catch (error) {
      print(error.toString());
      return false;
    }
  }

  Future<EmployeeStockListModel?> getCmmsItemList(
    int? facilityId,
    bool? isLoading,
    int? userId,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      final res = await _dataRepository.getCmmsItemList(
          auth: auth,
          isLoading: isLoading ?? false,
          facilityId: facilityId ?? 0,
          userId: userId);

      if (!res.hasError) {
        final EmployeeStockListModel _employeeStockListModel =
            employeeStockListModelFromJson(res.data);
        return _employeeStockListModel;
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + 'getCmmsItemList');
        return null;
      }
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  Future<Map<String, dynamic>> createReturnMrs(
    createReturnMrsJsonString,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.createReturnMrs(
        auth: auth,
        createReturnMrsJsonString: createReturnMrsJsonString,
        isLoading: isLoading ?? false,
      );

      var resourceData = res.data;

      print('Response Create Goods order : ${resourceData}');

      if (!res.hasError) {
        if (res.errorCode == 200) {
          var responseMap = json.decode(res.data);
          Fluttertoast.showToast(
              msg: " Mrs Return Add Successfully...", fontSize: 16.0);

          return responseMap;
        }
      } else {
        Utility.showDialog(res.errorCode.toString() + 'createReturnMrs');
        //return '';
      }
      return Map();
    } catch (error) {
      print(error.toString());
      return Map();
    }
  }

  Future<List<FaultyMaterialReportModel?>?> getFaultyMaterialReportList(
      int? facilityId,
      bool? isLoading,
      dynamic startDate,
      dynamic endDate) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getFaultyMaterialReportList(
        auth: auth,
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
        startDate: startDate,
        endDate: endDate,
      );

      if (!res.hasError) {
        final jsonFaultyMaterialReportModels = jsonDecode(res.data);
        // print(res.data);
        final List<FaultyMaterialReportModel> _FaultyMaterialReportModels =
            jsonFaultyMaterialReportModels
                .map<FaultyMaterialReportModel>((m) =>
                    FaultyMaterialReportModel.fromJson(
                        Map<String, dynamic>.from(m)))
                .toList();

        return _FaultyMaterialReportModels;
      } else {
        Utility.showDialog(
            res.errorCode.toString() + ' getFaultyMaterialReportList');
        return [];
      }
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

  Future<List<PlantStockListModel>?> getEmployeeStockReportList(int? facilityId,
      bool? isLoading, int? userId, dynamic startDate, dynamic endDate) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      final res = await _dataRepository.getEmployeeStockReportList(
          auth: auth,
          isLoading: isLoading ?? false,
          facilityId: facilityId ?? 0,
          userId: userId,
          startDate: startDate,
          endDate: endDate);

      if (!res.hasError) {
        final jsonPlantStockListModels = jsonDecode(res.data);
        // print(res.data);
        final List<PlantStockListModel> _plantStockListModels =
            jsonPlantStockListModels
                .map<PlantStockListModel>((m) =>
                    PlantStockListModel.fromJson(Map<String, dynamic>.from(m)))
                .toList();

        return _plantStockListModels;
      } //
      else {
        Utility.showDialog(
            res.errorCode.toString() + 'getEmployeeStockReportList');
        return null;
      }
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  Future<List<PmPlanListModel?>?> getPmPlanList(int? facilityId,
      bool? isLoading, dynamic startDate, dynamic endDate) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getPmPlanList(
          auth: auth,
          facilityId: facilityId ?? 0,
          isLoading: isLoading ?? false,
          startDate: startDate,
          endDate: endDate);
      // print(res.data);
      if (!res.hasError) {
        final jsonPmPlanListModelModels = jsonDecode(res.data);

        final List<PmPlanListModel> _PmPlanListModelList =
            jsonPmPlanListModelModels
                .map<PmPlanListModel>((m) =>
                    PmPlanListModel.fromJson(Map<String, dynamic>.from(m)))
                .toList();
        // print({"object", _PmPlanListModelList});
        return _PmPlanListModelList.reversed.toList();
      } else {
        Utility.showDialog(res.errorCode.toString() + 'getPmPlanList');
        return [];
      }
    } catch (error) {
      log(error.toString());

      return [];
    }
  }

  Future<Map<String, dynamic>> createPmPlan(
    createPmPlanJsonString,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.createPmPlan(
        auth: auth,
        createPmPlanJsonString: createPmPlanJsonString,
        isLoading: isLoading ?? false,
      );

      var resourceData = res.data;

      print('Response Create Goods order : ${resourceData}');

      if (!res.hasError) {
        Fluttertoast.showToast(msg: "  Add Successfully...", fontSize: 16.0);

        // if (res.errorCode == 200) {
        //   var responseMap = json.decode(res.data);
        //   return responseMap;
        // }

        // Fluttertoast.showToast(msg: "Data add successfully...", fontSize: 16.0);
      } else {
        Utility.showDialog(res.errorCode.toString() + 'createMrs');
        //return '';
      }
      return Map();
    } catch (error) {
      print(error.toString());
      return Map();
    }
  }

  Future<Map<String, dynamic>> updatePmPlan(
    createPmPlanJsonString,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.updatePmPlan(
        auth: auth,
        createPmPlanJsonString: createPmPlanJsonString,
        isLoading: isLoading ?? false,
      );

      var resourceData = res.data;

      print('Response Create Goods order : ${resourceData}');

      if (!res.hasError) {
        Fluttertoast.showToast(msg: " update Successfully...", fontSize: 16.0);

        // if (res.errorCode == 200) {
        //   var responseMap = json.decode(res.data);
        //   return responseMap;
        // }

        // Fluttertoast.showToast(msg: "Data add successfully...", fontSize: 16.0);
      } else {
        Utility.showDialog(res.errorCode.toString() + 'createMrs');
        //return '';
      }
      return Map();
    } catch (error) {
      print(error.toString());
      return Map();
    }
  }

  Future<bool> approvePmTaskExecution(
      {bool? isLoading, approvetoJsonString}) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      log(auth);
      final res = await _dataRepository.approvePmTaskExecution(
          auth: auth,
          isLoading: isLoading,
          approvetoJsonString: json.encode(approvetoJsonString));
      print({"res.data", res.data});
      if (!res.hasError) {
        Fluttertoast.showToast(msg: res.data, fontSize: 45.0);

        return true;
      } else {
        Fluttertoast.showToast(msg: res.data, fontSize: 45.0);
        return false;
      }
    } catch (error) {
      log(error.toString());
      return false;
    }
  }

  Future<bool> rejectPmTaskExecution(
      {bool? isLoading, rejecttoJsonString}) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      log(auth);
      final res = await _dataRepository.rejectPmTaskExecution(
          auth: auth,
          isLoading: isLoading,
          rejecttoJsonString: json.encode(rejecttoJsonString));
      print({"res.data", res.data});
      if (!res.hasError) {
        Fluttertoast.showToast(msg: res.data, fontSize: 45.0);

        return true;
      } else {
        Fluttertoast.showToast(msg: res.data, fontSize: 45.0);
        return false;
      }
    } catch (error) {
      log(error.toString());
      return false;
    }
  }

  Future<bool> ClosePMTaskExecution(
      {bool? isLoading, closetoJsonString}) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      log(auth);
      final res = await _dataRepository.ClosePMTaskExecution(
          auth: auth,
          isLoading: isLoading,
          ClosePMTaskExecutionJsonString: json.encode(closetoJsonString));
      print({"res.data", res.data});
      if (!res.hasError) {
        Fluttertoast.showToast(msg: res.data, fontSize: 45.0);

        return true;
      } else {
        Fluttertoast.showToast(msg: res.data, fontSize: 45.0);
        return false;
      }
    } catch (error) {
      log(error.toString());
      return false;
    }
  }

  Future<bool> UpdatePMTaskExecution(
      {bool? isLoading, updatePMTaskExecutionJsonString}) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      log(auth);
      final res = await _dataRepository.UpdatePMTaskExecution(
          auth: auth,
          isLoading: isLoading,
          updatePMTaskExecutionJsonString: updatePMTaskExecutionJsonString);
      print({"res.data", res.data});
      if (!res.hasError) {
        Fluttertoast.showToast(msg: res.data, fontSize: 45.0);

        return true;
      } else {
        Fluttertoast.showToast(msg: res.data, fontSize: 45.0);
        return false;
      }
    } catch (error) {
      log(error.toString());
      return false;
    }
  }

  Future<bool> cloneSchedule(
      {required int from_schedule_id,
      required int to_schedule_id,
      required int taskId,
      bool? isloading}) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      log(auth);
      final res = await _dataRepository.cloneSchedule(
          auth: auth,
          from_schedule_id: from_schedule_id,
          to_schedule_id: to_schedule_id,
          taskId: taskId,
          isloading: isloading);
      print({"res.data", res.data});
      if (!res.hasError) {
        Fluttertoast.showToast(msg: res.data, fontSize: 45.0);

        return true;
      } else {
        Fluttertoast.showToast(msg: res.data, fontSize: 45.0);
        return false;
      }
    } catch (error) {
      log(error.toString());
      return false;
    }
  }

  Future<List<AssetCategoryModel>> getAssetCategoryList({
    // required int? job_type_id,
    required bool isLoading,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      log(auth);
      final res = await _dataRepository.getAssetCategoryList(
        // job_type_id: job_type_id,
        isLoading: isLoading,
        auth: auth,
      );
      print('Asset type List Data: ${res.data}');

      if (!res.hasError) {
        var facilityTypeList = AssetCategoryModelFromJson(res.data);
        return facilityTypeList;
      }
      return [];
    } catch (error) {
      log(error.toString());
      return [];
    }
  }

  Future<List<AssetTypeListSMModel>> getAssetTypeSMList({
    required bool isLoading,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      log(auth);
      final res = await _dataRepository.getAssetTypeSMList(
        isLoading: isLoading,
        auth: auth,
      );
      print('Asset type List Data: ${res.data}');

      if (!res.hasError) {
        var assetTypeList = AssetTypeListSMModelFromJson(res.data);
        return assetTypeList;
      }
      return [];
    } catch (error) {
      log(error.toString());
      return [];
    }
  }

  Future<List<UnitMeasurementModel>> getUnitMeasurementList({
    // required int? businessType,
    // int? blockId,
    // required String categoryIds,
    int? blockId,
    String? categoryIds,
    required bool isLoading,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getUnitMeasurementList(
        // facilityId: businessType,
        // blockId: blockId,
        // categoryIds: categoryIds ?? "",
        // businessType: businessType,
        isLoading: isLoading,
        auth: auth,
      );
      if (!res.hasError) {
        var businessList = UnitMeasurementModelFromJson(res.data);
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

  Future<bool> createAuditNumber(
      {bool? isLoading, checkAuditJsonString}) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.createAuditNumber(
          auth: auth,
          isLoading: isLoading,
          checkAuditJsonString: checkAuditJsonString);

      if (!res.hasError) {
        Get.offAllNamed(Routes.auditListScreen);

        return true;
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + ' createAuditNumber');
        return false;
      }
    } catch (error) {
      print(error.toString());
      return false;
    }
  }

  Future<List<AuditPlanListModel>?> getAuditPlanList(int? facilityId,
      bool? isLoading, dynamic startDate, dynamic endDate) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getAuditPlanList(
          auth: auth,
          facilityId: facilityId ?? 0,
          isLoading: isLoading ?? false,
          startDate: startDate,
          endDate: endDate);
      print({"res.data", res.data});
      if (!res.hasError) {
        final jsonAuditPlanListModelModels = jsonDecode(res.data);

        final List<AuditPlanListModel> _AuditPlanListModelList =
            jsonAuditPlanListModelModels
                .map<AuditPlanListModel>((m) =>
                    AuditPlanListModel.fromJson(Map<String, dynamic>.from(m)))
                .toList();
        print({"object", _AuditPlanListModelList});
        return _AuditPlanListModelList.reversed.toList();
      } else {
        Utility.showDialog(res.errorCode.toString() + 'getAuditPlanList');
        return [];
      }
    } catch (error) {
      log(error.toString());

      return [];
    }
  }

  Future<bool> createAssetSM({bool? isLoading, assetListJsonString}) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.createAssetSM(
          auth: auth,
          isLoading: isLoading,
          assetListJsonString: assetListJsonString);

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

  Future<bool> transferItem({bool? isLoading, transferItemJsonString}) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.transferItem(
          auth: auth,
          isLoading: isLoading,
          transferItemJsonString: transferItemJsonString);
      print({"res.datanew", res.data});
      if (!res.hasError) {
        return true;
      } //
      else {
        Utility.showDialog(
            res.errorCode.toString() + ' createtransferItemNumber');
        return false;
      }
    } catch (error) {
      print(error.toString());
      return false;
    }
  }

  Future<AuditPlanDetailModel?> getAuditPlanDetails(
    int? auditPlanId,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getAuditPlanDetails(
        auth: auth,
        auditPlanId: auditPlanId,
        isLoading: isLoading,
      );
      if (!res.hasError) {
        final AuditPlanDetailModel _auditPlanDetailModel =
            auditPlanDetailModelFromJson(res.data);
        return _auditPlanDetailModel;
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + 'getPmPlanDetails');
        return null;
      }
    } //
    catch (error) {
      print(error.toString());
      return null;
    }
  }

  Future<Map<String, dynamic>> auditPlanApprovedButton(
    auditPlanApproveJsonString,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.auditPlanApprovedButton(
        auth: auth,
        auditPlanApproveJsonString: auditPlanApproveJsonString,
        isLoading: isLoading ?? false,
      );

      var resourceData = res.data;

      print('Response Goods Order Approve: ${resourceData}');

      if (!res.hasError) {
        if (res.errorCode == 200) {
          var responseMap = json.decode(res.data);
          return responseMap;
        } else {
          // Get.dialog<void>(WarrantyClaimErrorDialog());
        }
      } else {
        Utility.showDialog(
            res.errorCode.toString() + 'auditPlanApprovedButton');
        //return '';
      }
      return Map();
    } catch (error) {
      print(error.toString());
      return Map();
    }
  }

  Future<Map<String, dynamic>> auditPlanRejectButton(
    auditPlanRejectJsonString,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.auditPlanRejectButton(
        auth: auth,
        auditPlanRejectJsonString: auditPlanRejectJsonString,
        isLoading: isLoading ?? false,
      );

      var resourceData = res.data;

      print('Response Goods Order Approve: ${resourceData}');

      if (!res.hasError) {
        if (res.errorCode == 200) {
          var responseMap = json.decode(res.data);
          return responseMap;
        } else {
          // Get.dialog<void>(WarrantyClaimErrorDialog());
        }
      } else {
        Utility.showDialog(res.errorCode.toString() + 'auditPlanRejectButton');
        //return '';
      }
      return Map();
    } catch (error) {
      print(error.toString());
      return Map();
    }
  }

  Future<List<DesignationModel?>?> getResponsibilityList(
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getResponsibilityList(
        auth: auth,
        isLoading: isLoading ?? false,
      );

      if (!res.hasError) {
        final jsonResponsibiltyModels = jsonDecode(res.data);
        final List<DesignationModel> _ResponsibiltyModelList =
            jsonResponsibiltyModels
                .map<DesignationModel>(
                  (m) =>
                      DesignationModel.fromJson(Map<String, dynamic>.from(m)),
                )
                .toList();

        return _ResponsibiltyModelList;
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + 'getResponsibiltyList');
        return null;
      }
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

  Future<bool> createBodyInjured(
      {bool? isLoading, bodyInjuredJsonString}) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.createBodyInjured(
          auth: auth,
          isLoading: isLoading,
          bodyInjuredJsonString: bodyInjuredJsonString);
      if (!res.hasError) {
        return true;
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + ' createbodypart');
        return false;
      }
    } catch (error) {
      print(error.toString());
      return false;
    }
  }

  Future<bool> updateBodyInjured({
    bool? isLoading,
    bodyInjuredJsonString,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.updateBodyInjured(
        auth: auth,
        isLoading: isLoading,
        bodyInjuredJsonString: bodyInjuredJsonString,
      );
      print(res.data);
      if (!res.hasError) {
        return true;
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + 'updateBodypart');
        return false;
      }
    } catch (error) {
      print(error.toString());
      return false;
    }
  }

  Future<void> deleteBodyInjured(Object bodypart_id, bool isLoading) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.deleteBodyInjured(
        auth: auth,
        bodypart_id: bodypart_id,
        isLoading: isLoading,
      );

      if (!res.hasError) {
        //get delete response back from API
      } else {
        Utility.showDialog(res.errorCode.toString() + 'deletebodypart');
      }
    } catch (error) {
      print(error.toString());
    }
  }

  Future<List<BodyInjuredModel>> getBodyInjuredList({
    required int? facility_id,
    // int? blockId,
    // required String categoryIds,
    required bool isLoading,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      log(auth);
      final res = await _dataRepository.getBodyInjuredList(
        facility_id: facility_id,
        isLoading: isLoading,
        auth: auth,
      );
      print('Risk Type List Data: ${res.data}');
      if (!res.hasError) {
        var bodyInjuredList = bodyInjuredModelFromJson(res.data);
        return bodyInjuredList;
      }
      return [];
    } catch (error) {
      log(error.toString());
      return [];
    }
  }

  Future<List<VegetationPlanListModel>> getVegetationPlanList({
    required int? facility_id,
    required bool isLoading,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      log(auth);
      final res = await _dataRepository.getVegetationPlanList(
        facility_id: facility_id,
        isLoading: isLoading,
        auth: auth,
      );
      print('getVegetationPlanList: ${res.data}');

      if (!res.hasError) {
        final jsonVegetationPlanList = jsonDecode(res.data);
        // print(res.data);
        final List<VegetationPlanListModel> _getVegetationPlanList =
            jsonVegetationPlanList
                .map<VegetationPlanListModel>((m) =>
                    VegetationPlanListModel.fromJson(
                        Map<String, dynamic>.from(m)))
                .toList();

        return _getVegetationPlanList.reversed.toList();
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + 'getVegetationPlanList');
        return [];
      }
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

  Future<Map<String, dynamic>> createVegetationPlan(
    createVegetationPlans,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.createVegetationPlan(
        auth: auth,
        createVegetationPlans: createVegetationPlans,
        isLoading: isLoading ?? false,
      );

      var resourceData = res.data;

      print('Response Create MC  : ${resourceData}');

      if (!res.hasError) {
        Fluttertoast.showToast(
            msg: " Paln Added Successfully...", fontSize: 16.0);
        Get.offNamed(
          Routes.moduleCleaningListPlan,
        );

        // if (res.errorCode == 200) {
        //   var responseMap = json.decode(res.data);
        //   return responseMap;
        // }

        // Fluttertoast.showToast(msg: "Data add successfully...", fontSize: 16.0);
      } else {
        Utility.showDialog(res.errorCode.toString() + 'createVC');
        //return '';
      }
      return Map();
    } catch (error) {
      print(error.toString());
      return Map();
    }
  }

  Future<List<VegetationEquipmentModel>> getVegEquipmentModelList({
    required int? facilityId,
    required bool isLoading,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);

      log(auth);
      final res = await _dataRepository.getVegEquipmentModelList(
        facilityId: facilityId,
        isLoading: isLoading,
        auth: auth,
      );
      print('EquipmentModelList:${res.data}');

      if (!res.hasError) {
        var equipmentList = getVegetationEquipmentModelFromJson(res.data);
        return equipmentList;
      } //
      else {
        Utility.showDialog(res.errorCode.toString() + 'getEquipmentModelList');
        return [];
      }
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

  Future<VegPlanDetailModel?> getVegPlanDetail({
    bool? isLoading,
    int? planId,
  }) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.getVegPlanDetail(
        auth: auth,
        planId: planId,
        isLoading: isLoading ?? false,
      );

      // print({"MCPlandetail", res.data});

      if (!res.hasError) {
        if (res.errorCode == 200) {
          final VegPlanDetailModel _vegPlanDetailModel =
              vegPlanDetailModelFromJson(res.data);

          var responseMap = _vegPlanDetailModel;
          print({"MCPlandetail", responseMap});
          return responseMap;
        }
      } else {
        Utility.showDialog(res.errorCode.toString() + 'MCPlanDetail');
        //return '';
      }
      return null;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  Future<Map<String, dynamic>> vegPlanApprovedButton(
    vegApproveJsonString,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.vegPlanApprovedButton(
        auth: auth,
        vegApproveJsonString: json.encode(vegApproveJsonString),
        isLoading: isLoading ?? false,
      );

      var resourceData = res.data;

      print('Response vegetation Approve: ${resourceData}');

      if (!res.hasError) {
        if (res.errorCode == 200) {
          var responseMap = json.decode(res.data);
          return responseMap;
        } else {
          // Get.dialog<void>(WarrantyClaimErrorDialog());
        }
      } else {
        Utility.showDialog(res.errorCode.toString() + 'vegApprovedButton');
        //return '';
      }
      return Map();
    } catch (error) {
      print(error.toString());
      return Map();
    }
  }

  Future<Map<String, dynamic>> vegPlanRejectButton(
    vegRejectJsonString,
    bool? isLoading,
  ) async {
    try {
      final auth = await getSecuredValue(LocalKeys.authToken);
      final res = await _dataRepository.vegPlanRejectButton(
        auth: auth,
        vegRejectJsonString: json.encode(vegRejectJsonString),
        isLoading: isLoading ?? false,
      );

      var resourceData = res.data;

      print('Response veg Reject: ${resourceData}');

      if (!res.hasError) {
        if (res.errorCode == 200) {
          var responseMap = json.decode(res.data);
          return responseMap;
        } else {
          // Get.dialog<void>(WarrantyClaimErrorDialog());
        }
      } else {
        Utility.showDialog(res.errorCode.toString() + 'vegRejectButton');
        //return '';
      }
      return Map();
    } catch (error) {
      print(error.toString());
      return Map();
    }
  }
  //end
}
