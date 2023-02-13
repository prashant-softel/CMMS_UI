// coverage:ignore-file
import 'package:cmms/data/data.dart';
import 'package:cmms/domain/domain.dart';

import 'package:get/get.dart';

/// The helper class which will connect to the world to get the data.
class ConnectHelper {
  ConnectHelper() {
    _init();
  }
  String token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiJLaHVzaHJ1Lm1pc3RyeUBzb2Z0ZWwuY29tIiwibmJmIjoxNjc1NjY4NjUzLCJleHAiOjE2NzU2NzA0NTMsImlhdCI6MTY3NTY2ODY1M30.lV9fU4PiidsMcfbn9gw3DngH4Iiv97tUxuWDJrYbPQA';

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

  Future<ResponseModel> generateToken() async {
    var response = await apiWrapper.makeRequest(
      'Token/Authenticate',
      Request.postMultiparts,
      {
        'user_name': 'khushru.mistry@softel.com',
        'password': '/bS4BMO+fOLSPh0oK2qP0A=='
      },
      true,
      {
        'Content-Type': 'application/json',
      },
    );

    // print('Response Authenticate ${response.data}');

    return response;
  }

  Future<ResponseModel> getInventoryList({
    required bool isLoading,
    required String auth,
    required int facilityId,
    required int categoryId,
  }) async {
    var response = await apiWrapper.makeRequest(
      'Inventory/GetInventoryList?facilityId=$facilityId&categoryId=$categoryId',
      Request.getMultiparts,
      null,
      isLoading,
      {
        'Authorization': 'Bearer $auth',
      },
    );

    // print('Response ${response.data}');

    return response;
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
    var responseModel = await apiWrapper.makeRequest(
      'Job/GetJobList?facility_id=$facilityId&userId=$userId',
      Request.get,
      null,
      isLoading ?? true,
      {
        //'Content-Type': 'application/json',
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
    //jobId = 3158;
    var responseModel = await apiWrapper.makeRequest(
      'Job/GetJobDetail?job_id=$jobId',
      Request.get,
      null,
      isLoading ?? true,
      {
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  Future<ResponseModel> getFacilityList() async {
    var responseModel = await apiWrapper.makeRequest(
      'CMMS/GetFacilityList',
      Request.get,
      null,
      true,
      {
        //'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    return responseModel;
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
      'CMMS/GetEmployeeList?facilityId=$facilityId',
      Request.get,
      null,
      isLoading ?? true,
      {
        'Authorization': 'Bearer $auth',
      },
    );

    return responseModel;
  }

  ///
}
