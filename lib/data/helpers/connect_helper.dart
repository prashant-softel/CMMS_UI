// coverage:ignore-file

import 'dart:convert';
import 'dart:typed_data';

import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/job_card_details/views/widgets/carry_forward_Job_dialog.dart';
import 'package:cmms/app/job_card_details/views/widgets/close_job_dialog.dart';
import 'package:cmms/app/job_card_details/views/widgets/job_card_updated_dialog.dart';
import 'package:cmms/app/widgets/Incident_report_message_approve_dialog.dart';
import 'package:cmms/app/widgets/abandon_execution_message_dialog.dart';
import 'package:cmms/app/widgets/abandon_schedule_execution_message_dialog.dart';
import 'package:cmms/app/widgets/abandon_veg_execution_dialog.dart';
import 'package:cmms/app/widgets/approve_wc_message_dialog.dart';
import 'package:cmms/app/widgets/audit_plan_approve_msg_dialog.dart';
import 'package:cmms/app/widgets/audit_plan_reject_msg_dialog.dart';
import 'package:cmms/app/widgets/create_escalation_matrix_dialog.dart';
import 'package:cmms/app/widgets/create_incident_report_dialog.dart';
import 'package:cmms/app/widgets/create_jc_success_message_dialog.dart';
import 'package:cmms/app/widgets/create_permit_dialog.dart';
import 'package:cmms/app/widgets/create_sop_dialog.dart';
import 'package:cmms/app/widgets/end_execution_message_dialog.dart';
import 'package:cmms/app/widgets/end_mc_execution_message_dialog.dart';
import 'package:cmms/app/widgets/end_mc_schedule_execution_message.dart';
import 'package:cmms/app/widgets/end_veg_schedule_execution_message_dialog.dart';
import 'package:cmms/app/widgets/goods_order_message_approve_dialog.dart';
import 'package:cmms/app/widgets/goods_order_message_close_dialog.dart';
import 'package:cmms/app/widgets/goods_order_message_reject_dialog.dart';
import 'package:cmms/app/widgets/import_file_msg_dialog.dart';
import 'package:cmms/app/widgets/incident_report_approve_message_dialog.dart';
import 'package:cmms/app/widgets/incident_report_reject_message_dialog.dart';
import 'package:cmms/app/widgets/ir_message_approve_dialog.dart';
import 'package:cmms/app/widgets/link_to_permit_dailog.dart';
import 'package:cmms/app/widgets/mc_execution_approve_message_dialog.dart';
import 'package:cmms/app/widgets/mc_plan_message_approve_dialog.dart';
import 'package:cmms/app/widgets/mc_plan_message_dialog.dart';
import 'package:cmms/app/widgets/mc_plan_message_reject_dialog.dart';
import 'package:cmms/app/widgets/new_warranty_claim_dialog.dart';
import 'package:cmms/app/widgets/permit_approve_message_dialog.dart';
import 'package:cmms/app/widgets/permit_cancel_by_approver_message_dialog.dart';
import 'package:cmms/app/widgets/permit_cancel_message_dialog.dart';
import 'package:cmms/app/widgets/permit_cancel_request_message_dialog.dart';
import 'package:cmms/app/widgets/permit_close_message_dialog.dart';
import 'package:cmms/app/widgets/permit_extend_message_dialog.dart';
import 'package:cmms/app/widgets/permit_issue_message_dialog.dart';
import 'package:cmms/app/widgets/permit_reject_message_dialog.dart';
import 'package:cmms/app/widgets/pm_plan_reject_msg_dialog.dart';
import 'package:cmms/app/widgets/pm_task_view_dialog.dart';
import 'package:cmms/app/widgets/recive_go_msg_dialog.dart';
import 'package:cmms/app/widgets/reject_cancel_permit_msg_dailog.dart';
import 'package:cmms/app/widgets/reject_go_recive_msg_dialog.dart';
import 'package:cmms/app/widgets/reject_mc_execution_message_dialog.dart';
import 'package:cmms/app/widgets/reject_wc_message_dialog.dart';
import 'package:cmms/app/widgets/req_message_approve_dialog.dart';
import 'package:cmms/app/widgets/req_message_reject_dialog.dart';
import 'package:cmms/app/widgets/start_mc_execution_dialog.dart';
import 'package:cmms/app/widgets/start_veg_execution_dialog.dart';
import 'package:cmms/app/widgets/update_incident_report_dialog.dart';
import 'package:cmms/app/widgets/update_mc_execution_dialog.dart';
import 'package:cmms/app/widgets/update_permit_dialog.dart';
import 'package:cmms/app/widgets/veg_plan_message_approve_dialog.dart';
import 'package:cmms/app/widgets/veg_plan_message_dialog.dart';
import 'package:cmms/app/widgets/veg_plan_message_reject_dialog.dart';
import 'package:cmms/app/widgets/warranty_claim_updated_message_dialog.dart';
import 'package:cmms/data/data.dart';
import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/add_inventory_model.dart';
import 'package:cmms/domain/models/add_user_model.dart';
import 'package:cmms/domain/models/create_sop_model.dart';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';

import '../../app/job_card_details/views/widgets/approve_jc_dailog.dart';
import '../../app/job_card_details/views/widgets/reject_jc_dialog.dart';
import '../../app/widgets/pm_plan_approve_msg_dialog.dart';

/// The helper class which will connect to the world to get the data.
class ConnectHelper {
  ConnectHelper() {
    _init();
  }

  // late Dio _dio;

  /// Api wrapper initialization
  final apiWrapper = ApiWrapper();

  // /// Device info plugin initialization
  // final deviceinfo = DeviceInfoPlugin();

  // /// To get android device info
  // AndroidDeviceInfo? androidDeviceInfo;

  // /// To get iOS device info
  // IosDeviceInfo? iosDeviceInfo;

  // IosDeviceInfo? iosDeviceInfo;

  // coverage:ignore-start
  /// initialize the andorid device information
  void _init() async {
    // if (GetPlatform.isAndroid) {
    //   androidDeviceInfo = await deviceinfo.androidInfo;
    // } else {
    //   iosDeviceInfo = await deviceinfo.iosInfo;
    // }
    // _dio = Dio();
  }

  // coverage:ignore-end

  /// Device id
  // String? get deviceId => GetPlatform.isAndroid
  //     ? androidDeviceInfo?.id
  //     : iosDeviceInfo?.identifierForVendor;

  // /// Device make brand
  // String? get deviceMake =>
  //     GetPlatform.isAndroid ? androidDeviceInfo?.brand : 'Apple';

  // /// Device Model
  // String? get deviceModel => GetPlatform.isAndroid
  //     ? androidDeviceInfo?.model
  //     : iosDeviceInfo?.utsname.machine;

  /// Device is a type of 1 for Android and 2 for iOS
  String get deviceTypeCode => GetPlatform.isAndroid ? '1' : '2';

  // /// Device OS
  // String get deviceOs => GetPlatform.isAndroid
  //     ? '${androidDeviceInfo?.version.codename}'
  //     : '${iosDeviceInfo?.systemVersion}';

  Future<ResponseModel> getStateList(int countryCode) async =>
      await apiWrapper.makeRequest(
        'Utils/GetStateList?country_id=$countryCode',
        Request.get,
        null,
        true,
        {
          'Content-Type': 'application/json',
        },
      );

  Future<ResponseModel> generateToken({
    auth,
    bool? isLoading,
  }) async {
    ResponseModel response = ResponseModel(data: '', hasError: true);
    try {
      response = await apiWrapper.makeRequest(
        'User/Authenticate',
        Request.postMultiparts,
        // {'user_name': 'sujit@softeltech.in', 'password': 'Sujit123'},
        auth, true,
        {
          'Content-Type': 'application/json',
          "Access-Control-Allow-Origin":
              "*", // Required for CORS support to work
        },
      );
    } catch (error) {
      print(error);
    } finally {
      return response;
    }
  }

  Future<ResponseModel> getInventoryList({
    required bool isLoading,
    required String auth,
    int? facilityId,
    int? blockId,
    String? categoryIds,
  }) async {
    var blockIdParam = (blockId != null) ? 'linkedToBlockId=$blockId&' : '';
    var categoryIdsParam =
        (categoryIds != '') ? 'categoryIds=$categoryIds&' : '';

    var statusParam = 'status=1';
    var facilityParam = '&facilityId=$facilityId';

    ResponseModel responseModel = await apiWrapper.makeRequest(
      'Inventory/GetInventoryList?' +
          blockIdParam +
          categoryIdsParam +
          statusParam +
          facilityParam,
      Request.getMultiparts,
      null,
      isLoading,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  //  Future<ResponseModel> getAffectedPartList({
  //   required bool isLoading,
  //   required String auth,
  //   int? facilityId,
  //   int? blockId,
  //   String? categoryIds,
  // }) async {
  //   var blockIdParam = (blockId != null) ? 'linkedToBlockId=$blockId&' : '';
  //   var categoryIdsParam =
  //       (categoryIds != '') ? 'categoryIds=$categoryIds&' : '';

  //   var statusParam = 'status=1';
  //   ResponseModel responseModel = await apiWrapper.makeRequest(
  //     'Inventory/GetInventoryList?' +
  //         blockIdParam +
  //         categoryIdsParam +
  //         statusParam,
  //     Request.getMultiparts,
  //     null,
  //     isLoading,
  //     {
  //       'Authorization': 'Bearer $auth',
  //     },
  //   );
  //   return responseModel;
  // }

  Future<ResponseModel> getBusinessList({
    required bool isLoading,
    required String auth,
    int? businessType,
  }) async {
    ResponseModel responseModel = await apiWrapper.makeRequest(
      'CMMS/GetBusinessList?businessType=$businessType',
      Request.getMultiparts,
      null,
      isLoading,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> getmanufacturerList({
    required bool isLoading,
    required String auth,
    int? BusinessType,
  }) async {
    ResponseModel responseModel = await apiWrapper.makeRequest(
      'CMMS/GetBusinessList?BusinessType=$BusinessType',
      Request.getMultiparts,
      null,
      isLoading,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> getSupplierList({
    required bool isLoading,
    required String auth,
    int? BusinessType,
  }) async {
    ResponseModel responseModel = await apiWrapper.makeRequest(
      'CMMS/GetBusinessList?BusinessType=$BusinessType',
      Request.getMultiparts,
      null,
      isLoading,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> getUnitCurrencyList(
      {required bool isLoading, required String auth, int? facilityId}) async {
    ResponseModel responseModel = await apiWrapper.makeRequest(
      'Utils/GetCurrencyList',
      Request.getMultiparts,
      null,
      isLoading,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> updatePaidBy(
      {required bool isLoading, required String auth, int? facilityId}) async {
    ResponseModel responseModel = await apiWrapper.makeRequest(
      'SMMaster/GetPaidByList',
      Request.getMultiparts,
      null,
      isLoading,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> getEmployeeList(
      {required bool isLoading, required String auth, int? facility_id}) async {
    ResponseModel responseModel = await apiWrapper.makeRequest(
      'CMMS/GetEmployeeList?facility_id=$facility_id',
      Request.getMultiparts,
      null,
      isLoading,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> getEmployeesList(
      {required bool isLoading, required String auth, int? facility_id}) async {
    ResponseModel responseModel = await apiWrapper.makeRequest(
      'CMMS/GetEmployeeList?facility_id=$facility_id',
      Request.getMultiparts,
      null,
      isLoading,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  ///Risk Type List
  Future<ResponseModel> getRiskTypeList(
      {required bool isLoading, required String auth, int? facility_id}) async {
    ResponseModel responseModel = await apiWrapper.makeRequest(
      'CMMS/GetRiskTypeList?facility_id=$facility_id',
      Request.getMultiparts,
      null,
      isLoading,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> getEmployeePermitList(
      {required bool isLoading, required String auth, int? facility_id}) async {
    ResponseModel responseModel = await apiWrapper.makeRequest(
      'CMMS/GetEmployeeList?facility_id=$facility_id',
      Request.getMultiparts,
      null,
      isLoading,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> getPermitIssuerList(
      {required bool isLoading, required String auth, int? facility_id}) async {
    ResponseModel responseModel = await apiWrapper.makeRequest(
      'CMMS/GetEmployeeList?facility_id=$facility_id',
      Request.getMultiparts,
      null,
      isLoading,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> getPermitApproverList(
      {required bool isLoading, required String auth, int? facility_id}) async {
    ResponseModel responseModel = await apiWrapper.makeRequest(
      // 'CMMS/GetBusinessList?businessType=$businessType' +
      //     blockIdParam +
      //     categoryIdsParam,
      // statusParam,
      'CMMS/GetEmployeeList?facility_id=$facility_id',
      Request.getMultiparts,
      null,
      isLoading,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> getJobTypePermitList(
      {required bool isLoading, required String auth, int? facility_id}) async {
    ResponseModel responseModel = await apiWrapper.makeRequest(
      'Permit/GetJobTypeList?facility_id=$facility_id',
      Request.getMultiparts,
      null,
      isLoading,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> getSopPermitList(
      {required bool isLoading, required String auth, int? job_type_id}) async {
    ResponseModel responseModel = await apiWrapper.makeRequest(
      'Permit/GetSOPList?job_type_id=$job_type_id',
      Request.getMultiparts,
      null,
      isLoading,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> getAssetTypeList(
      {required bool isLoading, required String auth, int? job_type_id}) async {
    ResponseModel responseModel = await apiWrapper.makeRequest(
      'CMMS/GetAssetCategoryList',
      Request.getMultiparts,
      null,
      isLoading,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> getFacilityTypeList(
      {required bool isLoading, required String auth}) async {
    ResponseModel responseModel = await apiWrapper.makeRequest(
      'CMMS/GetFacilityList',
      Request.getMultiparts,
      null,
      isLoading,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> getIncidentRiskTypeList(
      {required bool isLoading, required String auth}) async {
    ResponseModel responseModel = await apiWrapper.makeRequest(
      'CMMS/GetRiskTypeList',
      Request.getMultiparts,
      null,
      isLoading,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> getInsuranceProvider(
      {required bool isLoading, required String auth}) async {
    ResponseModel responseModel = await apiWrapper.makeRequest(
      'CMMS/GetInsuranceProviderList',
      Request.getMultiparts,
      null,
      isLoading,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> getSPVList(
      {required bool isLoading, required String auth, int? job_type_id}) async {
    ResponseModel responseModel = await apiWrapper.makeRequest(
      'CMMS/GetSPVList',
      Request.getMultiparts,
      null,
      isLoading,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> getBodyInjuredData({
    required bool isLoading,
    required String auth,
  }) async {
    ResponseModel responseModel = await apiWrapper.makeRequest(
      'MISMaster/GetBodyPartsList',
      Request.getMultiparts,
      null,
      isLoading,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> getBlockTypeList(
      {required bool isLoading, required String auth, int? job_type_id}) async {
    ResponseModel responseModel = await apiWrapper.makeRequest(
      'Facility/GetBlockList?parent_id=$job_type_id',
      Request.getMultiparts,
      null,
      isLoading,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> getSafetyMeasureList(
      {required bool isLoading,
      required String auth,
      int? permit_type_id}) async {
    ResponseModel responseModel = await apiWrapper.makeRequest(
      'Permit/GetSafetyMeasurementQuestionList?permit_type_id=$permit_type_id',
      Request.getMultiparts,
      null,
      isLoading,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  ///Permit Cancel Condition List

  Future<ResponseModel> getPermitConditionList(
      {required bool isLoading, required String auth, int? isCancle}) async {
    ResponseModel responseModel = await apiWrapper.makeRequest(
      'Permit/GetPermitConditionList?isCancle=$isCancle',
      Request.getMultiparts,
      null,
      isLoading,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  ///Permit Close Condition List
  Future<ResponseModel> getPermitCloseConditionList(
      {required bool isLoading, required String auth, int? isClose}) async {
    ResponseModel responseModel = await apiWrapper.makeRequest(
      'Permit/GetPermitConditionList?isClose=$isClose',
      Request.getMultiparts,
      null,
      isLoading,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  ///Permit Extend Condition List
  Future<ResponseModel> getPermitExtendConditionList(
      {required bool isLoading, required String auth, int? isExtend}) async {
    ResponseModel responseModel = await apiWrapper.makeRequest(
      'Permit/GetPermitConditionList?isExtend=$isExtend',
      Request.getMultiparts,
      null,
      isLoading,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> getWarrantyClaimList({
    required bool isLoading,
    required String auth,
    String? start_date,
    required String end_date,
    int? facilityId,
    int? blockId,
    required String categoryIds,
  }) async {
    var blockIdParam = (blockId != null) ? 'linkedToBlockId=$blockId&' : '';
    var categoryIdsParam =
        (categoryIds != '') ? 'categoryIds=$categoryIds&' : '';
    var startDateParam = (start_date != null) ? 'start_date=$start_date&' : '';
    var endDateParam = (end_date != '') ? 'end_date=$end_date' : '';
//var statusParam = (status!=null status!='')?'status=1':'';
    // var statusParam = 'status=1';
    ResponseModel responseModel = await apiWrapper.makeRequest(
      'WC/GetWCList?facilityId=$facilityId&' + startDateParam + endDateParam,
      Request.getMultiparts,
      null,
      isLoading,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> getIncidentReportList({
    required bool isLoading,
    required String auth,
    int? facility_id,
    String? start_date,
    required String end_date,
  }) async {
    ResponseModel responseModel = await apiWrapper.makeRequest(
      'IncidentReport/GetIncidentList?facility_id=$facility_id&start_date=$start_date&end_date=$end_date',
      Request.get,
      null,
      isLoading,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> getInventoryAssetsList({
    required bool isLoading,
    required String auth,
    int? facility_id,
  }) async {
    ResponseModel responseModel = await apiWrapper.makeRequest(
      'Inventory/GetInventoryList?facilityId=$facility_id',
      Request.getMultiparts,
      null,
      isLoading,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> getEquipmentModelList({
    required bool isLoading,
    required String auth,
    int? facilityId,
  }) async {
    // var startDateParam = (start_date != null) ? 'start_date=$end_date&' : '';
    // var endDateParam = (end_date != '') ? 'end_date=$start_date' : '';
//var statusParam = (status!=null status!='')?'status=1':'';
    // var statusParam = 'status=1';
    ResponseModel responseModel = await apiWrapper.makeRequest(
      'MC/GetMCEquipmentList?facilityId=$facilityId',
      // startDateParam +
      // endDateParam,
      Request.getMultiparts,
      null,
      isLoading,
      {
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> getMCTaskEquipmentList({
    required bool isLoading,
    required String auth,
    int? taskId,
  }) async {
    ResponseModel responseModel = await apiWrapper.makeRequest(
      'MC/GetMCTaskEquipmentList?taskId=$taskId',
      Request.getMultiparts,
      null,
      isLoading,
      {
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  ///Module Cleaning Task List
  Future<ResponseModel> getMCTaskList({
    required bool isLoading,
    required String auth,
    int? facility_id,
    String? start_date,
    required String end_date,
  }) async {
    var startDateParam = (start_date != null) ? 'start_date=$start_date&' : '';
    var endDateParam = (end_date != '') ? 'end_date=$end_date' : '';
//var statusParam = (status!=null status!='')?'status=1':'';
    // var statusParam = 'status=1';
    ResponseModel responseModel = await apiWrapper.makeRequest(
      'MC/GetMCTaskList?facility_id=$facility_id&' +
          startDateParam +
          endDateParam,
      Request.getMultiparts,
      null,
      isLoading,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> getBlockList({
    required bool isLoading,
    required String facilityId,
    required String auth,
  }) async =>
      await apiWrapper.makeRequest(
        'CMMS/GetBlockList?facility_id=$facilityId',
        Request.getMultiparts,
        null,
        isLoading,
        {
          'Authorization': 'Bearer $auth',
        },
      );
  Future<ResponseModel> getEquipmentList({
    required bool isLoading,
    required String facilityId,
    required String auth,
  }) async =>
      await apiWrapper.makeRequest(
        'CMMS/GetAssetsList?facility_id=$facilityId',
        Request.getMultiparts,
        null,
        isLoading,
        {
          'Authorization': 'Bearer $auth',
        },
      );

  ///

  Future<ResponseModel> getJobList({
    required String auth,
    bool? isLoading,
    int? facilityId,
    bool? self_view,
    int? userId,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Job/GetJobList?facility_id=$facilityId&userId=$userId&self_view=$self_view',
      Request.get,
      null,
      isLoading ?? false,
      {
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> getNewPermitList({
    required String auth,
    bool? isLoading,
    bool? self_view,
    bool? non_expired,
    int? facilityId,
    int? userId,
    String? start_date,
    required String end_date,
  }) async {
    // facilityId = 45;
    var startDateParam = (start_date != null) ? 'startDate=$start_date&' : '';
    var endDateParam = (end_date != '') ? 'endDate=$end_date' : '';
    var responseModel = await apiWrapper.makeRequest(
      'Permit/GetPermitList?facility_id=$facilityId&userId=$userId&self_view=$self_view&non_expired=$non_expired&' +
          startDateParam +
          endDateParam,
      Request.get,
      null,
      isLoading ?? false,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    print('NewPermitResponse: ${responseModel.data}');

    return responseModel;
  }

  Future<ResponseModel> getGoodsOrdersList({
    required bool isLoading,
    required String auth,
    int? facility_id,
    String? start_date,
    required String end_date,
  }) async {
    ResponseModel responseModel = await apiWrapper.makeRequest(
      'GO/GetGOList?facility_id=$facility_id&fromDate=$end_date&toDate=$start_date',
      Request.getMultiparts,
      null,
      isLoading,
      {
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> transactionReport({
    required bool isLoading,
    required String auth,
    int? actorID,
    int? actorType,
    int? facility_id,
    String? start_date,
    required String end_date,
  }) async {
    ResponseModel responseModel = await apiWrapper.makeRequest(
      'SMReports/GetTransactionReport?facility_id=$facility_id&actorType=$actorType&actorID=$actorID&fromDate=$end_date&toDate=$start_date',
      // 'SMReports/GetTransactionReport?facility_id=$facility_id&actorType=2&actorID=45&fromDate=$end_date&toDate=$start_date',
      Request.getMultiparts,
      null,
      isLoading,
      {
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> getRequestOrderList({
    required bool isLoading,
    required String auth,
    int? facility_id,
    String? start_date,
    required String end_date,
  }) async {
    ResponseModel responseModel = await apiWrapper.makeRequest(
      'RequestOrder/GetRequestOrderList?facilityID=$facility_id&fromDate=$end_date&toDate=$start_date',
      Request.getMultiparts,
      null,
      isLoading,
      {
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> getModuleCleaningListPlan({
    required bool isLoading,
    required String auth,
    int? facility_id,
  }) async {
    ResponseModel responseModel = await apiWrapper.makeRequest(
      'MC/GetMCPlanList?facilityId=$facility_id',
      Request.getMultiparts,
      null,
      isLoading,
      {
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> permitIssueButton({
    required String auth,
    bool? isLoading,
    String? comment,
    String? id,
  }) async {
    // facilityId = 45;
    var responseModel = await apiWrapper.makeRequest(
      'Permit/PermitIssue',
      Request.put,
      {'comment': "$comment", 'id': id},
      isLoading ?? true,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    print('PermitIssueResponse: ${res}');
    Get.dialog<void>(PermitMessageIssueDialog(data: parsedJson['message']));

    return responseModel;
  }

  Future<ResponseModel> permitApprovedButton({
    required String auth,
    String? ptwStatus,
    rejectCancelPermitJsonString,
    int? jobId,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      ptwStatus == '133'
          ? 'Permit/PermitExtendApprove'
          : 'Permit/PermitApprove',
      Request.put,
      rejectCancelPermitJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    print('reqOrderApproveResponse: ${responseModel.data}');
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    Get.dialog<void>(PermitMessageApproveDialog(
      data: parsedJson['message'],
      jobId: jobId,
      ptwStatus: int.tryParse('$ptwStatus'),
    ));
    return responseModel;
  }
  // Future<ResponseModel> permitApprovedButton(
  //     {required String auth,
  //     bool? isLoading,
  //     String? comment,
  //     String? id,
  //     String? employee_id,
  //     String? ptwStatus,
  //     int? jobId}) async {
  //   // facilityId = 45;
  //   // ptwStatus = 123;
  //   var responseModel = await apiWrapper.makeRequest(
  //     ptwStatus == '133'
  //         ? 'Permit/PermitExtendApprove'
  //         : 'Permit/PermitApprove',
  //     Request.put,
  //     {'comment': "$comment", 'id': id},
  //     isLoading ?? true,
  //     {
  //       'Authorization': 'Bearer $auth',
  //     },
  //   );
  //   print('PermitApprovedResponse: ${responseModel.data}');
  //   var res = responseModel.data;
  //   var parsedJson = json.decode(res);
  //   Get.dialog<void>(PermitMessageApproveDialog(
  //     data: parsedJson['message'],
  //     jobId: jobId,
  //     ptwStatus: int.tryParse('$ptwStatus'),
  //   ));

  //   return responseModel;
  // }

  Future<ResponseModel> goodsOrderApprovedButton({
    required String auth,
    goodsOrderApproveJsonString,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'GO/ApproveGO',
      Request.post,
      goodsOrderApproveJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    print('goodsOrderApproveResponse: ${responseModel.data}');
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    Get.dialog<void>(GoodsOrderMessageApproveDialog(
        data: parsedJson['message'], id: parsedJson['id']));

    return responseModel;
  }

  Future<ResponseModel> approveIncidentReportButton({
    required String auth,
    incidentReportApproveJsonString,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'IncidentReport/ApproveIncidentReport',
      Request.post,
      incidentReportApproveJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    print('goodsOrderApproveResponse: ${responseModel.data}');
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    Get.dialog<void>(IncidentMessageApproveDialog(
        data: parsedJson['message'], id: parsedJson['id']));

    return responseModel;
  }

  Future<ResponseModel> approveIrButton({
    required String auth,
    incidentReportApproveJsonString,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'IncidentReport/ApproveCreateIR',
      Request.post,
      incidentReportApproveJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    print('goodsOrderApproveResponse: ${responseModel.data}');
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    Get.dialog<void>(IRMessageApproveDialog(
        data: parsedJson['message'], id: parsedJson['id']));

    return responseModel;
  }

  Future<ResponseModel> mcPlanApprovedButton({
    required String auth,
    mcApproveJsonString,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'MC/ApproveMCPlan',
      Request.put,
      mcApproveJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    print('McApproveResponse: ${responseModel.data}');
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    Get.dialog<void>(McPlanMessageApproveDialog(
        data: parsedJson['message'], id: parsedJson['id']));

    return responseModel;
  }

  Future<ResponseModel> mcExecutionApprovedButton({
    required String auth,
    mcExecutionApproveJsonString,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'MC/ApproveMCExecution',
      Request.put,
      mcExecutionApproveJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    print('McExecutionApproveResponse: ${responseModel.data}');
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    Get.dialog<void>(McExecutionMessageApproveDialog(
        data: parsedJson['message'], id: parsedJson['id']));

    return responseModel;
  }

  ///Approve Warranty claim
  Future<ResponseModel> wcApprovedButton({
    required String auth,
    WCApproveJsonString,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'WC/ApproveWC',
      Request.post,
      WCApproveJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    print('WCResponse: ${responseModel.data}');
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    Get.dialog<void>(WCMessageApproveDialog(
        data: parsedJson['message'], id: parsedJson['id']));

    return responseModel;
  }

  ///Reject Warranty claim
  Future<ResponseModel> wcRejectdButton({
    required String auth,
    WCRejectJsonString,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'WC/RejectWC',
      Request.put,
      WCRejectJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    print('WCResponse: ${responseModel.data}');
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    Get.dialog<void>(WCMessageRejectDialog(
        data: parsedJson['message'], id: parsedJson['id']));

    return responseModel;
  }

  Future<ResponseModel> rejectMcExecutionApprovedButton({
    required String auth,
    rejectMcExecutionApproveJsonString,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'MC/RejectMCPExecution',
      Request.put,
      rejectMcExecutionApproveJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    print('McExecutionRejectResponse: ${responseModel.data}');
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    Get.dialog<void>(RejectMcExecutionMessageApproveDialog(
        data: parsedJson['message'], id: parsedJson['id']));

    return responseModel;
  }

  Future<ResponseModel> mcPlanRejectButton({
    required String auth,
    mcRejectJsonString,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'MC/RejectMCPlan',
      Request.put,
      mcRejectJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    print('McRejectResponse: ${responseModel.data}');
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    Get.dialog<void>(McPlanMessageRejectDialog(
        data: parsedJson['message'], id: parsedJson['id']));

    return responseModel;
  }

  Future<ResponseModel> pmPlanApprovedButton({
    required String auth,
    pmPlanApproveJsonString,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'PM/ApprovePMPlan',
      Request.put,
      pmPlanApproveJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    print('pmplanApproveResponse: ${responseModel.data}');
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    Get.dialog<void>(PmPlanMessageApproveDialog(
        data: parsedJson['message'], id: parsedJson['id']));

    return responseModel;
  }

  Future<ResponseModel> auditPlanApprovedButton({
    required String auth,
    auditPlanApproveJsonString,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'AuditPlan/ApproveAuditPlan',
      Request.post,
      auditPlanApproveJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    print('pmplanApproveResponse: ${responseModel.data}');
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    Get.dialog<void>(AuditPlanMessageApproveDialog(
        data: parsedJson['message'], id: parsedJson['id']));

    return responseModel;
  }

  Future<ResponseModel> approveGOReceiveButton({
    required String auth,
    goodsOrderApproveJsonString,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'GO/ApproveGOReceive',
      Request.post,
      goodsOrderApproveJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    print('goodsOrderApproveResponse: ${responseModel.data}');
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    Get.dialog<void>(ApproveGOMsgReceiveDialog(
        data: parsedJson['message'], id: parsedJson['id']));

    return responseModel;
  }

  Future<ResponseModel> rejectGOReceiveButton({
    required String auth,
    goodsOrderApproveJsonString,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'GO/RejectGOReceive',
      Request.post,
      goodsOrderApproveJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    print('goodsOrderApproveResponse: ${responseModel.data}');
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    Get.dialog<void>(RejectGOMsgReceiveDialog(
        data: parsedJson['message'], id: parsedJson['id']));

    return responseModel;
  }

  Future<ResponseModel> pmPlanRejectButton({
    required String auth,
    pmPlanRejectJsonString,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'PM/RejectPMPlan',
      Request.put,
      pmPlanRejectJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    print('goodsOrderApproveResponse: ${responseModel.data}');
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    Get.dialog<void>(PMPlanMsgReceiveDialog(
        data: parsedJson['message'], id: parsedJson['id']));

    return responseModel;
  }

  Future<ResponseModel> auditPlanRejectButton({
    required String auth,
    auditPlanRejectJsonString,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'AuditPlan/RejectAuditPlan',
      Request.post,
      auditPlanRejectJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    print('goodsOrderApproveResponse: ${responseModel.data}');
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    Get.dialog<void>(AuditPlanMsgReceiveDialog(
        data: parsedJson['message'], id: parsedJson['id']));

    return responseModel;
  }

  Future<ResponseModel> goodsOrderRejectButton({
    required String auth,
    goodsOrderRejectJsonString,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'GO/RejectGO',
      Request.post,
      goodsOrderRejectJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    print('goodsOrderApproveResponse: ${responseModel.data}');
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    Get.dialog<void>(GoodsOrderMessageRejectDialog(
        data: parsedJson['message'], id: parsedJson['id']));

    return responseModel;
  }

  Future<ResponseModel> rejectIncidentReportButton({
    required String auth,
    incidentReportRejectJsonString,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'IncidentReport/RejectIncidentReport',
      Request.post,
      incidentReportRejectJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    print('incidentReportReject: ${responseModel.data}');
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    Get.dialog<void>(IncidentReportMessageRejectDialog(
        data: parsedJson['message'], id: parsedJson['id']));

    return responseModel;
  }

  Future<ResponseModel> rejectIrButton({
    required String auth,
    incidentReportRejectJsonString,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'IncidentReport/RejectCreateIR',
      Request.post,
      incidentReportRejectJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    print('incidentReportReject: ${responseModel.data}');
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    Get.dialog<void>(IncidentReportMessageRejectDialog(
        data: parsedJson['message'], id: parsedJson['id']));

    return responseModel;
  }

  Future<ResponseModel> goodsOrderCloseButton({
    required String auth,
    goodsOrderCloseJsonString,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'GO/CloseGO',
      Request.post,
      goodsOrderCloseJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    print('goodsOrderRejecteResponse: ${responseModel.data}');
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    Get.dialog<void>(GoodsOrderMessageCloseDialog(
        data: parsedJson['message'], id: parsedJson['id']));

    return responseModel;
  }

  Future<ResponseModel> permitCancelByIssuerButton({
    required String auth,
    bool? isLoading,
    String? comment,
    String? id,
  }) async {
    // facilityId = 45;
    var responseModel = await apiWrapper.makeRequest(
      'Permit/PermitCancelByIssuer',
      Request.put,
      {'comment': "$comment", 'id': id},
      isLoading ?? true,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    print('PermitCancelByIssuerResponse: ${responseModel.data}');
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    Get.dialog<void>(
        PermitMessageCancelByIssuerDialog(data: parsedJson['message']));

    return responseModel;
  }

  Future<ResponseModel> permitCancelRequestButton({
    required String auth,
    cancelPermitJsonString,
    bool? isLoading,
    int? jobId,
  }) async {
    // facilityId = 45;
    var responseModel = await apiWrapper.makeRequest(
      'Permit/PermitCancelRequest',
      Request.put,
      // {'comment': "$comment", 'id': id},
      cancelPermitJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    print('PermitCancelRequestResponse: ${responseModel.data}');
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    Get.dialog<void>(PermitMessageCancelRequestDialog(
        data: parsedJson['message'], jobId: jobId));

    return responseModel;
  }

  Future<ResponseModel> permitCancelByApproverButton({
    required String auth,
    bool? isLoading,
    // String? comment,
    // String? id,
    cancelByApproverJsonString,
    String? ptwStatus,
  }) async {
    // facilityId = 45;
    var responseModel = await apiWrapper.makeRequest(
      ptwStatus == '123' || ptwStatus == '130'
          ? 'Permit/PermitCancelByApprover'
          : 'Permit/PermitCancelRequest',
      Request.put,
      // {'comment': "$comment", 'id': id},
      cancelByApproverJsonString,
      isLoading ?? true,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    print(
        'PermitCancelByApprover&CancelRequestResponse: ${responseModel.data}');
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    Get.dialog<void>(
        PermitMessageCancelByApproverDialog(data: parsedJson['message']));

    return responseModel;
  }

  Future<ResponseModel> permitCancelRejectButton({
    required String auth,
    rejectCancelPermitJsonString,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Permit/PermitCancelReject',
      Request.put,
      rejectCancelPermitJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    print('reqOrderApproveResponse: ${responseModel.data}');
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    Get.dialog<void>(RejectCancelPermitMessageDialog(
        data: parsedJson['message'], id: parsedJson['id']));

    return responseModel;
  }
  // Future<ResponseModel> permitCancelRejectButton({
  //   required String auth,
  //   bool? isLoading,
  //   String? comment,
  //   String? id,
  //   String? ptwStatus,
  // }) async {
  //   // facilityId = 45;
  //   var responseModel = await apiWrapper.makeRequest(
  //     'Permit/PermitCancelReject',
  //     Request.put,
  //     {'comment': "$comment", 'id': id},
  //     isLoading ?? true,
  //     {
  //       'Authorization': 'Bearer $auth',
  //     },
  //   );
  //   print(
  //       'PermitCancelByApprover&CancelRequestResponse: ${responseModel.data}');
  //   var res = responseModel.data;
  //   var parsedJson = json.decode(res);
  //   Get.dialog<void>(
  //       PermitMessageCancelByApproverDialog(data: parsedJson['message']));

  //   return responseModel;
  // }

  Future<ResponseModel> permitExtendButton({
    required String auth,
    extendPermitJsonString,
    bool? isLoading,
    int? jobId,
  }) async {
    // facilityId = 45;
    var responseModel = await apiWrapper.makeRequest(
      'Permit/PermitExtend',
      Request.put,
      // {'comment': "$comment", 'Time': '$Time', 'id': id},
      extendPermitJsonString,
      isLoading ?? true,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    print('PermitExtendResponse: ${responseModel.data}');
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    Get.dialog<void>(PermitMessageExtendDialog(
      data: parsedJson['message'],
      jobId: jobId,
    ));

    return responseModel;
  }

  Future<ResponseModel> permitCloseButton({
    required String auth,
    closePermitJsonString,
    bool? isLoading,
    int? jobId,
  }) async {
    // facilityId = 45;
    var responseModel = await apiWrapper.makeRequest(
      'Permit/PermitClose',
      Request.put,
      // {'comment': "$comment", 'id': id},
      closePermitJsonString,
      isLoading ?? true,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    print('PermitCloseResponse: ${responseModel.data}');
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    Get.dialog<void>(
        PermitMessageCloseDialog(data: parsedJson['message'], jobId: jobId));

    return responseModel;
  }

  Future<ResponseModel> abandonExecutionButton({
    required String auth,
    abandoneJsonString,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'MC/AbandonMCExecution',
      Request.put,
      abandoneJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    print('AbandonExecutionResponse: ${responseModel.data}');
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    Get.dialog<void>(
        AbandonMCExecutionMessageDialog(data: parsedJson['message']));

    return responseModel;
  }

  Future<ResponseModel> abandonScheduleExecutionButton({
    required String auth,
    abandoneScheduleJsonString,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'MC/AbandonMCSchedule',
      Request.put,
      abandoneScheduleJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    print('AbandonExecutionResponse: ${responseModel.data}');
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    Get.dialog<void>(
        AbandonScheduleExecutionMessageDialog(data: parsedJson['message']));

    return responseModel;
  }

  ///End MC Execution
  Future<ResponseModel> endMCExecutionButton({
    required String auth,
    endJsonString,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'MC/EndMCScheduleExecution',
      Request.put,
      endJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    print('EndExecutionResponse: ${responseModel.data}');
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    Get.dialog<void>(EndMCExecutionMessageDialog(data: parsedJson['message']));

    return responseModel;
  }

  Future<ResponseModel> startMCExecutionButton({
    required String auth,
    bool? isLoading,
    int? executionId,
  }) async {
    // facilityId = 45;
    var responseModel = await apiWrapper.makeRequest(
      'MC/StartMCExecution?executionId=$executionId',
      Request.put,
      // {'comment': "$comment", 'id': id},
      null,
      isLoading ?? true,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    // print('StartExecutionResponse: ${responseModel.data}');
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    Get.dialog<void>(StartMcExecutionMessageDialog(
      data: parsedJson['message'],
      startMCId: parsedJson['id'],
    ));

    return responseModel;
  }

  Future<ResponseModel> endMcExecutionButton({
    required String auth,
    bool? isLoading,
    int? executionId,
  }) async {
    // facilityId = 45;
    var responseModel = await apiWrapper.makeRequest(
      'MC/EndMCExecution?executionId=$executionId',
      Request.put,
      // {'comment': "$comment", 'id': id},
      null,
      isLoading ?? true,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    // print('StartExecutionResponse: ${responseModel.data}');
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    Get.dialog<void>(EndMcExecutionMessageDialog(
      data: parsedJson['message'],
      endMCId: parsedJson['id'],
    ));

    return responseModel;
  }

  Future<ResponseModel> startMCExecutionScheduleButton({
    required String auth,
    bool? isLoading,
    int? scheduleId,
  }) async {
    // facilityId = 45;
    var responseModel = await apiWrapper.makeRequest(
      'MC/StartMCScheduleExecution?scheduleId=$scheduleId',
      Request.put,
      // {'comment': "$comment", 'id': id},
      null,
      isLoading ?? true,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    // print('StartExecutionResponse: ${responseModel.data}');
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    Get.dialog<void>(StartMcExecutionMessageDialog(
      data: parsedJson['message'],
      startMCId: parsedJson['id'],
    ));

    return responseModel;
  }

  Future<ResponseModel> endMCScheduleExecutionButton({
    required String auth,
    bool? isLoading,
    int? scheduleId,
  }) async {
    // facilityId = 45;
    var responseModel = await apiWrapper.makeRequest(
      'MC/EndMCScheduleExecution?scheduleId=$scheduleId',
      Request.put,
      // {'comment': "$comment", 'id': id},
      null,
      isLoading ?? true,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    // print('StartExecutionResponse: ${responseModel.data}');
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    Get.dialog<void>(EndMCScheduleExecutionMessageDialog(
      data: parsedJson['message'],
      endMCId: parsedJson['id'],
    ));

    return responseModel;
  }

  Future<ResponseModel> permitRejectButton(
      {required String auth,
      bool? isLoading,
      String? comment,
      int? id,
      String? ptwStatus,
      rejectExtendPermitJsonString,
      int? jobId}) async {
    // facilityId = 45;
    var responseModel = await apiWrapper.makeRequest(
      ptwStatus == '133' ? 'Permit/PermitExtendReject' : 'Permit/PermitReject',
      Request.put,
      rejectExtendPermitJsonString,
      // {'comment': "$comment", 'id': id},
      isLoading ?? true,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    // print('PermitRejectResponse: ${responseModel.data}');
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    Get.dialog<void>(PermitMessageRejectDialog(
      data: parsedJson['message'],
      jobId: jobId,
      ptwStatus: ptwStatus,
    ));

    return responseModel;
  }

  ///Incident Report Reject Button
  Future<ResponseModel> incidentReportRejectButton({
    required String auth,
    bool? isLoading,
    String? comment,
    String? id,
  }) async {
    // facilityId = 45;
    var responseModel = await apiWrapper.makeRequest(
      'IncidentReport/RejectIncidentReport',
      Request.post,
      {'comment': "$comment", 'id': id},
      isLoading ?? true,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    // print('IncidentReportRejectResponse: ${responseModel.data}');
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    Get.dialog<void>(
        IncidentReportMessageRejectDialog(data: parsedJson['message']));

    return responseModel;
  }

  ///Incident Report Approve Button
  Future<ResponseModel> incidentReportApproveButton({
    required String auth,
    bool? isLoading,
    String? incidentId,
  }) async {
    // facilityId = 45;
    var responseModel = await apiWrapper.makeRequest(
      'IncidentReport/ApproveIncidentReport?incidentId=$incidentId',
      Request.put,
      {'incidentId': incidentId},
      isLoading ?? true,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    // print('IncidentReportApproveResponse: ${responseModel.data}');
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    Get.dialog<void>(
        IncidentReportMessageApproveDialog(data: parsedJson['message']));

    return responseModel;
  }

//   Future<ResponseModel> getNewPermitList({
//     required bool isLoading,
//     required String auth,
//     int? facilityId,
//     int? userId,
//     // int? blockId,
//     // required String categoryIds,
//   }) async {
//     // var blockIdParam = (blockId != null) ? 'linkedToBlockId=$blockId&' : '';
//     // var categoryIdsParam =
//     //     (categoryIds != '') ? 'categoryIds=$categoryIds&' : '';
// //var statusParam = (status!=null status!='')?'status=1':'';
//     // var statusParam = 'status=1';
//     ResponseModel responseModel = await apiWrapper.makeRequest(
//       'Permit/GetPermitList?facility_id=$facilityId&userId=$userId',
//           // blockIdParam +
//           // categoryIdsParam,
//       Request.getMultiparts,
//       null,
//       isLoading,
//       {
//         'Authorization': 'Bearer $auth',
//       },
//     );
//     print('New Permit Response5:${responseModel.data}');
//     return responseModel;
//   }

  Future<ResponseModel> getInventoryDetailList({
    required String auth,
    bool? isLoading,
    // int? facilityId,
    int? id,
  }) async {
    // facilityId = 45;
    var responseModel = await apiWrapper.makeRequest(
      'Inventory/GetInventoryDetails?id=$id',
      Request.get,
      null,
      isLoading ?? true,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    // print('InventoryDetailResponse: ${responseModel.data}');

    return responseModel;
  }

  Future<ResponseModel> getPreventiveCheckList(
      {required String auth,
      bool? isLoading,
      int? facilityId,
      int? type,
      int? frequencyid,
      int? categoryId}) async {
    // var categoryIdsParam = (categoryId != 0) ? '&category_id=$categoryId' : 0;
    // var frequencyIdsParam =
    //     (frequencyid != 0) ? '&frequency_id=$frequencyid' : 0;

    var responseModel = await apiWrapper.makeRequest(
      'CheckList/GetCheckList?facility_id=$facilityId&type=$type',
      Request.get,
      null,
      isLoading ?? false,
      {
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> getPreventiveCheckListForPm(
      {required String auth,
      bool? isLoading,
      int? facilityId,
      int? type,
      int? frequencyid,
      int? categoryId}) async {
    var categoryIdsParam =
        (categoryId != null) ? '&category_id=$categoryId' : 0;
    var frequencyIdsParam =
        (frequencyid != null) ? '&frequency_id=$frequencyid' : 0;

    var responseModel = await apiWrapper.makeRequest(
      'CheckList/GetCheckList?facility_id=$facilityId&type=$type' +
          categoryIdsParam.toString() +
          frequencyIdsParam.toString(),
      Request.get,
      null,
      isLoading ?? false,
      {
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> getPreventiveCheckListForAudit(
      {required String auth,
      bool? isLoading,
      int? facilityId,
      int? type,
      int? frequencyid,
      int? categoryId}) async {
    var frequencyIdsParam =
        (frequencyid != null) ? '&frequency_id=$frequencyid' : 0;

    var responseModel = await apiWrapper.makeRequest(
      'CheckList/GetCheckList?facility_id=$facilityId&type=$type' +
          frequencyIdsParam.toString(),
      Request.get,
      null,
      isLoading ?? false,
      {
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> getModuleList({
    required String auth,
    bool? isLoading,
    int? facilityId,
    int? type,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'CMMS/GetModuleList',
      Request.get,
      null,
      isLoading ?? false,
      {
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> getInventoryTypeList({
    required String auth,
    bool? isLoading,
    int? facilityId,
    int? type,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Inventory/GetInventoryTypeList',
      Request.get,
      null,
      isLoading ?? false,
      {
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> getInventoryStatusList({
    required String auth,
    bool? isLoading,
    // int? facilityId,
    int? type,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Inventory/GetInventoryStatusList',
      Request.get,
      null,
      isLoading ?? false,
      {
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> getCheckPointlist(
      {required String auth,
      bool? isLoading,
      int? selectedchecklistId,
      int? facilityId}) async {
    var responseModel = await apiWrapper.makeRequest(
      'CheckList/GetCheckPointList?checklist_id=$selectedchecklistId&facility_id=$facilityId',
      Request.get,
      null,
      isLoading ?? false,
      {
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> getJobDetails({
    required String auth,
    bool? isLoading,
    int? jobId,
    int? userId,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Job/GetJobDetails?job_id=$jobId',
      Request.get,
      null,
      isLoading ?? false,
      {
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> getjobDetailsModel({
    required String auth,
    bool? isLoading,
    int? jobId,
    int? userId,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'JC/GetJCListByJobId?jobId=$jobId',
      Request.get,
      null,
      isLoading ?? false,
      {
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> getPermitList({
    required String auth,
    int? facilityId,
    bool? selfView,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Permit/GetPermitList?facility_id=$facilityId&self_view=$selfView',
      Request.get,
      null,
      isLoading ?? false,
      {
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> getFacilityList({
    String? auth,
    bool? isLoading,
  }) async {
    ResponseModel response = ResponseModel(data: '', hasError: true);
    print('Facility List: ${response}');
    try {
      response = await apiWrapper.makeRequest(
        'CMMS/GetFacilityList',
        Request.get,
        null,
        isLoading ?? false,
        {
          'Authorization': 'Bearer $auth',
        },
      );
    } catch (error) {
      print(error);
    }

    return response;
  }

  Future<ResponseModel> getTypePermitList(
      {String? auth, bool? isLoading, int? facility_id}) async {
    ResponseModel response = ResponseModel(data: '', hasError: true);
    // print('PermitTypeResponse: $response');
    try {
      response = await apiWrapper.makeRequest(
        'Permit/GetPermitTypeList?facility_id=$facility_id',
        Request.get,
        null,
        true,
        {
          'Authorization': 'Bearer $auth',
        },
      );
    } catch (error) {
      print(error);
    }

    return response;
  }

  Future<ResponseModel> getModulesList(
      {String? auth, bool? isLoading, int? facility_id}) async {
    ResponseModel response = ResponseModel(data: '', hasError: true);
    print('PermitTypeResponse: $response');
    try {
      response = await apiWrapper.makeRequest(
        'CMMS/GetModuleList?facility_id=$facility_id',
        Request.get,
        null,
        true,
        {
          'Authorization': 'Bearer $auth',
        },
      );
    } catch (error) {
      print(error);
    }

    return response;
  }

  Future<ResponseModel> getBlocksList({
    String? auth,
    bool? isLoading,
    int? facilityId,
  }) async =>
      await apiWrapper.makeRequest(
        'CMMS/GetBlockList?facility_id=$facilityId',
        Request.getMultiparts,
        null,
        isLoading ?? false,
        {
          'Authorization': 'Bearer $auth',
        },
      );
  Future<ResponseModel> getAssetList({
    String? auth,
    bool? isLoading,
    int? facilityId,
  }) async =>
      await apiWrapper.makeRequest(
        'SMMaster/GetAssetMasterList?facility_id=$facilityId',
        Request.getMultiparts,
        null,
        isLoading ?? false,
        {
          'Authorization': 'Bearer $auth',
        },
      );

  Future<ResponseModel> getInventoryCategoryList({
    String? auth,
    bool? isLoading,
    int? facilityId,
  }) async =>
      await apiWrapper.makeRequest(
        'Inventory/GetInventoryCategoryList',
        Request.getMultiparts,
        null,
        isLoading ?? false,
        {
          'Authorization': 'Bearer $auth',
        },
      );

  Future<ResponseModel> getAffectedPartList({
    String? auth,
    bool? isLoading,
    int? facilityId,
  }) async =>
      await apiWrapper.makeRequest(
        'Inventory/GetInventoryCategoryList',
        Request.getMultiparts,
        null,
        isLoading ?? false,
        {
          'Authorization': 'Bearer $auth',
        },
      );

  Future<ResponseModel> getInventoryIsolationList({
    String? auth,
    bool? isLoading,
    int? facilityId,
  }) async =>
      await apiWrapper.makeRequest(
        'Inventory/GetInventoryCategoryList',
        Request.getMultiparts,
        null,
        isLoading ?? true,
        {
          'Authorization': 'Bearer $auth',
        },
      );

  Future<ResponseModel> getInventoryEquipmentNameList({
    required bool isLoading,
    required String auth,
    int? facilityId,
    int? blockId,
    required String categoryIds,
  }) async {
    var blockIdParam = (blockId != null) ? 'linkedToBlockId=$blockId&' : '';
    var categoryIdsParam =
        (categoryIds != '') ? 'categoryIds=$categoryIds&' : '';
    var facilityIdparam = (facilityId != null) ? 'facilityId=$facilityId&' : '';
//var statusParam = (status!=null status!='')?'status=1':'';
    var statusParam = 'status=1';
    ResponseModel responseModel = await apiWrapper.makeRequest(
      'Inventory/GetInventoryList?' +
          blockIdParam +
          categoryIdsParam +
          facilityIdparam,
      Request.getMultiparts,
      null,
      isLoading,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> getFrequencyList({
    String? auth,
    bool? isLoading,
  }) async =>
      await apiWrapper.makeRequest(
        'CMMS/GetFrequencyList',
        Request.getMultiparts,
        null,
        isLoading ?? false,
        {
          'Authorization': 'Bearer $auth',
        },
      );

  Future<ResponseModel> getAssignedToList({
    required String auth,
    bool? isLoading,
    int? facilityId,
    int? userId,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'CMMS/GetEmployeeList?facility_id=$facilityId',
      Request.get,
      null,
      isLoading ?? false,
      {
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> getWorkTypeList({
    String? categoryIds,
    bool? isLoading,
    String? auth,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'JobWorkType/GetJobWorkTypeList?categoryIds=$categoryIds',
      Request.get,
      null,
      isLoading ?? false,
      {
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> getToolsRequiredToWorkTypeList({
    required String auth,
    String? workTypeIds,
    bool? isLoading,
  }) async {
    print("Work type id in connect helper: $workTypeIds");
    var responseModel = await apiWrapper.makeRequest(
      'JobWorkType/GetMasterToolList?worktypeIds=$workTypeIds',
      Request.get,
      null,
      isLoading ?? false,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> saveJob({
    required String auth,
    job,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Job/CreateNewJob',
      Request.post,
      job,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> updateJob({
    required String auth,
    job,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Job/UpdateJob?job=$job',
      Request.patch,
      job,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> assignReAssignJob({
    required String auth,
    jobId,
    assignedToId,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Job/ReAssignJob?job_id=$jobId&assignedTo=$assignedToId',
      Request.put,
      null,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  ///
  Future<ResponseModel> linkToPermit({
    required String auth,
    jobId,
    permitId,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Job/LinkToPTW?job_id=$jobId&ptw_id=$permitId',
      Request.put,
      null,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  ///
  Future<ResponseModel> createJobCard({
    String? auth,
    int? jobId,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'JC/CreateJC?job_id=$jobId',
      Request.post,
      null,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    Get.dialog<void>(CreateJobCardDialog(
        data: parsedJson['message'], jcId: parsedJson['id']));
    print('jcId2:${parsedJson['id']}');
    return responseModel;
  }

  Future<ResponseModel> startJobCard({
    String? auth,
    int? jcCard,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'JC/StartJC?jc_id=$jcCard',
      Request.put,
      null,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> uploadFiles({
    required String auth,
    fileUploadModel,
    int? facilityId,
    int? moduleId,
    int? id,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'FileUpload/UploadFile',
      Request.post,
      fileUploadModel,
      isLoading ?? false,
      {
        'Content-Type': 'multipart/form-data',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  //Create New Permit
  Future<ResponseModel> createNewPermit({
    required String auth,
    newPermit,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Permit/CreatePermit',
      Request.post,
      newPermit,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    print('CreateNewPermitResponse5:${responseModel.data}');
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    Get.dialog<void>(CreateNewPermitDialog(
      data: parsedJson['message'],
      PtwId: parsedJson['id'],
    ));

    return responseModel;
  }

  //Create New Permit
  Future<ResponseModel> createNewPermitForJob({
    required String auth,
    newPermit,
    jobId,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Permit/CreatePermit',
      Request.post,
      newPermit,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    print('CreateNewPermitResponseForJob:${responseModel.data}');
    // var res = responseModel.data;
    // var parsedJson = json.decode(res);
    // Get.dialog<void>(CreateNewPermitForJobDialog(
    //   data: parsedJson['message'],
    //   PtwId: parsedJson['id'],
    // ));

    return responseModel;
  }

  Future<ResponseModel> createNewPermitForPm({
    required String auth,
    newPermit,
    pmTaskId,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Permit/CreatePermit',
      Request.post,
      newPermit,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    print('CreateNewPermitResponseForJob:${responseModel.data}');
    // var res = responseModel.data;
    // var parsedJson = json.decode(res);
    // Get.dialog<void>(CreateNewPermitForJobDialog(
    //   data: parsedJson['message'],
    //   PtwId: parsedJson['id'],
    // ));

    return responseModel;
  }

  //Update New Permit
  Future<ResponseModel> updateNewPermit({
    required String auth,
    newPermit,
    bool? isLoading,
    bool? resubmit,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Permit/UpdatePermit?resubmit=$resubmit',
      Request.patch,
      newPermit,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    print('UpdateNewPermitResponse5:${responseModel.data}');
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    Get.dialog<void>(UpdateNewPermitDialog(
      data: parsedJson['message'],
      PtwId: parsedJson['id'],
    ));

    return responseModel;
  }

  ///resubmit permit
  Future<ResponseModel> resubmitPermit({
    required String auth,
    newPermit,
    bool? isLoading,
    bool? resubmit,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Permit/UpdatePermit?resubmit=$resubmit',
      Request.patch,
      newPermit,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    print('UpdateNewPermitResponse5:${responseModel.data}');
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    Get.dialog<void>(UpdateNewPermitDialog(
      data: parsedJson['message'],
      PtwId: parsedJson['id'],
    ));

    return responseModel;
  }

  //Create SOP
  Future<ResponseModel> createSOP({
    required String auth,
    createSop,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Permit/CreateSOP',
      Request.post,
      createSop,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    print('Create SOP Response:${responseModel.data}');
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    Get.dialog<void>(CreateSopDialog(
      data: parsedJson['message'],
      SopId: parsedJson['id'],
    ));

    return responseModel;
  }

  //Create Warranty Claim
  Future<ResponseModel> createWarrantyClaim({
    required String auth,
    createWarrantyClaim,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'WC/CreateWC',
      Request.post,
      createWarrantyClaim,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    print('Create Warranty Claim Response:${responseModel.data}');
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    // if (res.e != null) {
    //   Get.dialog<void>(WarrantyClaimErrorDialog());
    // } else {

    Get.dialog<void>(NewWarrantyClaimDialog(
      data: parsedJson['message'],
      warrantyClaimId: parsedJson['id'],
    ));
    // }

    return responseModel;
  }

  //Create Incident Report
  Future<ResponseModel> createIncidentReport({
    required String auth,
    createIncidentReport,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'IncidentReport/CreateIncidentReport',
      Request.post,
      createIncidentReport,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    print('Create Incident Report Response:${responseModel.data}');
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    // if (res.e != null) {
    //   Get.dialog<void>(WarrantyClaimErrorDialog());
    // } else {

    Get.dialog<void>(CreateIncidentReportDialog(
      data: parsedJson['message'],
      incidentReportId: parsedJson['id'],
    ));
    // }

    return responseModel;
  }

  //Create Escalation matrix
  Future<ResponseModel> createEscalationMatrix({
    required String auth,
    createEscalationMatrix,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'EM/SetEscalationMatrix',
      Request.post,
      createEscalationMatrix,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    print('Create Escalation Matrix Response:${responseModel.data}');
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    // if (res.e != null) {
    //   Get.dialog<void>(WarrantyClaimErrorDialog());
    // } else {

    Get.dialog<void>(CreateEscalationMatrixDialog(
      data: parsedJson['message'],
      escalationMatrixId: parsedJson['id'],
    ));
    // }

    return responseModel;
  }

  //Create WarraGoods order

  Future<ResponseModel> createGoodsOrder({
    required String auth,
    createGo,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'GO/CreateGO',
      Request.post,
      createGo,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    print('Create Goods Orders Response:${responseModel.data}');
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    // if (res.e != null) {
    //   Get.dialog<void>(WarrantyClaimErrorDialog());
    // } else {

    return responseModel;
  }

  Future<ResponseModel> createGrievance({
    required String auth,
    bool? isLoading,
    required jobTypeJsonString,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Permit/CreateGrievance',
      Request.post,
      jobTypeJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> createMcPlan({
    required String auth,
    createMcPlans,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'MC/CreateMCPlan',
      Request.post,
      createMcPlans,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    print('Create MC Response:${responseModel.data}');
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    // if (res.e != null) {
    //   Get.dialog<void>(WarrantyClaimErrorDialog());
    // } else {

    return responseModel;
  }

  Future<ResponseModel> updateMcPlan({
    required String auth,
    updateMcPlans,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'MC/UpdateMCPlan',
      Request.post,
      updateMcPlans,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    print('Update Veg Response:${responseModel.data}');
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    // if (res.e != null) {
    //   Get.dialog<void>(WarrantyClaimErrorDialog());
    // } else {

    Get.dialog<void>(MCPlanUpdatedMessageDialog(
      data: parsedJson['message'],
      warrantyClaimId: parsedJson['id'],
    ));

    return responseModel;
  }

  Future<ResponseModel> submitPurchaseOrderData({
    required String auth,
    createGoReq,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'RequestOrder/CreateRequestOrder',
      Request.post,
      createGoReq,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    print('Create Goods Orders Response:${responseModel.data}');
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    // if (res.e != null) {
    //   Get.dialog<void>(WarrantyClaimErrorDialog());
    // } else {

    return responseModel;
  }

  Future<ResponseModel> updatePurchaseOrderData({
    required String auth,
    createGoReq,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'RequestOrder/UpdateRequestOrder',
      Request.post,
      createGoReq,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    print('Update Req Order:${responseModel.data}');
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    // if (res.e != null) {
    //   Get.dialog<void>(WarrantyClaimErrorDialog());
    // } else {

    return responseModel;
  }

  Future<ResponseModel> updateGoodsOrder({
    required String auth,
    createGo,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'GO/UpdateGO',
      Request.post,
      createGo,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    print('update Goods Orders Response:${responseModel.data}');
    var res = responseModel.data;
    var parsedJson = json.decode(res);

    return responseModel;
  }

  Future<ResponseModel> updateGOReceive({
    required String auth,
    createGo,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'GO/UpdateGOReceive',
      Request.post,
      createGo,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    print('update Goods Orders Response:${responseModel.data}');
    var res = responseModel.data;
    var parsedJson = json.decode(res);

    return responseModel;
  }

  Future<ResponseModel> updateGOReceiveIsSubmit0({
    required String auth,
    createGo,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'GO/UpdateGOReceive',
      Request.post,
      createGo,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    print('update Goods Orders Response:${responseModel.data}');
    var res = responseModel.data;
    var parsedJson = json.decode(res);

    return responseModel;
  }

  //Update Warranty Claim
  Future<ResponseModel> updateWarrantyClaim({
    required String auth,
    updateWarrantyClaim,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'WC/UpdateWC',
      Request.patch,
      updateWarrantyClaim,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    print('Update Warranty Claim Response:${responseModel.data}');
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    // if (res.e != null) {
    //   Get.dialog<void>(WarrantyClaimErrorDialog());
    // } else {

    Get.dialog<void>(WarrantyClaimUpdatedMessageDialog(
      data: parsedJson['message'],
      warrantyClaimId: parsedJson['id'],
    ));
    // }

    return responseModel;
  }

  //Update Incident Report
  Future<ResponseModel> updateIncidentReport({
    required String auth,
    updateIncidentReport,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'IncidentReport/UpdateIncidentReport',
      Request.put,
      updateIncidentReport,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    print('Update Incident Report Response:${responseModel.data}');
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    // if (res.e != null) {
    //   Get.dialog<void>(WarrantyClaimErrorDialog());
    // } else {

    Get.dialog<void>(UpdateIncidentReportDialog(
      data: parsedJson['message'],
      incidentReportId: parsedJson['id'],
    ));
    // }

    return responseModel;
  }

  Future<ResponseModel> updateIRSecondStep({
    required String auth,
    updateIncidentReport,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'IncidentReport/UpdateIncidentInvestigationReport',
      Request.post,
      updateIncidentReport,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    print('Update Incident Report Response:${responseModel.data}');
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    // if (res.e != null) {
    //   Get.dialog<void>(WarrantyClaimErrorDialog());
    // } else {

    Get.dialog<void>(UpdateIncidentReportDialog(
      data: parsedJson['message'],
      incidentReportId: parsedJson['id'],
    ));
    // }

    return responseModel;
  }

  //Update MC Schedule Execution
  Future<ResponseModel> updateMCScheduleExecution({
    required String auth,
    updateMCScheduleExecutionJsonString,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'MC/UpdateMCScheduleExecution',
      Request.put,
      updateMCScheduleExecutionJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    print('Update MC Execution Response:${responseModel.data}');
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    // if (res.e != null) {
    //   Get.dialog<void>(WarrantyClaimErrorDialog());
    // } else {

    Get.dialog<void>(UpdateMCExecutionDialog(
      data: parsedJson['message'],
      mcExecutionId: parsedJson['id'],
    ));
    // }

    return responseModel;
  }

  Future<ResponseModel> getUserAccessList({
    required String auth,
    bool? isLoading,
    String? userId,
  }) async {
    userId = userId;
    var responseModel = await apiWrapper.makeRequest(
      'User/GetUserAccess?user_id=$userId',
      Request.get,
      null,
      isLoading ?? false,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> getNewPermitDetail({
    required String auth,
    bool? isLoading,
    int? permitId,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Permit/GetPermitDetails?permit_id=$permitId',
      Request.get,
      null,
      isLoading ?? false,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> getViewPermitDetail({
    required String auth,
    bool? isLoading,
    int? permitId,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Permit/GetPermitDetails?permit_id=$permitId',
      Request.get,
      null,
      isLoading ?? false,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    print('ViewResponseModel${responseModel.data}');
    return responseModel;
  }

  Future<ResponseModel> getViewWarrantyClaimDetail({
    required String auth,
    bool? isLoading,
    int? wc_id,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'wc/GetWCDetails?wc_id=$wc_id',
      Request.get,
      null,
      isLoading ?? false,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    print('ViewWarrantyClaimResponseModel${responseModel.data}');
    return responseModel;
  }

  ///MC Execution Details
  Future<ResponseModel> getMCExecutionDetail({
    required String auth,
    bool? isLoading,
    int? executionId,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'MC/GetMCExecutionDetails?executionId=$executionId',
      Request.get,
      null,
      isLoading ?? false,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    print('MCExecutionResponseModel${responseModel.data}');
    return responseModel;
  }

  Future<ResponseModel> getMcPlanDetail({
    required String auth,
    bool? isLoading,
    int? planId,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'MC/GetMCPlanDetails?planId=$planId',
      Request.get,
      null,
      isLoading ?? false,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    print('MCExecutionResponseModel${responseModel.data}');
    return responseModel;
  }

  Future<ResponseModel> getIncidentReportDetail({
    required String auth,
    bool? isLoading,
    int? id,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'IncidentReport/GetIncidentDetailsReport?id=$id',
      Request.get,
      null,
      isLoading ?? false,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    print('IncidentReportDetailResponseModel${responseModel.data}');
    return responseModel;
  }

  Future<ResponseModel> getPurchaseDetailsById({
    required String auth,
    bool? isLoading,
    int? id,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'GO/GetGODetailsByID?id=$id',
      Request.get,
      null,
      isLoading ?? false,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    // print('ViewgetPurchaseDetailsById1${responseModel.data}');
    return responseModel;
  }

  Future<ResponseModel> getRoDetailsByID({
    required String auth,
    bool? isLoading,
    int? requestID,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      "RequestOrder/GetRODetailsByID?requestID=$requestID",
      Request.get,
      null,
      isLoading ?? false,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    print('getRoDetailsByID${responseModel.data}');
    return responseModel;
  }

  Future<ResponseModel> getInventoryDetail({
    required String auth,
    bool? isLoading,
    int? id,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Inventory/GetInventoryDetails?id=$id',
      Request.get,
      null,
      isLoading ?? false,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    print('InventoryResponseModel${responseModel.data}');
    return responseModel;
  }

  Future<ResponseModel> getAddInventoryDetail({
    required String auth,
    bool? isLoading,
    int? id,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Inventory/GetInventoryDetails?id=$id',
      Request.get,
      null,
      isLoading ?? false,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    print('AddInventoryResponseModel${responseModel.data}');
    return responseModel;
  }

  Future<ResponseModel> getHistory({
    String? auth,
    int? moduleType,
    int? id,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Utils/GetHistoryLog?module_type=$moduleType&id=$id',
      Request.get,
      null,
      isLoading ?? false,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> getJobsLinkdToPermitList({
    String? auth,
    int? permitId,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Job/GetJobListByPermitId?permitId=$permitId',
      Request.get,
      null,
      isLoading ?? false,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> getMrsListByModule({
    String? auth,
    int? jobId,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'MRS/getMRSListByModule?jobId=$jobId',
      Request.get,
      null,
      isLoading ?? false,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> getMrsListByModuleTask({
    String? auth,
    int? taskId,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'MRS/getMRSListByModule?pmId=$taskId',
      Request.get,
      null,
      isLoading ?? false,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> createModuleList({
    required String auth,
    bool? isLoading,
    required modulelistJsonString,
  }) async {
    var responseModel =
        // responseModel =
        await apiWrapper.makeRequest(
      'CMMS/AddModule',
      Request.post,
      modulelistJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> createCheckList({
    required String auth,
    bool? isLoading,
    required checklistJsonString,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'CheckList/CreateCheckList',
      Request.post,
      checklistJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> createCheckpoint({
    required String auth,
    bool? isLoading,
    required checkpointJsonString,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'CheckList/CreateCheckPoint',
      Request.post,
      checkpointJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> deleteCkeckpoint({
    required String auth,
    bool? isLoading,
    required check_point_id,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'CheckList/DeleteCheckPoint?id=$check_point_id',
      Request.delete,
      check_point_id,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> deletePmPlan({
    required String auth,
    bool? isLoading,
    required planId,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'PM/DeletePMPlan?planId=$planId',
      Request.put,
      planId,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> deleteModulelist({
    required String auth,
    bool? isLoading,
    required module_id,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'CMMS/DeleteModule?id=$module_id',
      Request.delete,
      module_id,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> getJobCardHistory({
    required String? auth,
    int? moduleType,
    int? jobCardId,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Utils/GetHistoryLog?module_type=$moduleType&id=$jobCardId',
      Request.get,
      null,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  ///Permit History
  Future<ResponseModel> getPermitHistory({
    required String? auth,
    int? moduleType,
    int? permitId,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Utils/GetHistoryLog?module_type=$moduleType&id=$permitId',
      Request.get,
      null,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    print('PermitHistory Response:${responseModel}');
    return responseModel;
  }

  Future<ResponseModel> getRoHistory({
    required String? auth,
    int? moduleType,
    int? id,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Utils/GetHistoryLog?module_type=$moduleType&id=$id',
      Request.get,
      null,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    print('PermitHistory Response:${responseModel}');
    return responseModel;
  }

  Future<ResponseModel> updateJobCard({
    String? auth,
    jobCard,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'JC/UpdateJC',
      Request.put,
      jobCard,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    Get.dialog<void>(JobCardUpdatedDialog(
      message: parsedJson['message'],
      jobId: parsedJson['id'],
    ));
    return responseModel;
  }

  Future<ResponseModel> carryForwardJob({
    String? auth,
    jobCard,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'JC/CarryForwardJC',
      Request.put,
      jobCard,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    Get.dialog<void>(carryForwardJobDialog(
      message: parsedJson['message'],
      jobId: parsedJson['id'],
    ));
    return responseModel;
  }

  Future<ResponseModel> closeJob({
    String? auth,
    jobCard,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'JC/CloseJC',
      Request.put,
      jobCard,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    Get.dialog<void>(closeJobDialog(
      message: parsedJson['message'],
      jobId: parsedJson['id'],
    ));
    return responseModel;
  }

  // Future<ResponseModel> approveJobCard({
  //   String? auth,
  //   jobCardId,
  //   comment,
  //   bool? isLoading,
  // }) async {
  //   var responseModel = await apiWrapper.makeRequest(
  //     'JC/ApproveJC?status=3&ptw_id=59590',
  //     Request.put,
  //     null,
  //     isLoading ?? false,
  //     {
  //       'Content-Type': 'application/json',
  //       'Authorization': 'Bearer $auth',
  //     },
  //   );
  //   return responseModel;
  // }
  Future<ResponseModel> approveJobCards({
    required String auth,
    approveJsonString,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'JC/ApproveJCCF',
      Request.put,
      approveJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    print('JobCard Response $responseModel');
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    Get.dialog<void>(ApproveJcJobDialog(
      message: parsedJson['message'],
      jobId: parsedJson['id'],
      tittle: "JOb carry forward approved",
    ));
    return responseModel;
  }

//
  Future<ResponseModel> rejectJobCard({
    required String auth,
    rejectJsonString,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'JC/RejectJCCF',
      Request.put,
      rejectJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    Get.dialog<void>(RejectJcJobDialog(
      message: parsedJson['message'],
      jobId: parsedJson['id'],
      tittle: "JOb carry forward reject",
    ));
    return responseModel;
  }

  Future<ResponseModel> approvecloseJob({
    required String auth,
    approveJsonString,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'JC/ApproveJC',
      Request.put,
      approveJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    print('JobCard Response $responseModel');
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    List<Map<String, dynamic>> parsedList =
        List<Map<String, dynamic>>.from(parsedJson);

    // Accessing the first item in the list
    Map<String, dynamic> firstItem = parsedList.isNotEmpty ? parsedList[0] : {};

    // Accessing 'id' key which holds a list
    List<int> idList = List<int>.from(firstItem['id'] ?? []);

    Get.dialog<void>(ApproveJcJobDialog(
      message: firstItem['message'],
      jobId: idList, // parsedJson['id'],
      tittle: "JOb close approved",
    ));
    return responseModel;
  }

//
  Future<ResponseModel> rejectcloseJob({
    required String auth,
    rejectJsonString,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'JC/RejectJC',
      Request.put,
      rejectJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    Get.dialog<void>(RejectJcJobDialog(
      message: parsedJson['message'],
      jobId: parsedJson['id'],
      tittle: "JOb close reject",
    ));
    return responseModel;
  }

  Future<ResponseModel> getPermitDetails({
    required String? auth,
    int? permitId,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Permit/GetPermitDetails?permit_id=$permitId',
      Request.get,
      null,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> getJobCardDetails({
    String? auth,
    int? jobCardId,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'JC/GetJCDetail?jc_id=$jobCardId',
      Request.get,
      null,
      isLoading ?? false,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> getPmMappingList({
    required String auth,
    bool? isLoading,
    int? facilityId,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'CheckList/GetCheckListMap?facility_id=$facilityId',
      Request.get,
      null,
      isLoading ?? false,
      {
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> savePmMapping({
    required String auth,
    pmJsonString,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'CheckList/CreateCheckListMap',
      Request.post,
      pmJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> getCalibrationList({
    required String auth,
    bool? isLoading,
    int? facilityId,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Calibration/GetCalibrationList?facility_id=$facilityId',
      Request.get,
      null,
      isLoading ?? true,
      {
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> requestCalibration({
    required String auth,
    bool? isLoading,
    required requestCalibration,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Calibration/RequestCalibration',
      Request.post,
      requestCalibration,
      isLoading ?? true,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> rejectRequestCalibration({
    required String auth,
    bool? isLoading,
    required rejectCalibrationtoJsonString,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Calibration/RejectRequestCalibration',
      Request.put,
      rejectCalibrationtoJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> approveRequestCalibration({
    required String auth,
    bool? isLoading,
    required approveCalibrationtoJsonString,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Calibration/ApproveRequestCalibration',
      Request.put,
      approveCalibrationtoJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> rejectCloseCalibration({
    required String auth,
    bool? isLoading,
    required rejectCalibrationtoJsonString,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Calibration/RejectCalibration',
      Request.put,
      rejectCalibrationtoJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> approveCloseCalibration({
    required String auth,
    bool? isLoading,
    required approveCalibrationtoJsonString,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Calibration/ApproveCalibration',
      Request.put,
      approveCalibrationtoJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> closeCalibration({
    required String auth,
    bool? isLoading,
    required closeCalibrationtoJsonString,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Calibration/CloseCalibration',
      Request.put,
      closeCalibrationtoJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> completeCalibration({
    required String auth,
    bool? isLoading,
    required completeCalibrationtoJsonString,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Calibration/CompleteCalibration',
      Request.put,
      completeCalibrationtoJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> getPMScheduleData({
    required String auth,
    bool? isLoading,
    int? facilityId,
    int? selectedEquipmentId,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'PM/GetScheduleData?facility_id=$facilityId&category_id=$selectedEquipmentId',
      Request.get,
      null,
      isLoading ?? true,
      {
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> savePmSchedule({
    required String auth,
    pmScheduleJsonString,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'PM/SetScheduleData',
      Request.post,
      pmScheduleJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> getPmTaskList(
      {required String auth,
      bool? isLoading,
      int? facilityId,
      dynamic startDate,
      dynamic endDate}) async {
    var responseModel = await apiWrapper.makeRequest(
      'PMScheduleView/GetPMTaskList?facility_id=${facilityId}&start_date=${endDate}&end_date=2025-03-20',
      Request.get,
      null,
      isLoading ?? true,
      {
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> getAuditTaskList(
      {required String auth,
      bool? isLoading,
      int? facilityId,
      dynamic startDate,
      dynamic endDate}) async {
    var responseModel = await apiWrapper.makeRequest(
      'AuditPlan/GetTaskList?facility_id=${facilityId}&start_date=${endDate}&end_date=${startDate}',
      Request.get,
      null,
      isLoading ?? true,
      {
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> getPmtaskViewList({
    required String? auth,
    int? scheduleId,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'PMScheduleView/GetPMTaskDetail?task_id=$scheduleId',
      Request.get,
      null,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<CreateSOPModel> browseFiles(
      {required String auth,
      Uint8List? fileBytes,
      required String fileName,
      required int importType,
      bool? isLoading,
      required int facilityId}) async {
    final request = http.MultipartRequest('POST',
        Uri.parse('http://65.0.20.19/CMMS_API/api/FileUpload/UploadFile'));
    // Uri.parse('http://172.20.43.9:83/api/FileUpload/UploadFile'));

    request.files.add(
        http.MultipartFile.fromBytes('files', fileBytes!, filename: fileName));
    request.headers.addAll({'Authorization': 'Bearer $auth'});

    // Send the request and wait for the response
    final response = await request.send();
    var respStr = await response.stream.bytesToString();
    var jsonResponse = json.decode(respStr);

    // Check if the upload was successful
    if (response.statusCode == 200) {
      if (importType == AppConstants.kImportAsset) {
        importInventory(
            auth: auth,
            fileId: jsonResponse["id"][0].toString(),
            isLoading: true,
            facilityId: facilityId);
      } else if (importType == AppConstants.kImportUser) {
        importUser(
            auth: auth,
            fileId: jsonResponse["id"][0].toString(),
            isLoading: true);
      } else if (importType == AppConstants.kImportChecklist) {
        importCheckpoint(
            auth: auth,
            fileId: jsonResponse["id"][0].toString(),
            isLoading: true);
      } else if (importType == AppConstants.kImportBussiness) {
        importBusiness(
            auth: auth,
            fileId: jsonResponse["id"][0].toString(),
            isLoading: true);
      } else if (importType == AppConstants.kImportMaterial) {
        importMaterial(
            auth: auth,
            fileId: jsonResponse["id"][0].toString(),
            isLoading: true,
            facilityId: facilityId);
      } else if (importType == AppConstants.kImportPMPlan) {
        importPlan(
            auth: auth,
            fileId: jsonResponse["id"][0].toString(),
            isLoading: true);
      }
    }

    CreateSOPModel createSOPModel = CreateSOPModel(
        jsa_fileId: int.parse(jsonResponse["id"][0].toString()),
        sop_fileId: int.parse(jsonResponse["id"][0].toString()));
    print('JsaDataId${createSOPModel.jsa_fileId}');
    print('SOPDataId${createSOPModel.sop_fileId}');

    return createSOPModel;
  }

  Future<ResponseModel> importInventory(
      {required String auth,
      required String fileId,
      required bool isLoading,
      required int facilityId}) async {
    var responseModel = await apiWrapper.makeRequest(
      // 'Inventory/ImportInventories?file_id=$fileId&facilityID=$facilityId',
      'Inventory/ImportInventories?file_id=$fileId&facility_id=$facilityId',
      Request.post,
      null,
      true,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    var import = parsedJson['import_log'];
    String logString = import.join('\n');
    Get.dialog<void>(
        ImportMsgDialog(data: parsedJson['message'], importLog: logString));
    return responseModel;
  }

  Future<ResponseModel> importUser({
    required String auth,
    required String fileId,
    required bool isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'User/ImportUsers?file_id=$fileId',
      Request.post,
      null,
      true,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    var import = parsedJson['import_log'];
    String logString = import.join('\n');
    Get.dialog<void>(
        ImportMsgDialog(data: parsedJson['message'], importLog: logString));
    return responseModel;
  }

  Future<ResponseModel> deleteCkecklist({
    required String auth,
    bool? isLoading,
    required checklist_id,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'CheckList/DeleteCheckList?id=$checklist_id',
      Request.delete,
      checklist_id,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> deleteWorkTypeTool({
    required String auth,
    bool? isLoading,
    required worktypetool_id,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'JobWorkType/DeleteMasterTool?id=$worktypetool_id',
      Request.delete,
      worktypetool_id,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> updateChecklistNumber({
    required String auth,
    bool? isLoading,
    required checklistJsonString,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'CheckList/UpdateCheckList',
      Request.patch,
      checklistJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> updateWorkTypeTool({
    required String auth,
    bool? isLoading,
    required worktypetoolJsonString,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'JobWorkType/UpdateMasterTool',
      Request.put,
      json.encode(
        worktypetoolJsonString,
      ),
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> updateModulelistNumber({
    required String auth,
    bool? isLoading,
    required modulelistJsonString,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'CMMS/UpdateModule',
      Request.patch,
      modulelistJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> updateCheckPoint({
    required String auth,
    bool? isLoading,
    required checkpointJsonString,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'CheckList/UpdateCheckPoint',
      Request.patch,
      checkpointJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> updateSafetyMeasure({
    required String auth,
    bool? isLoading,
    required createSafetyMeasureJsonString,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Permit/UpdateSafetyMeasure',
      Request.patch,
      createSafetyMeasureJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> getCountryList({
    String? auth,
    bool? isLoading,
  }) async =>
      await apiWrapper.makeRequest(
        'Utils/GetCountryList',
        Request.get,
        null,
        true,
        {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $auth',
        },
      );
  Future<ResponseModel> getBloodList({
    String? auth,
    bool? isLoading,
  }) async =>
      await apiWrapper.makeRequest(
        'CMMS/GetBloodGroupList',
        Request.get,
        null,
        true,
        {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $auth',
        },
      );
  Future<ResponseModel> getStateListnew(
          {String? auth, bool? isLoading, int? selectedCountryId}) async =>
      await apiWrapper.makeRequest(
        'Utils/GetStateList?country_id=$selectedCountryId',
        Request.get,
        null,
        true,
        {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $auth',
        },
      );
  Future<ResponseModel> getCityList(
          {String? auth, bool? isLoading, int? selectedStateId}) async =>
      await apiWrapper.makeRequest(
        'Utils/GetCityList?state_id=$selectedStateId',
        Request.get,
        null,
        true,
        {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $auth',
        },
      );
  Future<ResponseModel> getRoleAccessList({
    required String? auth,
    int? roleId,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'RoleAccess/GetRoleAccess?role_id=$roleId',
      Request.get,
      null,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> getRoleNotificationList({
    required String? auth,
    int? roleId,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'RoleAccess/GetRoleNotifications?role_id=$roleId',
      Request.get,
      null,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> getUserAccessListById({
    required String? auth,
    int? userId,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'User/GetUserAccess?user_id=$userId',
      Request.get,
      null,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> getUserAccessListByUserId({
    required String? auth,
    int? userId,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'User/GetUserAccess?user_id=$userId',
      Request.get,
      null,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> getUserNotificationListById({
    required String? auth,
    int? userId,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'User/GetUserNotifications?user_id=$userId',
      Request.get,
      null,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> getRoleList({
    String? auth,
    bool? isLoading,
  }) async =>
      await apiWrapper.makeRequest(
        'RoleAccess/GetRoleList',
        Request.get,
        null,
        true,
        {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $auth',
        },
      );
  Future<ResponseModel> getUserList({
    required String auth,
    bool? isLoading,
    int? facilityId,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'User/GetUserList?facility_id=$facilityId',
      Request.get,
      null,
      isLoading ?? false,
      {
        'Authorization': 'Bearer $auth',
        'Content-Type': 'application/json',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> jobCardList({
    required String auth,
    bool? isLoading,
    int? facilityId,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'JC/GetJCList?facility_id=$facilityId',
      Request.get,
      null,
      isLoading ?? false,
      {
        'Authorization': 'Bearer $auth',
        'Content-Type': 'application/json',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> getUserDetails({
    required String? auth,
    int? userId,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'User/GetUserDetail?user_id=$userId',
      Request.get,
      null,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> saveAccessLevel({
    required String auth,
    accessLevelJsonString,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'User/SetUserAccess',
      Request.post,
      accessLevelJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> addUser({
    required String auth,
    bool? isLoading,
    required adduserJsonString,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'User/CreateUser',
      Request.post,
      adduserJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> updateUser({
    required String auth,
    bool? isLoading,
    required adduserJsonString,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'User/UpdateUser',
      Request.patch,
      adduserJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> updatePmExecution({
    required String auth,
    pmExecutionJsonString,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'PMScheduleView/UpdatePMScheduleExecution',
      Request.patch,
      pmExecutionJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> getWarrantyTypeList({
    String? auth,
    bool? isLoading,
  }) async =>
      await apiWrapper.makeRequest(
        'Inventory/GetWarrantyTypeList',
        Request.getMultiparts,
        null,
        isLoading ?? false,
        {
          'Authorization': 'Bearer $auth',
        },
      );
  Future<AddUserModel> uploadImge({
    required String auth,
    Uint8List? fileBytes,
    required String fileName,
    bool? isLoading,
  }) async {
    final request = http.MultipartRequest('POST',
        Uri.parse('http://65.0.20.19/CMMS_API/api/FileUpload/UploadFile'));
    // Uri.parse('http://172.20.43.9:83/api/FileUpload/UploadFile'));

    request.files.add(
        http.MultipartFile.fromBytes('files', fileBytes!, filename: fileName));
    request.headers.addAll({'Authorization': 'Bearer $auth'});

    // Send the request and wait for the response
    final response = await request.send();
    var respStr = await response.stream.bytesToString();
    var jsonResponse = json.decode(respStr);

    // Check if the upload was successful
    // if (response.statusCode == 200) {
    AddUserModel addUserModel = AddUserModel(
      photo_id: int.parse(jsonResponse["id"][0].toString()),
    );
    print('photo_id${addUserModel.photo_id}');

    return addUserModel;
  }

  Future<AddInventoryRequestModel> uploadImgeInventory({
    required String auth,
    Uint8List? fileBytes,
    required String fileName,
    bool? isLoading,
  }) async {
    final request = http.MultipartRequest('POST',
        Uri.parse('http://65.0.20.19/CMMS_API/api/FileUpload/UploadFile'));
    // Uri.parse('http://172.20.43.9:83/api/FileUpload/UploadFile'));

    request.files.add(
        http.MultipartFile.fromBytes('files', fileBytes!, filename: fileName));
    request.headers.addAll({'Authorization': 'Bearer $auth'});

    // Send the request and wait for the response
    final response = await request.send();
    var respStr = await response.stream.bytesToString();
    var jsonResponse = json.decode(respStr);

    // Check if the upload was successful
    // if (response.statusCode == 200) {
    AddInventoryRequestModel addInventoryRequestModel =
        AddInventoryRequestModel(
      categoryId: int.parse(jsonResponse["categoryId"][0].toString()),
    );
    print('photo_id${addInventoryRequestModel.categoryId}');

    return addInventoryRequestModel;
  }

  ///

  Future<ResponseModel> getWarrantyUsageTermList({
    String? auth,
    bool? isLoading,
  }) async =>
      await apiWrapper.makeRequest(
        'Inventory/GetWarrantyUsageTermList',
        Request.getMultiparts,
        null,
        isLoading ?? false,
        {
          'Authorization': 'Bearer $auth',
        },
      );

  Future<ResponseModel> getBusinessTypeList({
    required bool isLoading,
    required String auth,
    int? businessType,
  }) async {
    ResponseModel responseModel = await apiWrapper.makeRequest(
      'CMMS/GetBusinessTypeList',
      Request.getMultiparts,
      null,
      isLoading,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> createBusinessList({
    required String auth,
    bool? isLoading,
    required businesslistJsonString,
  }) async {
    var responseModel =
        // responseModel =
        await apiWrapper.makeRequest(
      'CMMS/AddBusiness', //AddBusiness
      Request.post,
      businesslistJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> createSPV({
    required String auth,
    bool? isLoading,
    required businesslistJsonString,
  }) async {
    var responseModel =
        // responseModel =
        await apiWrapper.makeRequest(
      'CMMS/CreateSPV', //AddBusiness
      Request.post,
      businesslistJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> saveNotification({
    required String auth,
    saveNotificationJsonString,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'User/SetUserNotifications',
      Request.post,
      saveNotificationJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> getWarrantyList({
    required String auth,
    bool? isLoading,
    int? facilityId,
    int? type,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Inventory/GetWarrantyTypeList',
      Request.get,
      null,
      isLoading ?? false,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> AddInventory({
    required String auth,
    bool? isLoading,
    required addInventoryJsonString,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Inventory/AddInventory',
      Request.post,
      addInventoryJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> updateInventory({
    required String auth,
    bool? isLoading,
    required addInventoryJsonString,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Inventory/UpdateInventory',
      Request.put,
      addInventoryJsonString,
      // json.encode(addInventoryJsonString),
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> inventoryList(
      {required bool isLoading,
      required String auth,
      int? facilityId,
      int? categoryId}) async {
    var categoryIdsParam = (categoryId != 0) ? '&categoryIds=$categoryId' : '';
    ResponseModel responseModel = await apiWrapper.makeRequest(
      'Inventory/GetInventoryList?facilityId=$facilityId',
      Request.get,
      null,
      isLoading,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> inventoryListviaCategory(
      {required bool isLoading,
      required String auth,
      int? facilityId,
      int? categoryId}) async {
    var categoryIdsParam = (categoryId != 0) ? '&categoryIds=$categoryId' : '';
    ResponseModel responseModel = await apiWrapper.makeRequest(
      'Inventory/GetInventoryList?facilityId=$facilityId' + categoryIdsParam,
      Request.get,
      null,
      isLoading,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> startCalibration({
    required String auth,
    bool? isLoading,
    required calibrationId,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Calibration/StartCalibration?calibration_id=$calibrationId',
      Request.put,
      calibrationId,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> createFacilityType({
    required String auth,
    bool? isLoading,
    required facilitylistJsonString,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Facility/CreateNewFacility',
      Request.post,
      facilitylistJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> createBlockType({
    required String auth,
    bool? isLoading,
    required blockTypeJsonString,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Facility/CreateNewBlock',
      Request.post,
      blockTypeJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  ///
  Future<ResponseModel> getCalibrationView({
    required String? auth,
    int? calibrationId,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Calibration/GetCalibrationDetails?id=$calibrationId',
      Request.get,
      null,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> getAssetMasterList({
    required String auth,
    bool? isLoading,
    int? facilityId,
    int? type,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'SMMaster/GetAssetMasterList',
      Request.get,
      null,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> getDesignationList({
    String? auth,
    bool? isLoading,
  }) async =>
      await apiWrapper.makeRequest(
        'RoleAccess/GetDesignationList',
        Request.get,
        null,
        true,
        {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $auth',
        },
      );
  Future<ResponseModel> getResponsibilityList({
    String? auth,
    bool? isLoading,
  }) async =>
      await apiWrapper.makeRequest(
        'MISMaster/GetResponsibilityList',
        Request.get,
        null,
        true,
        {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $auth',
        },
      );
  Future<ResponseModel> deleteBusinessList({
    required String auth,
    bool? isLoading,
    required business_id,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'CMMS/DeleteBusiness?id=$business_id',
      Request.delete,
      business_id,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> deleteBlock({
    required String auth,
    bool? isLoading,
    required business_id,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Facility/DeleteBlock?block_id=$business_id',
      Request.delete,
      business_id,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> deleteSPV({
    required String auth,
    bool? isLoading,
    required business_id,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'CMMS/DeleteSPV?id=$business_id',
      Request.delete,
      business_id,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> deleteGoodsOrders({
    required String auth,
    bool? isLoading,
    required id,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'GO/DeleteGO?id=$id',
      Request.delete,
      id,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> updateBusinesslist({
    required String auth,
    bool? isLoading,
    required modulelistJsonString,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'CMMS/UpdateBusiness',
      Request.patch,
      modulelistJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> updateSPV({
    required String auth,
    bool? isLoading,
    required modulelistJsonString,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'CMMS/UpdateSPV',
      Request.patch,
      modulelistJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> updateFacilityList({
    required String auth,
    bool? isLoading,
    required modulelistJsonString,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Facility/UpdateFacility',
      Request.patch,
      modulelistJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> getCompetencyList({
    required String auth,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'User/GetCompetencyList',
      Request.get,
      null,
      isLoading ?? false,
      {
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> createCompetency({
    required String auth,
    bool? isLoading,
    required competencyJsonString,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'User/AddCompetency',
      Request.post,
      competencyJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> updateCompetency({
    required String auth,
    bool? isLoading,
    required competencyJsonString,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'User/UpdateCompetency',
      Request.patch,
      competencyJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> deleteCompetencyList({
    required String auth,
    bool? isLoading,
    required checklist_id,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'User/DeleteCompetency?id=$checklist_id',
      Request.delete,
      checklist_id,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> createPermitType({
    required String auth,
    bool? isLoading,
    required checklistJsonString,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Permit/CreatePermitType',
      Request.post,
      checklistJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> deletePermitType({
    required String auth,
    bool? isLoading,
    required permit_id,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Permit/DeletePermitType?id=$permit_id',
      Request.delete,
      permit_id,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  ///Delete Safety Measure
  Future<ResponseModel> deleteSafetyMeasure({
    required String auth,
    bool? isLoading,
    required id,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Permit/DeleteSafetyMeasure?id=$id',
      Request.delete,
      id,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> updatePermitType({
    required String auth,
    bool? isLoading,
    required checklistJsonString,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Permit/UpdatePermitType',
      Request.patch,
      checklistJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> createRoleList({
    required String auth,
    bool? isLoading,
    required modulelistJsonString,
  }) async {
    var responseModel =
        // responseModel =
        await apiWrapper.makeRequest(
      'RoleAccess/AddRole',
      Request.post,
      modulelistJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> updateRoleList({
    required String auth,
    bool? isLoading,
    required modulelistJsonString,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'RoleAccess/UpdateRole',
      Request.patch,
      modulelistJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> deleteRole({
    required String auth,
    bool? isLoading,
    required module_id,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'RoleAccess/DeleteRole?id=$module_id',
      Request.delete,
      module_id,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> createDesignation({
    required String auth,
    bool? isLoading,
    required designationJsonString,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'RoleAccess/AddDesignation',
      Request.post,
      designationJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> createResponsibility({
    required String auth,
    bool? isLoading,
    required designationJsonString,
  }) async {
    int userId = varUserAccessModel.value.user_id ?? 0;
    var responseModel = await apiWrapper.makeRequest(
      'MISMaster/CreateResponsibility?UserID=$userId',
      Request.post,
      designationJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> saveRoleAccess({
    required String auth,
    bool? isLoading,
    required saveRolelistJsonString,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'RoleAccess/SetRoleAccess',
      Request.post,
      saveRolelistJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> updateDesignation({
    required String auth,
    bool? isLoading,
    required designationJsonString,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'RoleAccess/UpdateDesignation',
      Request.patch,
      designationJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> updateResponsibility({
    required String auth,
    bool? isLoading,
    required designationJsonString,
  }) async {
    int userId = varUserAccessModel.value.user_id ?? 0;

    var responseModel = await apiWrapper.makeRequest(
      'MISMaster/UpdateResponsibility?UserID=$userId',
      Request.put,
      designationJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> deleteDesignation({
    required String auth,
    bool? isLoading,
    required module_id,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'RoleAccess/DeleteDesignation?id=$module_id',
      Request.delete,
      module_id,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> deleteResponsibility({
    required String auth,
    bool? isLoading,
    required module_id,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'MISMaster/DeleteResponsibility?id=$module_id',
      Request.delete,
      null,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> createBusinessType({
    required String auth,
    bool? isLoading,
    required businessTypeJsonString,
  }) async {
    var responseModel =
        // responseModel =
        await apiWrapper.makeRequest(
      'CMMS/AddBusinessType', //AddBusiness
      Request.post,
      businessTypeJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> deleteBusinessType({
    required String auth,
    bool? isLoading,
    required businesstype_id,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'CMMS/DeleteBusinessType?id=$businesstype_id',
      Request.delete,
      businesstype_id,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> updateBusinessType({
    required String auth,
    bool? isLoading,
    required businessTypeJsonString,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'CMMS/UpdateBusinessType',
      Request.patch,
      businessTypeJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> getMrsList(
      {required String auth,
      bool? isLoading,
      int? facilityId,
      dynamic startDate,
      dynamic endDate,
      int? userId}) async {
    var responseModel = await apiWrapper.makeRequest(
      'MRS/getMRSList?facility_ID=$facilityId&emp_id=$userId&fromDate=$endDate&toDate=$startDate',
      //  'MRS/getMRSList?facility_ID=$facilityId&emp_id=412&fromDate=2023-04-23&toDate=2023-07-7',
      Request.get,
      null,
      isLoading ?? false,
      {
        'Authorization': 'Bearer $auth',
        'Content-Type': 'application/json',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> getPlantStockList(
      {required String auth,
      bool? isLoading,
      int? facilityId,
      dynamic startDate,
      dynamic endDate,
      int? userId,
      List<int>? selectedAssetsNameIdList}) async {
    String assets = selectedAssetsNameIdList.toString();
    final assetsItems = assets.substring(1, assets.length - 1);
    var responseModel = await apiWrapper.makeRequest(
      'SMReports/GetStockReport?facility_id=$facilityId&actorTypeID=2&actorID=$facilityId&StartDate=$endDate&EndDate=$startDate&assetMasterIDs=$assetsItems',
      Request.get,
      null,
      isLoading ?? false,
      {
        'Authorization': 'Bearer $auth',
        'Content-Type': 'application/json',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> getPlantStockListReturn({
    required String auth,
    bool? isLoading,
    int? facilityId,
    int? actorID,
    int? actorType,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'SMReports/GetStockReport?facility_id=$facilityId&actorTypeID=$actorType&actorID=$actorID',
      Request.get,
      null,
      isLoading ?? false,
      {
        'Authorization': 'Bearer $auth',
        'Content-Type': 'application/json',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> getEquipmentAssetsList({
    String? auth,
    bool? isLoading,
    int? facilityId,
  }) async =>
      await apiWrapper.makeRequest(
        'MRS/GetAssetItems?facility_ID=$facilityId',
        Request.get,
        null,
        isLoading ?? false,
        {
          'Authorization': 'Bearer $auth',
        },
      );

  Future<ResponseModel> deleteFacility({
    required String auth,
    bool? isLoading,
    required business_id,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Facility/DeleteFacility?facility_id=$business_id',
      Request.delete,
      business_id,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> createMrs({
    required String auth,
    createMrsJsonString,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'MRS/CreateMRS',
      Request.post,
      createMrsJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> transferItem({
    required String auth,
    transferItemJsonString,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'MRS/TransferItems',
      Request.post,
      transferItemJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> createPmPlan({
    required String auth,
    createPmPlanJsonString,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'PM/CreatePMPlan',
      Request.post,
      createPmPlanJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> updatePmPlan({
    required String auth,
    createPmPlanJsonString,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'PM/UpdatePMPlan',
      Request.post,
      createPmPlanJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> createRiskType({
    required String auth,
    bool? isLoading,
    required riskTypeJsonString,
  }) async {
    var responseModel =
        // responseModel =
        await apiWrapper.makeRequest(
      'CMMS/CreateRiskType', //AddBusiness
      Request.post,
      riskTypeJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> deleteRiskType({
    required String auth,
    bool? isLoading,
    required businesstype_id,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'CMMS/DeleteRiskType?id=$businesstype_id',
      Request.delete,
      businesstype_id,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> updateRiskType({
    required String auth,
    bool? isLoading,
    required riskTypeJsonString,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'CMMS/UpdateRiskType',
      Request.patch,
      riskTypeJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> createInventoryStatus({
    required String auth,
    bool? isLoading,
    required checkpointJsonString,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Inventory/AddInventoryStatus',
      Request.post,
      checkpointJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> getMrsDetails({
    required String? auth,
    int? mrsId,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'MRS/getMRSDetails?ID=$mrsId',
      Request.get,
      null,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> getPmPlanDetails({
    required String? auth,
    int? pmPlanId,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'PM/GetPMPlanDetail?planId=$pmPlanId',
      Request.get,
      null,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> deleteInventoryStatus({
    required String auth,
    bool? isLoading,
    required check_point_id,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Inventory/DeleteInventoryStatus?id=$check_point_id',
      Request.delete,
      check_point_id,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> updateInventoryStatus({
    required String auth,
    bool? isLoading,
    required checklistJsonString,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Inventory/UpdateInventoryStatus',
      Request.patch,
      checklistJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> createInventoryType({
    required String auth,
    bool? isLoading,
    required checkpointJsonString,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Inventory/AddInventoryType',
      Request.post,
      checkpointJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> deleteInventoryType({
    required String auth,
    bool? isLoading,
    required check_point_id,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Inventory/DeleteInventoryType?id=$check_point_id',
      Request.delete,
      check_point_id,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> updateInventoryType({
    required String auth,
    bool? isLoading,
    required checklistJsonString,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Inventory/UpdateInventoryType',
      Request.patch,
      checklistJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> createInventoryCategory({
    required String auth,
    bool? isLoading,
    required checkpointJsonString,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Inventory/AddInventoryCategory',
      Request.post,
      checkpointJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> deleteInventoryCategory({
    required String auth,
    bool? isLoading,
    required check_point_id,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Inventory/DeleteInventoryCategory?id=$check_point_id',
      Request.delete,
      check_point_id,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> updateInventoryCategory({
    required String auth,
    bool? isLoading,
    required checklistJsonString,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Inventory/UpdateInventoryCategory',
      Request.patch,
      checklistJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> updateBlockType({
    required String auth,
    bool? isLoading,
    required checklistJsonString,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Facility/UpdateBlock',
      Request.patch,
      checklistJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> approveMrs({
    required String auth,
    bool? isLoading,
    required approvetoJsonString,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'MRS/mrsApproval',
      Request.post,
      approvetoJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> rejectMrs({
    required String auth,
    bool? isLoading,
    required rejecttoJsonString,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'MRS/mrsReject',
      Request.post,
      rejecttoJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> editMrs({
    required String auth,
    editMrsJsonString,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'MRS/updateMRS',
      Request.post,
      editMrsJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> getInsuranceStatus(
      {required bool isLoading, required String auth}) async {
    ResponseModel responseModel = await apiWrapper.makeRequest(
      'CMMS/GetInsuranceStatusList',
      Request.getMultiparts,
      null,
      isLoading,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> getCalibrationAssets({
    required String auth,
    bool? isLoading,
    int? facilityId,
    int? type,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Inventory/GetCalibrationList?facilityId=$facilityId',
      Request.get,
      null,
      isLoading ?? false,
      {
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> getWarrantyCertificate({
    required String auth,
    bool? isLoading,
    int? type,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Inventory/getWarrantyCertificate',
      Request.get,
      null,
      isLoading ?? false,
      {
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> saveRoleNotification({
    required String auth,
    bool? isLoading,
    required saveRoleNotificationJsonString,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'RoleAccess/SetRoleNotifications',
      Request.post,
      saveRoleNotificationJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> issueMrs({
    required String auth,
    bool? isLoading,
    required issuetoJsonString,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'MRS/MRSIssue',
      Request.post,
      issuetoJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> approveIssueMrs({
    required String auth,
    bool? isLoading,
    required issuemrsapprovetoJsonString,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'MRS/ApproveMRSIssue',
      Request.post,
      issuemrsapprovetoJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> rejectIssueMrs({
    required String auth,
    bool? isLoading,
    required rejectIssuetoJsonString,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'MRS/RejectMRSIssue',
      Request.post,
      rejectIssuetoJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> getReturnMrsList(
      {required String auth,
      bool? isLoading,
      int? facilityId,
      int? userId}) async {
    var responseModel = await apiWrapper.makeRequest(
      'MRS/GetMRSReturnList?facility_ID=$facilityId&emp_id=$userId',
      //  'MRS/getMRSList?facility_ID=$facilityId&emp_id=412&fromDate=2023-04-23&toDate=2023-07-7',
      Request.get,
      null,
      isLoading ?? false,
      {
        'Authorization': 'Bearer $auth',
        'Content-Type': 'application/json',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> scheduleLinkToPermit({
    required String auth,
    scheduleId,
    permitId,
    activity,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      // 'PMScheduleView/LinkPermitToPMTask?schedule_id=$scheduleId&permit_id=$permitId',

      'PMScheduleView/LinkPermitToPMTask?task_id=$scheduleId&permit_id=$permitId',
      Request.put,
      null,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    Get.dialog<void>(LinkToPermitDialog(
        data: parsedJson['message'],
        taskId: scheduleId,
        activity: activity //parsedJson['id']
        ));
    print('jcId2:${parsedJson['id']}');
    return responseModel;
  }

  Future<ResponseModel> setPmTask({
    required String auth,
    scheduleId,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      //  'PMScheduleView/SetPMTask?schedule_id=$scheduleId',

      'PMScheduleView/StartPMTask?task_id=$scheduleId',
      Request.post,
      null,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> createJobType({
    required String auth,
    bool? isLoading,
    required jobTypeJsonString,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Permit/CreateJobType',
      Request.post,
      jobTypeJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  ///Create Safety Measure
  Future<ResponseModel> createSafetyMeasure({
    required String auth,
    bool? isLoading,
    required safetyMeasurelistJsonString,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Permit/CreateSafetyMeasure',
      Request.post,
      safetyMeasurelistJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> approveReturnMrs({
    required String auth,
    bool? isLoading,
    required approvetoJsonString,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'MRS/ApproveMRSReturn',
      Request.post,
      approvetoJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> approveGoodsOrder({
    required String auth,
    goodsOrderApproveJsonString,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'RequestOrder/ApproveRequestOrder',
      Request.post,
      goodsOrderApproveJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    print('reqOrderApproveResponse: ${responseModel.data}');
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    Get.dialog<void>(ReqOrderMessageApproveDialog(
        data: parsedJson['message'], id: parsedJson['id']));

    return responseModel;
  }
  // Future<ResponseModel> approveGoodsOrder({
  //   required String auth,
  //   bool? isLoading,
  //   required approvetoJsonString,
  // }) async {
  //   var responseModel = await apiWrapper.makeRequest(
  //     'RequestOrder/ApproveRequestOrder',
  //     Request.post,
  //     approvetoJsonString,
  //     isLoading ?? false,
  //     {
  //       'Content-Type': 'application/json',
  //       'Authorization': 'Bearer $auth',
  //     },
  //   );

  //   return responseModel;
  // }

  Future<ResponseModel> approveGOReceive({
    required String auth,
    bool? isLoading,
    required approvetoJsonString,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'RequestOrder/ApproveRequestOrder',
      Request.post,
      approvetoJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> rejectGoodsOrder({
    required String auth,
    goodsOrderRejectJsonString,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'RequestOrder/RejectRequestOrder',
      Request.post,
      goodsOrderRejectJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    print('goodsOrderApproveResponse: ${responseModel.data}');
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    Get.dialog<void>(ReqOrderMessageRejectDialog(
        data: parsedJson['message'], id: parsedJson['id']));

    return responseModel;
  }
  // Future<ResponseModel> rejectGoodsOrder({
  //   required String auth,
  //   bool? isLoading,
  //   required rejecttoJsonString,
  // }) async {
  //   var responseModel = await apiWrapper.makeRequest(
  //     'RequestOrder/RejectGoodsOrder',
  //     Request.post,
  //     rejecttoJsonString,
  //     isLoading ?? false,
  //     {
  //       'Content-Type': 'application/json',
  //       'Authorization': 'Bearer $auth',
  //     },
  //   );

  //   return responseModel;
  // }

  Future<ResponseModel> deleteJobType({
    required String auth,
    bool? isLoading,
    required check_point_id,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Permit/DeleteJobType?id=$check_point_id',
      Request.delete,
      check_point_id,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> rejectRetrunMrs({
    required String auth,
    bool? isLoading,
    required rejecttoJsonString,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'MRS/RejectMRSReturn',
      Request.post,
      rejecttoJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> updateTbt({
    required String auth,
    bool? isLoading,
    required tbtJsonString,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Permit/UpdateJobType',
      Request.patch,
      tbtJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> getReturnMrsDetails({
    required String? auth,
    int? mrsId,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'MRS/getReturnDataByID?ID=$mrsId',
      Request.get,
      null,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> deleteSopType({
    required String auth,
    bool? isLoading,
    required check_point_id,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Permit/DeleteSOP?id=$check_point_id',
      Request.delete,
      check_point_id,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> updateSop({
    required String auth,
    bool? isLoading,
    required tbtJsonString,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Permit/UpdateSOP',
      Request.patch,
      tbtJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> getCmmsItemList({
    String? auth,
    bool? isLoading,
    int? facilityId,
    int? userId,
  }) async =>
      await apiWrapper.makeRequest(
        'SMReports/GetEmployeeStock?facility_id=$facilityId&Emp_ID=$userId',
        Request.get,
        null,
        isLoading ?? false,
        {
          'Authorization': 'Bearer $auth',
        },
      );
  Future<ResponseModel> createReturnMrs({
    required String auth,
    createReturnMrsJsonString,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'MRS/ReturnMRS',
      Request.post,
      createReturnMrsJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> importCheckpoint({
    required String auth,
    required String fileId,
    required bool isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'CheckList/ImportChecklistCheckpoint?file_id=$fileId',
      Request.post,
      null,
      true,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    var import = parsedJson[0]['import_log'];
    String logString = import.join('\n');

    Get.dialog<void>(
        ImportMsgDialog(data: parsedJson[0]['message'], importLog: logString));
    return responseModel;
  }

  Future<ResponseModel> importMaterial(
      {required String auth,
      required String fileId,
      required bool isLoading,
      required int facilityId}) async {
    var responseModel = await apiWrapper.makeRequest(
      'SMMaster/ImportMaterialFile?file_id=$fileId&facilityID=$facilityId',
      Request.post,
      null,
      true,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    var import = parsedJson['import_log'];
    // String logString = import.join('\n');
    Get.dialog<void>(
        ImportMsgDialog(data: parsedJson['message'], importLog: import));
    return responseModel;
  }

  Future<ResponseModel> importPlan({
    required String auth,
    required String fileId,
    required bool isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'PM/ImportPMPlanFile?file_id=$fileId',
      Request.post,
      null,
      true,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    var import = parsedJson['import_log'];
    String logString = import.join('\n');
    Get.dialog<void>(
        ImportMsgDialog(data: parsedJson['message'], importLog: logString));
    return responseModel;
  }

  Future<ResponseModel> importBusiness({
    required String auth,
    required String fileId,
    required bool isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'CheckList/ImportChecklistCheckpoint?file_id=$fileId',
      Request.post,
      null,
      true,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    var import = parsedJson['import_log'];
    String logString = import.join('\n');
    Get.dialog<void>(
        ImportMsgDialog(data: parsedJson['message'], importLog: logString));
    return responseModel;
  }

  Future<ResponseModel> getFaultyMaterialReportList(
      {required String auth,
      bool? isLoading,
      int? facilityId,
      dynamic startDate,
      dynamic endDate,
      int? userId}) async {
    var responseModel = await apiWrapper.makeRequest(
      //'SMReports/GetPlantStockReport?facility_id=$facilityId&StartDate=$endDate&EndDate=$startDate',
      'SMReports/GetFaultyMaterialReport?facility_id=45&StartDate=2020-01-01&EndDate=2023-08-30',
      Request.get,
      null,
      isLoading ?? false,
      {
        'Authorization': 'Bearer $auth',
        'Content-Type': 'application/json',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> getEmployeeStockReportList(
          {String? auth,
          bool? isLoading,
          int? facilityId,
          int? userId,
          dynamic startDate,
          dynamic endDate}) async =>
      await apiWrapper.makeRequest(
        'SMReports/GetStockReport?facility_id=$facilityId&actorTypeID=5&actorID=$userId&StartDate=$endDate&EndDate=$startDate&assetMasterIDs=',

        // 'SMReports/GetEmployeeStockReport?facility_id=${facilityId}&Emp_id=${userId}&StartDate=${endDate}&EndDate=${startDate}',
        Request.get,
        null,
        isLoading ?? false,
        {
          'Authorization': 'Bearer $auth',
        },
      );
  Future<ResponseModel> getPmPlanList(
      {required String auth,
      bool? isLoading,
      int? facilityId,
      dynamic startDate,
      dynamic endDate}) async {
    var responseModel = await apiWrapper.makeRequest(
      //   'PMScheduleView/GetPMTaskList?facility_id=${facilityId}&start_date=${endDate}&end_date=${startDate}',
      'PM/GetPMPlanList?facility_id=${facilityId}', Request.get,
      null,
      isLoading ?? true,
      {
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> ClosePMTaskExecution({
    required String auth,
    ClosePMTaskExecutionJsonString,
    bool? isLoading,
  }) async {
    // facilityId = 45;
    var responseModel = await apiWrapper.makeRequest(
      'PMScheduleView/ClosePMTaskExecution',
      Request.put,
      // {'comment': "$comment", 'id': id},
      ClosePMTaskExecutionJsonString,
      isLoading ?? true,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    // Get.dialog<void>(PermitMessageCloseDialog(data: parsedJson['message']));

    return responseModel;
  }

  Future<ResponseModel> assignToPmTask({
    required String auth,
    int? assignId,
    int? taskId,
    required bool isLoading,
  }) async {
    // facilityId = 45;
    var responseModel = await apiWrapper.makeRequest(
      'PMScheduleView/AssignPMTask?task_id=$taskId&assign_to=$assignId',
      Request.put,
      null,
      isLoading,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    Get.dialog<void>(PmTaskViewDialog(
      data: parsedJson['message'],
      taskId: taskId,
    ));
    return responseModel;
  }

  Future<ResponseModel> approvePmTaskExecution({
    required String auth,
    approvetoJsonString,
    bool? isLoading,
  }) async {
    // facilityId = 45;
    var responseModel = await apiWrapper.makeRequest(
      'PMScheduleView/ApprovePMTaskExecution',
      Request.put,
      // {'comment': "$comment", 'id': id},
      approvetoJsonString,
      isLoading ?? true,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    // Get.dialog<void>(PermitMessageCloseDialog(data: parsedJson['message']));

    return responseModel;
  }

  Future<ResponseModel> rejectPmTaskExecution({
    required String auth,
    rejecttoJsonString,
    bool? isLoading,
  }) async {
    // facilityId = 45;
    var responseModel = await apiWrapper.makeRequest(
      'PMScheduleView/RejectPMTaskExecution',
      Request.put,
      // {'comment': "$comment", 'id': id},
      rejecttoJsonString,
      isLoading ?? true,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    // Get.dialog<void>(PermitMessageCloseDialog(data: parsedJson['message']));

    return responseModel;
  }

  Future<ResponseModel> UpdatePMTaskExecution({
    required String auth,
    updatePMTaskExecutionJsonString,
    bool? isLoading,
  }) async {
    // facilityId = 45;
    var responseModel = await apiWrapper.makeRequest(
      //  'PMScheduleView/UpdatePMTaskExecution',
      'PMScheduleView/UpdatePMTaskExecution',
      Request.patch,
      updatePMTaskExecutionJsonString,
      isLoading ?? true,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    // Get.dialog<void>(PermitMessageCloseDialog(data: parsedJson['message']));

    return responseModel;
  }

  Future<ResponseModel> cloneSchedule(
      {required String auth,
      required int from_schedule_id,
      required int to_schedule_id,
      required int taskId,
      bool? isloading}) async {
    // facilityId = 45;
    var responseModel = await apiWrapper.makeRequest(
      'PMScheduleView/cloneSchedule?task_id=${taskId}&from_schedule_id=${to_schedule_id}&to_schedule_id=${from_schedule_id}',
      Request.patch,
      null,
      isloading ?? true,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    // Get.dialog<void>(PermitMessageCloseDialog(data: parsedJson['message']));

    return responseModel;
  }

  Future<ResponseModel> getAssetCategoryList(
      {required bool isLoading, required String auth}) async {
    ResponseModel responseModel = await apiWrapper.makeRequest(
      'SMMaster/GetAssetCategoryList',
      Request.getMultiparts,
      null,
      isLoading,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> getAssetTypeSMList(
      {required bool isLoading, required String auth, int? asset_id}) async {
    ResponseModel responseModel = await apiWrapper.makeRequest(
      'SMMaster/GetAssetTypeList',
      Request.getMultiparts,
      null,
      isLoading,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> getUnitMeasurementList(
      {required bool isLoading, required String auth, int? facilityId}) async {
    ResponseModel responseModel = await apiWrapper.makeRequest(
      'SMMaster/GetUnitMeasurementList',
      Request.getMultiparts,
      null,
      isLoading,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> createAssetSM({
    required String auth,
    bool? isLoading,
    required assetListJsonString,
  }) async {
    var responseModel =
        // responseModel =
        await apiWrapper.makeRequest(
      'SMMaster/AddAssetMaster', //AddBusiness
      Request.post,
      assetListJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> createAuditNumber({
    required String auth,
    bool? isLoading,
    required checkAuditJsonString,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'AuditPlan/CreateAuditPlan',
      Request.post,
      checkAuditJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> getAuditPlanList(
      {required String auth,
      bool? isLoading,
      int? facilityId,
      dynamic startDate,
      dynamic endDate}) async {
    var responseModel = await apiWrapper.makeRequest(
      // 'AuditPlan/GetAuditPlanList?facility_id=45&fromDate=2023-07-01&toDate=2023-10-21',
      'AuditPlan/GetAuditPlanList?facility_id=${facilityId}&fromDate=${endDate}&toDate=${startDate}',
      Request.get,
      null,
      isLoading ?? true,
      {
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

// <<<<<<< HEAD
  Future<ResponseModel> getGrievanceList({
    required String auth,
    bool? isLoading,
    int? facilityId,
    bool? self_view,
    int? userId,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Grievance/GetGrievanceList?facility_id=$facilityId&userId=$userId&self_view=$self_view',
      Request.get,
      null,
      isLoading ?? true,
      {
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> getAuditPlanDetails({
    required String? auth,
    int? auditPlanId,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'AuditPlan/GetAuditPlanByID?id=$auditPlanId',
      Request.get,
      null,
      isLoading ?? true,
      {
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> createBodyInjured({
    required String auth,
    bool? isLoading,
    required bodyInjuredJsonString,
  }) async {
    var responseModel =
        // responseModel =
        await apiWrapper.makeRequest(
      'MISMaster/CreateBodyParts', //AddBusiness
      Request.post,
      bodyInjuredJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> updateBodyInjured({
    required String auth,
    bool? isLoading,
    required bodyInjuredJsonString,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'MISMaster/UpdateBodyParts',
      Request.put,
      jsonEncode(bodyInjuredJsonString),
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> deleteBodyInjured({
    required String auth,
    bool? isLoading,
    required bodypart_id,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'MISMaster/DeleteBodyParts?id=$bodypart_id',
      Request.delete,
      bodypart_id,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> getBodyInjuredList(
      {required bool isLoading, required String auth}) async {
    ResponseModel responseModel = await apiWrapper.makeRequest(
      'MISMaster/GetBodyPartsList',
      Request.getMultiparts,
      null,
      isLoading,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> getVegetationPlanList({
    required bool isLoading,
    required String auth,
    int? facility_id,
  }) async {
    ResponseModel responseModel = await apiWrapper.makeRequest(
      'Vegetation/GetVegetationPlanList?facilityId=$facility_id',
      Request.getMultiparts,
      null,
      isLoading,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> createVegetationPlan({
    required String auth,
    createVegetationPlans,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Vegetation/CreateVegetationPlan',
      Request.post,
      createVegetationPlans,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    print('Create Vegetation Response:${responseModel.data}');
    var res = responseModel.data;
    var parsedJson = json.decode(res);

    return responseModel;
  }

  Future<ResponseModel> getVegEquipmentModelList({
    required bool isLoading,
    required String auth,
    int? facilityId,
  }) async {
    // var startDateParam = (start_date != null) ? 'start_date=$end_date&' : '';
    // var endDateParam = (end_date != '') ? 'end_date=$start_date' : '';
//var statusParam = (status!=null status!='')?'status=1':'';
    // var statusParam = 'status=1';
    ResponseModel responseModel = await apiWrapper.makeRequest(
      'Vegetation/GetVegEquipmentList?facilityId=$facilityId',
      // startDateParam +
      // endDateParam,
      Request.get,
      null,
      isLoading,
      {
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> getVegPlanDetail({
    required bool isLoading,
    required String auth,
    int? plan_id,
  }) async {
    ResponseModel responseModel = await apiWrapper.makeRequest(
      'Vegetation/GetVegetationPlanDetails?planId=$plan_id',
      Request.getMultiparts,
      null,
      isLoading,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> vegPlanApprovedButton({
    required String auth,
    vegApproveJsonString,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Vegetation/ApproveVegetationPlan',
      Request.put,
      vegApproveJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    print('vegApproveResponse: ${responseModel.data}');
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    Get.dialog<void>(VegPlanMessageApproveDialog(
        data: parsedJson['message'], id: parsedJson['id']));
    return responseModel;
  }

  Future<ResponseModel> vegPlanRejectButton({
    required String auth,
    vegRejectJsonString,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Vegetation/RejectVegetationPlan',
      Request.put,
      vegRejectJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    print('vegRejectResponse: ${responseModel.data}');
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    Get.dialog<void>(VegPlanMessageRejectDialog(
        data: parsedJson['message'], id: parsedJson['id']));
    return responseModel;
  }

  Future<ResponseModel> deleteUser({
    required String auth,
    bool? isLoading,
    required user_id,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'User/DeleteUser?id=$user_id',
      Request.delete,
      user_id,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> deletePmTask({
    required String auth,
    bool? isLoading,
    required task_id,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'PM/DeletePMTask',
      Request.post,
      {"id": int.tryParse(task_id)},
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> updateVegPlan({
    required String auth,
    updateVegPlans,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Vegetation/UpdateVegetationPlan',
      Request.post,
      updateVegPlans,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    print('Update MC Response:${responseModel.data}');
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    // if (res.e != null) {
    //   Get.dialog<void>(WarrantyClaimErrorDialog());
    // } else {

    Get.dialog<void>(VegPlanUpdatedMessageDialog(
      data: parsedJson['message'],
      warrantyClaimId: parsedJson['id'],
    ));

    return responseModel;
  }

  Future<ResponseModel> getVegTaskList({
    required bool isLoading,
    required String auth,
    int? facility_id,
  }) async {
    ResponseModel responseModel = await apiWrapper.makeRequest(
      'Vegetation/GetVegetationTaskList?facility_Id=$facility_id',
      Request.get,
      null,
      isLoading,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> getVegExecutionDetail({
    required String auth,
    bool? isLoading,
    int? executionId,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Vegetation/GetVegExecutionDetails?executionId=$executionId',
      Request.get,
      null,
      isLoading ?? false,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    print('MCExecutionResponseModel${responseModel.data}');
    return responseModel;
  }

  Future<ResponseModel> createIncidentRiskType({
    required String auth,
    bool? isLoading,
    required incidentRiskTypeJsonString,
  }) async {
    var responseModel =
        // responseModel =
        await apiWrapper.makeRequest(
      'MISMaster/CreateIncidentType', //Add Incident Type API
      Request.post,
      incidentRiskTypeJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> getIncidentRiskType(
      {required bool isLoading, required String auth, int? facility_id}) async {
    ResponseModel responseModel = await apiWrapper.makeRequest(
      'MISMaster/GetIncidentTypeList',
      Request.getMultiparts,
      null,
      isLoading,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> updateIncidentRiskType({
    required String auth,
    bool? isLoading,
    required incidentRiskTypeJsonString,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'MISMaster/UpdateIncidentType',
      Request.post,
      incidentRiskTypeJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> deleteIncidentRiskType({
    required String auth,
    bool? isLoading,
    required risktype_id,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'MISMaster/DeleteIncidentType?id=$risktype_id',
      Request.delete,
      risktype_id,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> startVegExecutionScheduleButton({
    required String auth,
    bool? isLoading,
    int? scheduleId,
  }) async {
    // facilityId = 45;
    var responseModel = await apiWrapper.makeRequest(
      'Vegetation/StartVegScheduleExecution?scheduleId=$scheduleId',
      Request.put,
      // {'comment': "$comment", 'id': id},
      null,
      isLoading ?? true,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    // print('StartExecutionResponse: ${responseModel.data}');
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    Get.dialog<void>(StartVegExecutionMessageDialog(
      data: parsedJson['message'],
      startVegId: parsedJson['id'],
    ));

    return responseModel;
  }

  Future<ResponseModel> endVegScheduleExecutionButton({
    required String auth,
    bool? isLoading,
    int? scheduleId,
  }) async {
    // facilityId = 45;
    var responseModel = await apiWrapper.makeRequest(
      'Vegetation/EndVegScheduleExecution?scheduleId=$scheduleId',
      Request.put,
      // {'comment': "$comment", 'id': id},
      null,
      isLoading ?? true,
      {
        'Authorization': 'Bearer $auth',
      },
    );
    // print('StartExecutionResponse: ${responseModel.data}');
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    Get.dialog<void>(EndVegScheduleExecutionMessageDialog(
      data: parsedJson['message'],
      endVegId: parsedJson['id'],
    ));

    return responseModel;
  }

  Future<ResponseModel> abandonVegExecutionButton({
    required String auth,
    abandoneJsonString,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'Cleaning/AbandonVegetationExecution',
      Request.put,
      abandoneJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    print('AbandonExecutionResponse: ${responseModel.data}');
    var res = responseModel.data;
    var parsedJson = json.decode(res);
    Get.dialog<void>(
        AbandonVegExecutionMessageDialog(data: parsedJson['message']));
    return responseModel;
  }

  Future<ResponseModel> createWorkType({
    required String auth,
    bool? isLoading,
    required worktypeJsonString,
  }) async {
    var responseModel =
        // responseModel =
        await apiWrapper.makeRequest(
      'JobWorkType/CreateJobWorkType', //AddBusiness
      Request.post,
      worktypeJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> createWorkTypeTool({
    required String auth,
    bool? isLoading,
    required worktypetoolJsonString,
  }) async {
    var responseModel =
        // responseModel =
        await apiWrapper.makeRequest(
      'JobWorkType/CreateMasterTool', //AddBusiness
      Request.post,
      worktypetoolJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> deleteWorkType({
    required String auth,
    bool? isLoading,
    required worktype_id,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'JobWorkType/DeleteJobWorkType?id=$worktype_id',
      Request.delete,
      worktype_id,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> updateWorkType({
    required String auth,
    bool? isLoading,
    required worktypeJsonString,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'JobWorkType/UpdateJobWorkType',
      Request.patch,
      worktypeJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }

  Future<ResponseModel> createToolType(
      {bool? isLoading, required String auth, String? tool_name}) async {
    ResponseModel responseModel = await apiWrapper.makeRequest(
      'JobWorkType/CreateMasterTool?tool_name=$tool_name',
      Request.post,
      null,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }
  Future<ResponseModel> createfreq({
    required String auth,
    bool? isLoading,
    required freqJsonString,
  }) async {
    var responseModel =
        // responseModel =
        await apiWrapper.makeRequest(
      'CMMS/CreateFrequencyList', //Addfrequency
      Request.post,
      freqJsonString,
      isLoading ?? false,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );
    return responseModel;
  }
}
