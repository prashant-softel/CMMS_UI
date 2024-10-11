import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/create_sop_model.dart';
import 'package:cmms/domain/models/employee_list_model.dart';
import 'package:cmms/domain/models/employee_list_model2.dart';
import 'package:cmms/domain/models/employee_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/models/inventory_detail_model.dart';
import 'package:cmms/domain/models/job_type_list_model.dart';
import 'package:cmms/domain/models/new_permit_details_model.dart';
import 'package:cmms/domain/models/permit_cancel_condition_list_model.dart';
import 'package:cmms/domain/models/safety_measure_list_model.dart';
import 'package:cmms/domain/models/sop_list_model.dart';
import 'package:cmms/domain/models/type_permit_model.dart';
import 'package:cmms/domain/models/work_type_model.dart';
import 'package:flutter/foundation.dart';

import '../models/facility_model.dart';

class ViewPermitUsecase {
  ViewPermitUsecase(this.repository);
  Repository repository;

  Future<List<BlockModel?>?> getBlocksList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getBlocksList(
        auth,
        facilityId,
        isLoading,
      );

  Future<List<HistoryModel>?> getPermitHistory({
    moduleType,
    facilityId,
    permitId,
    bool? isLoading,
  }) async =>
      await repository.getPermitHistory(
        moduleType,
        permitId,
        facilityId,
        isLoading,
      );

  Future<Map<String, dynamic>> permitApprovedButton(
          {rejectCancelPermitJsonString,
          String? ptwStatus,
          int? jobId,
          int? type,
          bool? isLoading,
          int? vegexe,
          int? vegid,
          String? taskId}) async =>
      await repository.permitApprovedButton(rejectCancelPermitJsonString,
          ptwStatus, jobId, type, isLoading, vegexe, vegid, taskId);
  // Future<void> permitApprovedButton({
  //   String? comment,
  //   String? id,
  //   String? ptwStatus,
  //   int? jobId,
  //   bool? isLoading,
  // }) async {
  //   await repository.permitApprovedButton(
  //     comment,
  //     id,
  //     ptwStatus,
  //     jobId,
  //     isLoading,
  //   );
  // }

  Future<Map<String, dynamic>> permitCloseButton({
    closePermitJsonString,
    bool? isLoading,
    int? jobId,
  }) async =>
      await repository.permitCloseButton(
          closePermitJsonString, isLoading, jobId, 0);

  // Future<void> permitCancelRequestButton({
  //   String? comment,
  //   String? id,
  //   bool? isLoading,
  // }) async {
  //   await repository.permitCancelRequestButton(
  //     comment,
  //     id,
  //     isLoading,
  //   );
  // }

  Future<Map<String, dynamic>> permitCancelRequestButton(
          {cancelPermitJsonString,
          bool? isLoading,
          int? jobId,
          int? type,
          String? taskId}) async =>
      await repository.permitCancelRequestButton(
          cancelPermitJsonString, isLoading, jobId, type, taskId);

  Future<CreateSOPModel?> browseFiles(
      Uint8List? fileBytes, String fileName, bool isLoading) async {
    return await repository.browseFiles(fileBytes, fileName, 0, isLoading, 0);
    // return true;
  }

  Future<CreateSOPModel?> browseFilesForExtend(
      Uint8List? fileBytes, String fileName, bool isLoading) async {
    return await repository.browseFiles(fileBytes, fileName, 0, isLoading, 0);
    // return true;
  }

  Future<Map<String, dynamic>> permitExtendButton({
    extendPermitJsonString,
    bool? isLoading,
    int? jobId,
  }) async =>
      await repository.permitExtendButton(
          extendPermitJsonString, isLoading, jobId);

  // Future<void> permitRejectButton({
  //   String? comment,
  //   String? id,
  //   String? ptwStatus,
  //   int? jobId,
  //   bool? isLoading,
  // }) async {
  //   await repository.permitRejectButton(
  //     comment,
  //     id,
  //     ptwStatus,
  //     jobId,
  //     isLoading,
  //   );
  // }

  Future<Map<String, dynamic>> permitRejectButton(
          {int? id,
          String? ptwStatus,
          int? jobId,
          rejectExtendPermitJsonString,
          bool? isLoading,
          int? type,
          int? vegexe,
          int? vegid,
          String? taskId}) async =>
      await repository.permitRejectButton(rejectExtendPermitJsonString, id,
          ptwStatus, jobId, type, isLoading, vegexe, vegid, taskId);

  // Future<void> permitCancelByApproverButton({
  //   String? comment,
  //   String? id,
  //   String? ptwStatus,
  //   bool? isLoading,
  // }) async {
  //   await repository.permitCancelByApproverButton(
  //     comment,
  //     id,
  //     ptwStatus,
  //     isLoading,
  //   );
  // }

  Future<Map<String, dynamic>> permitCancelByApproverButton({
    String? ptwStatus,
    cancelByApproverJsonString,
    bool? isLoading,
  }) async =>
      await repository.permitCancelByApproverButton(
        ptwStatus,
        cancelByApproverJsonString,
        isLoading,
      );

  // Future<void> permitCancelRejectButton({
  //   String? comment,
  //   String? id,
  //   bool? isLoading,
  // }) async {
  //   await repository.permitCancelRejectButton(
  //     comment,
  //     id,
  //     isLoading,
  //   );
  // }
  Future<Map<String, dynamic>> permitCancelRejectButton({
    rejectCancelPermitJsonString,
    bool? isLoading,
  }) async =>
      await repository.permitCancelRejectButton(
        rejectCancelPermitJsonString,
        isLoading,
      );

  Future<List<SafetyMeasureListModel>> getSafetyMeasureList(
      {required bool isLoading, required int? permit_type_id}) async {
    return repository.getSafetyMeasureList(
      isLoading: isLoading,
      permit_type_id: permit_type_id,
    );
  }

  Future<List<PermitCancelListModel>> getPermitConditionList(
      {required bool isLoading,
      required int? isCancle,
      required int facilityId}) async {
    return repository.getPermitConditionList(
        isLoading: isLoading, isCancle: isCancle, facilityId: facilityId);
  }

  Future<List<PermitCancelListModel>> getPermitCloseConditionList(
      {required bool isLoading, required int? isClose}) async {
    return repository.getPermitCloseConditionList(
      isLoading: isLoading,
      isClose: isClose,
    );
  }

  Future<List<PermitCancelListModel>> getPermitExtendConditionList(
      {required bool isLoading, required int? isExtend}) async {
    return repository.getPermitExtendConditionList(
      isLoading: isLoading,
      isExtend: isExtend,
    );
  }

  Future<NewPermitDetailModel?> getViewPermitDetail({
    bool? isLoading,
    required int facilityId,
    required int permitId,
  }) async =>
      await repository.getViewPermitDetail(
        permitId: permitId,
        facilityId: facilityId,
        isLoading: isLoading ?? false,
      );

  Future<List<EmployeeListModel>> getEmployeePermitList(
      {required bool isLoading, required int? facility_id}) async {
    return repository.getEmployeePermitList(
      isLoading: isLoading,
      facility_id: facility_id,
    );
  }

  Future<List<EmployeeListModel>> getPermitIssuerList(
      {required bool isLoading, required int? facility_id}) async {
    return repository.getPermitIssuerList(
      isLoading: isLoading,
      facility_id: facility_id,
    );
  }

  Future<List<EmployeeListModel2>> getPermitApproverList(
      {required bool isLoading, required int? facility_id}) async {
    return repository.getPermitApproverList(
      isLoading: isLoading,
      facility_id: facility_id,
    );
  }

  Future<List<JobTypeListModel>> getJobTypePermitList(
      {required bool isLoading, required int? facility_id}) async {
    return repository.getJobTypePermitList(
      isLoading: isLoading,
    );
  }

  Future<List<SOPListModel>> getSopPermitList(
      {required bool isLoading, required int? job_type_id}) async {
    return repository.getSopPermitList(
      isLoading: isLoading,
      job_type_id: job_type_id,
    );
  }

  Future<List<InventoryDetailModel?>?> getInventoryDetailList({
    required String auth,
    required int facilityId,
    int? id,
    bool? isLoading,
  }) async =>
      await repository.getInventoryDetailList(
        auth,
        facilityId,
        id,
        isLoading,
      );

  Future<List<WorkTypeModel?>?> getWorkTypeList(
          {bool? isLoading, String? categoryIds}) async =>
      await repository.getWorkTypeList(
        isLoading,
        categoryIds,
      );

  Future<List<EmployeeModel?>?> getAssignedToList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getAssignedToList(
        auth,
        facilityId,
        isLoading,
      );

  Future<List<InventoryCategoryModel?>?> getInventoryCategoryList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getInventoryCategoryList(auth, facilityId, isLoading, 0);

  Future<List<InventoryModel?>?> getInventoryEquipmentNameList({
    required bool isLoading,
    required int? facilityId,
    int? blockId,
    required String categoryIds,
  }) async {
    return repository.getInventoryEquipmentNameList(
      isLoading: isLoading,
      facilityId: facilityId,
      blockId: blockId,
      categoryIds: categoryIds,
    );
  }

  Future<List<InventoryCategoryModel?>?> getInventoryIsolationList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getInventoryIsolationList(
        auth,
        facilityId,
        isLoading,
      );

  // Future<void> createCheckList({
  //   bool? isLoading,
  // }) async =>
  //     await repository.createCheckList(isLoading: isLoading);

  Future<List<FacilityModel?>?> getFacilityLists(bool? isLoading) async =>
      await repository.getFacilityList(isLoading);

  Future<List<TypePermitModel?>?> getTypePermitList(
          bool? isLoading, int? facility_id) async =>
      await repository.getTypePermitList(isLoading, facility_id);

  Future<Map<String, dynamic>> createNewPermit({
    newPermit,
    bool? isLoading,
  }) async =>
      await repository.createNewPermit(
        newPermit,
        isLoading,
      );

  Future<List<EmployeeListModel>> getEmployeeList(
      {required bool isLoading, required int? facility_id}) async {
    return repository.getEmployeeList(
      isLoading: isLoading,
      facility_id: facility_id,
    );
  }

  void saveValue({String? permitId}) async =>
      repository.saveValue(LocalKeys.permitId, permitId);
  Future<String?> getValue() async =>
      await repository.getStringValue(LocalKeys.permitId);
  void saveJobIdValue({String? jobId}) async =>
      repository.saveValue(LocalKeys.jobId, jobId);
  Future<String?> getJobIdValue() async =>
      await repository.getStringValue(LocalKeys.jobId);
  void saveTypeValue({String? type}) async =>
      repository.saveValue(LocalKeys.type, type);
  Future<String?> getTypeValue() async =>
      await repository.getStringValue(LocalKeys.type);

  void clearValue() async => repository.clearData(LocalKeys.permitId);
  void clearTypeValue() async => repository.clearData(LocalKeys.types);
  void clearisCheckedValue() async => repository.clearData(LocalKeys.isChecked);
  void clearjobmodelValue() async => repository.clearData(LocalKeys.jobModel);
  void clearpmTaskValue() async => repository.clearData(LocalKeys.pmTaskModel);
  void clearStoreDataPMtaskId() async =>
      repository.clearData(LocalKeys.pmTaskId);
}
