import 'dart:math';
import 'dart:typed_data';

import 'package:cmms/data/data.dart';
import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/add_inventory_model.dart';
import 'package:cmms/domain/models/create_sop_model.dart';
import 'package:cmms/domain/models/update_pm_task_execution_model.dart';

import '../../domain/models/add_user_model.dart';

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
  Future<ResponseModel> getAffectedPartList({
    int? facilityId,
    int? blockId,
    String? categoryIds,
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getAffectedPartList(
      isLoading: isLoading,
      auth: auth,
      facilityId: facilityId,
      // blockId: blockId,
      // categoryIds: categoryIds,
    );
  }

  @override
  Future<ResponseModel> getBusinessList({
    int? businessType,
    required bool isLoading,
    required int facilityId,
    required String auth,
  }) async {
    return await connectHelper.getBusinessList(
        isLoading: isLoading,
        auth: auth,
        businessType: businessType,
        facilityId: facilityId);
  }

  Future<ResponseModel> getBodyInjuredData({
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getBodyInjuredData(
      isLoading: isLoading,
      auth: auth,
    );
  }

  Future<ResponseModel> getmanufacturerList({
    int? BusinessType,
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getmanufacturerList(
      isLoading: isLoading,
      auth: auth,
      BusinessType: BusinessType,
    );
  }

  Future<ResponseModel> getSupplierList({
    int? BusinessType,
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getSupplierList(
      isLoading: isLoading,
      auth: auth,
      BusinessType: BusinessType,
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

  Future<ResponseModel> getStatutoryComplianceDropDown({
    int? facilityId,
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getStatutoryComplianceDropDown(
      isLoading: isLoading,
      auth: auth,
      facilityId: facilityId,
    );
  }

  Future<ResponseModel> statusOfAplication({
    int? facilityId,
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.statusOfAplication(
      isLoading: isLoading,
      auth: auth,
      facilityId: facilityId,
    );
  }

  Future<ResponseModel> getTypeOfWaterList({
    int? facilityId,
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getTypeOfWaterList(
      isLoading: isLoading,
      auth: auth,
      facilityId: facilityId,
    );
  }

  Future<ResponseModel> getTypeOfWasteList({
    int? facilityId,
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getTypeOfWasteList(
      isLoading: isLoading,
      auth: auth,
      facilityId: facilityId,
    );
  }

  Future<ResponseModel> getWaterTypeById({
    String? auth,
    int? waterTypeId,
    bool? isLoading,
  }) async =>
      await connectHelper.getWaterTypeById(
        auth: auth,
        waterTypeId: waterTypeId,
        isLoading: isLoading,
      );

  Future<ResponseModel> createWaterType({
    auth,
    waterTypeJson,
    bool? isLoading,
  }) async {
    var response = await connectHelper.createWaterType(
      auth: auth,
      waterTypeJson: waterTypeJson,
      isLoading: isLoading,
    );
    return response;
  }

  Future<ResponseModel> updateWaterType({
    auth,
    waterTypeJson,
    bool? isLoading,
  }) async {
    var response = await connectHelper.updateWaterType(
      auth: auth,
      waterTypeJson: waterTypeJson,
      isLoading: isLoading,
    );
    return response;
  }

  Future<ResponseModel> deleteWaterType({
    auth,
    int? waterTypeId,
    bool? isLoading,
  }) async {
    var response = await connectHelper.deleteWaterType(
      auth: auth,
      waterTypeId: waterTypeId,
      isLoading: isLoading,
    );
    return response;
  }

  Future<ResponseModel> updatePaidBy({
    int? facilityId,
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.updatePaidBy(
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
  Future<ResponseModel> getRiskTypeList({
    int? facility_id,
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getRiskTypeList(
      isLoading: isLoading,
      auth: auth,
      facility_id: facility_id,
    );
  }

  @override
  Future<ResponseModel> getEmployeesList({
    int? facility_id,
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getEmployeesList(
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

  Future<ResponseModel> getEmployeeListByFacilityId({
    int? facility_id,
    bool? isLoading,
    required String auth,
  }) async {
    return await connectHelper.getEmployeeListByFacilityId(
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
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getJobTypePermitList(
      isLoading: isLoading,
      auth: auth,
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
      // businessType: businessType,
      // blockId: blockId,
      // categoryIds: categoryIds,
    );
  }

  @override
  Future<ResponseModel> getAssetTypeList({
    int? job_type_id,
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getAssetTypeList(
      isLoading: isLoading,
      auth: auth,
      job_type_id: job_type_id,
      // businessType: businessType,
      // blockId: blockId,
      // categoryIds: categoryIds,
    );
  }

  Future<ResponseModel> getFacilityTypeList({
    int? job_type_id,
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getFacilityTypeList(
      isLoading: isLoading,
      auth: auth,
      // job_type_id: job_type_id,
      // businessType: businessType,
      // blockId: blockId,
      // categoryIds: categoryIds,
    );
  }

  Future<ResponseModel> getSPVList({
    int? job_type_id,
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getSPVList(
      isLoading: isLoading,
      auth: auth,
      job_type_id: job_type_id,
      // businessType: businessType,
      // blockId: blockId,
      // categoryIds: categoryIds,
    );
  }

  Future<ResponseModel> getBlockTypeList({
    int? job_type_id,
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getBlockTypeList(
      isLoading: isLoading,
      auth: auth,
      job_type_id: job_type_id,
      // businessType: businessType,
      // blockId: blockId,
      // categoryIds: categoryIds,
    );
  }

  @override
  Future<ResponseModel> getSafetyMeasureList({
    int? permit_type_id,
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getSafetyMeasureList(
      isLoading: isLoading,
      auth: auth,
      permit_type_id: permit_type_id,
      // businessType: businessType,
      // blockId: blockId,
      // categoryIds: categoryIds,
    );
  }

  @override
  Future<ResponseModel> getPermitConditionList({
    int? isCancle,
    required int facilityId,
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getPermitConditionList(
        isLoading: isLoading,
        auth: auth,
        isCancle: isCancle,
        facilityId: facilityId);
  }

  @override
  Future<ResponseModel> getPermitCloseConditionList({
    int? isClose,
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getPermitCloseConditionList(
      isLoading: isLoading,
      auth: auth,
      isClose: isClose,
    );
  }

  @override
  Future<ResponseModel> getPermitExtendConditionList({
    int? isExtend,
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getPermitExtendConditionList(
      isLoading: isLoading,
      auth: auth,
      isExtend: isExtend,
    );
  }

  @override
  Future<ResponseModel> getWarrantyClaimList({
    int? facilityId,
    int? blockId,
    required String categoryIds,
    required bool isLoading,
    String? start_date,
    required String end_date,
    required String auth,
  }) async {
    return await connectHelper.getWarrantyClaimList(
      isLoading: isLoading,
      auth: auth,
      facilityId: facilityId,
      blockId: blockId,
      categoryIds: categoryIds,
      start_date: start_date,
      end_date: end_date,
    );
  }

  ///Incident Report List
  @override
  Future<ResponseModel> getIncidentReportList({
    int? facility_id,
    String? start_date,
    required String end_date,
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getIncidentReportList(
      isLoading: isLoading,
      auth: auth,
      facility_id: facility_id,
      start_date: start_date,
      end_date: end_date,
    );
  }

  //getHealthDatalist
  @override
  Future<ResponseModel> getHealthDatalist({
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getHealthDatalist(
      isLoading: isLoading,
      auth: auth,
    );
  }

  //getFuelConsumption
  @override
  Future<ResponseModel> getFuelConsumption({
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getFuelConsumption(
      isLoading: isLoading,
      auth: auth,
    );
  }

  //getkaizensdata
  @override
  Future<ResponseModel> getkaizensdata({
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getkaizensdata(
      isLoading: isLoading,
      auth: auth,
    );
  }

//getplantationdata
  @override
  Future<ResponseModel> getplantationdata({
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getplantationdata(
      isLoading: isLoading,
      auth: auth,
    );
  }

// getVisitsAndNoticesDatalist
  @override
  Future<ResponseModel> getVisitsAndNoticesDatalist({
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getVisitsAndNoticesDatalist(
      isLoading: isLoading,
      auth: auth,
    );
  }

  @override
  Future<ResponseModel> getInventoryAssetsList({
    int? facility_id,
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getInventoryAssetsList(
      isLoading: isLoading,
      auth: auth,
      facility_id: facility_id,
    );
  }

  @override
  Future<ResponseModel> getEquipmentModelList({
    int? facilityId,
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getEquipmentModelList(
      isLoading: isLoading,
      auth: auth,
      facilityId: facilityId,
    );
  }

  Future<ResponseModel> getMCTaskEquipmentList({
    int? taskId,
    required bool isLoading,
    required int facilityId,
    required String auth,
  }) async {
    return await connectHelper.getMCTaskEquipmentList(
        isLoading: isLoading,
        auth: auth,
        taskId: taskId,
        facilityId: facilityId);
  }

  ///Module Cleaning Task List
  @override
  Future<ResponseModel> getMCTaskList({
    int? facility_id,
    required bool isLoading,
    required String auth,
    String? start_date,
    required String end_date,
  }) async {
    return await connectHelper.getMCTaskList(
      isLoading: isLoading,
      auth: auth,
      facility_id: facility_id,
      start_date: start_date,
      end_date: end_date,
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
    bool? self_view,
    bool? isLoading,
  }) async =>
      await connectHelper.getJobList(
        auth: auth,
        facilityId: facilityId ?? 0,
        userId: userId,
        self_view: self_view,
        isLoading: isLoading ?? false,
      );
  Future<ResponseModel> getGoodsOrdersList({
    int? facility_id,
    String? start_date,
    required String end_date,
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getGoodsOrdersList(
      isLoading: isLoading,
      auth: auth,
      facility_id: facility_id,
      start_date: start_date,
      end_date: end_date,
    );
  }

  Future<ResponseModel> getStatutoryDataList({
    int? facility_id,
    String? start_date,
    String? end_date,
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getStatutoryDataList(
      isLoading: isLoading,
      auth: auth,
      facility_id: facility_id,
      start_date: start_date,
      end_date: end_date,
    );
  }

  Future<ResponseModel> getObservationDataList({
    int? facility_id,
    String? start_date,
    String? end_date,
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getObservationDataList(
      isLoading: isLoading,
      auth: auth,
      facility_id: facility_id,
      start_date: start_date,
      end_date: end_date,
    );
  }

  Future<ResponseModel> getWaterDataList({
    int? facility_id,
    String? start_date,
    required String end_date,
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getWaterDataList(
      isLoading: isLoading,
      auth: auth,
      facility_id: facility_id,
      start_date: start_date,
      end_date: end_date,
    );
  }

  Future<ResponseModel> transactionReport({
    int? actorID,
    int? actorType,
    int? facility_id,
    String? start_date,
    required String end_date,
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.transactionReport(
      isLoading: isLoading,
      auth: auth,
      facility_id: facility_id,
      start_date: start_date,
      end_date: end_date,
      actorID: actorID,
      actorType: actorType,
    );
  }

  Future<ResponseModel> getRequestOrderList({
    int? facility_id,
    String? start_date,
    required String end_date,
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getRequestOrderList(
      isLoading: isLoading,
      auth: auth,
      facility_id: facility_id,
      start_date: start_date,
      end_date: end_date,
    );
  }

  Future<ResponseModel> getDocUploadList({
    int? facility_id,
    String? start_date,
    required String end_date,
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getDocUploadList(
      isLoading: isLoading,
      auth: auth,
      facility_id: facility_id,
      start_date: start_date,
      end_date: end_date,
    );
  }

  Future<ResponseModel> getModuleCleaningListPlan({
    int? facility_id,
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getModuleCleaningListPlan(
      isLoading: isLoading,
      auth: auth,
      facility_id: facility_id,
    );
  }

  Future<ResponseModel> getwcCertifiacteList({
    int? facility_id,
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getwcCertifiacteList(
      isLoading: isLoading,
      auth: auth,
      facility_id: facility_id,
    );
  }

  Future<ResponseModel> getNewPermitList({
    required String auth,
    int? facilityId,
    int? userId,
    bool? isLoading,
    bool? self_view,
    bool? non_expired,
    String? start_date,
    required String end_date,
  }) async =>
      await connectHelper.getNewPermitList(
        auth: auth,
        facilityId: facilityId,
        // facilityId: facilityId ?? 0,
        // userId: 33,
        self_view: self_view,
        non_expired: non_expired,
        start_date: start_date,
        end_date: end_date,
        userId: userId,
        isLoading: isLoading ?? false,
      );

  Future<ResponseModel> permitIssueButton({
    required String auth,
    String? comment,
    String? id,
    bool? isLoading,
  }) async =>
      await connectHelper.permitIssueButton(
        auth: auth,
        comment: comment,
        id: id,
        isLoading: isLoading ?? false,
      );

  Future<ResponseModel> permitApprovedButton({
    required String auth,
    rejectCancelPermitJsonString,
    String? ptwStatus,
    int? jobId,
    bool? isLoading,
  }) async =>
      await connectHelper.permitApprovedButton(
        auth: auth,
        rejectCancelPermitJsonString: rejectCancelPermitJsonString,
        ptwStatus: ptwStatus,
        jobId: jobId,
        isLoading: isLoading ?? false,
      );

  // Future<ResponseModel> permitApprovedButton({
  //   required String auth,
  //   String? comment,
  //   String? id,
  //   String? ptwStatus,
  //   int? jobId,
  //   bool? isLoading,
  // }) async =>
  //     await connectHelper.permitApprovedButton(
  //       auth: auth,
  //       comment: comment,
  //       id: id,
  //       ptwStatus: ptwStatus,
  //       jobId: jobId,
  //       isLoading: isLoading ?? false,
  //     );

  Future<ResponseModel> goodsOrderApprovedButton({
    required String auth,
    goodsOrderApproveJsonString,
    bool? isLoading,
  }) async =>
      await connectHelper.goodsOrderApprovedButton(
        auth: auth,
        goodsOrderApproveJsonString: goodsOrderApproveJsonString,
        isLoading: isLoading ?? false,
      );
  Future<ResponseModel> complianceApprovedButton({
    required String auth,
    complianceApprovedJsonString,
    bool? isLoading,
    int? position,
  }) async =>
      await connectHelper.complianceApprovedButton(
          auth: auth,
          complianceApprovedJsonString: complianceApprovedJsonString,
          isLoading: isLoading ?? false,
          position: position);
  Future<ResponseModel> approveIncidentReportButton({
    required String auth,
    incidentReportApproveJsonString,
    bool? isLoading,
  }) async =>
      await connectHelper.approveIncidentReportButton(
        auth: auth,
        incidentReportApproveJsonString: incidentReportApproveJsonString,
        isLoading: isLoading ?? false,
      );
  Future<ResponseModel> approveIncidentReportButton2ndStep({
    required String auth,
    incidentReportApproveJsonString,
    bool? isLoading,
  }) async =>
      await connectHelper.approveIncidentReportButton2ndStep(
        auth: auth,
        incidentReportApproveJsonString: incidentReportApproveJsonString,
        isLoading: isLoading ?? false,
      );
  Future<ResponseModel> approveIrButton({
    required String auth,
    incidentReportApproveJsonString,
    bool? isLoading,
  }) async =>
      await connectHelper.approveIrButton(
        auth: auth,
        incidentReportApproveJsonString: incidentReportApproveJsonString,
        isLoading: isLoading ?? false,
      );

  Future<ResponseModel> mcPlanApprovedButton(
          {required String auth,
          mcApproveJsonString,
          bool? isLoading,
          int? facility_id}) async =>
      await connectHelper.mcPlanApprovedButton(
          auth: auth,
          mcApproveJsonString: mcApproveJsonString,
          isLoading: isLoading ?? false,
          facility_id: facility_id);

  Future<ResponseModel> mcExecutionApprovedButton(
          {required String auth,
          mcExecutionApproveJsonString,
          bool? isLoading,
          int? facility_id}) async =>
      await connectHelper.mcExecutionApprovedButton(
          auth: auth,
          mcExecutionApproveJsonString: mcExecutionApproveJsonString,
          isLoading: isLoading ?? false,
          facility_id: facility_id);

  Future<ResponseModel> wcApprovedButton({
    required String auth,
    WCApproveJsonString,
    bool? isLoading,
  }) async =>
      await connectHelper.wcApprovedButton(
        auth: auth,
        WCApproveJsonString: WCApproveJsonString,
        isLoading: isLoading ?? false,
      );

  Future<ResponseModel> wcRejectdButton({
    required String auth,
    WCRejectJsonString,
    bool? isLoading,
  }) async =>
      await connectHelper.wcRejectdButton(
        auth: auth,
        WCRejectJsonString: WCRejectJsonString,
        isLoading: isLoading ?? false,
      );
  Future<ResponseModel> closeWCApprovedButton({
    required String auth,
    WCApproveJsonString,
    bool? isLoading,
  }) async =>
      await connectHelper.closeWCApprovedButton(
        auth: auth,
        WCApproveJsonString: WCApproveJsonString,
        isLoading: isLoading ?? false,
      );

  Future<ResponseModel> closeWCRejectdButton({
    required String auth,
    WCRejectJsonString,
    bool? isLoading,
  }) async =>
      await connectHelper.closeWCRejectdButton(
        auth: auth,
        WCRejectJsonString: WCRejectJsonString,
        isLoading: isLoading ?? false,
      );
  Future<ResponseModel> updateWarranty({
    required String auth,
    updateWarrantyClaim,
    bool? isLoading,
  }) async =>
      await connectHelper.updateWarranty(
        auth: auth,
        updateWarrantyClaim: updateWarrantyClaim,
        isLoading: isLoading ?? false,
      );
  Future<ResponseModel> closeWarranty({
    required String auth,
    updateWarrantyClaim,
    bool? isLoading,
  }) async =>
      await connectHelper.closeWarranty(
        auth: auth,
        updateWarrantyClaim: updateWarrantyClaim,
        isLoading: isLoading ?? false,
      );

  Future<ResponseModel> rejectMcExecutionApprovedButton(
          {required String auth,
          rejectMcExecutionApproveJsonString,
          bool? isLoading,
          int? facility_id}) async =>
      await connectHelper.rejectMcExecutionApprovedButton(
          auth: auth,
          rejectMcExecutionApproveJsonString:
              rejectMcExecutionApproveJsonString,
          isLoading: isLoading ?? false,
          facility_id: facility_id);

  Future<ResponseModel> mcPlanRejectButton(
          {required String auth,
          mcRejectJsonString,
          bool? isLoading,
          int? facility_id}) async =>
      await connectHelper.mcPlanRejectButton(
          auth: auth,
          mcRejectJsonString: mcRejectJsonString,
          isLoading: isLoading ?? false,
          facility_id: facility_id);

  Future<ResponseModel> pmPlanApprovedButton({
    required String auth,
    pmPlanApproveJsonString,
    bool? isLoading,
  }) async =>
      await connectHelper.pmPlanApprovedButton(
        auth: auth,
        pmPlanApproveJsonString: pmPlanApproveJsonString,
        isLoading: isLoading ?? false,
      );
  Future<ResponseModel> auditPlanApprovedButton({
    required String auth,
    auditPlanApproveJsonString,
    bool? isLoading,
  }) async =>
      await connectHelper.auditPlanApprovedButton(
        auth: auth,
        auditPlanApproveJsonString: auditPlanApproveJsonString,
        isLoading: isLoading ?? false,
      );
  Future<ResponseModel> approveGOReceiveButton({
    required String auth,
    goodsOrderApproveJsonString,
    bool? isLoading,
  }) async =>
      await connectHelper.approveGOReceiveButton(
        auth: auth,
        goodsOrderApproveJsonString: goodsOrderApproveJsonString,
        isLoading: isLoading ?? false,
      );

  Future<ResponseModel> rejectGOReceiveButton({
    required String auth,
    goodsOrderApproveJsonString,
    bool? isLoading,
  }) async =>
      await connectHelper.rejectGOReceiveButton(
        auth: auth,
        goodsOrderApproveJsonString: goodsOrderApproveJsonString,
        isLoading: isLoading ?? false,
      );
  Future<ResponseModel> pmPlanRejectButton({
    required String auth,
    pmPlanRejectJsonString,
    bool? isLoading,
  }) async =>
      await connectHelper.pmPlanRejectButton(
        auth: auth,
        pmPlanRejectJsonString: pmPlanRejectJsonString,
        isLoading: isLoading ?? false,
      );
  Future<ResponseModel> auditTaskApprovedButton({
    required String auth,
    auditTaskApproveJsonString,
    bool? isLoading,
  }) async =>
      await connectHelper.auditTaskApprovedButton(
        auth: auth,
        auditTaskApproveJsonString: auditTaskApproveJsonString,
        isLoading: isLoading ?? false,
      );
  Future<ResponseModel> auditTaskSkipButton({
    required String auth,
    auditTaskSkipJsonString,
    bool? isLoading,
  }) async =>
      await connectHelper.auditTaskSkipButton(
        auth: auth,
        auditTaskSkipJsonString: auditTaskSkipJsonString,
        isLoading: isLoading ?? false,
      );
  Future<ResponseModel> auditTaskCloseButton({
    required String auth,
    auditTaskCloseJsonString,
    bool? isLoading,
  }) async =>
      await connectHelper.auditTaskCloseButton(
        auth: auth,
        auditTaskCloseJsonString: auditTaskCloseJsonString,
        isLoading: isLoading ?? false,
      );
  Future<ResponseModel> auditTaskCloseApproveButton({
    required String auth,
    auditTaskCloseApproveJsonString,
    bool? isLoading,
  }) async =>
      await connectHelper.auditTaskCloseApproveButton(
        auth: auth,
        auditTaskCloseApproveJsonString: auditTaskCloseApproveJsonString,
        isLoading: isLoading ?? false,
      );
  Future<ResponseModel> auditTaskCloseRejectButton({
    required String auth,
    auditTaskCloseRejectJsonString,
    bool? isLoading,
  }) async =>
      await connectHelper.auditTaskCloseRejectButton(
        auth: auth,
        auditTaskCloseRejectJsonString: auditTaskCloseRejectJsonString,
        isLoading: isLoading ?? false,
      );
  Future<ResponseModel> auditTaskRejectButton({
    required String auth,
    auditTaskRejectJsonString,
    bool? isLoading,
  }) async =>
      await connectHelper.auditTaskRejectButton(
        auth: auth,
        auditTaskRejectJsonString: auditTaskRejectJsonString,
        isLoading: isLoading ?? false,
      );
  Future<ResponseModel> getAuditTaskDetails({
    String? auth,
    int? auditTaskId,
    bool? isLoading,
  }) async {
    return await connectHelper.getAuditTaskDetails(
      auth: auth,
      auditTaskId: auditTaskId,
      isLoading: isLoading,
    );
  }

  Future<ResponseModel> auditPlanRejectButton({
    required String auth,
    auditPlanRejectJsonString,
    bool? isLoading,
  }) async =>
      await connectHelper.auditPlanRejectButton(
        auth: auth,
        auditPlanRejectJsonString: auditPlanRejectJsonString,
        isLoading: isLoading ?? false,
      );
  Future<ResponseModel> goodsOrderRejectButton({
    required String auth,
    goodsOrderRejectJsonString,
    bool? isLoading,
  }) async =>
      await connectHelper.goodsOrderRejectButton(
        auth: auth,
        goodsOrderRejectJsonString: goodsOrderRejectJsonString,
        isLoading: isLoading ?? false,
      );
  Future<ResponseModel> rejectIncidentReportButton({
    required String auth,
    incidentReportRejectJsonString,
    bool? isLoading,
  }) async =>
      await connectHelper.rejectIncidentReportButton(
        auth: auth,
        incidentReportRejectJsonString: incidentReportRejectJsonString,
        isLoading: isLoading ?? false,
      );

  Future<ResponseModel> rejectIrButton({
    required String auth,
    incidentReportRejectJsonString,
    bool? isLoading,
  }) async =>
      await connectHelper.rejectIrButton(
        auth: auth,
        incidentReportRejectJsonString: incidentReportRejectJsonString,
        isLoading: isLoading ?? false,
      );
  Future<ResponseModel> goodsOrderCloseButton({
    required String auth,
    goodsOrderCloseJsonString,
    bool? isLoading,
  }) async =>
      await connectHelper.goodsOrderCloseButton(
        auth: auth,
        goodsOrderCloseJsonString: goodsOrderCloseJsonString,
        isLoading: isLoading ?? false,
      );

  Future<ResponseModel> permitCancelByIssuerButton({
    required String auth,
    String? comment,
    String? id,
    bool? isLoading,
  }) async =>
      await connectHelper.permitCancelByIssuerButton(
        auth: auth,
        comment: comment,
        id: id,
        isLoading: isLoading ?? false,
      );

  Future<ResponseModel> permitCancelRequestButton(
          {required String auth,
          cancelPermitJsonString,
          bool? isLoading,
          int? jobId,
          int? type}) async =>
      await connectHelper.permitCancelRequestButton(
          auth: auth,
          cancelPermitJsonString: cancelPermitJsonString,
          isLoading: isLoading ?? false,
          jobId: jobId,
          type: type);

  Future<ResponseModel> permitCancelByApproverButton({
    required String auth,
    // String? comment,
    // String? id,
    cancelByApproverJsonString,
    String? ptwStatus,
    bool? isLoading,
  }) async =>
      await connectHelper.permitCancelByApproverButton(
        auth: auth,
        // comment: comment,
        // id: id,
        cancelByApproverJsonString: cancelByApproverJsonString,
        ptwStatus: ptwStatus,
        isLoading: isLoading ?? false,
      );

  Future<ResponseModel> permitCancelRejectButton({
    required String auth,
    rejectCancelPermitJsonString,
    bool? isLoading,
  }) async =>
      await connectHelper.permitCancelRejectButton(
        auth: auth,
        rejectCancelPermitJsonString: rejectCancelPermitJsonString,
        isLoading: isLoading ?? false,
      );
  // Future<ResponseModel> permitCancelRejectButton({
  //   required String auth,
  //   String? comment,
  //   String? id,
  //   bool? isLoading,
  // }) async =>
  //     await connectHelper.permitCancelRejectButton(
  //       auth: auth,
  //       comment: comment,
  //       id: id,
  //       isLoading: isLoading ?? false,
  //     );

  Future<ResponseModel> permitExtendButton({
    required String auth,
    extendPermitJsonString,
    bool? isLoading,
    int? jobId,
  }) async =>
      await connectHelper.permitExtendButton(
        auth: auth,
        extendPermitJsonString: extendPermitJsonString,
        isLoading: isLoading ?? false,
        jobId: jobId,
      );

  Future<ResponseModel> permitCloseButton(
          {required String auth,
          closePermitJsonString,
          bool? isLoading,
          int? jobId,
          int? closetype}) async =>
      await connectHelper.permitCloseButton(
          auth: auth,
          closePermitJsonString: closePermitJsonString,
          isLoading: isLoading ?? false,
          jobId: jobId,
          closetype: closetype);

  Future<ResponseModel> rejectJobCard({
    auth,
    bool? isLoading,
    rejectJsonString,
  }) async {
    var response = await connectHelper.rejectJobCard(
        auth: auth, isLoading: isLoading, rejectJsonString: rejectJsonString);
    return response;
  }

  Future<ResponseModel> rejectcloseJob({
    auth,
    bool? isLoading,
    rejectJsonString,
  }) async {
    var response = await connectHelper.rejectcloseJob(
        auth: auth, isLoading: isLoading, rejectJsonString: rejectJsonString);
    return response;
  }

  Future<ResponseModel> startMCExecutionButton(
          {required String auth,
          int? executionId,
          bool? isLoading,
          int? facility_id}) async =>
      await connectHelper.startMCExecutionButton(
          auth: auth,
          executionId: executionId,
          isLoading: isLoading ?? false,
          facility_id: facility_id);

  Future<ResponseModel> endMcExecutionButton(
          {required String auth,
          int? executionId,
          bool? isLoading,
          int? facility_id}) async =>
      await connectHelper.endMcExecutionButton(
          auth: auth,
          executionId: executionId,
          isLoading: isLoading ?? false,
          facility_id: facility_id);

  Future<ResponseModel> startMCExecutionScheduleButton(
          {required String auth,
          int? scheduleId,
          bool? isLoading,
          int? facility_id}) async =>
      await connectHelper.startMCExecutionScheduleButton(
          auth: auth,
          scheduleId: scheduleId,
          isLoading: isLoading ?? false,
          facility_id: facility_id);

  Future<ResponseModel> endMCScheduleExecutionButton(
          {required String auth,
          int? scheduleId,
          bool? isLoading,
          int? facility_id}) async =>
      await connectHelper.endMCScheduleExecutionButton(
          auth: auth,
          scheduleId: scheduleId,
          isLoading: isLoading ?? false,
          facility_id: facility_id);

  // Future<ResponseModel> permitRejectButton({
  //   required String auth,
  //   String? comment,
  //   String? id,
  //   String? ptwStatus,
  //   int? jobId,
  //   bool? isLoading,
  // }) async =>
  //     await connectHelper.permitRejectButton(
  //       auth: auth,
  //       comment: comment,
  //       id: id,
  //       ptwStatus: ptwStatus,
  //       jobId: jobId,
  //       isLoading: isLoading ?? false,
  //     );

  Future<ResponseModel> permitRejectButton(
          {required String auth,
          int? id,
          String? ptwStatus,
          int? jobId,
          rejectExtendPermitJsonString,
          bool? isLoading,
          int? type,
          int? vegexe,
          int? vegid}) async =>
      await connectHelper.permitRejectButton(
          auth: auth,
          rejectExtendPermitJsonString: rejectExtendPermitJsonString,
          id: id,
          jobId: jobId,
          ptwStatus: ptwStatus,
          isLoading: isLoading ?? false,
          type: type,
          vegexe: vegexe,
          vegid: vegid);

  Future<ResponseModel> incidentReportRejectButton({
    required String auth,
    String? comment,
    String? id,
    bool? isLoading,
  }) async =>
      await connectHelper.incidentReportRejectButton(
        auth: auth,
        comment: comment,
        id: id,
        isLoading: isLoading ?? false,
      );

  Future<ResponseModel> incidentReportApproveButton({
    required String auth,
    String? incidentId,
    bool? isLoading,
  }) async =>
      await connectHelper.incidentReportApproveButton(
        auth: auth,
        incidentId: incidentId,
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
    required int facilityId,
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
        facilityId: facilityId,
        isLoading: isLoading ?? false,
      );

  Future<ResponseModel> getPreventiveCheckList(
          {required String auth,
          int? facilityId,
          int? type,
          bool? isLoading,
          int? frequencyid,
          int? categoryId}) async =>
      await connectHelper.getPreventiveCheckList(
          auth: auth,
          facilityId: facilityId ?? 0,
          type: type,
          isLoading: isLoading ?? false,
          categoryId: categoryId,
          frequencyid: frequencyid);
  Future<ResponseModel> getdashboardList(
          {required String auth,
          String? facilityId,
          bool? isLoading,
          dynamic startDate,
          dynamic endDate}) async =>
      await connectHelper.getdashboardList(
          auth: auth,
          facilityId: facilityId ?? "",
          isLoading: isLoading ?? false,
          startDate: startDate,
          endDate: endDate);
  Future<ResponseModel> getPreventiveCheckListForPm(
          {required String auth,
          int? facilityId,
          int? type,
          bool? isLoading,
          int? frequencyid,
          int? categoryId}) async =>
      await connectHelper.getPreventiveCheckListForPm(
          auth: auth,
          facilityId: facilityId ?? 0,
          type: type,
          isLoading: isLoading ?? false,
          categoryId: categoryId,
          frequencyid: frequencyid);
  Future<ResponseModel> getPreventiveCheckListForAudit(
          {required String auth,
          int? facilityId,
          int? type,
          bool? isLoading,
          int? frequencyid,
          int? categoryId}) async =>
      await connectHelper.getPreventiveCheckListForAudit(
          auth: auth,
          facilityId: facilityId ?? 0,
          type: type,
          isLoading: isLoading ?? false,
          categoryId: categoryId,
          frequencyid: frequencyid);

  Future<ResponseModel> getModuleList({
    required String auth,
    bool? isLoading,
  }) async =>
      await connectHelper.getModuleList(
        auth: auth,
        isLoading: isLoading ?? false,
      );
  Future<ResponseModel> getStatusList({
    required String auth,
    int? moduleId,
    bool? isLoading,
  }) async =>
      await connectHelper.getStatusList(
        auth: auth,
        moduleId: moduleId ?? 0,
        isLoading: isLoading ?? false,
      );

  Future<ResponseModel> getInventoryTypeList({
    required String auth,
    int? facilityId,
    int? type,
    bool? isLoading,
  }) async =>
      await connectHelper.getInventoryTypeList(
        auth: auth,
        facilityId: facilityId ?? 0,
        type: type,
        isLoading: isLoading ?? false,
      );
  Future<ResponseModel> getInventoryStatusList({
    required String auth,
    // int? facilityId,
    bool? isLoading,
  }) async =>
      await connectHelper.getInventoryStatusList(
        auth: auth,
        // facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );

  Future<ResponseModel> getCheckPointlist(
          {required String auth,
          int? selectedchecklistId,
          bool? isLoading,
          int? facilityId,
          int? type}) async =>
      await connectHelper.getCheckPointlist(
          auth: auth,
          selectedchecklistId: selectedchecklistId ?? 0,
          isLoading: isLoading ?? false,
          facilityId: facilityId,
          type: type);

  Future<ResponseModel> getFacilityList({
    String? auth,
    bool? isLoading,
  }) async =>
      await connectHelper.getFacilityList(
        auth: auth,
        isLoading: isLoading,
      );
  Future<ResponseModel> getFacilityListByUserId({
    String? auth,
    bool? isLoading,
  }) async =>
      await connectHelper.getFacilityListByUserId(
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

  Future<ResponseModel> getAssetList({
    String? auth,
    bool? isLoading,
    int? facilityId,
  }) async {
    return await connectHelper.getAssetList(
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

  //  Future<ResponseModel> getAffectedPartList({
  //   String? auth,
  //   bool? isLoading,
  //   int? facilityId,
  // }) async {
  //   return await connectHelper.getAffectedPartList(
  //     auth: auth,
  //     isLoading: isLoading,
  //     facilityId: facilityId,
  //   );
  // }

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
    required int facilityId,
    int? userId,
    bool? isLoading,
  }) async =>
      await connectHelper.getJobDetails(
        auth: auth,
        facilityId: facilityId,
        jobId: jobId ?? 0,
        userId: userId,
        isLoading: isLoading,
      );

  Future<ResponseModel> getjobDetailsModel({
    required String auth,
    required int jobId,
    required int facilityId,
    int? userId,
    bool? isLoading,
  }) async =>
      await connectHelper.getjobDetailsModel(
        auth: auth,
        jobId: jobId,
        userId: userId,
        facilityId: facilityId,
        isLoading: isLoading,
      );

  ///
  Future<ResponseModel> getPermitList({
    required String auth,
    int? facilityId,
    bool? selfView,
    bool? isLoading,
  }) async =>
      await connectHelper.getPermitList(
        auth: auth,
        facilityId: facilityId,
        selfView: selfView,
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
  Future<ResponseModel> getAssignedToListWOAttend({
    required String auth,
    int? facilityId,
    int? featureId,
    int? isattendanceneeded,
    int? userId,
    bool? isLoading,
  }) async =>
      await connectHelper.getAssignedToListWOAttend(
        auth: auth,
        facilityId: facilityId,
        featureId: featureId,
        isattendanceneeded: isattendanceneeded,
        userId: userId,
        isLoading: isLoading,
      );
  Future<ResponseModel> getAssignedToEmployee({
    required String auth,
    int? facilityId,
    int? featureId,
    bool? isLoading,
  }) async =>
      await connectHelper.getAssignedToEmployee(
        auth: auth,
        facilityId: facilityId,
        featureId: featureId,
        isLoading: isLoading,
      );
  Future<ResponseModel> getEmployeeTrainingList({
    required String auth,
    int? facilityId,
    int? featureId,
    bool? isLoading,
  }) async =>
      await connectHelper.getEmployeeTrainingList(
        auth: auth,
        facilityId: facilityId,
        featureId: featureId,
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

  ///
  Future<ResponseModel> updateJob({
    required String auth,
    job,
    bool? isLoading,
  }) async =>
      await connectHelper.updateJob(
        auth: auth,
        job: job,
        isLoading: isLoading ?? false,
      );

  ///
  Future<ResponseModel> assignReAssignJob({
    required String auth,
    jobId,
    assignedToId,
    bool? isLoading,
  }) async =>
      await connectHelper.assignReAssignJob(
        auth: auth,
        jobId: jobId,
        assignedToId: assignedToId,
        isLoading: isLoading ?? false,
      );

  ///
  Future<ResponseModel> linkToPermit({
    required String auth,
    jobId,
    permitId,
    bool? isLoading,
  }) async =>
      await connectHelper.linkToPermit(
        auth: auth,
        jobId: jobId,
        permitId: permitId,
        isLoading: isLoading ?? false,
      );

  Future<ResponseModel> linkMcToPermit({
    required String auth,
    mcId,
    permitId,
    bool? isLoading,
  }) async =>
      await connectHelper.linkMcToPermit(
        auth: auth,
        mcId: mcId,
        permitId: permitId,
        isLoading: isLoading ?? false,
      );

  ///
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

  Future<ResponseModel> createModuleList({
    auth,
    bool? isLoading,
    modulelistJsonString,
  }) async {
    var response = await connectHelper.createModuleList(
        auth: auth,
        isLoading: isLoading,
        modulelistJsonString: modulelistJsonString);
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

  Future<ResponseModel> saveRoleAccess({
    auth,
    bool? isLoading,
    saveRolelistJsonString,
  }) async {
    var response = await connectHelper.saveRoleAccess(
        auth: auth,
        isLoading: isLoading,
        saveRolelistJsonString: saveRolelistJsonString);
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

  Future<ResponseModel> createNewPermitForJob({
    required String auth,
    newPermit,
    jobId,
    bool? isLoading,
  }) async =>
      await connectHelper.createNewPermitForJob(
        auth: auth,
        newPermit: newPermit,
        jobId: jobId,
        isLoading: isLoading ?? false,
      );
  Future<ResponseModel> createNewPermitForMC({
    required String auth,
    newPermit,
    mcId,
    bool? isLoading,
  }) async =>
      await connectHelper.createNewPermitForMC(
        auth: auth,
        newPermit: newPermit,
        mcId: mcId,
        isLoading: isLoading ?? false,
      );
  Future<ResponseModel> createNewPermitForPm({
    required String auth,
    newPermit,
    pmTaskId,
    bool? isLoading,
  }) async =>
      await connectHelper.createNewPermitForPm(
        auth: auth,
        newPermit: newPermit,
        pmTaskId: pmTaskId,
        isLoading: isLoading ?? false,
      );
  Future<ResponseModel> updateNewPermit(
          {required String auth,
          newPermit,
          bool? isLoading,
          bool? resubmit,
          int? type,
          vegplanId,
          vegexid}) async =>
      await connectHelper.updateNewPermit(
          auth: auth,
          newPermit: newPermit,
          isLoading: isLoading ?? false,
          resubmit: resubmit,
          type: type,
          vegplanId: vegplanId,
          vegexid: vegexid);

  Future<ResponseModel> resubmitPermit(
          {required String auth,
          newPermit,
          int? type,
          bool? isLoading,
          bool? resubmit,
          vegplanId,
          vegexid}) async =>
      await connectHelper.resubmitPermit(
          auth: auth,
          newPermit: newPermit,
          isLoading: isLoading ?? false,
          type: type,
          resubmit: resubmit,
          vegplanId: vegplanId,
          vegexid: vegexid);

  Future<ResponseModel> createSOP({
    required String auth,
    createSop,
    bool? isLoading,
  }) async =>
      await connectHelper.createSOP(
        auth: auth,
        createSop: createSop,
        isLoading: isLoading ?? false,
      );

  Future<ResponseModel> createWarrantyClaim({
    required String auth,
    createWarrantyClaim,
    bool? isLoading,
  }) async =>
      await connectHelper.createWarrantyClaim(
        auth: auth,
        createWarrantyClaim: createWarrantyClaim,
        isLoading: isLoading ?? false,
      );

  Future<ResponseModel> createIncidentReport({
    required String auth,
    createIncidentReport,
    bool? isLoading,
  }) async =>
      await connectHelper.createIncidentReport(
        auth: auth,
        createIncidentReport: createIncidentReport,
        isLoading: isLoading ?? false,
      );

  Future<ResponseModel> createEscalationMatrix({
    required String auth,
    createEscalationMatrix,
    required int moduleId,
    required int statusId,
    bool? isLoading,
  }) async =>
      await connectHelper.createEscalationMatrix(
        auth: auth,
        createEscalationMatrix: createEscalationMatrix,
        moduleId: moduleId,
        statusId: statusId,
        isLoading: isLoading ?? false,
      );
  Future<ResponseModel> escalateModule({
    required String auth,
    required int moduleId,
    required int statusId,
    required int facilityId,
    bool? isLoading,
  }) async =>
      await connectHelper.escalateModule(
        auth: auth,
        moduleId: moduleId,
        statusId: statusId,
        facilityId: facilityId,
        isLoading: isLoading ?? false,
      );

  Future<ResponseModel> getEscalationDetail({
    required String auth,
    required int? moduleId,
    required int? statusId,
    bool? isLoading,
  }) async =>
      await connectHelper.getEscalationDetail(
        auth: auth,
        moduleId: moduleId,
        statusId: statusId,
        isLoading: isLoading ?? false,
      );

  Future<ResponseModel> getEscalationMatrixList({
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getEscalationMatrixList(
      isLoading: isLoading,
      auth: auth,
    );
  }

  Future<ResponseModel> createMcPlan(
          {required String auth,
          createMcPlans,
          bool? isLoading,
          int? facilityId}) async =>
      await connectHelper.createMcPlan(
          auth: auth,
          createMcPlans: createMcPlans,
          isLoading: isLoading ?? false,
          facilityId: facilityId);

  Future<ResponseModel> updateMcPlan(
          {required String auth,
          updateMcPlans,
          bool? isLoading,
          int? facility_id}) async =>
      await connectHelper.updateMcPlan(
          auth: auth,
          updateMcPlans: updateMcPlans,
          isLoading: isLoading ?? false,
          facility_id: facility_id);

  Future<ResponseModel> createGoodsOrder({
    required String auth,
    createGo,
    bool? isLoading,
  }) async =>
      await connectHelper.createGoodsOrder(
        auth: auth,
        createGo: createGo,
        isLoading: isLoading ?? false,
      );
  Future<ResponseModel> uploadDocumentNew({
    required String auth,
    uploadDocument,
    bool? isLoading,
  }) async =>
      await connectHelper.uploadDocumentNew(
        auth: auth,
        uploadDocument: uploadDocument,
        isLoading: isLoading ?? false,
      );
  Future<ResponseModel> createCompliance(
          {required String auth,
          createCompliance,
          bool? isLoading,
          int? position}) async =>
      await connectHelper.createCompliance(
        auth: auth,
        createCompliance: createCompliance,
        isLoading: isLoading ?? false,
        position: position,
      );
  Future<ResponseModel> createObs(
          {required String auth,
          createObs,
          bool? isLoading,
          int? position}) async =>
      await connectHelper.createObs(
        auth: auth,
        createObs: createObs,
        isLoading: isLoading ?? false,
        position: position,
      );
  Future<ResponseModel> createoccupational({
    required String auth,
    createoccupational,
    bool? isLoading,
  }) async =>
      await connectHelper.createoccupational(
        auth: auth,
        createoccupational: createoccupational,
        isLoading: isLoading ?? false,
      );
  //createvisitsandnotices
  Future<ResponseModel> createvisitsandnotices({
    required String auth,
    createvisitsandnotices,
    bool? isLoading,
  }) async =>
      await connectHelper.createvisitsandnotices(
        auth: auth,
        createvisitsandnotices: createvisitsandnotices,
        isLoading: isLoading ?? false,
      );
// createfuledata
  Future<ResponseModel> createfuledata({
    required String auth,
    createfuledata,
    bool? isLoading,
  }) async =>
      await connectHelper.createfuledata(
        auth: auth,
        createfuledata: createfuledata,
        isLoading: isLoading ?? false,
      );
  // createkaizensdata
  Future<ResponseModel> createkaizensdata({
    required String auth,
    createkaizensdata,
    bool? isLoading,
  }) async =>
      await connectHelper.createkaizensdata(
        auth: auth,
        createkaizensdata: createkaizensdata,
        isLoading: isLoading ?? false,
      );
//createplantationdata
  Future<ResponseModel> createplantationdata({
    required String auth,
    createplantationdata,
    bool? isLoading,
  }) async =>
      await connectHelper.createplantationdata(
        auth: auth,
        createplantationdata: createplantationdata,
        isLoading: isLoading ?? false,
      );
  // update Occupational Health
  Future<ResponseModel> updateHealthData({
    required String auth,
    updateHealthData,
    bool? isLoading,
  }) async =>
      await connectHelper.updateHealthData(
        auth: auth,
        updateHealthData: updateHealthData,
        isLoading: isLoading ?? false,
      );

  Future<ResponseModel> updateVisitAndNoticeDetails({
    required String auth,
    updateRegularVisit,
    bool? isLoading,
  }) async =>
      await connectHelper.updateVisitAndNoticeDetails(
        auth: auth,
        updateRegularVisit: updateRegularVisit,
        isLoading: isLoading ?? false,
      );
  //updateKaizenDetails
  Future<ResponseModel> updateKaizenDetails({
    required String auth,
    updateKaizen,
    bool? isLoading,
  }) async =>
      await connectHelper.updateKaizenDetails(
        auth: auth,
        updateKaizen: updateKaizen,
        isLoading: isLoading ?? false,
      );
  //updatePlantationDetails
  Future<ResponseModel> updatePlantationDetails({
    required String auth,
    updatePlantation,
    bool? isLoading,
  }) async =>
      await connectHelper.updatePlantationDetails(
        auth: auth,
        updatePlantation: updatePlantation,
        isLoading: isLoading ?? false,
      );

  //updateFuelConsumption
  Future<ResponseModel> updateFuelConsumption({
    required String auth,
    updateFueldata,
    bool? isLoading,
  }) async =>
      await connectHelper.updateFuelConsumption(
        auth: auth,
        updateFueldata: updateFueldata,
        isLoading: isLoading ?? false,
      );
  Future<ResponseModel> createWaterData({
    required String auth,
    createWaterData,
    bool? isLoading,
  }) async =>
      await connectHelper.createWaterData(
        auth: auth,
        createWaterData: createWaterData,
        isLoading: isLoading ?? false,
      );
  Future<ResponseModel> updateWaterData({
    required String auth,
    updateWaterData,
    bool? isLoading,
  }) async =>
      await connectHelper.updateWaterData(
        auth: auth,
        updateWaterData: updateWaterData,
        isLoading: isLoading ?? false,
      );

  Future<ResponseModel> getWasteDataList({
    int? facility_id,
    String? start_date,
    required String end_date,
    required bool isLoading,
    required int isHazardous,
    required String auth,
  }) async {
    return await connectHelper.getWasteDataList(
      isLoading: isLoading,
      auth: auth,
      facility_id: facility_id,
      start_date: start_date,
      end_date: end_date,
      isHazardous: isHazardous,
    );
  }

  Future<ResponseModel> createWasteData({
    required String auth,
    createWasteData,
    bool? isLoading,
  }) async =>
      await connectHelper.createWasteData(
        auth: auth,
        createWasteData: createWasteData,
        isLoading: isLoading ?? false,
      );
  Future<ResponseModel> updateWasteData({
    required String auth,
    createWasteData,
    bool? isLoading,
  }) async =>
      await connectHelper.updateWasteData(
        auth: auth,
        createWasteData: createWasteData,
        isLoading: isLoading ?? false,
      );
  Future<ResponseModel> submitPurchaseOrderData({
    required String auth,
    createGoReq,
    bool? isLoading,
  }) async =>
      await connectHelper.submitPurchaseOrderData(
        auth: auth,
        createGoReq: createGoReq,
        isLoading: isLoading ?? false,
      );
  Future<ResponseModel> updatePurchaseOrderData({
    required String auth,
    createGoReq,
    bool? isLoading,
  }) async =>
      await connectHelper.updatePurchaseOrderData(
        auth: auth,
        createGoReq: createGoReq,
        isLoading: isLoading ?? false,
      );
  Future<ResponseModel> updateGoodsOrder({
    required String auth,
    createGo,
    bool? isLoading,
  }) async =>
      await connectHelper.updateGoodsOrder(
        auth: auth,
        createGo: createGo,
        isLoading: isLoading ?? false,
      );

  Future<ResponseModel> updateGOReceive({
    required String auth,
    createGo,
    bool? isLoading,
  }) async =>
      await connectHelper.updateGOReceive(
        auth: auth,
        createGo: createGo,
        isLoading: isLoading ?? false,
      );
  Future<ResponseModel> updateGOReceiveIsSubmit0({
    required String auth,
    createGo,
    bool? isLoading,
  }) async =>
      await connectHelper.updateGOReceiveIsSubmit0(
        auth: auth,
        createGo: createGo,
        isLoading: isLoading ?? false,
      );

  Future<ResponseModel> updateWarrantyClaim({
    required String auth,
    updateWarrantyClaim,
    bool? isLoading,
  }) async =>
      await connectHelper.updateWarrantyClaim(
        auth: auth,
        updateWarrantyClaim: updateWarrantyClaim,
        isLoading: isLoading ?? false,
      );
  Future<ResponseModel> resubmitWarrantyClaim({
    required String auth,
    updateWarrantyClaim,
    bool? isLoading,
  }) async =>
      await connectHelper.resubmitWarrantyClaim(
        auth: auth,
        updateWarrantyClaim: updateWarrantyClaim,
        isLoading: isLoading ?? false,
      );

  Future<ResponseModel> updateIncidentReport({
    required String auth,
    updateIncidentReport,
    bool? isLoading,
  }) async =>
      await connectHelper.updateIncidentReport(
        auth: auth,
        updateIncidentReport: updateIncidentReport,
        isLoading: isLoading ?? false,
      );

  Future<ResponseModel> updateIRSecondStep({
    required String auth,
    updateIncidentReport,
    bool? isLoading,
  }) async =>
      await connectHelper.updateIRSecondStep(
        auth: auth,
        updateIncidentReport: updateIncidentReport,
        isLoading: isLoading ?? false,
      );

  Future<ResponseModel> updateMCScheduleExecution(
          {required String auth,
          updateMCScheduleExecutionJsonString,
          bool? isLoading,
          int? facility_id}) async =>
      await connectHelper.updateMCScheduleExecution(
          auth: auth,
          updateMCScheduleExecutionJsonString:
              updateMCScheduleExecutionJsonString,
          isLoading: isLoading ?? false,
          facility_id: facility_id);

  Future<ResponseModel> getNewPermitDetail({
    required int facilityId,
    required String auth,
    bool? isLoading,
    int? permitId,
  }) async =>
      await connectHelper.getNewPermitDetail(
        auth: auth,
        permitId: permitId,
        facilityId: facilityId,
        isLoading: isLoading ?? false,
      );

  Future<ResponseModel> getViewPermitDetail({
    required String auth,
    required int facilityId,
    bool? isLoading,
    int? permitId,
  }) async =>
      await connectHelper.getViewPermitDetail(
        auth: auth,
        permitId: permitId,
        facilityId: facilityId,
        isLoading: isLoading ?? false,
      );

  Future<ResponseModel> getViewWarrantyClaimDetail({
    required String auth,
    bool? isLoading,
    int? wc_id,
    int? facilityId,
  }) async =>
      await connectHelper.getViewWarrantyClaimDetail(
        auth: auth,
        wc_id: wc_id,
        facilityId: facilityId,
        isLoading: isLoading ?? false,
      );

  Future<ResponseModel> getMCExecutionDetail({
    required String auth,
    required int facilityId,
    bool? isLoading,
    int? executionId,
  }) async =>
      await connectHelper.getMCExecutionDetail(
        auth: auth,
        executionId: executionId,
        facilityId: facilityId,
        isLoading: isLoading ?? false,
      );

  Future<ResponseModel> getMcPlanDetail({
    required String auth,
    required int facilityId,
    bool? isLoading,
    int? planId,
  }) async =>
      await connectHelper.getMcPlanDetail(
        auth: auth,
        planId: planId,
        facilityId: facilityId,
        isLoading: isLoading ?? false,
      );

  Future<ResponseModel> getIncidentReportDetail({
    required String auth,
    bool? isLoading,
    int? id,
  }) async =>
      await connectHelper.getIncidentReportDetail(
        auth: auth,
        id: id,
        isLoading: isLoading ?? false,
      );

  Future<ResponseModel> getPurchaseDetailsById({
    required String auth,
    bool? isLoading,
    int? id,
  }) async =>
      await connectHelper.getPurchaseDetailsById(
        auth: auth,
        id: id,
        isLoading: isLoading ?? false,
      );
  Future<ResponseModel> getRoDetailsByID({
    required String auth,
    required int facilityId,
    bool? isLoading,
    int? requestID,
  }) async =>
      await connectHelper.getRoDetailsByID(
        auth: auth,
        requestID: requestID,
        facilityId: facilityId,
        isLoading: isLoading ?? false,
      );
  Future<ResponseModel> getRoDetailsByIDs({
    required String auth,
    required int facilityId,
    bool? isLoading,
    required List<int> requestID,
  }) async =>
      await connectHelper.getRoDetailsByIDs(
        auth: auth,
        requestID: requestID,
        facilityId: facilityId,
        isLoading: isLoading ?? false,
      );

  Future<ResponseModel> getInventoryDetail({
    required String auth,
    bool? isLoading,
    int? id,
  }) async =>
      await connectHelper.getInventoryDetail(
        auth: auth,
        id: id,
        isLoading: isLoading ?? false,
      );

  Future<ResponseModel> getAddInventoryDetail({
    required String auth,
    bool? isLoading,
    int? id,
  }) async =>
      await connectHelper.getAddInventoryDetail(
        auth: auth,
        id: id,
        isLoading: isLoading ?? false,
      );

  Future<ResponseModel> getStatutoryDetail({
    required String auth,
    bool? isLoading,
    int? id,
  }) async =>
      await connectHelper.getStatutoryDetail(
        auth: auth,
        id: id,
        isLoading: isLoading ?? false,
      );
  Future<ResponseModel> getObsDetail({
    required String auth,
    bool? isLoading,
    int? id,
  }) async =>
      await connectHelper.getObsDetail(
        auth: auth,
        id: id,
        isLoading: isLoading ?? false,
      );

  Future<ResponseModel> viewObsCloseButton({
    required String auth,
    viewobsCloseJsonString,
    bool? isLoading,
  }) async =>
      await connectHelper.viewObsCloseButton(
        auth: auth,
        viewobsCloseJsonString: viewobsCloseJsonString,
        isLoading: isLoading ?? false,
      );
  Future<ResponseModel> getHistory({
    String? auth,
    int? moduleType,
    int? id,
    required int facilityId,
    bool? isLoading,
  }) async {
    return await connectHelper.getHistory(
      auth: auth,
      moduleType: moduleType,
      id: id,
      facilityId: facilityId,
      isLoading: isLoading,
    );
  }

  Future<ResponseModel> getJobsLinkdToPermitList({
    String? auth,
    required int facilityId,
    int? permitId,
    bool? isLoading,
  }) async {
    return await connectHelper.getJobsLinkdToPermitList(
      auth: auth,
      permitId: permitId,
      facilityId: facilityId,
      isLoading: isLoading,
    );
  }

  Future<ResponseModel> getMrsListByModule({
    String? auth,
    int? jobId,
    required int facilityId,
    bool? isLoading,
  }) async {
    return await connectHelper.getMrsListByModule(
        auth: auth, jobId: jobId, isLoading: isLoading, facilityId: facilityId);
  }

  Future<ResponseModel> getMrsListByModuleTask({
    String? auth,
    int? taskId,
    bool? isLoading,
  }) async {
    return await connectHelper.getMrsListByModuleTask(
      auth: auth,
      taskId: taskId,
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

  Future<ResponseModel> deletePmPlan({
    auth,
    bool? isLoading,
    planId,
  }) async {
    var response = await connectHelper.deletePmPlan(
        auth: auth, isLoading: isLoading, planId: planId);
    return response;
  }

  Future<ResponseModel> deleteAuditPlan({
    auth,
    bool? isLoading,
    planId,
  }) async {
    var response = await connectHelper.deleteAuditPlan(
        auth: auth, isLoading: isLoading, planId: planId);
    return response;
  }

  Future<ResponseModel> getPermitDetails({
    String? auth,
    required int facilityId,
    int? permitId,
    bool? isLoading,
  }) async {
    return await connectHelper.getPermitDetails(
      auth: auth,
      permitId: permitId,
      facilityId: facilityId,
      isLoading: isLoading,
    );
  }

  Future<ResponseModel> getJobCardHistory({
    String? auth,
    int? jobCardId,
    required int facilityId,
    int? moduleType,
    bool? isLoading,
  }) async {
    return await connectHelper.getJobCardHistory(
      auth: auth,
      moduleType: moduleType,
      jobCardId: jobCardId,
      facilityId: facilityId,
      isLoading: isLoading,
    );
  }

  Future<ResponseModel> getViewPlanHistory({
    String? auth,
    int? pmPlanId,
    required int facilityId,
    int? moduleType,
    bool? isLoading,
  }) async {
    return await connectHelper.getViewPlanHistory(
      auth: auth,
      moduleType: moduleType,
      pmPlanId: pmPlanId,
      facilityId: facilityId,
      isLoading: isLoading,
    );
  }

  ///Permit History
  Future<ResponseModel> getPermitHistory({
    String? auth,
    int? permitId,
    required int facilityId,
    int? moduleType,
    bool? isLoading,
  }) async {
    return await connectHelper.getPermitHistory(
      auth: auth,
      moduleType: moduleType,
      facilityId: facilityId,
      permitId: permitId,
      isLoading: isLoading,
    );
  }

  Future<ResponseModel> getRoHistory({
    String? auth,
    int? id,
    required int facilityId,
    int? moduleType,
    bool? isLoading,
  }) async {
    return await connectHelper.getRoHistory(
      auth: auth,
      moduleType: moduleType,
      id: id,
      facilityId: facilityId,
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

  Future<ResponseModel> carryForwardJob({
    String? auth,
    jobCard,
    bool? isLoading,
  }) async {
    return await connectHelper.carryForwardJob(
      auth: auth,
      jobCard: jobCard,
      isLoading: isLoading,
    );
  }

  Future<ResponseModel> closeJob({
    String? auth,
    jobCard,
    bool? isLoading,
  }) async {
    return await connectHelper.closeJob(
      auth: auth,
      jobCard: jobCard,
      isLoading: isLoading,
    );
  }

  // Future<ResponseModel> approveJobCard({
  //   String? auth,
  //   jobCardId,
  //   comment,
  //   bool? isLoading,
  // }) async {
  //   return await connectHelper.approveJobCard(
  //     auth: auth,
  //     jobCardId: jobCardId,
  //     isLoading: isLoading,
  //   );
  // }
  Future<ResponseModel> approveJobCards({
    auth,
    bool? isLoading,
    approveJsonString,
  }) async {
    var response = await connectHelper.approveJobCards(
        auth: auth, isLoading: isLoading, approveJsonString: approveJsonString);
    return response;
  }

  Future<ResponseModel> approvecloseJob({
    auth,
    bool? isLoading,
    approveJsonString,
  }) async {
    var response = await connectHelper.approvecloseJob(
        auth: auth, isLoading: isLoading, approveJsonString: approveJsonString);
    return response;
  }

//
  Future<ResponseModel> abandonExecutionButton(
          {required String auth,
          abandoneJsonString,
          bool? isLoading,
          int? facility_id}) async =>
      await connectHelper.abandonExecutionButton(
          auth: auth,
          abandoneJsonString: abandoneJsonString,
          isLoading: isLoading ?? false,
          facility_id: facility_id);

  Future<ResponseModel> abandonScheduleExecutionButton(
          {required String auth,
          abandoneScheduleJsonString,
          bool? isLoading,
          int? facility_id}) async =>
      await connectHelper.abandonScheduleExecutionButton(
          auth: auth,
          abandoneScheduleJsonString: abandoneScheduleJsonString,
          isLoading: isLoading ?? false,
          facility_id: facility_id);

  Future<ResponseModel> endMCExecutionButton(
          {required String auth,
          endJsonString,
          bool? isLoading,
          int? facility_id}) async =>
      await connectHelper.endMCExecutionButton(
          auth: auth,
          endJsonString: endJsonString,
          isLoading: isLoading ?? false,
          facility_id: facility_id);

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
    int? facility_id,
  }) async =>
      await connectHelper.getTypePermitList(
          auth: auth, isLoading: isLoading, facility_id: facility_id);

  Future<ResponseModel> getModulesList({
    String? auth,
    bool? isLoading,
    int? facility_id,
  }) async =>
      await connectHelper.getModulesList(
          auth: auth, isLoading: isLoading, facility_id: facility_id);

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
  Future<ResponseModel> startJobCard({
    String? auth,
    jcCard,
    jobCard,
    bool? isLoading,
  }) async =>
      await connectHelper.startJobCard(
        auth: auth,
        jcCard: jcCard,
        jobCard: jobCard,
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
        isLoading: isLoading,
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
  Future<ResponseModel> requestCalibration({
    auth,
    bool? isLoading,
    requestCalibration,
  }) async {
    var response = await connectHelper.requestCalibration(
        auth: auth,
        isLoading: isLoading,
        requestCalibration: requestCalibration);
    return response;
  }

  Future<ResponseModel> rejectRequestCalibration({
    auth,
    bool? isLoading,
    rejectCalibrationtoJsonString,
  }) async {
    var response = await connectHelper.rejectRequestCalibration(
        auth: auth,
        isLoading: isLoading,
        rejectCalibrationtoJsonString: rejectCalibrationtoJsonString);
    return response;
  }

  Future<ResponseModel> skipCalibration({
    auth,
    bool? isLoading,
    skipCalibrationtoJsonString,
  }) async {
    var response = await connectHelper.skipCalibration(
        auth: auth,
        isLoading: isLoading,
        skipCalibrationtoJsonString: skipCalibrationtoJsonString);
    return response;
  }

  Future<ResponseModel> approveRequestCalibration({
    auth,
    bool? isLoading,
    approveCalibrationtoJsonString,
  }) async {
    var response = await connectHelper.approveRequestCalibration(
        auth: auth,
        isLoading: isLoading,
        approveCalibrationtoJsonString: approveCalibrationtoJsonString);
    return response;
  }

  Future<ResponseModel> approveCloseCalibration({
    auth,
    bool? isLoading,
    approveCalibrationtoJsonString,
  }) async {
    var response = await connectHelper.approveCloseCalibration(
        auth: auth,
        isLoading: isLoading,
        approveCalibrationtoJsonString: approveCalibrationtoJsonString);
    return response;
  }

  Future<ResponseModel> rejectCloseCalibration({
    auth,
    bool? isLoading,
    rejectCalibrationtoJsonString,
  }) async {
    var response = await connectHelper.rejectCloseCalibration(
        auth: auth,
        isLoading: isLoading,
        rejectCalibrationtoJsonString: rejectCalibrationtoJsonString);
    return response;
  }

  Future<ResponseModel> closeCalibration({
    auth,
    bool? isLoading,
    closeCalibrationtoJsonString,
  }) async {
    var response = await connectHelper.closeCalibration(
        auth: auth,
        isLoading: isLoading,
        closeCalibrationtoJsonString: closeCalibrationtoJsonString);
    return response;
  }

  Future<ResponseModel> completeCalibration({
    auth,
    bool? isLoading,
    completeCalibrationtoJsonString,
  }) async {
    var response = await connectHelper.completeCalibration(
        auth: auth,
        isLoading: isLoading,
        completeCalibrationtoJsonString: completeCalibrationtoJsonString);
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
  Future<ResponseModel> savePmSchedule({
    required String auth,
    pmScheduleJsonString,
    bool? isLoading,
  }) async =>
      await connectHelper.savePmSchedule(
        auth: auth,
        pmScheduleJsonString: pmScheduleJsonString,
        isLoading: isLoading ?? false,
      );
  Future<ResponseModel> getPmTaskList(
          {required String auth,
          int? facilityId,
          bool? isLoading,
          dynamic startDate,
          dynamic endDate}) async =>
      await connectHelper.getPmTaskList(
          auth: auth,
          facilityId: facilityId ?? 0,
          isLoading: isLoading ?? false,
          startDate: startDate,
          endDate: endDate);
  Future<ResponseModel> getAuditTaskList(
          {required String auth,
          int? facilityId,
          bool? isLoading,
          dynamic startDate,
          dynamic endDate,
          int? type}) async =>
      await connectHelper.getAuditTaskList(
          auth: auth,
          facilityId: facilityId ?? 0,
          isLoading: isLoading ?? false,
          startDate: startDate,
          endDate: endDate,
          type: type);
  Future<ResponseModel> getPmtaskViewList({
    String? auth,
    int? scheduleId,
    required int facilityId,
    bool? isLoading,
  }) async {
    return await connectHelper.getPmtaskViewList(
      auth: auth,
      scheduleId: scheduleId,
      facilityId: facilityId,
      isLoading: isLoading,
    );
  }

  Future<CreateSOPModel> browseFiles(
      {required String auth,
      Uint8List? fileBytes,
      required String fileName,
      required int importType,
      required bool isLoading,
      required int facilityId}) async {
    return await connectHelper.browseFiles(
        auth: auth,
        fileBytes: fileBytes,
        fileName: fileName,
        importType: importType,
        isLoading: true,
        facilityId: facilityId);
    // return true;
  }

  Future<PmFiles?> browsePmFiles({
    required String auth,
    Uint8List? fileBytes,
    required String fileName,
    required bool isLoading,
  }) async {
    return await connectHelper.browsePmFiles(
      auth: auth,
      fileBytes: fileBytes,
      fileName: fileName,
      isLoading: true,
    );
    // return true;
  }

  Future<ResponseModel> deleteCkecklist({
    auth,
    bool? isLoading,
    checklist_id,
  }) async {
    var response = await connectHelper.deleteCkecklist(
        auth: auth, isLoading: isLoading, checklist_id: checklist_id);
    return response;
  }

  Future<ResponseModel> deleteWorkTypeTool({
    auth,
    bool? isLoading,
    worktypetool_id,
  }) async {
    var response = await connectHelper.deleteWorkTypeTool(
        auth: auth, isLoading: isLoading, worktypetool_id: worktypetool_id);
    return response;
  }

  Future<ResponseModel> deleteModulelist({
    auth,
    bool? isLoading,
    module_id,
  }) async {
    var response = await connectHelper.deleteModulelist(
        auth: auth, isLoading: isLoading, module_id: module_id);
    return response;
  }

  Future<ResponseModel> updateChecklistNumber({
    auth,
    bool? isLoading,
    checklistJsonString,
  }) async {
    var response = await connectHelper.updateChecklistNumber(
      auth: auth,
      isLoading: isLoading,
      checklistJsonString: checklistJsonString,
    );
    return response;
  }

  Future<ResponseModel> updateWorkTypeTool({
    auth,
    bool? isLoading,
    worktypetoolJsonString,
  }) async {
    var response = await connectHelper.updateWorkTypeTool(
      auth: auth,
      isLoading: isLoading,
      worktypetoolJsonString: worktypetoolJsonString,
    );
    return response;
  }

  Future<ResponseModel> updateModulelistNumber({
    auth,
    bool? isLoading,
    modulelistJsonString,
  }) async {
    var response = await connectHelper.updateModulelistNumber(
      auth: auth,
      isLoading: isLoading,
      modulelistJsonString: modulelistJsonString,
    );
    return response;
  }

  Future<ResponseModel> updateCheckPoint({
    auth,
    bool? isLoading,
    checkpointJsonString,
  }) async {
    var response = await connectHelper.updateCheckPoint(
        auth: auth,
        isLoading: isLoading,
        checkpointJsonString: checkpointJsonString);
    return response;
  }

  Future<ResponseModel> updateSafetyMeasure({
    auth,
    bool? isLoading,
    createSafetyMeasureJsonString,
  }) async {
    var response = await connectHelper.updateSafetyMeasure(
        auth: auth,
        isLoading: isLoading,
        createSafetyMeasureJsonString: createSafetyMeasureJsonString);
    return response;
  }

  Future<ResponseModel> getCountryList({
    required String auth,
    bool? isLoading,
  }) async {
    return await connectHelper.getCountryList(
      auth: auth,
      isLoading: isLoading,
    );
  }

  Future<ResponseModel> getBloodList({
    required String auth,
    bool? isLoading,
  }) async {
    return await connectHelper.getBloodList(
      auth: auth,
      isLoading: isLoading,
    );
  }

  Future<ResponseModel> getStateListnew({
    required String auth,
    bool? isLoading,
    int? selectedCountryId,
  }) async {
    return await connectHelper.getStateListnew(
        auth: auth, isLoading: isLoading, selectedCountryId: selectedCountryId);
  }

  Future<ResponseModel> getCityList({
    required String auth,
    bool? isLoading,
    int? selectedStateId,
  }) async {
    return await connectHelper.getCityList(
        auth: auth, isLoading: isLoading, selectedStateId: selectedStateId);
  }

  Future<ResponseModel> getRoleAccessList({
    String? auth,
    int? roleId,
    bool? isLoading,
  }) async {
    return await connectHelper.getRoleAccessList(
      auth: auth,
      roleId: roleId,
      isLoading: isLoading,
    );
  }

  Future<ResponseModel> getRoleNotificationList({
    String? auth,
    int? roleId,
    bool? isLoading,
  }) async {
    return await connectHelper.getRoleNotificationList(
      auth: auth,
      roleId: roleId,
      isLoading: isLoading,
    );
  }

  Future<ResponseModel> getUserAccessListById({
    String? auth,
    int? userId,
    bool? isLoading,
  }) async {
    return await connectHelper.getUserAccessListById(
      auth: auth,
      userId: userId,
      isLoading: isLoading,
    );
  }

  Future<ResponseModel> getUserAccessListByUserId({
    String? auth,
    int? userId,
    bool? isLoading,
  }) async {
    return await connectHelper.getUserAccessListByUserId(
      auth: auth,
      userId: userId,
      isLoading: isLoading,
    );
  }

  Future<ResponseModel> getUserNotificationListById({
    String? auth,
    int? userId,
    bool? isLoading,
  }) async {
    return await connectHelper.getUserNotificationListById(
      auth: auth,
      userId: userId,
      isLoading: isLoading,
    );
  }

  Future<ResponseModel> getRoleList({
    required String auth,
    bool? isLoading,
  }) async {
    return await connectHelper.getRoleList(
      auth: auth,
      isLoading: isLoading,
    );
  }

  Future<ResponseModel> getCumulativeReportList({
    required String auth,
    bool? isLoading,
    required selectedFacilityIdList,
    required module_id,
  }) async {
    return await connectHelper.getCumulativeReportList(
        auth: auth,
        isLoading: isLoading,
        selectedFacilityIdList: selectedFacilityIdList,
        module_id: module_id);
  }

  Future<ResponseModel> getUserList({
    required String auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await connectHelper.getUserList(
        auth: auth,
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );
  Future<ResponseModel> jobCardList({
    required String auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await connectHelper.jobCardList(
        auth: auth,
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );
  Future<ResponseModel> getUserDetails({
    String? auth,
    int? userId,
    bool? isLoading,
  }) async {
    return await connectHelper.getUserDetails(
      auth: auth,
      userId: userId,
      isLoading: isLoading,
    );
  }

  Future<ResponseModel> saveAccessLevel({
    required String auth,
    accessLevelJsonString,
    bool? isLoading,
  }) async =>
      await connectHelper.saveAccessLevel(
        auth: auth,
        accessLevelJsonString: accessLevelJsonString,
        isLoading: isLoading ?? false,
      );
  Future<ResponseModel> addUser({
    auth,
    bool? isLoading,
    adduserJsonString,
  }) async {
    var response = await connectHelper.addUser(
        auth: auth, isLoading: isLoading, adduserJsonString: adduserJsonString);
    return response;
  }

  Future<ResponseModel> updateUser({
    auth,
    bool? isLoading,
    adduserJsonString,
  }) async {
    var response = await connectHelper.updateUser(
        auth: auth, isLoading: isLoading, adduserJsonString: adduserJsonString);
    return response;
  }

  Future<ResponseModel> getWarrantyTypeList({
    String? auth,
    bool? isLoading,
  }) async {
    return await connectHelper.getWarrantyTypeList(
      auth: auth,
      isLoading: isLoading,
    );
  }

  Future<ResponseModel> updatePmExecution(
          {required String auth,
          pmExecutionJsonString,
          bool? isLoading,
          int? facility_id}) async =>
      await connectHelper.updatePmExecution(
          auth: auth,
          pmExecutionJsonString: pmExecutionJsonString,
          isLoading: isLoading ?? false,
          facility_id: facility_id);
  Future<ResponseModel> updateAuditTaskExecution({
    required String auth,
    auditExecutionJsonString,
    bool? isLoading,
  }) async =>
      await connectHelper.updateAuditTaskExecution(
        auth: auth,
        auditExecutionJsonString: auditExecutionJsonString,
        isLoading: isLoading ?? false,
      );
  Future<AddUserModel> uploadImge(
      {required String auth,
      Uint8List? fileBytes,
      required String fileName,
      required bool isLoading}) async {
    return await connectHelper.uploadImge(
      auth: auth,
      fileBytes: fileBytes,
      fileName: fileName,
      isLoading: true,
    );
    // return true;
  }

  Future<AddInventoryRequestModel> uploadImgeInventory(
      {required String auth,
      Uint8List? fileBytes,
      required String fileName,
      required bool isLoading}) async {
    return await connectHelper.uploadImgeInventory(
      auth: auth,
      fileBytes: fileBytes,
      fileName: fileName,
      isLoading: true,
    );
    // return true;
  }

  ///
  Future<ResponseModel> getWarrantyUsageTermList({
    String? auth,
    bool? isLoading,
  }) async {
    return await connectHelper.getWarrantyUsageTermList(
      auth: auth,
      isLoading: isLoading,
    );
  }

  Future<ResponseModel> createBusinessList({
    auth,
    bool? isLoading,
    businesslistJsonString,
  }) async {
    var response = await connectHelper.createBusinessList(
        auth: auth,
        isLoading: isLoading,
        businesslistJsonString: businesslistJsonString);
    return response;
  }

  Future<ResponseModel> createSPVlist({
    auth,
    bool? isLoading,
    businesslistJsonString,
  }) async {
    var response = await connectHelper.createSPV(
        auth: auth,
        isLoading: isLoading,
        businesslistJsonString: businesslistJsonString);
    return response;
  }

  Future<ResponseModel> getBusinessTypeList({
    int? businessType,
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getBusinessTypeList(
      isLoading: isLoading,
      auth: auth,
      businessType: businessType,
    );
  }

  Future<ResponseModel> getWarrantyList({
    required String auth,
    int? facilityId,
    int? type,
    bool? isLoading,
  }) async =>
      await connectHelper.getWarrantyList(
        auth: auth,
        facilityId: facilityId ?? 0,
        type: type,
        isLoading: isLoading ?? false,
      );

  Future<ResponseModel> saveNotification({
    required String auth,
    saveNotificationJsonString,
    bool? isLoading,
  }) async =>
      await connectHelper.saveNotification(
        auth: auth,
        saveNotificationJsonString: saveNotificationJsonString,
        isLoading: isLoading ?? false,
      );

  Future<ResponseModel> AddInventory({
    auth,
    bool? isLoading,
    addInventoryJsonString,
  }) async {
    var response = await connectHelper.AddInventory(
        auth: auth,
        isLoading: isLoading,
        addInventoryJsonString: addInventoryJsonString);
    return response;
  }

  Future<ResponseModel> updateInventory({
    auth,
    bool? isLoading,
    addInventoryJsonString,
  }) async {
    var response = await connectHelper.updateInventory(
        auth: auth,
        isLoading: isLoading,
        addInventoryJsonString: addInventoryJsonString);
    return response;
  }

  Future<ResponseModel> inventoryList(
      {int? facilityId,
      required bool isLoading,
      required String auth,
      int? categoryId}) async {
    return await connectHelper.inventoryList(
        isLoading: isLoading,
        auth: auth,
        facilityId: facilityId,
        categoryId: categoryId);
  }

  Future<ResponseModel> inventoryListviaCategory(
      {int? facilityId,
      required bool isLoading,
      required String auth,
      int? categoryId}) async {
    return await connectHelper.inventoryListviaCategory(
        isLoading: isLoading,
        auth: auth,
        facilityId: facilityId,
        categoryId: categoryId);
  }

  Future<ResponseModel> startCalibration({
    auth,
    bool? isLoading,
    calibrationId,
  }) async {
    var response = await connectHelper.startCalibration(
        auth: auth, isLoading: isLoading, calibrationId: calibrationId);
    return response;
  }

  Future<ResponseModel> createFacilityType({
    auth,
    bool? isLoading,
    facilitylistJsonString,
  }) async {
    var response = await connectHelper.createFacilityType(
        auth: auth,
        isLoading: isLoading,
        facilitylistJsonString: facilitylistJsonString);
    return response;
  }

  Future<ResponseModel> createBlockType({
    auth,
    bool? isLoading,
    facilitylistJsonString,
  }) async {
    var response = await connectHelper.createBlockType(
        auth: auth,
        isLoading: isLoading,
        blockTypeJsonString: facilitylistJsonString);
    return response;
  }

  ///
  Future<ResponseModel> getCalibrationView({
    String? auth,
    required int facilityId,
    int? calibrationId,
    bool? isLoading,
  }) async {
    return await connectHelper.getCalibrationView(
      auth: auth,
      calibrationId: calibrationId,
      facilityId: facilityId,
      isLoading: isLoading,
    );
  }

  //end
  Future<ResponseModel> getAssetMasterList({
    required String auth,
    int? facilityId,
    int? type,
    bool? isLoading,
  }) async =>
      await connectHelper.getAssetMasterList(
        auth: auth,
        facilityId: facilityId ?? 0,
        type: type,
        isLoading: isLoading ?? false,
      );

  Future<ResponseModel> getDesignationList({
    required String auth,
    bool? isLoading,
  }) async {
    return await connectHelper.getDesignationList(
      auth: auth,
      isLoading: isLoading,
    );
  }

  Future<ResponseModel> deleteBusinessList({
    auth,
    bool? isLoading,
    business_id,
  }) async {
    var response = await connectHelper.deleteBusinessList(
        auth: auth, isLoading: isLoading, business_id: business_id);
    return response;
  }

  Future<ResponseModel> deleteBlock({
    auth,
    bool? isLoading,
    business_id,
  }) async {
    var response = await connectHelper.deleteBlock(
        auth: auth, isLoading: isLoading, business_id: business_id);
    return response;
  }

  Future<ResponseModel> deleteSPV({
    auth,
    bool? isLoading,
    business_id,
  }) async {
    var response = await connectHelper.deleteSPV(
        auth: auth, isLoading: isLoading, business_id: business_id);
    return response;
  }

  Future<ResponseModel> deleteFacility({
    auth,
    bool? isLoading,
    business_id,
  }) async {
    var response = await connectHelper.deleteFacility(
        auth: auth, isLoading: isLoading, business_id: business_id);
    return response;
  }

  Future<ResponseModel> updateBusinesslist({
    auth,
    bool? isLoading,
    modulelistJsonString,
  }) async {
    var response = await connectHelper.updateBusinesslist(
      auth: auth,
      isLoading: isLoading,
      modulelistJsonString: modulelistJsonString,
    );
    return response;
  }

  Future<ResponseModel> updateSPV({
    auth,
    bool? isLoading,
    modulelistJsonString,
  }) async {
    var response = await connectHelper.updateSPV(
      auth: auth,
      isLoading: isLoading,
      modulelistJsonString: modulelistJsonString,
    );
    return response;
  }

  Future<ResponseModel> deleteGoodsOrders(
      {auth, bool? isLoading, id, facility_id}) async {
    var response = await connectHelper.deleteGoodsOrders(
        auth: auth, isLoading: isLoading, id: id, facility_id: facility_id);
    return response;
  }

  Future<ResponseModel> updateFacilityList({
    auth,
    bool? isLoading,
    modulelistJsonString,
  }) async {
    var response = await connectHelper.updateFacilityList(
      auth: auth,
      isLoading: isLoading,
      modulelistJsonString: modulelistJsonString,
    );
    return response;
  }

  Future<ResponseModel> getCompetencyList({
    required String auth,
    bool? isLoading,
  }) async =>
      await connectHelper.getCompetencyList(
        auth: auth,
        isLoading: isLoading ?? false,
      );

  Future<ResponseModel> createCompetency({
    auth,
    bool? isLoading,
    competencyJsonString,
  }) async {
    var response = await connectHelper.createCompetency(
        auth: auth,
        isLoading: isLoading,
        competencyJsonString: competencyJsonString);
    return response;
  }

  Future<ResponseModel> updateCompetency({
    auth,
    bool? isLoading,
    competencyJsonString,
  }) async {
    var response = await connectHelper.updateCompetency(
      auth: auth,
      isLoading: isLoading,
      competencyJsonString: competencyJsonString,
    );
    return response;
  }

  Future<ResponseModel> deleteCompetencyList({
    auth,
    bool? isLoading,
    checklist_id,
  }) async {
    var response = await connectHelper.deleteCompetencyList(
        auth: auth, isLoading: isLoading, checklist_id: checklist_id);
    return response;
  }

  Future<ResponseModel> createPermitType({
    auth,
    bool? isLoading,
    checklistJsonString,
  }) async {
    var response = await connectHelper.createPermitType(
        auth: auth,
        isLoading: isLoading,
        checklistJsonString: checklistJsonString);
    return response;
  }

  Future<ResponseModel> deletePermitType({
    auth,
    bool? isLoading,
    permit_id,
  }) async {
    var response = await connectHelper.deletePermitType(
        auth: auth, isLoading: isLoading, permit_id: permit_id);
    return response;
  }

  Future<ResponseModel> deleteSafetyMeasure({
    auth,
    bool? isLoading,
    id,
  }) async {
    var response = await connectHelper.deleteSafetyMeasure(
        auth: auth, isLoading: isLoading, id: id);
    return response;
  }

  Future<ResponseModel> updatePermitType({
    auth,
    bool? isLoading,
    checklistJsonString,
  }) async {
    var response = await connectHelper.updatePermitType(
      auth: auth,
      isLoading: isLoading,
      checklistJsonString: checklistJsonString,
    );
    return response;
  }

  Future<ResponseModel> createRoleList({
    auth,
    bool? isLoading,
    modulelistJsonString,
  }) async {
    var response = await connectHelper.createRoleList(
        auth: auth,
        isLoading: isLoading,
        modulelistJsonString: modulelistJsonString);
    return response;
  }

  Future<ResponseModel> updateRoleList({
    auth,
    bool? isLoading,
    modulelistJsonString,
  }) async {
    var response = await connectHelper.updateRoleList(
      auth: auth,
      isLoading: isLoading,
      modulelistJsonString: modulelistJsonString,
    );
    return response;
  }

  Future<ResponseModel> deleteRole({
    auth,
    bool? isLoading,
    module_id,
  }) async {
    var response = await connectHelper.deleteRole(
        auth: auth, isLoading: isLoading, module_id: module_id);
    return response;
  }

  Future<ResponseModel> createDesignation({
    auth,
    bool? isLoading,
    designationJsonString,
  }) async {
    var response = await connectHelper.createDesignation(
        auth: auth,
        isLoading: isLoading,
        designationJsonString: designationJsonString);
    return response;
  }

  Future<ResponseModel> updateDesignation({
    auth,
    bool? isLoading,
    designationJsonString,
  }) async {
    var response = await connectHelper.updateDesignation(
      auth: auth,
      isLoading: isLoading,
      designationJsonString: designationJsonString,
    );
    return response;
  }

  Future<ResponseModel> createResponsibility({
    auth,
    bool? isLoading,
    designationJsonString,
  }) async {
    var response = await connectHelper.createResponsibility(
        auth: auth,
        isLoading: isLoading,
        designationJsonString: designationJsonString);
    return response;
  }

  Future<ResponseModel> updateResponsibility({
    auth,
    bool? isLoading,
    designationJsonString,
  }) async {
    var response = await connectHelper.updateResponsibility(
      auth: auth,
      isLoading: isLoading,
      designationJsonString: designationJsonString,
    );
    return response;
  }

  Future<ResponseModel> deleteDesignation({
    auth,
    bool? isLoading,
    module_id,
  }) async {
    var response = await connectHelper.deleteDesignation(
        auth: auth, isLoading: isLoading, module_id: module_id);
    return response;
  }

  Future<ResponseModel> deleteResponsibility({
    auth,
    bool? isLoading,
    module_id,
  }) async {
    var response = await connectHelper.deleteResponsibility(
        auth: auth, isLoading: isLoading, module_id: module_id);
    return response;
  }

  Future<ResponseModel> createBusinessType({
    auth,
    bool? isLoading,
    businessTypeJsonString,
  }) async {
    var response = await connectHelper.createBusinessType(
        auth: auth,
        isLoading: isLoading,
        businessTypeJsonString: businessTypeJsonString);
    return response;
  }

  Future<ResponseModel> deleteBusinessType({
    auth,
    bool? isLoading,
    businesstype_id,
  }) async {
    var response = await connectHelper.deleteBusinessType(
        auth: auth, isLoading: isLoading, businesstype_id: businesstype_id);
    return response;
  }

  Future<ResponseModel> updateBusinessType({
    auth,
    bool? isLoading,
    businessTypeJsonString,
  }) async {
    var response = await connectHelper.updateBusinessType(
      auth: auth,
      isLoading: isLoading,
      businessTypeJsonString: businessTypeJsonString,
    );
    return response;
  }

  Future<ResponseModel> getMrsList(
          {required String auth,
          int? facilityId,
          bool? isLoading,
          dynamic startDate,
          dynamic endDate,
          int? userId}) async =>
      await connectHelper.getMrsList(
          auth: auth,
          facilityId: facilityId ?? 0,
          isLoading: isLoading ?? false,
          startDate: startDate,
          endDate: endDate,
          userId: userId);
  Future<ResponseModel> getPlantStockList(
          {required String auth,
          int? facilityId,
          bool? isLoading,
          dynamic startDate,
          dynamic endDate,
          int? userId,
          List<int>? selectedAssetsNameIdList}) async =>
      await connectHelper.getPlantStockList(
          auth: auth,
          facilityId: facilityId ?? 0,
          isLoading: isLoading ?? false,
          startDate: startDate,
          endDate: endDate,
          userId: userId,
          selectedAssetsNameIdList: selectedAssetsNameIdList);
  Future<ResponseModel> getPlantStockListReturn({
    required String auth,
    int? facilityId,
    bool? isLoading,
    int? mrsId,
  }) async =>
      await connectHelper.getPlantStockListReturn(
          auth: auth,
          facilityId: facilityId ?? 0,
          isLoading: isLoading ?? false,
          mrsId: mrsId);

  Future<ResponseModel> getFaultyMaterialReportList({
    required String auth,
    int? facilityId,
    bool? isLoading,
    dynamic startDate,
    dynamic endDate,
  }) async =>
      await connectHelper.getFaultyMaterialReportList(
        auth: auth,
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
        startDate: startDate,
        endDate: endDate,
      );
  Future<ResponseModel> getEquipmentAssetsList({
    String? auth,
    bool? isLoading,
    int? facilityId,
  }) async {
    return await connectHelper.getEquipmentAssetsList(
      auth: auth,
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }

  Future<ResponseModel> createMrs({
    required String auth,
    createMrsJsonString,
    type,
    bool? isLoading,
  }) async =>
      await connectHelper.createMrs(
        auth: auth,
        createMrsJsonString: createMrsJsonString,
        type: type,
        isLoading: isLoading ?? false,
      );
  Future<ResponseModel> createPmPlan({
    required String auth,
    createPmPlanJsonString,
    bool? isLoading,
  }) async =>
      await connectHelper.createPmPlan(
        auth: auth,
        createPmPlanJsonString: createPmPlanJsonString,
        isLoading: isLoading ?? false,
      );
  Future<ResponseModel> updatePmPlan({
    required String auth,
    createPmPlanJsonString,
    bool? isLoading,
  }) async =>
      await connectHelper.updatePmPlan(
        auth: auth,
        createPmPlanJsonString: createPmPlanJsonString,
        isLoading: isLoading ?? false,
      );
  Future<ResponseModel> getIncidentRiskTypeList({
    // int? job_type_id,
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getIncidentRiskTypeList(
      isLoading: isLoading,
      auth: auth,
      // job_type_id: job_type_id,
      // businessType: businessType,
      // blockId: blockId,
      // categoryIds: categoryIds,
    );
  }

  Future<ResponseModel> getInsuranceProvider({
    // int? job_type_id,
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getInsuranceProvider(
      isLoading: isLoading,
      auth: auth,
      // job_type_id: job_type_id,
      // businessType: businessType,
      // blockId: blockId,
      // categoryIds: categoryIds,
    );
  }

  Future<ResponseModel> createRiskType({
    auth,
    bool? isLoading,
    riskTypeJsonString,
  }) async {
    var response = await connectHelper.createRiskType(
        auth: auth,
        isLoading: isLoading,
        riskTypeJsonString: riskTypeJsonString);
    return response;
  }

  Future<ResponseModel> deleteRiskType({
    auth,
    bool? isLoading,
    businesstype_id,
  }) async {
    var response = await connectHelper.deleteRiskType(
        auth: auth, isLoading: isLoading, businesstype_id: businesstype_id);
    return response;
  }

  Future<ResponseModel> updateRiskType({
    auth,
    bool? isLoading,
    riskTypeJsonString,
  }) async {
    var response = await connectHelper.updateRiskType(
      auth: auth,
      isLoading: isLoading,
      riskTypeJsonString: riskTypeJsonString,
    );
    return response;
  }

  Future<ResponseModel> getMrsDetails({
    String? auth,
    int? mrsId,
    required int facilityId,
    bool? isLoading,
  }) async {
    return await connectHelper.getMrsDetails(
        auth: auth, mrsId: mrsId, isLoading: isLoading, facilityId: facilityId);
  }

  Future<ResponseModel> getPmPlanDetails({
    String? auth,
    required int facilityId,
    int? pmPlanId,
    bool? isLoading,
  }) async {
    return await connectHelper.getPmPlanDetails(
      auth: auth,
      pmPlanId: pmPlanId,
      facilityId: facilityId,
      isLoading: isLoading,
    );
  }

  Future<ResponseModel> getAuditPlanDetails({
    String? auth,
    required int facilityId,
    int? auditPlanId,
    bool? isLoading,
  }) async {
    return await connectHelper.getAuditPlanDetails(
      auth: auth,
      auditPlanId: auditPlanId,
      facilityId: facilityId,
      isLoading: isLoading,
    );
  }

  Future<ResponseModel> createInventoryStatus({
    auth,
    bool? isLoading,
    checkpointJsonString,
  }) async {
    var response = await connectHelper.createInventoryStatus(
        auth: auth,
        isLoading: isLoading,
        checkpointJsonString: checkpointJsonString);
    return response;
  }

  Future<ResponseModel> deleteInventoryStatus({
    auth,
    bool? isLoading,
    check_point_id,
  }) async {
    var response = await connectHelper.deleteInventoryStatus(
        auth: auth, isLoading: isLoading, check_point_id: check_point_id);
    return response;
  }

  Future<ResponseModel> updateInventoryStatus({
    auth,
    bool? isLoading,
    checklistJsonString,
  }) async {
    var response = await connectHelper.updateInventoryStatus(
      auth: auth,
      isLoading: isLoading,
      checklistJsonString: checklistJsonString,
    );
    return response;
  }

  Future<ResponseModel> createInventoryType({
    auth,
    bool? isLoading,
    checkpointJsonString,
  }) async {
    var response = await connectHelper.createInventoryType(
        auth: auth,
        isLoading: isLoading,
        checkpointJsonString: checkpointJsonString);
    return response;
  }

  Future<ResponseModel> deleteInventoryType({
    auth,
    bool? isLoading,
    check_point_id,
  }) async {
    var response = await connectHelper.deleteInventoryType(
        auth: auth, isLoading: isLoading, check_point_id: check_point_id);
    return response;
  }

  Future<ResponseModel> updateInventoryType({
    auth,
    bool? isLoading,
    checklistJsonString,
  }) async {
    var response = await connectHelper.updateInventoryType(
      auth: auth,
      isLoading: isLoading,
      checklistJsonString: checklistJsonString,
    );
    return response;
  }

  Future<ResponseModel> createInventoryCategory({
    auth,
    bool? isLoading,
    checkpointJsonString,
  }) async {
    var response = await connectHelper.createInventoryCategory(
        auth: auth,
        isLoading: isLoading,
        checkpointJsonString: checkpointJsonString);
    return response;
  }

  Future<ResponseModel> deleteInventoryCategory({
    auth,
    bool? isLoading,
    check_point_id,
  }) async {
    var response = await connectHelper.deleteInventoryCategory(
        auth: auth, isLoading: isLoading, check_point_id: check_point_id);
    return response;
  }

  Future<ResponseModel> updateInventoryCategory({
    auth,
    bool? isLoading,
    checklistJsonString,
  }) async {
    var response = await connectHelper.updateInventoryCategory(
      auth: auth,
      isLoading: isLoading,
      checklistJsonString: checklistJsonString,
    );
    return response;
  }

  Future<ResponseModel> updateBlockType({
    auth,
    bool? isLoading,
    checklistJsonString,
  }) async {
    var response = await connectHelper.updateBlockType(
      auth: auth,
      isLoading: isLoading,
      checklistJsonString: checklistJsonString,
    );
    return response;
  }

  Future<ResponseModel> approveMrs(
      {auth,
      bool? isLoading,
      int? type,
      approvetoJsonString,
      int? facility_id}) async {
    var response = await connectHelper.approveMrs(
        auth: auth,
        isLoading: isLoading,
        type: type,
        approvetoJsonString: approvetoJsonString,
        facility_id: facility_id);
    return response;
  }

  Future<ResponseModel> rejectMrs(
      {auth, bool? isLoading, rejecttoJsonString, facility_id}) async {
    var response = await connectHelper.rejectMrs(
        auth: auth,
        isLoading: isLoading,
        rejecttoJsonString: rejecttoJsonString,
        facility_id: facility_id);
    return response;
  }

  Future<ResponseModel> editMrs({
    required String auth,
    editMrsJsonString,
    bool? isLoading,
  }) async =>
      await connectHelper.editMrs(
        auth: auth,
        editMrsJsonString: editMrsJsonString,
        isLoading: isLoading ?? false,
      );

  Future<ResponseModel> getInsuranceStatus({
    // int? job_type_id,
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getInsuranceStatus(
      isLoading: isLoading,
      auth: auth,
    );
  }

  Future<ResponseModel> getCalibrationCertificate({
    required String auth,
    int? facilityId,
    int? type,
    bool? isLoading,
  }) async =>
      await connectHelper.getCalibrationAssets(
        auth: auth,
        facilityId: facilityId ?? 0,
        type: type,
        isLoading: isLoading ?? false,
      );

  Future<ResponseModel> getWarrantyCertificate({
    required String auth,
    int? type,
    bool? isLoading,
  }) async =>
      await connectHelper.getWarrantyCertificate(
        auth: auth,
        type: type,
        isLoading: isLoading ?? false,
      );

  Future<ResponseModel> saveRoleNotification({
    auth,
    bool? isLoading,
    saveRoleNotificationJsonString,
  }) async {
    var response = await connectHelper.saveRoleNotification(
        auth: auth,
        isLoading: isLoading,
        saveRoleNotificationJsonString: saveRoleNotificationJsonString);
    return response;
  }

  Future<ResponseModel> issueMrs(
      {auth,
      bool? isLoading,
      issuetoJsonString,
      int? type,
      int? facility_id}) async {
    var response = await connectHelper.issueMrs(
        auth: auth,
        isLoading: isLoading,
        type: type,
        issuetoJsonString: issuetoJsonString,
        facility_id: facility_id);
    return response;
  }

  Future<ResponseModel> approveIssueMrs(
      {auth, bool? isLoading, issuemrsapprovetoJsonString, facility_id}) async {
    var response = await connectHelper.approveIssueMrs(
        auth: auth,
        isLoading: isLoading,
        issuemrsapprovetoJsonString: issuemrsapprovetoJsonString,
        facility_id: facility_id);
    return response;
  }

  Future<ResponseModel> rejectIssueMrs(
      {auth, bool? isLoading, rejectIssuetoJsonString, facility_id}) async {
    var response = await connectHelper.rejectIssueMrs(
        auth: auth,
        isLoading: isLoading,
        rejectIssuetoJsonString: rejectIssuetoJsonString,
        facility_id: facility_id);
    return response;
  }

  Future<ResponseModel> getReturnMrsList(
          {required String auth,
          int? facilityId,
          bool? isLoading,
          int? userId}) async =>
      await connectHelper.getReturnMrsList(
          auth: auth,
          facilityId: facilityId ?? 0,
          isLoading: isLoading ?? false,
          userId: userId);
  Future<ResponseModel> scheduleLinkToPermit(
          {required String auth,
          scheduleId,
          permitId,
          activity,
          bool? isLoading,
          type,
          facilityId}) async =>
      await connectHelper.scheduleLinkToPermit(
          auth: auth,
          scheduleId: scheduleId,
          permitId: permitId,
          activity: activity,
          isLoading: isLoading ?? false,
          type: type,
          facilityId: facilityId);
  Future<ResponseModel> vegscheduleLinkToPermit(
          {required String auth,
          scheduleId,
          permitId,
          activity,
          bool? isLoading,
          type,
          vegplanId,
          vegexid,
          int? facilityId}) async =>
      await connectHelper.vegscheduleLinkToPermit(
          auth: auth,
          scheduleId: scheduleId,
          permitId: permitId,
          activity: activity,
          isLoading: isLoading ?? false,
          type: type,
          vegplanId: vegplanId,
          vegexid: vegexid,
          facilityId: facilityId);
  Future<ResponseModel> setPmTask(
          {required String auth,
          scheduleId,
          bool? isLoading,
          int? facility_id}) async =>
      await connectHelper.setPmTask(
          auth: auth,
          scheduleId: scheduleId,
          isLoading: isLoading ?? false,
          facility_id: facility_id);
  Future<ResponseModel> startAuditTask({
    required String auth,
    auditTaskId,
    bool? isLoading,
  }) async =>
      await connectHelper.startAuditTask(
        auth: auth,
        auditTaskId: auditTaskId,
        isLoading: isLoading ?? false,
      );
  Future<ResponseModel> approveReturnMrs({
    auth,
    bool? isLoading,
    approvetoJsonString,
  }) async {
    var response = await connectHelper.approveReturnMrs(
        auth: auth,
        isLoading: isLoading,
        approvetoJsonString: approvetoJsonString);
    return response;
  }

  Future<ResponseModel> approveGoodsOrder({
    required String auth,
    goodsOrderApproveJsonString,
    bool? isLoading,
  }) async =>
      await connectHelper.approveGoodsOrder(
        auth: auth,
        goodsOrderApproveJsonString: goodsOrderApproveJsonString,
        isLoading: isLoading ?? false,
      );
  // Future<ResponseModel> approveGoodsOrder({
  //   auth,
  //   bool? isLoading,
  //   approvetoJsonString,
  // }) async {
  //   var response = await connectHelper.approveGoodsOrder(
  //       auth: auth,
  //       isLoading: isLoading,
  //       approvetoJsonString: approvetoJsonString);
  //   return response;
  // }

  Future<ResponseModel> approveGOReceive({
    auth,
    bool? isLoading,
    approvetoJsonString,
  }) async {
    var response = await connectHelper.approveGOReceive(
        auth: auth,
        isLoading: isLoading,
        approvetoJsonString: approvetoJsonString);
    return response;
  }

  Future<ResponseModel> rejectGoodsOrder({
    required String auth,
    goodsOrderRejectJsonString,
    bool? isLoading,
  }) async =>
      await connectHelper.rejectGoodsOrder(
        auth: auth,
        goodsOrderRejectJsonString: goodsOrderRejectJsonString,
        isLoading: isLoading ?? false,
      );
  // Future<ResponseModel> rejectGoodsOrder({
  //   auth,
  //   bool? isLoading,
  //   rejecttoJsonString,
  // }) async {
  //   var response = await connectHelper.rejectGoodsOrder(
  //       auth: auth,
  //       isLoading: isLoading,
  //       rejecttoJsonString: rejecttoJsonString);
  //   return response;
  // }

  Future<ResponseModel> rejectRetrunMrs({
    auth,
    bool? isLoading,
    rejecttoJsonString,
  }) async {
    var response = await connectHelper.rejectRetrunMrs(
        auth: auth,
        isLoading: isLoading,
        rejecttoJsonString: rejecttoJsonString);
    return response;
  }

  Future<ResponseModel> getReturnMrsDetails({
    String? auth,
    required int facilityId,
    int? mrsId,
    bool? isLoading,
  }) async {
    return await connectHelper.getReturnMrsDetails(
      auth: auth,
      mrsId: mrsId,
      facilityId: facilityId,
      isLoading: isLoading,
    );
  }

  Future<ResponseModel> createJobType({
    auth,
    bool? isLoading,
    jobTypeJsonString,
  }) async {
    var response = await connectHelper.createJobType(
        auth: auth, isLoading: isLoading, jobTypeJsonString: jobTypeJsonString);
    return response;
  }

  Future<ResponseModel> createSafetyMeasure({
    auth,
    bool? isLoading,
    safetyMeasurelistJsonString,
  }) async {
    var response = await connectHelper.createSafetyMeasure(
        auth: auth,
        isLoading: isLoading,
        safetyMeasurelistJsonString: safetyMeasurelistJsonString);
    return response;
  }

  Future<ResponseModel> deleteJobType({
    auth,
    bool? isLoading,
    check_point_id,
  }) async {
    var response = await connectHelper.deleteJobType(
        auth: auth, isLoading: isLoading, check_point_id: check_point_id);
    return response;
  }

  Future<ResponseModel> updateTbt({
    auth,
    bool? isLoading,
    tbtJsonString,
  }) async {
    var response = await connectHelper.updateTbt(
      auth: auth,
      isLoading: isLoading,
      tbtJsonString: tbtJsonString,
    );
    return response;
  }

  Future<ResponseModel> deleteSopType({
    auth,
    bool? isLoading,
    check_point_id,
  }) async {
    var response = await connectHelper.deleteSopType(
        auth: auth, isLoading: isLoading, check_point_id: check_point_id);
    return response;
  }

  Future<ResponseModel> updateSop({
    auth,
    bool? isLoading,
    tbtJsonString,
  }) async {
    var response = await connectHelper.updateSop(
      auth: auth,
      isLoading: isLoading,
      tbtJsonString: tbtJsonString,
    );
    return response;
  }

  Future<ResponseModel> getCmmsItemList({
    String? auth,
    bool? isLoading,
    int? facilityId,
    int? userId,
  }) async {
    return await connectHelper.getCmmsItemList(
        auth: auth,
        isLoading: isLoading,
        facilityId: facilityId,
        userId: userId);
  }

  Future<ResponseModel> createReturnMrs({
    required String auth,
    createReturnMrsJsonString,
    bool? isLoading,
  }) async =>
      await connectHelper.createReturnMrs(
        auth: auth,
        createReturnMrsJsonString: createReturnMrsJsonString,
        isLoading: isLoading ?? false,
      );
  Future<ResponseModel> updateReturnMrs({
    required String auth,
    createReturnMrsJsonString,
    bool? isLoading,
  }) async =>
      await connectHelper.updateReturnMrs(
        auth: auth,
        createReturnMrsJsonString: createReturnMrsJsonString,
        isLoading: isLoading ?? false,
      );
  Future<ResponseModel> getEmployeeStockReportList(
      {String? auth,
      bool? isLoading,
      int? facilityId,
      int? userId,
      dynamic startDate,
      dynamic endDate}) async {
    return await connectHelper.getEmployeeStockReportList(
        auth: auth,
        isLoading: isLoading,
        facilityId: facilityId,
        userId: userId,
        startDate: startDate,
        endDate: endDate);
  }

  Future<ResponseModel> getPmPlanList(
          {required String auth,
          int? facilityId,
          bool? isLoading,
          dynamic startDate,
          dynamic endDate}) async =>
      await connectHelper.getPmPlanList(
          auth: auth,
          facilityId: facilityId ?? 0,
          isLoading: isLoading ?? false,
          startDate: startDate,
          endDate: endDate);
  Future<ResponseModel> getAuditPlanList(
          {required String auth,
          int? facilityId,
          bool? isLoading,
          dynamic startDate,
          dynamic endDate,
          int? type}) async =>
      await connectHelper.getAuditPlanList(
          auth: auth,
          facilityId: facilityId ?? 0,
          isLoading: isLoading ?? false,
          startDate: startDate,
          endDate: endDate,
          type: type);
  Future<ResponseModel> ClosePMTaskExecution({
    required String auth,
    ClosePMTaskExecutionJsonString,
    bool? isLoading,
  }) async =>
      await connectHelper.ClosePMTaskExecution(
        auth: auth,
        ClosePMTaskExecutionJsonString: ClosePMTaskExecutionJsonString,
        isLoading: isLoading ?? false,
      );
  Future<ResponseModel> rejectPmTaskExecution({
    required String auth,
    rejecttoJsonString,
    bool? isLoading,
  }) async =>
      await connectHelper.rejectPmTaskExecution(
        auth: auth,
        rejecttoJsonString: rejecttoJsonString,
        isLoading: isLoading ?? false,
      );
  Future<ResponseModel> rejectCancelPmTaskExecution({
    required String auth,
    rejectCanceltoJsonString,
    bool? isLoading,
  }) async =>
      await connectHelper.rejectCancelPmTaskExecution(
        auth: auth,
        rejectCanceltoJsonString: rejectCanceltoJsonString,
        isLoading: isLoading ?? false,
      );
  Future<ResponseModel> approvePmTaskExecution({
    required String auth,
    approvetoJsonString,
    bool? isLoading,
  }) async =>
      await connectHelper.approvePmTaskExecution(
        auth: auth,
        approvetoJsonString: approvetoJsonString,
        isLoading: isLoading ?? false,
      );
  Future<ResponseModel> approveCancelPmTaskExecution({
    required String auth,
    approveCanceltoJsonString,
    bool? isLoading,
  }) async =>
      await connectHelper.approveCancelPmTaskExecution(
        auth: auth,
        approveCanceltoJsonString: approveCanceltoJsonString,
        isLoading: isLoading ?? false,
      );
  Future<ResponseModel> CancelPMTask({
    required String auth,
    CancelPMTaskJsonString,
    bool? isLoading,
  }) async =>
      await connectHelper.CancelPMTask(
        auth: auth,
        CancelPMTaskJsonString: CancelPMTaskJsonString,
        isLoading: isLoading ?? false,
      );

  Future<ResponseModel> assignToPmTask(
          {required String auth,
          int? assignId,
          int? taskId,
          required bool isLoading,
          int? facility_id}) async =>
      await connectHelper.assignToPmTask(
          auth: auth,
          assignId: assignId,
          taskId: taskId,
          isLoading: isLoading,
          facility_id: facility_id);
  Future<ResponseModel> assignAuditTask({
    required String auth,
    int? assignId,
    int? taskId,
    required bool isLoading,
  }) async =>
      await connectHelper.assignAuditTask(
        auth: auth,
        assignId: assignId,
        taskId: taskId,
        isLoading: isLoading,
      );
  Future<ResponseModel> assignToMC(
          {required String auth,
          int? assignId,
          int? taskId,
          required bool isLoading,
          int? facility_id}) async =>
      await connectHelper.assignToMC(
          auth: auth,
          assignId: assignId,
          taskId: taskId,
          isLoading: isLoading,
          facility_id: facility_id);
  Future<ResponseModel> assignToVeg(
          {required String auth,
          int? assignId,
          int? taskId,
          required bool isLoading,
          int? facilityId}) async =>
      await connectHelper.assignToVeg(
          auth: auth,
          assignId: assignId,
          taskId: taskId,
          isLoading: isLoading,
          facilityId: facilityId);
  Future<ResponseModel> UpdatePMTaskExecution(
          {required String auth,
          updatePMTaskExecutionJsonString,
          bool? isLoading,
          int? facility_id}) async =>
      await connectHelper.UpdatePMTaskExecution(
          auth: auth,
          updatePMTaskExecutionJsonString: updatePMTaskExecutionJsonString,
          isLoading: isLoading ?? false,
          facility_id: facility_id);
  Future<ResponseModel> cloneSchedule(
          {required String auth,
          required int from_schedule_id,
          required int to_schedule_id,
          required int taskId,
          required int cloneJobs,
          bool? isloading,
          int? facility_id}) async =>
      await connectHelper.cloneSchedule(
          auth: auth,
          from_schedule_id: from_schedule_id,
          to_schedule_id: to_schedule_id,
          taskId: taskId,
          cloneJobs: cloneJobs,
          isloading: isloading ?? false,
          facility_id: facility_id);
  Future<ResponseModel> rejectShecduleExecution(
          {required String auth,
          rejecttoJsonString,
          bool? isLoading,
          int? facility_id}) async =>
      await connectHelper.rejectShecduleExecution(
          auth: auth,
          rejecttoJsonString: rejecttoJsonString,
          isLoading: isLoading ?? false,
          facility_id: facility_id);
  Future<ResponseModel> approveShecduleExecution(
          {required String auth,
          approvetoJsonString,
          bool? isLoading,
          int? facility_id}) async =>
      await connectHelper.approveShecduleExecution(
          auth: auth,
          approvetoJsonString: approvetoJsonString,
          isLoading: isLoading ?? false,
          facility_id: facility_id);
  Future<ResponseModel> endRejectExecution(
          {required String auth,
          rejecttoJsonString,
          bool? isLoading,
          int? facility_id}) async =>
      await connectHelper.endRejectExecution(
          auth: auth,
          rejecttoJsonString: rejecttoJsonString,
          isLoading: isLoading ?? false,
          facility_id: facility_id);
  Future<ResponseModel> endApproveExecution(
          {required String auth,
          approvetoJsonString,
          bool? isLoading,
          int? facility_id}) async =>
      await connectHelper.endApproveExecution(
        auth: auth,
        facility_id: facility_id,
        approvetoJsonString: approvetoJsonString,
        isLoading: isLoading ?? false,
      );

  Future<ResponseModel> abandoneRejectExecution(
          {required String auth,
          rejecttoJsonString,
          bool? isLoading,
          int? facility_id}) async =>
      await connectHelper.abandoneRejectExecution(
          auth: auth,
          rejecttoJsonString: rejecttoJsonString,
          isLoading: isLoading ?? false,
          facility_id: facility_id);
  Future<ResponseModel> abandonedApproveExecution(
          {required String auth,
          approvetoJsonString,
          bool? isLoading,
          int? facility_id}) async =>
      await connectHelper.abandonedApproveExecution(
          auth: auth,
          approvetoJsonString: approvetoJsonString,
          isLoading: isLoading ?? false,
          facility_id: facility_id);

  Future<ResponseModel> getAssetCategoryList({
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getAssetCategoryList(
      isLoading: isLoading,
      auth: auth,
      // job_type_id: job_type_id,
      // businessType: businessType,
      // blockId: blockId,
      // categoryIds: categoryIds,
    );
  }

  Future<ResponseModel> getAssetTypeSMList({
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getAssetTypeSMList(
      auth: auth,
      isLoading: isLoading,
    );
  }

  Future<ResponseModel> getUnitMeasurementList({
    // int? facilityId,
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getUnitMeasurementList(
      isLoading: isLoading,
      auth: auth,
      // facilityId: facilityId,
    );
  }

  Future<ResponseModel> createAuditNumber({
    auth,
    bool? isLoading,
    checkAuditJsonString,
  }) async {
    var response = await connectHelper.createAuditNumber(
        auth: auth,
        isLoading: isLoading,
        checkAuditJsonString: checkAuditJsonString);
    return response;
  }

  Future<ResponseModel> updateAuditNumber({
    auth,
    bool? isLoading,
    checkAuditJsonString,
  }) async {
    var response = await connectHelper.updateAuditNumber(
        auth: auth,
        isLoading: isLoading,
        checkAuditJsonString: checkAuditJsonString);
    return response;
  }

  Future<ResponseModel> createAssetSM({
    auth,
    bool? isLoading,
    assetListJsonString,
  }) async {
    var response = await connectHelper.createAssetSM(
        auth: auth,
        isLoading: isLoading,
        assetListJsonString: assetListJsonString);
    return response;
  }

  Future<ResponseModel> transferItem({
    required String auth,
    transferItemJsonString,
    bool? isLoading,
  }) async =>
      await connectHelper.transferItem(
        auth: auth,
        transferItemJsonString: transferItemJsonString,
        isLoading: isLoading ?? false,
      );

  Future<ResponseModel> getGrievanceList({
    required String auth,
    int? facilityId,
    bool? isLoading,
    bool? self_view,
    String? start_date,
    String? end_date,
  }) async =>
      await connectHelper.getGrievanceList(
        auth: auth,
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
        self_view: self_view,
        start_date: start_date,
        end_date: end_date,
      );

  Future<ResponseModel> getGrievanceDetails({
    required String auth,
    int? id,
    bool? isLoading,
  }) async =>
      await connectHelper.getGrievanceDetails(
        auth: auth,
        id: id ?? 0,
        isLoading: isLoading ?? false,
      );

  Future<ResponseModel> updateGrievanceDetails({
    auth,
    grievanceJson,
    bool? isLoading,
  }) async {
    var response = await connectHelper.updateGrievanceDetails(
      auth: auth,
      grievanceJson: grievanceJson,
      isLoading: isLoading,
    );
    return response;
  }

  Future<ResponseModel> deleteGrievanceDetails({
    auth,
    int? Id,
    bool? isLoading,
  }) async {
    var response = await connectHelper.deleteGrievanceDetails(
      auth: auth,
      Id: Id,
      isLoading: isLoading,
    );
    return response;
  }

  //deleteKaizen
  Future<ResponseModel> deleteKaizen({
    auth,
    int? Id,
    bool? isLoading,
  }) async {
    var response = await connectHelper.deleteKaizen(
      auth: auth,
      Id: Id,
      isLoading: isLoading,
    );
    return response;
  }

  //deleteHealth
  Future<ResponseModel> deleteHealth({
    auth,
    int? Id,
    bool? isLoading,
  }) async {
    var response = await connectHelper.deleteHealth(
      auth: auth,
      Id: Id,
      isLoading: isLoading,
    );
    return response;
  }

  //deleteVisitNotice
  Future<ResponseModel> deleteVisitNotice({
    auth,
    int? Id,
    bool? isLoading,
  }) async {
    var response = await connectHelper.deleteVisitNotice(
      auth: auth,
      Id: Id,
      isLoading: isLoading,
    );
    return response;
  }

  //deleteFuel
  Future<ResponseModel> deleteFuel({
    auth,
    int? Id,
    bool? isLoading,
  }) async {
    var response = await connectHelper.deleteFuel(
      auth: auth,
      Id: Id,
      isLoading: isLoading,
    );
    return response;
  }

//deletePlantation
  Future<ResponseModel> deletePlantation({
    auth,
    int? Id,
    bool? isLoading,
  }) async {
    var response = await connectHelper.deletePlantation(
      auth: auth,
      Id: Id,
      isLoading: isLoading,
    );
    return response;
  }

  Future<ResponseModel> getGrievanceType({
    String? auth,
    bool? isLoading,
  }) async =>
      await connectHelper.getGrievanceType(
        auth: auth,
        isLoading: isLoading,
      );
  Future<ResponseModel> getGrievanceTypeById({
    String? auth,
    int? grievanceTypeId,
    bool? isLoading,
  }) async =>
      await connectHelper.getGrievanceTypeById(
        auth: auth,
        grievanceTypeId: grievanceTypeId,
        isLoading: isLoading,
      );

  Future<ResponseModel> createGrievanceType({
    auth,
    grievanceJson,
    bool? isLoading,
  }) async {
    var response = await connectHelper.createGrievanceType(
      auth: auth,
      grievanceJson: grievanceJson,
      isLoading: isLoading,
    );
    return response;
  }

  Future<ResponseModel> updateGrievanceType({
    auth,
    grievanceJson,
    bool? isLoading,
  }) async {
    var response = await connectHelper.updateGrievanceType(
      auth: auth,
      grievanceJson: grievanceJson,
      isLoading: isLoading,
    );
    return response;
  }

  Future<ResponseModel> deleteGrievanceType({
    auth,
    int? grievanceTypeId,
    bool? isLoading,
  }) async {
    var response = await connectHelper.deleteGrievanceType(
      auth: auth,
      grievanceTypeId: grievanceTypeId,
      isLoading: isLoading,
    );
    return response;
  }

  Future<ResponseModel> getResponsibilityList({
    required String auth,
    bool? isLoading,
  }) async {
    return await connectHelper.getResponsibilityList(
      auth: auth,
      isLoading: isLoading,
    );
  }

  Future<ResponseModel> saveGrievance({
    required String auth,
    grievance,
    bool? isLoading,
  }) async =>
      await connectHelper.saveGrievance(
        auth: auth,
        grievance: grievance,
        isLoading: isLoading ?? false,
      );

  Future<ResponseModel> createBodyInjured({
    auth,
    bool? isLoading,
    bodyInjuredJsonString,
  }) async {
    var response = await connectHelper.createBodyInjured(
        auth: auth,
        isLoading: isLoading,
        bodyInjuredJsonString: bodyInjuredJsonString);
    return response;
  }

  Future<ResponseModel> updateBodyInjured({
    auth,
    bool? isLoading,
    bodyInjuredJsonString,
  }) async {
    var response = await connectHelper.updateBodyInjured(
      auth: auth,
      isLoading: isLoading,
      bodyInjuredJsonString: bodyInjuredJsonString,
    );
    return response;
  }

  Future<ResponseModel> deleteBodyInjured({
    auth,
    bool? isLoading,
    bodypart_id,
  }) async {
    var response = await connectHelper.deleteBodyInjured(
        auth: auth, isLoading: isLoading, bodypart_id: bodypart_id);
    return response;
  }

  Future<ResponseModel> getBodyInjuredList({
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getBodyInjuredList(
      isLoading: isLoading,
      auth: auth,
    );
  }

  Future<ResponseModel> getVegetationPlanList({
    int? facility_id,
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getVegetationPlanList(
      isLoading: isLoading,
      auth: auth,
      facility_id: facility_id,
    );
  }

  Future<ResponseModel> createVegetationPlan(
          {required String auth,
          createVegetationPlans,
          bool? isLoading,
          int? facility_Id}) async =>
      await connectHelper.createVegetationPlan(
          auth: auth,
          createVegetationPlans: createVegetationPlans,
          isLoading: isLoading ?? false,
          facility_Id: facility_Id);

  Future<ResponseModel> getVegEquipmentModelList({
    int? facilityId,
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getVegEquipmentModelList(
      isLoading: isLoading,
      auth: auth,
      facilityId: facilityId,
    );
  }

  Future<ResponseModel> getVegPlanDetail({
    required String auth,
    required int facilityId,
    bool? isLoading,
    int? planId,
  }) async =>
      await connectHelper.getVegPlanDetail(
        auth: auth,
        plan_id: planId,
        facilityId: facilityId,
        isLoading: isLoading ?? false,
      );

  Future<ResponseModel> vegPlanApprovedButton(
          {required String auth,
          vegApproveJsonString,
          bool? isLoading,
          int? facilityId}) async =>
      await connectHelper.vegPlanApprovedButton(
          auth: auth,
          vegApproveJsonString: vegApproveJsonString,
          isLoading: isLoading ?? false,
          facilityId: facilityId);

  Future<ResponseModel> vegPlanRejectButton(
          {required String auth,
          vegRejectJsonString,
          bool? isLoading,
          int? facilityId}) async =>
      await connectHelper.vegPlanRejectButton(
          auth: auth,
          vegRejectJsonString: vegRejectJsonString,
          isLoading: isLoading ?? false,
          facilityId: facilityId);
  Future<ResponseModel> deleteVegPlan(
      {required String auth,
      bool? isLoading,
      required int planId,
      int? facilityId}) async {
    var response = await connectHelper.deleteVegPlan(
        auth: auth,
        isLoading: isLoading,
        planId: planId,
        facilityId: facilityId);
    return response;
  }

  Future<ResponseModel> deleteUser({
    auth,
    bool? isLoading,
    user_id,
  }) async {
    var response = await connectHelper.deleteUser(
        auth: auth, isLoading: isLoading, user_id: user_id);
    return response;
  }

  Future<ResponseModel> deletePmTask(
      {auth, bool? isLoading, task_id, facility_id}) async {
    var response = await connectHelper.deletePmTask(
        auth: auth,
        isLoading: isLoading,
        task_id: task_id,
        facility_id: facility_id);
    return response;
  }

  Future<ResponseModel> updateVegPlan(
          {required String auth,
          updateVegPlans,
          bool? isLoading,
          int? facilityId}) async =>
      await connectHelper.updateVegPlan(
          auth: auth,
          updateVegPlans: updateVegPlans,
          isLoading: isLoading ?? false,
          facilityId: facilityId);

  Future<ResponseModel> getVegTaskList({
    int? facility_id,
    dynamic startDate,
    dynamic endDate,
    required bool isLoading,
    required String auth,
    // String? start_date,
    // required String end_date,
  }) async {
    return await connectHelper.getVegTaskList(
        isLoading: isLoading,
        auth: auth,
        facility_id: facility_id,
        startDate: startDate,
        endDate: endDate
        // start_date: start_date,
        // end_date: end_date,
        );
  }

  Future<ResponseModel> getVegExecutionDetail({
    required int facilityId,
    required String auth,
    bool? isLoading,
    int? executionId,
  }) async =>
      await connectHelper.getVegExecutionDetail(
        auth: auth,
        facilityId: facilityId,
        executionId: executionId,
        isLoading: isLoading ?? false,
      );
  Future<ResponseModel> getVegTaskEquipmentList({
    required int facilityId,
    required String auth,
    bool? isLoading,
    int? executionId,
  }) async =>
      await connectHelper.getVegTaskEquipmentList(
        auth: auth,
        facilityId: facilityId,
        executionId: executionId,
        isLoading: isLoading ?? false,
      );
  Future<ResponseModel> startVegExecutionButton(
          {required String auth,
          int? executionId,
          bool? isLoading,
          int? facilityId}) async =>
      await connectHelper.startVegExecutionButton(
          auth: auth,
          executionId: executionId,
          isLoading: isLoading ?? false,
          facilityId: facilityId);

  Future<ResponseModel> endVegExecutionButton(
          {required String auth,
          int? executionId,
          bool? isLoading,
          int? facilityId}) async =>
      await connectHelper.endVegExecutionButton(
          auth: auth,
          executionId: executionId,
          isLoading: isLoading ?? false,
          facilityId: facilityId);

  Future<ResponseModel> abandonVegExecutionButton(
          {required String auth,
          abandoneJsonString,
          bool? isLoading,
          int? facilityId}) async =>
      await connectHelper.abandonVegExecutionButton(
          auth: auth,
          abandoneJsonString: abandoneJsonString,
          isLoading: isLoading ?? false,
          facilityId: facilityId);

  Future<ResponseModel> startVegExecutionScheduleButton(
          {required String auth,
          int? scheduleId,
          bool? isLoading,
          int? facilityId}) async =>
      await connectHelper.startVegExecutionScheduleButton(
          auth: auth,
          scheduleId: scheduleId,
          isLoading: isLoading ?? false,
          facilityId: facilityId);

  Future<ResponseModel> endVegScheduleExecutionButton(
          {required String auth,
          int? scheduleId,
          bool? isLoading,
          int? facilityId}) async =>
      await connectHelper.endVegScheduleExecutionButton(
          auth: auth,
          scheduleId: scheduleId,
          isLoading: isLoading ?? false,
          facilityId: facilityId);

  Future<ResponseModel> abandonVegScheduleExecutionButton({
    required String auth,
    abandoneScheduleJsonString,
    bool? isLoading,
  }) async =>
      await connectHelper.abandonVegScheduleExecutionButton(
        auth: auth,
        abandoneScheduleJsonString: abandoneScheduleJsonString,
        isLoading: isLoading ?? false,
      );

  Future<ResponseModel> updateVegScheduleExecution(
          {required String auth,
          updateVegJson,
          bool? isLoading,
          int? facilityId}) async =>
      await connectHelper.updateVegScheduleExecution(
          auth: auth,
          updateVegJson: updateVegJson,
          isLoading: isLoading ?? false,
          facilityId: facilityId);

  Future<ResponseModel> vegrejectShecduleExecution(
          {required String auth,
          rejecttoJsonString,
          bool? isLoading,
          int? facilityId}) async =>
      await connectHelper.vegrejectShecduleExecution(
          auth: auth,
          rejecttoJsonString: rejecttoJsonString,
          isLoading: isLoading ?? false,
          facilityId: facilityId);
  Future<ResponseModel> vegapproveShecduleExecution(
          {required String auth,
          approvetoJsonString,
          bool? isLoading,
          int? facilityId}) async =>
      await connectHelper.vegapproveShecduleExecution(
          auth: auth,
          approvetoJsonString: approvetoJsonString,
          isLoading: isLoading ?? false,
          facilityId: facilityId);

  Future<ResponseModel> vegendRejectExecution(
          {required String auth,
          rejecttoJsonString,
          bool? isLoading,
          int? facilityId}) async =>
      await connectHelper.vegendRejectExecution(
          auth: auth,
          rejecttoJsonString: rejecttoJsonString,
          isLoading: isLoading ?? false,
          facilityId: facilityId);
  Future<ResponseModel> vegendApproveExecution(
          {required String auth,
          approvetoJsonString,
          bool? isLoading,
          int? facilityId}) async =>
      await connectHelper.vegendApproveExecution(
          auth: auth,
          approvetoJsonString: approvetoJsonString,
          isLoading: isLoading ?? false,
          facilityId: facilityId);

  Future<ResponseModel> vegabandoneRejectExecution(
          {required String auth,
          rejecttoJsonString,
          bool? isLoading,
          int? facilityId}) async =>
      await connectHelper.vegabandoneRejectExecution(
          auth: auth,
          rejecttoJsonString: rejecttoJsonString,
          isLoading: isLoading ?? false,
          facilityId: facilityId);
  Future<ResponseModel> vegabandonedApproveExecution(
          {required String auth,
          approvetoJsonString,
          bool? isLoading,
          int? facilityId}) async =>
      await connectHelper.vegabandonedApproveExecution(
          auth: auth,
          approvetoJsonString: approvetoJsonString,
          isLoading: isLoading ?? false,
          facilityId: facilityId);

  Future<ResponseModel> createIncidentRiskType({
    auth,
    bool? isLoading,
    incidentRiskTypeJsonString,
  }) async {
    var response = await connectHelper.createIncidentRiskType(
        auth: auth,
        isLoading: isLoading,
        incidentRiskTypeJsonString: incidentRiskTypeJsonString);
    return response;
  }

  Future<ResponseModel> getIncidentRiskType({
    required bool isLoading,
    required int facilityId,
    required String auth,
  }) async {
    return await connectHelper.getIncidentRiskType(
      facilityId: facilityId,
      isLoading: isLoading,
      auth: auth,
    );
  }

  Future<ResponseModel> updateIncidentRiskType({
    auth,
    bool? isLoading,
    incidentRiskTypeJsonString,
  }) async {
    var response = await connectHelper.updateIncidentRiskType(
      auth: auth,
      isLoading: isLoading,
      incidentRiskTypeJsonString: incidentRiskTypeJsonString,
    );
    return response;
  }

  Future<ResponseModel> deleteIncidentRiskType({
    auth,
    bool? isLoading,
    risktype_id,
  }) async {
    var response = await connectHelper.deleteIncidentRiskType(
        auth: auth, isLoading: isLoading, risktype_id: risktype_id);
    return response;
  }

  Future<ResponseModel> createWorkType({
    auth,
    bool? isLoading,
    worktypeJsonString,
  }) async {
    var response = await connectHelper.createWorkType(
        auth: auth,
        isLoading: isLoading,
        worktypeJsonString: worktypeJsonString);
    return response;
  }

  Future<ResponseModel> createWorkTypeTool({
    auth,
    bool? isLoading,
    worktypetoolJsonString,
  }) async {
    var response = await connectHelper.createWorkTypeTool(
        auth: auth,
        isLoading: isLoading,
        worktypetoolJsonString: worktypetoolJsonString);
    return response;
  }

  Future<ResponseModel> deleteWorkType({
    auth,
    bool? isLoading,
    worktype_id,
  }) async {
    var response = await connectHelper.deleteWorkType(
        auth: auth, isLoading: isLoading, worktype_id: worktype_id);
    return response;
  }

  Future<ResponseModel> updateWorkType({
    auth,
    bool? isLoading,
    worktypeJsonString,
  }) async {
    var response = await connectHelper.updateWorkType(
      auth: auth,
      isLoading: isLoading,
      worktypeJsonString: worktypeJsonString,
    );
    return response;
  }

  Future<ResponseModel> createToolType({
    auth,
    String? tool_name,
    bool? isLoading,
  }) async {
    var response = await connectHelper.createToolType(
        auth: auth, isLoading: isLoading, tool_name: tool_name);
    return response;
  }

  Future<ResponseModel> createfreq({
    auth,
    freqJsonString,
    bool? isLoading,
  }) async {
    var response = await connectHelper.createfreq(
        auth: auth, isLoading: isLoading, freqJsonString: freqJsonString);
    return response;
  }

  Future<ResponseModel> createWasteType({
    auth,
    wasteTypeJson,
    bool? isLoading,
  }) async {
    var response = await connectHelper.createWasteType(
      auth: auth,
      wasteTypeJson: wasteTypeJson,
      isLoading: isLoading,
    );
    return response;
  }

  Future<ResponseModel> updateWasteType({
    auth,
    wasteTypeJson,
    bool? isLoading,
  }) async {
    var response = await connectHelper.updateWasteType(
      auth: auth,
      wasteTypeJson: wasteTypeJson,
      isLoading: isLoading,
    );
    return response;
  }

  Future<ResponseModel> deleteWasteType({
    auth,
    int? wasteTypeId,
    bool? isLoading,
  }) async {
    var response = await connectHelper.deleteWasteType(
      auth: auth,
      wasteTypeId: wasteTypeId,
      isLoading: isLoading,
    );
    return response;
  }

  Future<ResponseModel> getWasteTypeList({
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getWasteTypeList(
      isLoading: isLoading,
      auth: auth,
    );
  }

  Future<ResponseModel> getWaterDataMonthDetail({
    required String auth,
    required int month,
    required int year,
    required int facilityId,
    bool? isLoading,
  }) async =>
      await connectHelper.getWaterDataMonthDetail(
        auth: auth,
        month: month,
        year: year,
        facilityId: facilityId,
        isLoading: isLoading ?? false,
      );
  Future<ResponseModel> getWasteDataMonthDetail({
    required String auth,
    required int month,
    required int year,
    required int facilityId,
    required int hazardous,
    bool? isLoading,
  }) async =>
      await connectHelper.getWasteDataMonthDetail(
        auth: auth,
        month: month,
        year: year,
        facilityId: facilityId,
        hazardous: hazardous,
        isLoading: isLoading ?? false,
      );
  Future<ResponseModel> getSourceObservationList({
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getSourceObservationList(
      isLoading: isLoading,
      auth: auth,
    );
  }

  Future<ResponseModel> getPlantStockMonthDetail({
    required String auth,
    required int facilityID,
    required int assetItemID,
    String? start_date,
    required String end_date,
    bool? isLoading,
  }) async =>
      await connectHelper.getPlantStockMonthDetail(
        auth: auth,
        start_date: start_date,
        end_date: end_date,
        assetItemID: assetItemID,
        facilityID: facilityID,
        isLoading: isLoading ?? false,
      );
  Future<ResponseModel> getDocuementListById({
    required String auth,
    required int facilityID,
    required int docUploadId,
    String? start_date,
    String? sub_doc_name,
    required String end_date,
    bool? isLoading,
  }) async =>
      await connectHelper.getDocuementListById(
        auth: auth,
        start_date: start_date,
        end_date: end_date,
        docUploadId: docUploadId,
        facilityID: facilityID,
        sub_doc_name: sub_doc_name,
        isLoading: isLoading ?? false,
      );

  //create
  Future<ResponseModel> createSourceOfObslist({
    auth,
    bool? isLoading,
    businesslistJsonString,
  }) async {
    var response = await connectHelper.createSourceOfOb(
        auth: auth,
        isLoading: isLoading,
        businesslistJsonString: businesslistJsonString);
    return response;
  }

  //update
  Future<ResponseModel> updatesourceOfObs({
    auth,
    bool? isLoading,
    modulelistJsonString,
  }) async {
    var response = await connectHelper.updatesourceOfObs(
      auth: auth,
      isLoading: isLoading,
      modulelistJsonString: modulelistJsonString,
    );
    return response;
  }

  //delete
  Future<ResponseModel> deleteSourceOfObs({
    auth,
    bool? isLoading,
    business_id,
  }) async {
    var response = await connectHelper.deleteSourceOfObs(
        auth: auth, isLoading: isLoading, business_id: business_id);
    return response;
  }

  //Type Of Observation
  Future<ResponseModel> getTypeOfObservationList({
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getTypeOfObservationList(
      isLoading: isLoading,
      auth: auth,
    );
  }

  //create
  Future<ResponseModel> createTypeOfObslist({
    auth,
    bool? isLoading,
    businesslistJsonString,
  }) async {
    var response = await connectHelper.createTypeOfObslist(
        auth: auth,
        isLoading: isLoading,
        businesslistJsonString: businesslistJsonString);
    return response;
  }

  //update
  Future<ResponseModel> updatetypeOfObs({
    auth,
    bool? isLoading,
    modulelistJsonString,
  }) async {
    var response = await connectHelper.updatetypeOfObs(
      auth: auth,
      isLoading: isLoading,
      modulelistJsonString: modulelistJsonString,
    );
    return response;
  }

  //delete
  Future<ResponseModel> deleteTypeOfObs({
    auth,
    bool? isLoading,
    business_id,
  }) async {
    var response = await connectHelper.deleteTypeOfObs(
        auth: auth, isLoading: isLoading, business_id: business_id);
    return response;
  }

  Future<ResponseModel> addAttendance({
    auth,
    jsonEmployeeAttendance,
    isLoading,
  }) async {
    var response = await connectHelper.addAttendance(
      auth: auth,
      jsonEmployeeAttendance: jsonEmployeeAttendance,
      isLoading: isLoading,
    );
    return response;
  }

  Future<ResponseModel> getAttendanceList({
    required String auth,
    required int facilityId,
    required String year,
    bool? isLoading,
  }) async =>
      await connectHelper.getAttendanceList(
        auth: auth,
        facilityId: facilityId,
        year: year,
        isLoading: isLoading ?? false,
      );
  Future<ResponseModel> getChecklistInspection({
    required String auth,
    bool? isLoading,
  }) async =>
      await connectHelper.getChecklistInspection(
        auth: auth,
        isLoading: isLoading ?? false,
      );
  Future<ResponseModel> getAttendanceDetail({
    required String auth,
    required int facilityId,
    required String date,
    bool? isLoading,
  }) async =>
      await connectHelper.getAttendanceDetail(
        auth: auth,
        facilityId: facilityId,
        date: date,
        isLoading: isLoading ?? false,
      );

  Future<ResponseModel> getAttendanceListMonthwise({
    required String auth,
    required int facilityId,
    String? start_date,
    String? end_date,
    bool? isLoading,
  }) async =>
      await connectHelper.getAttendanceListMonthwise(
        auth: auth,
        facilityId: facilityId,
        start_date: start_date,
        end_date: end_date,
        isLoading: isLoading ?? false,
      );

  Future<ResponseModel> getDSMData({
    required String auth,
    List<String>? selectedYear,
    List<String>? selectedMonth,
    List<int>? selectedState,
    List<int>? selectedSpv,
    List<int>? selectedSite,
    List<int>? selectedDSMType,
    bool? isLoading,
  }) async =>
      await connectHelper.getDSMData(
        auth: auth,
        selectedYear: selectedYear,
        selectedMonth: selectedMonth,
        selectedState: selectedState,
        selectedSpv: selectedSpv,
        selectedSite: selectedSite,
        selectedDSMType: selectedDSMType,
        isLoading: isLoading ?? false,
      );

  Future<ResponseModel> getdsmType({
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getdsmType(
      isLoading: isLoading,
      auth: auth,
    );
  }

  //Material category
  Future<ResponseModel> getMaterialList({
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getMaterialList(
      isLoading: isLoading,
      auth: auth,
    );
  }

  //create
  Future<ResponseModel> createMaterialCategory({
    auth,
    bool? isLoading,
    mcategorylistJsonString,
  }) async {
    var response = await connectHelper.createMaterialCategory(
        auth: auth,
        isLoading: isLoading,
        mcategorylistJsonString: mcategorylistJsonString);
    return response;
  }

  //update
  Future<ResponseModel> updateMaterialCategory({
    auth,
    bool? isLoading,
    modulelistJsonString,
  }) async {
    var response = await connectHelper.updateMaterialCategory(
      auth: auth,
      isLoading: isLoading,
      modulelistJsonString: modulelistJsonString,
    );
    return response;
  }

  //delete
  Future<ResponseModel> deleteMaterialCategory({
    auth,
    bool? isLoading,
    materialcat_id,
  }) async {
    var response = await connectHelper.deleteMaterialCategory(
        auth: auth, isLoading: isLoading, materialcat_id: materialcat_id);
    return response;
  }

  // training courses
  Future<ResponseModel> addCourse({
    auth,
    courseJson,
    isLoading,
  }) async =>
      await connectHelper.addCourse(
        auth: auth,
        courseJson: courseJson,
        isLoading: isLoading ?? false,
      );
  Future<ResponseModel> updateCourse({
    auth,
    courseJson,
    isLoading,
  }) async =>
      await connectHelper.updateCourse(
        auth: auth,
        courseJson: courseJson,
        isLoading: isLoading ?? false,
      );

  Future<ResponseModel> deleteTrainingCourse({
    required String auth,
    int? courseId,
    bool? isLoading,
  }) async {
    var response = await connectHelper.deleteTrainingCourse(
      auth: auth,
      isLoading: isLoading,
      courseId: courseId,
    );
    return response;
  }

  Future<ResponseModel> getTrainingCourseList({
    required String auth,
    int? facilityId,
    dynamic startDate,
    dynamic endDate,
    bool? isLoading,
  }) async =>
      await connectHelper.getTrainingCourseList(
        auth: auth,
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
        startDate: startDate,
        endDate: endDate,
      );

  Future<ResponseModel> getCourseDetails({
    required String auth,
    int? courseId,
    bool? isLoading,
  }) async =>
      await connectHelper.getCourseDetails(
        auth: auth,
        courseId: courseId,
        isLoading: isLoading,
      );

  Future<ResponseModel> scheduleCourse({
    auth,
    scheduleCourseJson,
    isLoading,
  }) async =>
      await connectHelper.scheduleCourse(
        auth: auth,
        scheduleCourseJson: scheduleCourseJson,
        isLoading: isLoading ?? false,
      );

  Future<ResponseModel> approveCourseSchedule({
    required String auth,
    approveSchedule,
    bool? isLoading,
  }) async =>
      await connectHelper.approveCourseSchedule(
        auth: auth,
        approveSchedule: approveSchedule,
        isLoading: isLoading ?? false,
      );

  Future<ResponseModel> rejectCourseSchedule({
    required String auth,
    rejectSchedule,
    bool? isLoading,
  }) async =>
      await connectHelper.rejectCourseSchedule(
        auth: auth,
        rejectSchedule: rejectSchedule,
        isLoading: isLoading ?? false,
      );

  Future<ResponseModel> executeScheduleCourse({
    auth,
    executeCourseJson,
    isLoading,
  }) async =>
      await connectHelper.executeScheduleCourse(
        auth: auth,
        executeCourseJson: executeCourseJson,
        isLoading: isLoading ?? false,
      );

  Future<ResponseModel> getScheduleCourseDetails({
    required String auth,
    int? schedule_id,
    bool? isLoading,
  }) async =>
      await connectHelper.getScheduleCourseDetails(
        auth: auth,
        schedule_id: schedule_id,
        isLoading: isLoading,
      );

  //Course category
  //get
  Future<ResponseModel> getCourseCategory({
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getCourseCategory(
      isLoading: isLoading,
      auth: auth,
    );
  }

  //create
  Future<ResponseModel> createCourseCategory({
    auth,
    bool? isLoading,
    CourseCategoryJsonString,
  }) async {
    var response = await connectHelper.createCourseCategory(
        auth: auth,
        isLoading: isLoading,
        CourseCategoryJsonString: CourseCategoryJsonString);
    return response;
  }

  //update
  Future<ResponseModel> updateCourseCategory({
    auth,
    bool? isLoading,
    CourseCategoryJsonString,
  }) async {
    var response = await connectHelper.updateCourseCategory(
      auth: auth,
      isLoading: isLoading,
      CourseCategoryJsonString: CourseCategoryJsonString,
    );
    return response;
  }

  //delete
  Future<ResponseModel> deleteCourseCategory({
    auth,
    bool? isLoading,
    category_id,
  }) async {
    var response = await connectHelper.deleteCourseCategory(
        auth: auth, isLoading: isLoading, category_id: category_id);
    return response;
  }

  //Targeted Group
  //get
  Future<ResponseModel> getTargetedGroup({
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getTargetedGroup(
      isLoading: isLoading,
      auth: auth,
    );
  }

  //create
  Future<ResponseModel> createTargetedGroup({
    auth,
    bool? isLoading,
    CourseCategoryJsonString,
  }) async {
    var response = await connectHelper.createTargetedGroup(
        auth: auth,
        isLoading: isLoading,
        CourseCategoryJsonString: CourseCategoryJsonString);
    return response;
  }

  //update
  Future<ResponseModel> updateTargetedGroup({
    auth,
    bool? isLoading,
    CourseCategoryJsonString,
  }) async {
    var response = await connectHelper.updateTargetedGroup(
      auth: auth,
      isLoading: isLoading,
      CourseCategoryJsonString: CourseCategoryJsonString,
    );
    return response;
  }

  //delete
  Future<ResponseModel> deleteTargetedGroup({
    auth,
    bool? isLoading,
    category_id,
  }) async {
    var response = await connectHelper.deleteTargetedGroup(
        auth: auth, isLoading: isLoading, category_id: category_id);
    return response;
  }

  //Statutory Compliance
  //get
  Future<ResponseModel> getStatutoryCompliance({
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getStatutoryCompliance(
      isLoading: isLoading,
      auth: auth,
    );
  }

  //create
  Future<ResponseModel> createStatutoryCompliance({
    auth,
    bool? isLoading,
    StatutoryComplianceJsonString,
  }) async {
    var response = await connectHelper.createStatutoryCompliance(
        auth: auth,
        isLoading: isLoading,
        StatutoryComplianceJsonString: StatutoryComplianceJsonString);
    return response;
  }

  //update
  Future<ResponseModel> updateStatutoryCompliance({
    auth,
    bool? isLoading,
    StatutoryComplianceJsonString,
  }) async {
    var response = await connectHelper.updateStatutoryCompliance(
      auth: auth,
      isLoading: isLoading,
      StatutoryComplianceJsonString: StatutoryComplianceJsonString,
    );
    return response;
  }

  //delete
  Future<ResponseModel> deleteStatutoryCompliance({
    auth,
    bool? isLoading,
    StatutoryCompliance_id,
  }) async {
    var response = await connectHelper.deleteStatutoryCompliance(
        auth: auth,
        isLoading: isLoading,
        StatutoryCompliance_id: StatutoryCompliance_id);
    return response;
  }

  // Compliance Status
  //get
  Future<ResponseModel> getComplianceStatus({
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getComplianceStatus(
      isLoading: isLoading,
      auth: auth,
    );
  }

  //create
  Future<ResponseModel> createComplianceStatus({
    auth,
    bool? isLoading,
    ComplianceStatusJsonString,
  }) async {
    var response = await connectHelper.createComplianceStatus(
        auth: auth,
        isLoading: isLoading,
        ComplianceStatusJsonString: ComplianceStatusJsonString);
    return response;
  }

  //update
  Future<ResponseModel> updateComplianceStatus({
    auth,
    bool? isLoading,
    ComplianceStatusJsonString,
  }) async {
    var response = await connectHelper.updateComplianceStatus(
      auth: auth,
      isLoading: isLoading,
      ComplianceStatusJsonString: ComplianceStatusJsonString,
    );
    return response;
  }

  //delete
  Future<ResponseModel> deleteComplianceStatus({
    auth,
    bool? isLoading,
    ComplianceStatus_id,
  }) async {
    var response = await connectHelper.deleteComplianceStatus(
        auth: auth,
        isLoading: isLoading,
        ComplianceStatus_id: ComplianceStatus_id);
    return response;
  }

  // DocumentMaster
  //get
  Future<ResponseModel> getDocumentMaster({
    required bool isLoading,
    required String auth,
  }) async {
    return await connectHelper.getDocumentMaster(
      isLoading: isLoading,
      auth: auth,
    );
  }

  //create
  Future<ResponseModel> createDocumentMaster({
    auth,
    bool? isLoading,
    DocumentMasterJsonString,
  }) async {
    var response = await connectHelper.createDocumentMaster(
        auth: auth,
        isLoading: isLoading,
        DocumentMasterJsonString: DocumentMasterJsonString);
    return response;
  }

  //update
  Future<ResponseModel> updateDocumentMaster({
    auth,
    bool? isLoading,
    DocumentMasterJsonString,
  }) async {
    var response = await connectHelper.updateDocumentMaster(
      auth: auth,
      isLoading: isLoading,
      DocumentMasterJsonString: DocumentMasterJsonString,
    );
    return response;
  }

  //delete
  Future<ResponseModel> deleteDocumentMaster({
    auth,
    bool? isLoading,
    DocumentMaster_id,
  }) async {
    var response = await connectHelper.deleteDocumentMaster(
        auth: auth, isLoading: isLoading, DocumentMaster_id: DocumentMaster_id);
    return response;
  }

  Future<ResponseModel> getStatutoryHistory({
    required String auth,
    required int compliance_id,
    required bool isLoading,
  }) async {
    return await connectHelper.getStatutoryHistory(
      auth: auth,
      compliance_id: compliance_id,
      isLoading: isLoading,
    );
  }

  Future<ResponseModel> getScheduleCourseList({
    required String auth,
    int? facilityId,
    dynamic startDate,
    dynamic endDate,
    bool? isLoading,
  }) async =>
      await connectHelper.getScheduleCourseList(
        auth: auth,
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
        startDate: startDate,
        endDate: endDate,
      );

  Future<ResponseModel> getObservationSummary({
    String? auth,
    bool? isLoading,
    required int facility_id,
    required String fromDate,
    required String toDate,
  }) async =>
      await connectHelper.getObservationSummary(
        auth: auth,
        isLoading: isLoading,
        facility_id: facility_id,
        fromDate: fromDate,
        toDate: toDate,
      );

  Future<ResponseModel> getTrainingSummary({
    String? auth,
    bool? isLoading,
    required int facility_id,
    String? fromDate,
    String? toDate,
  }) async =>
      await connectHelper.getTrainingSummary(
        auth: auth,
        isLoading: isLoading,
        facility_id: facility_id,
        fromDate: fromDate,
        toDate: toDate,
      );

  Future<ResponseModel> getGrievanceSummary({
    String? auth,
    bool? isLoading,
    required int facility_id,
    String? fromDate,
    String? toDate,
  }) async =>
      await connectHelper.getGrievanceSummary(
        auth: auth,
        isLoading: isLoading,
        facility_id: facility_id,
        fromDate: fromDate,
        toDate: toDate,
      );

//end
}
