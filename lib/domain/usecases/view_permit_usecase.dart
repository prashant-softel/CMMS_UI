import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/employee_list_model.dart';
import 'package:cmms/domain/models/employee_list_model2.dart';
import 'package:cmms/domain/models/employee_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/models/inventory_detail_model.dart';
import 'package:cmms/domain/models/job_type_list_model.dart';
import 'package:cmms/domain/models/new_permit_details_model.dart';
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
    permitId,
    bool? isLoading,
  }) async =>
      await repository.getPermitHistory(
        moduleType,
        permitId,
        isLoading,
      );

   Future<void> permitApprovedButton({
    String? comment,
    String? id,
    String? ptwStatus,
    int? jobId,
    bool? isLoading,
  }) async {
    await repository.permitApprovedButton(
      comment,
      id,
      ptwStatus,
      jobId,
      isLoading,
    );
  }

  Future<void> permitCloseButton({
    String? comment,
    String? id,
    bool? isLoading,
  }) async {
    await repository.permitCloseButton(
      comment,
      id,
      isLoading,
    );
  }

  Future<void> permitCancelRequestButton({
    String? comment,
    String? id,
    bool? isLoading,
  }) async {
    await repository.permitCancelRequestButton(
      comment,
      id,
      isLoading,
    );
  }

   Future<bool> browseFiles(Uint8List? fileBytes, String fileName,
      int importType, bool isLoading, int facilityId) async {
    await repository.browseFiles(
        fileBytes, fileName, importType, isLoading, facilityId);
    return true;
  }

  Future<void> permitExtendButton({
    String? comment,
    String? Time,
    String? id,
    bool? isLoading,
  }) async {
    await repository.permitExtendButton(
      comment,
      Time,
      id,
      isLoading,
    );
  }


   Future<void> permitRejectButton({
    String? comment,
    String? id,
    bool? isLoading,
  }) async {
    await repository.permitRejectButton(
      comment,
      id,
      isLoading,
    );
  }

   Future<void> permitCancelByApproverButton({
    String? comment,
    String? id,
    String? ptwStatus,
    bool? isLoading,
  }) async {
    await repository.permitCancelByApproverButton(
      comment,
      id,
      ptwStatus,
      isLoading,
    );
  }


  Future<List<SafetyMeasureListModel>> getSafetyMeasureList({
    required bool isLoading,
    required int? permit_type_id
   
  }) async {
    return repository.getSafetyMeasureList(
      isLoading: isLoading,
      permit_type_id: permit_type_id,
  
    );
  }

  Future<NewPermitDetailModel?> getViewPermitDetail({
    bool? isLoading,  
    required int permitId,
  }) async =>
      await repository.getViewPermitDetail(
        permitId: permitId,
        isLoading: isLoading ?? false,
      );


   Future<List<EmployeeListModel>> getEmployeePermitList({
    required bool isLoading,
    required int? facility_id
   
  }) async {
    return repository.getEmployeePermitList(
      isLoading: isLoading,
      facility_id: facility_id,
  
    );
  }

   Future<List<EmployeeListModel>> getPermitIssuerList({
    required bool isLoading,
    required int? facility_id
   
  }) async {
    return repository.getPermitIssuerList(
      isLoading: isLoading,
      facility_id: facility_id,
  
    );
  }

   Future<List<EmployeeListModel2>> getPermitApproverList({
    required bool isLoading,
    required int? facility_id
   
  }) async {
    return repository.getPermitApproverList(
      isLoading: isLoading,
      facility_id: facility_id,
  
    );
  }

  Future<List<JobTypeListModel>> getJobTypePermitList({
    required bool isLoading,
    required int? facility_id
   
  }) async {
    return repository.getJobTypePermitList(
      isLoading: isLoading,
      facility_id: facility_id,
  
    );
  }

   Future<List<SOPListModel>> getSopPermitList({
    required bool isLoading,
    required int? job_type_id
   
  }) async {
    return repository.getSopPermitList(
      isLoading: isLoading,
      job_type_id: job_type_id,
  
    );
  }

  Future<List<InventoryDetailModel?>?> getInventoryDetailList({
    required String auth,
    int? id,
    bool? isLoading,
  }) async =>
      await repository.getInventoryDetailList(
        auth,
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
      await repository.getInventoryCategoryList(
        auth,
        facilityId,
        isLoading,
      );


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
    bool? isLoading,
    int? facility_id
    ) async =>
      await repository.getTypePermitList(
        isLoading,
        facility_id
        );

  Future<Map<String, dynamic>> createNewPermit({
    newPermit,
    bool? isLoading,
  }) async =>
      await repository.createNewPermit(
         newPermit,
        isLoading,
      );

}
