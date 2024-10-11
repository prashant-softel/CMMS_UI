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

  void clearValue() async => repository.clearData(LocalKeys.pmPlanId);

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
      await repository.getInventoryCategoryList(auth, facilityId, isLoading, 0);
  Future<Map<String, dynamic>> createPmPlan({
    createPmPlanJsonString,
    bool? isLoading,
  }) async =>
      await repository.createPmPlan(
        createPmPlanJsonString,
        isLoading,
      );
  Future<Map<String, dynamic>> updatePmPlan({
    createPmPlanJsonString,
    bool? isLoading,
  }) async =>
      await repository.updatePmPlan(
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
  Future<List<EmployeeModel?>?> getAssignedToListWOAttend({
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
    required int facilityId,
    bool? isLoading,
  }) async =>
      await repository.getPmPlanDetails(
        pmPlanId,
        facilityId,
        isLoading,
      );
  void saveValue({String? pmPlanId}) async =>
      repository.saveValue(LocalKeys.pmPlanId, pmPlanId);
  Future<String?> getValue() async =>
      await repository.getStringValue(LocalKeys.pmPlanId);
}
