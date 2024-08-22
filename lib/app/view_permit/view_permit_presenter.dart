import 'package:cmms/domain/models/block_model.dart';
import 'package:cmms/domain/models/create_sop_model.dart';
import 'package:cmms/domain/models/employee_list_model.dart';
import 'package:cmms/domain/models/employee_list_model2.dart';
import 'package:cmms/domain/models/employee_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/inventory_detail_model.dart';
import 'package:cmms/domain/models/inventory_model.dart';
import 'package:cmms/domain/models/job_type_list_model.dart';
import 'package:cmms/domain/models/new_permit_details_model.dart';
import 'package:cmms/domain/models/permit_cancel_condition_list_model.dart';
import 'package:cmms/domain/models/safety_measure_list_model.dart';
import 'package:cmms/domain/models/sop_list_model.dart';
import 'package:cmms/domain/models/type_permit_model.dart';
import 'package:cmms/domain/models/work_type_model.dart';
import 'package:cmms/domain/usecases/view_permit_usecase.dart';
import 'package:flutter/foundation.dart';

import '../../../domain/models/inventory_category_model.dart';

class ViewPermitPresenter {
  ViewPermitPresenter(this.viewPermitUsecase);
  ViewPermitUsecase viewPermitUsecase;

  Future<List<BlockModel?>?> getBlocksList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await viewPermitUsecase.getBlocksList(
        auth: auth ?? "",
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );

  Future<List<HistoryModel>?> getPermitHistory(
    moduleType,
    facilityId,
    permitId,
    isLoading,
  ) async =>
      await viewPermitUsecase.getPermitHistory(
        moduleType: moduleType,
        facilityId: facilityId,
        permitId: permitId,
        isLoading: isLoading,
      );

  Future<Map<String, dynamic>?> permitApprovedButton(
      {rejectCancelPermitJsonString,
      String? ptwStatus,
      int? jobId,
      required bool isLoading,
      int? type,
      int? vegexe,
      int? vegid}) async {
    return viewPermitUsecase.permitApprovedButton(
        rejectCancelPermitJsonString: rejectCancelPermitJsonString,
        ptwStatus: ptwStatus,
        jobId: jobId,
        isLoading: isLoading,
        type: type,
        vegid: vegid,
        vegexe: vegexe);
  }
  // Future<void> permitApprovedButton({
  //   String? comment,
  //   String? id,
  //   String? ptwStatus,
  //   int? jobId,
  //   bool? isLoading,
  // }) async =>
  //     await viewPermitUsecase.permitApprovedButton(
  //       comment: comment,
  //       id: id,
  //       ptwStatus: ptwStatus,
  //       jobId: jobId,
  //       isLoading: isLoading ?? false,
  //     );

  Future<Map<String, dynamic>?> permitCloseButton({
    closePermitJsonString,
    required bool isLoading,
    int? jobId,
  }) async {
    return viewPermitUsecase.permitCloseButton(
        closePermitJsonString: closePermitJsonString,
        isLoading: isLoading,
        jobId: jobId);
  }

  Future<CreateSOPModel?> browseFiles(
      Uint8List? fileBytes, String fileName, bool isLoading) async {
    return await viewPermitUsecase.browseFiles(fileBytes, fileName, isLoading);
    // return true;
  }

  Future<CreateSOPModel?> browseFilesForExtend(
      Uint8List? fileBytes, String fileName, bool isLoading) async {
    return await viewPermitUsecase.browseFilesForExtend(
        fileBytes, fileName, isLoading);
    // return true;
  }

  // Future<void> permitCancelRequestButton({
  //   // String? comment,
  //   // String? id,
  //   cancelPermitJsonString
  //   bool? isLoading,
  // }) async =>
  //     await viewPermitUsecase.permitCancelRequestButton(
  //       // comment: comment,
  //       // id: id,
  //       isLoading: isLoading ?? false,
  //     );

  Future<Map<String, dynamic>?> permitCancelRequestButton(
      {cancelPermitJsonString,
      required bool isLoading,
      int? jobId,
      int? type}) async {
    return viewPermitUsecase.permitCancelRequestButton(
        cancelPermitJsonString: cancelPermitJsonString,
        isLoading: isLoading,
        jobId: jobId,
        type: type);
  }

  Future<Map<String, dynamic>?> permitExtendButton({
    extendPermitJsonString,
    required bool isLoading,
    int? jobId,
  }) async {
    return viewPermitUsecase.permitExtendButton(
      extendPermitJsonString: extendPermitJsonString,
      jobId: jobId,
      isLoading: isLoading,
    );
  }

  // Future<void> permitRejectButton({
  //   String? comment,
  //   String? id,
  //   bool? isLoading,
  //   String? ptwStatus,
  //   int? jobId,
  // }) async =>
  //     await viewPermitUsecase.permitRejectButton(
  //       comment: comment,
  //       id: id,
  //       ptwStatus: ptwStatus,
  //       jobId: jobId,
  //       isLoading: isLoading ?? false,
  //     );

  Future<Map<String, dynamic>?> permitRejectButton(
      {int? id,
      String? ptwStatus,
      int? jobId,
      rejectExtendPermitJsonString,
      required bool isLoading,
      int? type,
      int? vegexe,
      int? vegid}) async {
    return viewPermitUsecase.permitRejectButton(
        rejectExtendPermitJsonString: rejectExtendPermitJsonString,
        id: id,
        ptwStatus: ptwStatus,
        jobId: jobId,
        isLoading: isLoading,
        type: type,
        vegid: vegid,
        vegexe: vegexe);
  }

  // Future<void> permitCancelByApproverButton({
  //   String? comment,
  //   String? id,
  //   String? ptwStatus,
  //   bool? isLoading,
  // }) async =>
  //     await viewPermitUsecase.permitCancelByApproverButton(
  //       comment: comment,
  //       id: id,
  //       ptwStatus: ptwStatus,
  //       isLoading: isLoading ?? false,
  //     );

  Future<Map<String, dynamic>?> permitCancelByApproverButton({
    cancelByApproverJsonString,
    String? ptwStatus,
    required bool isLoading,
  }) async {
    return viewPermitUsecase.permitCancelByApproverButton(
      cancelByApproverJsonString: cancelByApproverJsonString,
      ptwStatus: ptwStatus,
      isLoading: isLoading,
    );
  }

  Future<Map<String, dynamic>?> permitCancelRejectButton({
    rejectCancelPermitJsonString,
    required bool isLoading,
  }) async {
    return viewPermitUsecase.permitCancelRejectButton(
      rejectCancelPermitJsonString: rejectCancelPermitJsonString,
      isLoading: isLoading,
    );
  }

  Future<List<EmployeeModel?>?> getAssignedToList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await viewPermitUsecase.getAssignedToList(
        auth: auth ?? "",
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );

  Future<List<SafetyMeasureListModel>> getSafetyMeasureList({
    required bool isLoading,
    required int? permit_type_id,
  }) async {
    return viewPermitUsecase.getSafetyMeasureList(
      isLoading: isLoading,
      permit_type_id: permit_type_id,
    );
  }

  Future<List<PermitCancelListModel>> getPermitConditionList({
    required bool isLoading,
    required int facilityId,
    required int? isCancle,
  }) async {
    return viewPermitUsecase.getPermitConditionList(
        isLoading: isLoading, isCancle: isCancle, facilityId: facilityId);
  }

  Future<List<PermitCancelListModel>> getPermitCloseConditionList({
    required bool isLoading,
    required int? isClose,
  }) async {
    return viewPermitUsecase.getPermitCloseConditionList(
      isLoading: isLoading,
      isClose: isClose,
    );
  }

  Future<List<PermitCancelListModel>> getPermitExtendConditionList({
    required bool isLoading,
    required int? isExtend,
  }) async {
    return viewPermitUsecase.getPermitExtendConditionList(
      isLoading: isLoading,
      isExtend: isExtend,
    );
  }

  Future<List<EmployeeListModel>> getEmployeePermitList({
    required bool isLoading,
    required int? facility_id,
  }) async {
    return viewPermitUsecase.getEmployeePermitList(
      isLoading: isLoading,
      facility_id: facility_id,
    );
  }

  Future<List<EmployeeListModel>> getPermitIssuerList({
    required bool isLoading,
    required int? facility_id,
  }) async {
    return viewPermitUsecase.getPermitIssuerList(
      isLoading: isLoading,
      facility_id: facility_id,
    );
  }

  Future<List<EmployeeListModel2>> getPermitApproverList({
    required bool isLoading,
    required int? facility_id,
  }) async {
    return viewPermitUsecase.getPermitApproverList(
      isLoading: isLoading,
      facility_id: facility_id,
    );
  }

  Future<List<JobTypeListModel>> getJobTypePermitList({
    required bool isLoading,
    required int? facility_id,
  }) async {
    return viewPermitUsecase.getJobTypePermitList(
      isLoading: isLoading,
      facility_id: facility_id,
    );
  }

  Future<List<SOPListModel>> getSopPermitList({
    required bool isLoading,
    required int? job_type_id,
  }) async {
    return viewPermitUsecase.getSopPermitList(
      isLoading: isLoading,
      job_type_id: job_type_id,
    );
  }

  Future<List<WorkTypeModel?>?> getWorkTypeList({
    String? auth,
    String? categoryIds,
    bool? isLoading,
  }) async =>
      await viewPermitUsecase.getWorkTypeList(
        categoryIds: categoryIds,
        isLoading: isLoading ?? false,
      );

  Future<List<InventoryDetailModel?>?> getInventoryDetailList({
    String? auth,
    required int facilityId,
    // int? facilityId,
    int? id,
    bool? isLoading,
  }) async =>
      await viewPermitUsecase.getInventoryDetailList(
        auth: auth ?? "",
        // facilityId: 45,
        // facilityId: facilityId ?? 0,
        id: id,
        facilityId: facilityId,
        isLoading: isLoading ?? false,
      );

  Future<NewPermitDetailModel?> getViewPermitDetail({
    bool? isLoading,
    required int facilityId,
    required int permitId,
  }) async {
    return viewPermitUsecase.getViewPermitDetail(
      permitId: permitId,
      facilityId: facilityId,
      isLoading: isLoading ?? false,
    );
  }

  Future<List<FacilityModel?>?> getFacilityLists() async =>
      await viewPermitUsecase.getFacilityLists(true);

  Future<List<TypePermitModel?>?> getTypePermitList(
          {required int facility_id}) async =>
      await viewPermitUsecase.getTypePermitList(true, facility_id);

  Future<List<InventoryCategoryModel?>?> getInventoryCategoryList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await viewPermitUsecase.getInventoryCategoryList();

  Future<List<InventoryCategoryModel?>?> getInventoryIsolationList({
    String? auth,
    int? facilityId,
    bool? isLoading,
    int? categoryId,
  }) async =>
      await viewPermitUsecase.getInventoryIsolationList();

  Future<List<InventoryModel?>?> getInventoryEquipmentNameList({
    required bool isLoading,
    required int? facilityId,
    int? blockId,
    required String categoryIds,
  }) async {
    return viewPermitUsecase.getInventoryEquipmentNameList(
      isLoading: isLoading,
      facilityId: facilityId,
      blockId: blockId,
      categoryIds: categoryIds,
    );
  }
  // Future<void> createCheckList({
  //   bool? isLoading,
  // }) async =>
  //     await viewPermitUsecase.createCheckList(isLoading: isLoading);

  Future<Map<String, dynamic>?> createNewPermit({
    newPermit,
    required bool isLoading,
  }) async {
    return viewPermitUsecase.createNewPermit(
      newPermit: newPermit,
      isLoading: isLoading,
    );
  }

  Future<List<EmployeeListModel>> getEmployeeList({
    required bool isLoading,
    required int? facility_id,
  }) async {
    return viewPermitUsecase.getEmployeeList(
      isLoading: isLoading,
      facility_id: facility_id,
    );
  }

  void saveValue({String? permitId}) async {
    return viewPermitUsecase.saveValue(permitId: permitId);
  }

  Future<String?> getValue() async => await viewPermitUsecase.getValue();

  void saveJobIdValue({String? jobId}) async {
    return viewPermitUsecase.saveJobIdValue(jobId: jobId);
  }

  Future<String?> getJobIdValue() async =>
      await viewPermitUsecase.getJobIdValue();

  void clearValue() async => viewPermitUsecase.clearValue();
  void clearTypeValue() async => viewPermitUsecase.clearTypeValue();
  void clearisCheckedValue() async => viewPermitUsecase.clearisCheckedValue();
  void clearjobmodelValue() async => viewPermitUsecase.clearjobmodelValue();
  void clearpmTaskValue() async => viewPermitUsecase.clearpmTaskValue();
  void clearStoreDataPMtaskId() async =>
      viewPermitUsecase.clearStoreDataPMtaskId();
  void saveTypeValue({String? type}) async {
    return viewPermitUsecase.saveTypeValue(type: type);
  }

  Future<String?> getTypeValue() async =>
      await viewPermitUsecase.getTypeValue();
}
