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

  @override
  Future<String> getUserAccessData(String key) async {
    throw UnimplementedError();
  }

  /// Save data in secure storage
  @override
  void saveValueSecurely(String key, String value) {
    throw UnimplementedError();
  }

  @override
  void saveUserAcessData(String key, String value) {
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
  Future<ResponseModel> generateToken({
    auth,
    bool? isLoading,
  }) async {
    var response =
        await connectHelper.generateToken(auth: auth, isLoading: isLoading);
    return response;
  }

  @override
  Future<ResponseModel> getInventoryList({
    int? facilityId,
    int? blockId,
    required String categoryIds,
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getInventoryList(
      isLoading: isLoading,
      auth: auth,
      facilityId: facilityId,
      blockId: blockId,
      categoryIds: categoryIds,
    );
  }

  @override
  Future<ResponseModel> getWorkTypeList({
    String? categoryIds,
    bool? isLoading,
    String? auth,
  }) async {
    return await connectHelper.getWorkTypeList(
      isLoading: isLoading,
      auth: auth,
      categoryIds: categoryIds,
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
  Future<ResponseModel> getPreventiveCheckList({
    required String auth,
    int? facilityId,
    int? type,
    bool? isLoading,
  }) async =>
      await connectHelper.getPreventiveCheckList(
        auth: auth,
        facilityId: facilityId ?? 0,
        type: type,
        isLoading: isLoading ?? false,
      );
  Future<ResponseModel> getFacilityList({
    String? auth,
    bool? isLoading,
  }) async =>
      await connectHelper.getFacilityList(
        auth: auth,
        isLoading: isLoading,
      );
  Future<ResponseModel> getUserAccessList({
    required String auth,
    String? userId,
    bool? isLoading,
  }) async =>
      await connectHelper.getUserAccessList(
        auth: auth,
        userId: userId,
        isLoading: isLoading ?? false,
      );

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

  Future<ResponseModel> getInventoryCategoryList({
    String? auth,
    bool? isLoading,
    int? facilityId,
  }) async {
    return await connectHelper.getInventoryCategoryList(
      auth: auth,
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }

  Future<ResponseModel> getFrequencyList({
    String? auth,
    bool? isLoading,
  }) async {
    return await connectHelper.getFrequencyList(
      auth: auth,
      isLoading: isLoading,
    );
  }

  ///
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
        isLoading: isLoading,
      );

  ///
  Future<ResponseModel> getAssignedToList({
    required String auth,
    int? facilityId,
    int? userId,
    bool? isLoading,
  }) async =>
      await connectHelper.getAssignedToList(
        auth: auth,
        facilityId: facilityId,
        userId: userId,
        isLoading: isLoading,
      );

  ///
  Future<ResponseModel> getToolsRequiredToWorkTypeList({
    required String auth,
    String? workTypeIds,
    bool? isLoading,
  }) async =>
      await connectHelper.getToolsRequiredToWorkTypeList(
        auth: auth,
        workTypeIds: workTypeIds,
        isLoading: isLoading ?? false,
      );

  ///
  Future<ResponseModel> saveJob({
    required String auth,
    job,
    bool? isLoading,
  }) async =>
      await connectHelper.saveJob(
        auth: auth,
        job: job,
        isLoading: isLoading ?? false,
      );

  ///
  Future<ResponseModel> createJobCard({
    String? auth,
    jobId,
    bool? isLoading,
  }) async =>
      await connectHelper.createJobCard(
        auth: auth,
        jobId: jobId,
        isLoading: isLoading ?? false,
      );

  ///
  Future<ResponseModel> createCheckList({
    auth,
    bool? isLoading,
  }) async {
    var response =
        await connectHelper.createCheckList(auth: auth, isLoading: isLoading);
    return response;
  }

  ///
  Future<ResponseModel> uploadFiles({
    required String auth,
    fileUploadModel,
    bool? isLoading,
  }) async =>
      await connectHelper.uploadFiles(
        auth: auth,
        fileUploadModel: fileUploadModel,
        isLoading: isLoading ?? false,
      );

  Future<ResponseModel> getJobCardDetails({
    String? auth,
    int? jobCardId,
    bool? isLoading,
  }) async {
    return await connectHelper.getJobCardDetails(
      auth: auth,
      jobCardId: jobCardId,
      isLoading: isLoading,
    );
  }

  Future<ResponseModel> getPermitDetails({
    String? auth,
    int? permitId,
    bool? isLoading,
  }) async {
    return await connectHelper.getPermitDetails(
      auth: auth,
      permitId: permitId,
      isLoading: isLoading,
    );
  }

  Future<ResponseModel> getJobCardHistory({
    String? auth,
    int? jobCardId,
    int? moduleType,
    bool? isLoading,
  }) async {
    return await connectHelper.getJobCardHistory(
      auth: auth,
      moduleType: moduleType,
      jobCardId: jobCardId,
      isLoading: isLoading,
    );
  }

  Future<ResponseModel> updateJobCard({
    String? auth,
    jobCard,
    bool? isLoading,
  }) async {
    return await connectHelper.updateJobCard(
      auth: auth,
      jobCard: jobCard,
      isLoading: isLoading,
    );
  }

  Future<ResponseModel> approveJobCard({
    String? auth,
    jobCardId,
    comment,
    bool? isLoading,
  }) async {
    return await connectHelper.approveJobCard(
      auth: auth,
      jobCardId: jobCardId,
      isLoading: isLoading,
    );
  }

  Future<ResponseModel> rejectJobCard({
    String? auth,
    jobCardId,
    comment,
    bool? isLoading,
  }) async {
    return await connectHelper.rejectJobCard(
      auth: auth,
      jobCardId: jobCardId,
      isLoading: isLoading,
    );
  }

  ///
}
