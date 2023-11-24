import 'package:cmms/domain/models/employee_model.dart';
import 'package:cmms/domain/models/frequency_model.dart';
import 'package:cmms/domain/models/get_pm_plan_detail_model.dart';
import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/models/inventory_model.dart';
import 'package:cmms/domain/models/preventive_checklist_model.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';

import 'package:cmms/domain/repositories/repository.dart';

class CreatePmPlanUsecase {
  CreatePmPlanUsecase(this.repository);
  Repository repository;
  Future<List<InventoryModel?>?> inventoryList(
      {required bool isLoading, int? facilityId, int? categoryId}) async {
    return repository.inventoryListviaCategory(
        isLoading: isLoading, facilityId: facilityId, categoryId: categoryId);
  }

  Future<List<FrequencyModel?>?> getFrequencyList({
    bool? isLoading,
  }) async =>
      await repository.getFrequencyList(
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
  Future<Map<String, dynamic>> createPmPlan({
    createPmPlanJsonString,
    bool? isLoading,
  }) async =>
      await repository.createPmPlan(
        createPmPlanJsonString,
        isLoading,
      );
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
    bool? isLoading,
  }) async =>
      await repository.getAssignedToList(
        auth,
        facilityId,
        isLoading,
      );
  Future<PMPlanDetail?> getPmPlanDetails({
    int? pmPlanId,
    bool? isLoading,
  }) async =>
      await repository.getPmPlanDetails(
        pmPlanId,
        isLoading,
      );
  void saveValue({String? pmPlanId}) async =>
      repository.saveValue(LocalKeys.pmPlanId, pmPlanId);
  Future<String?> getValue() async =>
      await repository.getStringValue(LocalKeys.pmPlanId);
}
