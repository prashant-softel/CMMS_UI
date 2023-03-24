// coverage:ignore-file

import 'package:cmms/data/data.dart';
import 'package:cmms/domain/domain.dart';

import 'package:get/get.dart';

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
    required String categoryIds,
  }) async {
    var blockIdParam = (blockId != null) ? 'linkedToBlockId=$blockId&' : '';
    var categoryIdsParam =
        (categoryIds != '') ? 'categoryIds=$categoryIds&' : '';
//var statusParam = (status!=null status!='')?'status=1':'';
    var statusParam = 'status=1';
    ResponseModel responseModel = await apiWrapper.makeRequest(
      'Inventory/GetInventoryList?' +
          blockIdParam +
          categoryIdsParam +
          statusParam,
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
    int? userId,
  }) async {
    // facilityId = 45;
    var responseModel = await apiWrapper.makeRequest(
      'Job/GetJobList?facility_id=$facilityId&userId=$userId',
      Request.get,
      null,
      isLoading ?? true,
      {
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> getPreventiveCheckList({
    required String auth,
    bool? isLoading,
    int? facilityId,
    int? type,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'CheckList/GetCheckList?facility_id=$facilityId&type=$type',
      Request.get,
      null,
      isLoading ?? true,
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
      isLoading ?? true,
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
    try {
      response = await apiWrapper.makeRequest(
        'CMMS/GetFacilityList',
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

    Future<ResponseModel> getTypePermitList({
    String? auth,
    bool? isLoading,
  }) async {
    ResponseModel response = ResponseModel(data: '', hasError: true);
    print('PermitTypeResponse: $response');
    try {
      response = await apiWrapper.makeRequest(
        'Permit/GetPermitTypeList?facility_id=50',
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
        isLoading ?? true,
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
        isLoading ?? true,
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
      isLoading ?? true,
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
      isLoading ?? true,
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
    var responseModel = await apiWrapper.makeRequest(
      'JobWorkType/GetMasterToolList?worktypeIds=$workTypeIds',
      Request.get,
      null,
      isLoading ?? true,
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
      'Job/CreateNewJob?job=$job',
      Request.post,
      job,
      isLoading ?? true,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

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
      isLoading ?? true,
      {
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> createCheckList({
    required String auth,
    bool? isLoading,
  }) async {
    var responseModel = await apiWrapper.makeRequest(
      'CheckList/CreateCheckList',
      Request.post,
      [
        {
          "checklist_number": "IV _Test Check List 005",
          "type": 1,
          "facility_id": 45,
          "category_id": 2,
          "frequency_id": 2,
          "manPower": 16,
          "duration": 2,
          "status": 1
        }
      ],
      isLoading ?? true,
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }
}
