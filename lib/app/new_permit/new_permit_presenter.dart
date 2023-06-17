import 'package:cmms/domain/models/block_model.dart';
import 'package:cmms/domain/models/employee_list_model.dart';
import 'package:cmms/domain/models/employee_list_model2.dart';
import 'package:cmms/domain/models/employee_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/inventory_detail_model.dart';
import 'package:cmms/domain/models/inventory_model.dart';
import 'package:cmms/domain/models/job_type_list_model.dart';
import 'package:cmms/domain/models/new_permit_details_model.dart';
import 'package:cmms/domain/models/preventive_checklist_model.dart';
import 'package:cmms/domain/models/safety_measure_list_model.dart';
import 'package:cmms/domain/models/sop_list_model.dart';
import 'package:cmms/domain/models/type_permit_model.dart';
import 'package:cmms/domain/models/work_type_model.dart';
import 'package:cmms/domain/repositories/repositories.dart';
import 'package:cmms/domain/usecases/breakdown_usecase.dart';
import 'package:cmms/domain/usecases/breakdown_usecase.dart';
import 'package:cmms/domain/usecases/new_permit_usecase.dart';

import '../../../domain/models/inventory_category_model.dart';
import '../../../domain/usecases/preventive_list_usecase.dart';
import '../../domain/models/create_permit_model.dart';
import '../../domain/usecases/breakdown_usecase.dart';

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

   Future<List<EmployeeListModel>> getEmployeePermitList({
    required bool isLoading,
    required int? facility_id,
  }) async {
    return newPermitUsecase.getEmployeePermitList(
      isLoading: isLoading,
      facility_id: facility_id,
    );
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
    // int? facilityId,
    int? id,
    bool? isLoading,
  }) async =>
      await newPermitUsecase.getInventoryDetailList(
        auth: auth ?? "",
        // facilityId: 45,
        // facilityId: facilityId ?? 0,
        id: id,
        isLoading: isLoading ?? false,
      );



   Future<List<FacilityModel?>?> getFacilityLists() async =>
      await newPermitUsecase.getFacilityLists(true);

   Future<List<TypePermitModel?>?> getTypePermitList(
    {required int facility_id}
   ) async =>
      await newPermitUsecase.getTypePermitList(
        true,
        facility_id
        );


  Future<List<InventoryCategoryModel?>?> getInventoryCategoryList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await newPermitUsecase.getInventoryCategoryList(
      );

  Future<List<InventoryCategoryModel?>?> getInventoryIsolationList({
    String? auth,
    int? facilityId,
    bool? isLoading,
    int? categoryId,
  }) async =>
      await newPermitUsecase.getInventoryIsolationList(
      );

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

   Future<Map<String, dynamic>?> updateNewPermit({
     newPermit,
    required bool isLoading,
  }) async {
    return newPermitUsecase.updateNewPermit(
       newPermit: newPermit,
      isLoading: isLoading,
    );
  }

Future<NewPermitDetailModel?> getNewPermitDetail({
  
    bool? isLoading,  
    required int permitId,
  }) async {
      return newPermitUsecase.getNewPermitDetail(
        permitId: permitId,
        isLoading: isLoading ?? false,
      );
  }

}


