import 'package:cmms/domain/models/employee_model.dart';
import 'package:cmms/domain/models/equipment_list_model.dart';
import 'package:cmms/domain/models/frequency_model.dart';
import 'package:cmms/domain/models/get_pm_plan_detail_model.dart';
import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/models/inventory_model.dart';
import 'package:cmms/domain/models/mc_details_plan_model.dart';
import 'package:cmms/domain/models/preventive_checklist_model.dart';

import 'package:cmms/domain/repositories/repository.dart';

import '../repositories/local_storage_keys.dart';

class ModuleCleaningPlanningUsecase {
  ModuleCleaningPlanningUsecase(this.repository);
  Repository repository;
  Future<List<InventoryModel?>?> inventoryList(
      {required bool isLoading, int? facilityId, int? categoryId}) async {
    return repository.inventoryList(
        isLoading: isLoading, facilityId: facilityId, categoryId: categoryId);
  }

  Future<List<FrequencyModel?>?> getFrequencyList({
    bool? isLoading,
  }) async =>
      await repository.getFrequencyList(
        isLoading,
      );
  Future<Map<String, dynamic>> createMcPlan(
          {createMcPlans, bool? isLoading, int? facilityId}) async =>
      await repository.createMcPlan(
        createMcPlans,
        isLoading,
        facilityId,
      );

  Future<Map<String, dynamic>> updateMcPlan({
    updateMcPlans,
    bool? isLoading,int?facility_id
  }) async =>
      await repository.updateMcPlan(
        updateMcPlans,
        isLoading,facility_id
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
  Future<Map<String, dynamic>> createPmPlan({
    createPmPlanJsonString,
    bool? isLoading,
  }) async =>
      await repository.createPmPlan(
        createPmPlanJsonString,
        isLoading,
      );
  Future<List<EquipmentListModel>> getEquipmentModelList({
    required bool isLoading,
    required int? facilityId,
  }) async {
    return repository.getEquipmentModelList(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }

  Future<List<PreventiveCheckListModel?>?> getPreventiveCheckListForPm(
          {int? type,
          int? facilityId,
          bool? isLoading,
          int? frequencyid,
          int? categoryId}) async =>
      await repository.getPreventiveCheckListForPm(
          type: type,
          facilityId: facilityId,
          isLoading: isLoading,
          categoryId: categoryId,
          frequencyid: frequencyid);
  Future<List<EmployeeModel?>?> getAssignedToList({
    String? auth,
    int? facilityId,
    int? featureId,
    int? isattendanceneeded,
    bool? isLoading,
  }) async =>
      await repository.getAssignedToListWOAttend(
        auth,
        facilityId,
        featureId,
        isattendanceneeded,
        isLoading,
      );
  Future<PMPlanDetail?> getPmPlanDetails({
    int? pmPlanId,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getPmPlanDetails(
        pmPlanId,
        facilityId!,
        isLoading,
      );
  Future<McPalningDetailsModel?> getMcPlanDetail({
    bool? isLoading,
    required int planId,
    required int facilityId,
  }) async =>
      await repository.getMcPlanDetail(
        planId: planId,
        facilityId: facilityId,
        isLoading: isLoading ?? false,
      );
  void saveValueMcId({String? mcid}) async =>
      repository.saveValue(LocalKeys.mcid, mcid);
  Future<String?> getValueMcId() async =>
      await repository.getStringValue(LocalKeys.mcid);
  void saveValuePlanId({String? planId}) async =>
      repository.saveValue(LocalKeys.planId, planId);
  Future<String?> getValuePlanId() async =>
      await repository.getStringValue(LocalKeys.planId);
}
