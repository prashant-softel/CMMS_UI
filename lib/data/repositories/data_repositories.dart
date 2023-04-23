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
    //return generateToken();
    throw UnimplementedError();
  }

  Future<String> getUserAccessData(String key) async {
    //return generateToken();
    throw UnimplementedError();
  }

  @override
  Future<String> getNewPermitAccessData(String key) async {
    //return generateToken();
    throw UnimplementedError();
  }

  /// Save data in secure storage
  @override
  void saveValueSecurely(String key, String value) {
    throw UnimplementedError();
  }

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
    String? categoryIds,
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
  Future<ResponseModel> getBusinessList({
    int? businessType,
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getBusinessList(
      isLoading: isLoading,
      auth: auth,
      businessType: businessType,
    );
  }

  @override
  Future<ResponseModel> getUnitCurrencyList({
    int? facilityId,
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getUnitCurrencyList(
      isLoading: isLoading,
      auth: auth,
      facilityId: facilityId,
    );
  }

  @override
  Future<ResponseModel> getEmployeeList({
    int? facility_id,
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getEmployeeList(
      isLoading: isLoading,
      auth: auth,
      facility_id: facility_id,
    );
  }

  @override
  Future<ResponseModel> getEmployeePermitList({
    int? facility_id,
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getEmployeePermitList(
      isLoading: isLoading,
      auth: auth,
      facility_id: facility_id,
    );
  }

  @override
  Future<ResponseModel> getPermitIssuerList({
    int? facility_id,
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getPermitIssuerList(
      isLoading: isLoading,
      auth: auth,
      facility_id: facility_id,
    );
  }

  @override
  Future<ResponseModel> getPermitApproverList({
    int? facility_id,
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getPermitApproverList(
      isLoading: isLoading,
      auth: auth,
      facility_id: facility_id,
    );
  }

  @override
  Future<ResponseModel> getJobTypePermitList({
    int? facility_id,
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getJobTypePermitList(
      isLoading: isLoading,
      auth: auth,
      facility_id: facility_id,
    );
  }

  @override
  Future<ResponseModel> getSopPermitList({
    int? job_type_id,
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getSopPermitList(
      isLoading: isLoading,
      auth: auth,
      job_type_id: job_type_id,
      businessType: businessType,
      blockId: blockId,
      categoryIds: categoryIds,
    );
  }

  @override
  Future<ResponseModel> getWarrantyClaimList({
    int? facilityId,
    int? blockId,
    required String categoryIds,
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getWarrantyClaimList(
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

  Future<ResponseModel> getNewPermitList({
    required String auth,
    int? facilityId,
    int? userId,
    bool? isLoading,
  }) async =>
      await connectHelper.getNewPermitList(
        auth: auth,
        facilityId: facilityId,
        // facilityId: facilityId ?? 0,
        // userId: 33,
        userId: userId,
        isLoading: isLoading ?? false,
      );

  Future<ResponseModel> getPermitIssueButton({
    required String auth,
    String? comment,
    int? employee_id,
    int? id,
    bool? isLoading,
  }) async =>
      await connectHelper.getPermitIssueButton(
        auth: auth,
        comment: comment,
        employee_id: employee_id,
        id: id,
        isLoading: isLoading ?? false,
      );

  //  @override
  // Future<ResponseModel> getNewPermitList({
  //   int? facilityId,
  //   required int? userId,
  //   // int? blockId,
  //   // required String categoryIds,
  //   required bool isLoading,
  //   required String auth,
  // }) async {
  //   return await connectHelper.getNewPermitList(
  //     isLoading: isLoading,
  //     auth: auth,
  //     facilityId: facilityId,
  //     userId: 33,
  //     // blockId: blockId,
  //     // categoryIds: categoryIds,
  //   );
  // }

  Future<ResponseModel> getInventoryDetailList({
    required String auth,
    // int? facilityId,
    int? id,
    bool? isLoading,
  }) async =>
      await connectHelper.getInventoryDetailList(
        auth: auth,
        // facilityId: 45,
        // facilityId: facilityId ?? 0,
        // userId: userId,
        id: id,
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
  Future<ResponseModel> getCheckPointlist({
    required String auth,
    int? selectedchecklistId,
    bool? isLoading,
  }) async =>
      await connectHelper.getCheckPointlist(
        auth: auth,
        selectedchecklistId: selectedchecklistId ?? 0,
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

   Future<ResponseModel> getInventoryIsolationList({
    String? auth,
    bool? isLoading,
    int? facilityId,
  }) async {
    return await connectHelper.getInventoryIsolationList(
      auth: auth,
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }

  Future<ResponseModel> getInventoryEquipmentNameList({
    int? facilityId,
    int? blockId,
    required String categoryIds,
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getInventoryEquipmentNameList(
       isLoading: isLoading,
      auth: auth,
      facilityId: facilityId,
      blockId: blockId,
      categoryIds: categoryIds,
    );
  }

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

  Future<ResponseModel> createCheckList({
    auth,
    bool? isLoading,
    checklistJsonString,
  }) async {
    var response = await connectHelper.createCheckList(
        auth: auth,
        isLoading: isLoading,
        checklistJsonString: checklistJsonString);
    return response;
  }

  Future<ResponseModel> createCheckpoint({
    auth,
    bool? isLoading,
    checkpointJsonString,
  }) async {
    var response = await connectHelper.createCheckpoint(
        auth: auth,
        isLoading: isLoading,
        checkpointJsonString: checkpointJsonString);
    return response;
  }

  Future<ResponseModel> createNewPermit({
    required String auth,
    newPermit,
    bool? isLoading,
  }) async =>
      await connectHelper.createNewPermit(
        auth: auth,
        newPermit: newPermit,
        isLoading: isLoading ?? false,
      );

  Future<ResponseModel> getHistory({
    String? auth,
    int? moduleType,
    int? id,
    bool? isLoading,
  }) async {
    return await connectHelper.getHistory(
      auth: auth,
      moduleType: moduleType,
      id: id,
      isLoading: isLoading,
    );
  }

  Future<ResponseModel> deleteCkeckpoint({
    auth,
    bool? isLoading,
    check_point_id,
  }) async {
    var response = await connectHelper.deleteCkeckpoint(
        auth: auth, isLoading: isLoading, check_point_id: check_point_id);
    return response;
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

  // Future<ResponseModel> getPreventiveCheckList({
  //   required String auth,
  //   int? facilityId,
  //   int? type,
  //   bool? isLoading,
  // }) async =>
  //     await connectHelper.getPreventiveCheckList(
  //       auth: auth,
  //       facilityId: facilityId ?? 0,
  //       type: type,
  //       isLoading: isLoading ?? false,
  //     );

  // Future<ResponseModel> getCheckPointlist({
  //   required String auth,
  //   int? selectedchecklistId,
  //   bool? isLoading,
  // }) async =>
  //     await connectHelper.getCheckPointlist(
  //       auth: auth,
  //       selectedchecklistId: selectedchecklistId ?? 0,
  //       isLoading: isLoading ?? false,
  //     );

  Future<ResponseModel> getTypePermitList({
    String? auth,
    bool? isLoading,
  }) async =>
      await connectHelper.getTypePermitList(
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

  Future<ResponseModel> getFrequencyList({
    String? auth,
    bool? isLoading,
  }) async {
    return await connectHelper.getFrequencyList(
      auth: auth,
      isLoading: isLoading,
    );
  }

  Future<ResponseModel> getPmMappingList({
    required String auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await connectHelper.getPmMappingList(
        auth: auth,
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );
  Future<ResponseModel> savePmMapping({
    required String auth,
    pmJsonString,
    bool? isLoading,
  }) async =>
      await connectHelper.savePmMapping(
        auth: auth,
        pmJsonString: pmJsonString,
        isLoading: isLoading ?? false,
      );
  Future<ResponseModel> getCalibrationList({
    required String auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await connectHelper.getCalibrationList(
        auth: auth,
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );
  Future<ResponseModel> StartCalibration({
    auth,
    bool? isLoading,
    startcalibration,
  }) async {
    var response = await connectHelper.StartCalibration(
        auth: auth, isLoading: isLoading, startcalibration: startcalibration);
    return response;
  }

  Future<ResponseModel> getPMScheduleData({
    required String auth,
    int? facilityId,
    int? selectedEquipmentId,
    bool? isLoading,
  }) async =>
      await connectHelper.getPMScheduleData(
        auth: auth,
        facilityId: facilityId ?? 0,
        selectedEquipmentId: selectedEquipmentId,
        isLoading: isLoading ?? false,
      );

  ///
}
