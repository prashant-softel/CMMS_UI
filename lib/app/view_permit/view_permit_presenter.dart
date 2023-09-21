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
    permitId,
    isLoading,
  ) async =>
      await viewPermitUsecase.getPermitHistory(
        moduleType: moduleType,
        permitId: permitId,
        isLoading: isLoading,
      );

   Future<void> permitApprovedButton({
    String? comment,
    String? id,
    String? ptwStatus,
    int? jobId,
    bool? isLoading,
  }) async =>
      await viewPermitUsecase.permitApprovedButton(
        comment: comment,
        id: id,
        ptwStatus: ptwStatus,
        jobId: jobId,
        isLoading: isLoading ?? false,
      );

  Future<Map<String, dynamic>?> permitCloseButton({
   closePermitJsonString,
  required bool isLoading,
    
  }) async {
     return viewPermitUsecase.permitCloseButton(
        closePermitJsonString: closePermitJsonString,
      isLoading: isLoading,
      );
  }

   Future<CreateSOPModel?> browseFiles(
      Uint8List? fileBytes, String fileName, bool isLoading) async {
    return await viewPermitUsecase.browseFiles(fileBytes, fileName, isLoading);
    // return true;
  }

   Future<CreateSOPModel?> browseFilesForExtend(
      Uint8List? fileBytes, String fileName, bool isLoading) async {
    return await viewPermitUsecase.browseFilesForExtend(fileBytes, fileName, isLoading);
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

  Future<Map<String, dynamic>?> permitCancelRequestButton({
   cancelPermitJsonString,
  required bool isLoading,
    
  }) async {
     return viewPermitUsecase.permitCancelRequestButton(
        cancelPermitJsonString: cancelPermitJsonString,
      isLoading: isLoading,
      );
  }



  Future<Map<String, dynamic>?> permitExtendButton({
   extendPermitJsonString,
  required bool isLoading,
    
  }) async {
     return viewPermitUsecase.permitExtendButton(
        extendPermitJsonString: extendPermitJsonString,
      isLoading: isLoading,
      );
  }


   Future<void> permitRejectButton({
    String? comment,
    String? id,
    bool? isLoading,
  }) async =>
      await viewPermitUsecase.permitRejectButton(
        comment: comment,
        id: id,
        isLoading: isLoading ?? false,
      );

   Future<void> permitCancelByApproverButton({
    String? comment,
    String? id,
    String? ptwStatus,
    bool? isLoading,
  }) async =>
      await viewPermitUsecase.permitCancelByApproverButton(
        comment: comment,
        id: id,
        ptwStatus: ptwStatus,
        isLoading: isLoading ?? false,
      );

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
    required int? isCancle,
  }) async {
    return viewPermitUsecase.getPermitConditionList(
      isLoading: isLoading,
      isCancle: isCancle,
    );
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
    // int? facilityId,
    int? id,
    bool? isLoading,
  }) async =>
      await viewPermitUsecase.getInventoryDetailList(
        auth: auth ?? "",
        // facilityId: 45,
        // facilityId: facilityId ?? 0,
        id: id,
        isLoading: isLoading ?? false,
      );

  Future<NewPermitDetailModel?> getViewPermitDetail({
  
    bool? isLoading,  
    required int permitId,
  }) async {
      return viewPermitUsecase.getViewPermitDetail(
        permitId: permitId,
        isLoading: isLoading ?? false,
      );
  }




   Future<List<FacilityModel?>?> getFacilityLists() async =>
      await viewPermitUsecase.getFacilityLists(true);

   Future<List<TypePermitModel?>?> getTypePermitList(
    {required int facility_id}
   ) async =>
      await viewPermitUsecase.getTypePermitList(
        true,
        facility_id
        );

  Future<List<InventoryCategoryModel?>?> getInventoryCategoryList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await viewPermitUsecase.getInventoryCategoryList(
      );

  Future<List<InventoryCategoryModel?>?> getInventoryIsolationList({
    String? auth,
    int? facilityId,
    bool? isLoading,
    int? categoryId,
  }) async =>
      await viewPermitUsecase.getInventoryIsolationList(
      );

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

}


