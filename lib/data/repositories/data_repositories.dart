import 'package:cmms/data/data.dart';
import 'package:cmms/domain/domain.dart';

/// Repositories (retrieve data, heavy processing etc..)
class DataRepository extends DomainRepository {
  /// [connectHelper] : A connection helper which will connect to the
  /// remote to get the data.
  DataRepository(this.connectHelper);

  final ConnectHelper connectHelper;

  @override
  void clearData(dynamic key) {
    throw UnimplementedError();
  }

  /// Delete the box
  @override
  void deleteBox() {
    throw UnimplementedError();
  }

  /// returns stored string value
  @override
  String getStringValue(String key) {
    throw UnimplementedError();
  }

  /// store the data
  @override
  void saveValue(dynamic key, dynamic value) {
    throw UnimplementedError();
  }

  /// return bool value
  @override
  bool getBoolValue(String key) => throw UnimplementedError();

  /// Get data from secure storage
  @override
  Future<String> getSecuredValue(String key) async {
    throw UnimplementedError();
  }

  /// Save data in secure storage
  @override
  void saveValueSecurely(String key, String value) {
    throw UnimplementedError();
  }

  /// Delete data from secure storage
  @override
  void deleteSecuredValue(String key) {
    throw UnimplementedError();
  }

  /// Delete all data from secure storage
  @override
  void deleteAllSecuredValues() {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> getStateList(int countryCode) async =>
      await connectHelper.getStateList(countryCode);

  @override
  Future<ResponseModel> generateToken() async {
    return await connectHelper.generateToken();
  }

  @override
  Future<ResponseModel> getInventoryList({
    required int facilityId,
    required int categoryId,
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getInventoryList(
      isLoading: isLoading,
      auth: auth,
      facilityId: facilityId,
      categoryId: categoryId,
    );
  }

  @override
  Future<ResponseModel> getBlockList({
    required bool isLoading,
    required String facilityId,
    required String auth,
  }) async {
    return await connectHelper.getBlockList(
      isLoading: isLoading,
      facilityId: facilityId,
      auth: auth,
    );
  }

  @override
  Future<ResponseModel> getEquipmentList(
          {required bool isLoading,
          required String facilityId,
          required String auth}) async =>
      await connectHelper.getEquipmentList(
        isLoading: isLoading,
        facilityId: facilityId,
        auth: auth,
      );

  Future<ResponseModel> getJobList({
    required String auth,
    int? facilityId,
    int? userId,
    bool? isLoading,
  }) async =>
      await connectHelper.getJobList(
        auth: auth,
        facilityId: facilityId ?? 0,
        userId: userId,
        isLoading: isLoading ?? false,
      );

  Future<ResponseModel> getFacilityList() async =>
      await connectHelper.getFacilityList();

  Future<ResponseModel> getBlocksList({
    String? auth,
    bool? isLoading,
    int? facilityId,
  }) async {
    return await connectHelper.getBlocksList(
      auth: auth,
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }

  // Future<ResponseModel> getInventoryCategoryList({
  //   String? auth,
  //   bool? isLoading,
  //   int? facilityId,
  // }) async {
  //   return await connectHelper.getInventoryCategoryList(
  //     auth: auth,
  //     isLoading: isLoading,
  //     facilityId: facilityId,
  //   );
  // }

  Future<ResponseModel> getJobDetails({
    required String auth,
    int? jobId,
    int? userId,
    bool? isLoading,
  }) async =>
      await connectHelper.getJobDetails(
        auth: auth,
        jobId: jobId ?? 0,
        userId: userId,
        isLoading: isLoading ?? false,
      );

  Future<ResponseModel> getAssignedToList({
    required String auth,
    int? facilityId,
    int? userId,
    bool? isLoading,
  }) async =>
      await connectHelper.getAssignedToList(
        auth: auth,
        facilityId: facilityId ?? 0,
        userId: userId,
        isLoading: isLoading ?? false,
      );

  @override
  Future<ResponseModel> getInventoryTypeList({
    required int facilityId,
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getInventoryTypeList(
      isLoading: isLoading,
      auth: auth,
      facilityId: facilityId,
    );
  }

  @override
  Future<ResponseModel> getInventoryCategoryList({
    required int facilityId,
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getInventoryCategoryList(
      isLoading: isLoading,
      auth: auth,
      facilityId: facilityId,
    );
  }

  @override
  Future<ResponseModel> getInventoryStatusList({
    required int facilityId,
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getInventoryStatusList(
      isLoading: isLoading,
      auth: auth,
      facilityId: facilityId,
    );
  }

  @override
  Future<ResponseModel> getBusinessList(
      {required int businessType,
      required bool isLoading,
      required String auth}) async {
    return await connectHelper.getBusinessList(
      isLoading: isLoading,
      auth: auth,
      businessType: businessType,
    );
  }

  Future<ResponseModel> addInventory({
    required bool isLoading,
    required String auth,
    required AddInventoryRequestModel requestBody,
  }) async {
    var response = await connectHelper.addInventory(
      isLoading: isLoading,
      auth: auth,
      requestBody: requestBody,
    );
    print('Response add inventory ${response.data}');
    return response;
  }

  Future<ResponseModel> inventoryDetails({
    required int inventoryId,
    required bool isLoading,
    required String auth,
  }) async {
    var response = await connectHelper.inventoryDetails(
      isLoading: isLoading,
      auth: auth,
      id: inventoryId,
    );
    // print('Response add inventory ${response.data}');
    return response;
  }

  
  Future<ResponseModel> updateInventory({
    required bool isLoading,
    required String auth,
    required AddInventoryRequestModel requestBody,
  }) async {
    var response = await connectHelper.updateInventory(
      isLoading: isLoading,
      auth: auth,
      requestBody: requestBody,
    );
    // print('Response add inventory ${response.data}');
    return response;
  }


  ///
}
