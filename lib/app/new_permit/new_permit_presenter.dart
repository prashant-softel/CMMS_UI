import 'package:cmms/domain/models/block_model.dart';
import 'package:cmms/domain/models/employee_list_model.dart';
import 'package:cmms/domain/models/employee_list_model2.dart';
import 'package:cmms/domain/models/employee_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/inventory_detail_model.dart';
import 'package:cmms/domain/models/inventory_model.dart';
import 'package:cmms/domain/models/job_type_list_model.dart';
import 'package:cmms/domain/models/new_permit_details_model.dart';
import 'package:cmms/domain/models/safety_measure_list_model.dart';
import 'package:cmms/domain/models/sop_list_model.dart';
import 'package:cmms/domain/models/type_permit_model.dart';
import 'package:cmms/domain/models/work_type_model.dart';
import 'package:cmms/domain/usecases/new_permit_usecase.dart';
import 'package:flutter/foundation.dart';

import '../../../domain/models/inventory_category_model.dart';

class NewPermitPresenter {
  NewPermitPresenter(this.newPermitUsecase);
  NewPermitUsecase newPermitUsecase;

  Future<List<BlockModel?>?> getBlocksList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await newPermitUsecase.getBlocksList(
        auth: auth ?? "",
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );

  Future<List<EmployeeModel?>?> getAssignedToList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await newPermitUsecase.getAssignedToList(
        auth: auth ?? "",
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );

  Future<List<EmployeeListModel>> getEmployeePermitList(
      {required bool isLoading,
      required int? facility_id,
      int? featureId}) async {
    return newPermitUsecase.getEmployeePermitList(
        isLoading: isLoading, facility_id: facility_id, featureId: featureId);
  }

  Future<List<EmployeeListModel>> getEmployeePermitListoftbt(
      {required bool isLoading,
      required int? facility_id,
      int? featureId}) async {
    return newPermitUsecase.getEmployeePermitListoftbt(
        isLoading: isLoading, facility_id: facility_id, featureId: featureId);
  }

  Future<List<EmployeeListModel>> getPermitIssuerList({
    required bool isLoading,
    required int? facility_id,
  }) async {
    return newPermitUsecase.getPermitIssuerList(
      isLoading: isLoading,
      facility_id: facility_id,
    );
  }

  Future<List<EmployeeListModel2>> getPermitApproverList({
    required bool isLoading,
    required int? facility_id,
  }) async {
    return newPermitUsecase.getPermitApproverList(
      isLoading: isLoading,
      facility_id: facility_id,
    );
  }

  Future<List<JobTypeListModel>> getJobTypePermitList({
    required bool isLoading,
    required int? facility_id,
  }) async {
    return newPermitUsecase.getJobTypePermitList(
      isLoading: isLoading,
      facility_id: facility_id,
    );
  }

  Future<List<SOPListModel>> getSopPermitList({
    required bool isLoading,
    required int? job_type_id,
  }) async {
    return newPermitUsecase.getSopPermitList(
      isLoading: isLoading,
      job_type_id: job_type_id,
    );
  }

  Future<List<SafetyMeasureListModel>> getSafetyMeasureList({
    required bool isLoading,
    required int? permit_type_id,
  }) async {
    return newPermitUsecase.getSafetyMeasureList(
      isLoading: isLoading,
      permit_type_id: permit_type_id,
    );
  }

  Future<List<WorkTypeModel?>?> getWorkTypeList({
    String? auth,
    String? categoryIds,
    bool? isLoading,
  }) async =>
      await newPermitUsecase.getWorkTypeList(
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
      await newPermitUsecase.getInventoryDetailList(
        auth: auth ?? "",
        // facilityId: 45,
        // facilityId: facilityId ?? 0,
        id: id,
        facilityId: facilityId,
        isLoading: isLoading ?? false,
      );

  Future<List<FacilityModel?>?> getFacilityLists() async =>
      await newPermitUsecase.getFacilityLists(true);

  Future<List<TypePermitModel?>?> getTypePermitList(
          {required int facility_id}) async =>
      await newPermitUsecase.getTypePermitList(true, facility_id);

  Future<Map<String, dynamic>?> linkToPermit({
    int? jobId,
    int? permitId,
    bool? isLoading,
  }) async =>
      await newPermitUsecase.linkToPermit(
        jobId: jobId,
        permitId: permitId,
        isLoading: isLoading,
      );

  Future<List<InventoryCategoryModel?>?> getInventoryCategoryList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await newPermitUsecase.getInventoryCategoryList();

  Future<List<InventoryCategoryModel?>?> getInventoryIsolationList({
    String? auth,
    int? facilityId,
    bool? isLoading,
    int? categoryId,
  }) async =>
      await newPermitUsecase.getInventoryIsolationList();

  Future<List<InventoryModel?>?> getInventoryEquipmentNameList({
    required bool isLoading,
    required int? facilityId,
    int? blockId,
    required String categoryIds,
  }) async {
    return newPermitUsecase.getInventoryEquipmentNameList(
      isLoading: isLoading,
      facilityId: facilityId,
      blockId: blockId,
      categoryIds: categoryIds,
    );
  }
  // Future<void> createCheckList({
  //   bool? isLoading,
  // }) async =>
  //     await newPermitUsecase.createCheckList(isLoading: isLoading);

  Future<Map<String, dynamic>?> createNewPermit({
    newPermit,
    required bool isLoading,
  }) async {
    return newPermitUsecase.createNewPermit(
      newPermit: newPermit,
      isLoading: isLoading,
    );
  }

  Future<List<HistoryModel>?> getPermitHistory(
    moduleType,
    permitId,
    facilityId,
    isLoading,
  ) async =>
      await newPermitUsecase.getPermitHistory(
        moduleType: moduleType,
        permitId: permitId,
        facilityId: facilityId,
        isLoading: isLoading,
      );

  Future<bool> browseFiles(Uint8List? fileBytes, String fileName,
      int importType, bool isLoading, int facilityId) async {
    await newPermitUsecase.browseFiles(
        fileBytes, fileName, importType, isLoading, facilityId);
    return true;
  }

  void clearValue() async => newPermitUsecase.clearValue();
  void clearTypeValue() async => newPermitUsecase.clearTypeValue();

  Future<Map<String, dynamic>?> createNewPermitForJob({
    newPermit,
    required int jobId,
    required bool isLoading,
  }) async {
    return newPermitUsecase.createNewPermitForJob(
      newPermit: newPermit,
      jobId: jobId,
      isLoading: isLoading,
    );
  }

  Future<Map<String, dynamic>?> createNewPermitForPm(
      {newPermit,
      required int pmTaskId,
      String? activity,
      required bool isLoading,
      int? type,
      int? vegplanId,
      int? vegexid,
      int? facilityId,
      int? mcplanId,
      int? mctaskId}) async {
    return newPermitUsecase.createNewPermitForPm(
        newPermit: newPermit,
        pmTaskId: pmTaskId,
        activity: activity,
        isLoading: isLoading,
        type: type,
        vegexid: vegexid,
        vegplanId: vegplanId,
        facilityId: facilityId,
        mcplanId: mcplanId,
        mctaskId: mctaskId);
  }

  Future<Map<String, dynamic>?> updateNewPermit({
    newPermit,
    required bool isLoading,
    required bool resubmit,
    int? type,
    int? vegplanId,
    int? vegexid,
    String? taskId,
    int? mcplanId,
    int? mcexid,
  }) async {
    return newPermitUsecase.updateNewPermit(
      type: type,
      newPermit: newPermit,
      isLoading: isLoading,
      resubmit: resubmit,
      vegexid: vegexid,
      vegplanId: vegplanId,
      taskId: taskId,
      mcexid: mcexid,
      mcplanId: mcplanId,
    );
  }

  Future<Map<String, dynamic>?> resubmitPermit({
    newPermit,
    required bool isLoading,
    required bool resubmit,
    int? type,
    int? vegplanId,
    int? vegexid,
    String? taskId,
    int? mcplanId,
    int? mcexid,
  }) async {
    return newPermitUsecase.resubmitPermit(
      newPermit: newPermit,
      isLoading: isLoading,
      resubmit: true,
      type: type,
      vegexid: vegexid,
      vegplanId: vegplanId,
      taskId: taskId,
      mcexid: mcexid,
      mcplanId: mcplanId,
    );
  }

  Future<NewPermitDetailModel?> getNewPermitDetail(
      {bool? isLoading, required int permitId, required int facilityId}) async {
    return newPermitUsecase.getNewPermitDetail(
      permitId: permitId,
      facilityId: facilityId,
      isLoading: isLoading ?? false,
    );
  }

  Future<Map<String, dynamic>?> createJobCard({
    String? auth,
    int? jobId,
    bool? isLoading,
  }) async =>
      await newPermitUsecase.createJobCard(
        auth: auth,
        jobId: jobId,
        isLoading: isLoading,
      );
  void saveValue({String? permitId}) async {
    return newPermitUsecase.saveValue(permitId: permitId);
  }

  void saveValuee({String? type}) async {
    return newPermitUsecase.saveValuee(type: type);
  }

  Future<String?> getValue() async => await newPermitUsecase.getValue();
  Future<String?> getValuee() async => await newPermitUsecase.getValuee();
  void saveisCheckedValue({bool? isChecked}) async {
    return newPermitUsecase.saveisCheckedValue(isChecked: isChecked);
  }

  Future<bool?> getisCheckedValue() async =>
      await newPermitUsecase.getisCheckedValue();
  void saveJobModelValue({String? jobModel}) async {
    return newPermitUsecase.saveJobModelValue(jobModel: jobModel);
  }

  Future<String> getJobModelValue() async =>
      await newPermitUsecase.getJobModelValue();
  void savePmTaskModelValue({String? pmtaskModel}) async {
    return newPermitUsecase.savePmTaskModelValue(pmtaskModel: pmtaskModel);
  }

  Future<String> getPmtaskModelValue() async =>
      await newPermitUsecase.getPmTaskModelValue();
  void clearStoreTaskData() {
    newPermitUsecase.clearStoreTaskData();
  }

  void clearStoreDataTaskId() {
    newPermitUsecase.clearStoreDataTaskId();
  }

  void clearStoreTaskActivityData() {
    newPermitUsecase.clearStoreTaskActivityData();
  }

  void clearStoreTaskfromActorData() {
    newPermitUsecase.clearStoreTaskfromActorData();
  }

  void clearStoreTasktoActorData() {
    newPermitUsecase.clearStoreTasktoActorData();
  }

  void clearStoreTaskWhereUsedData() {
    newPermitUsecase.clearStoreTaskWhereUsedData();
  }
}
