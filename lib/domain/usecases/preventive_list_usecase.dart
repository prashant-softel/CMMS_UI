import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/models/preventive_checklist_model.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:cmms/domain/repositories/repository.dart';

import '../models/frequency_model.dart';

class PreventivelistUsecase {
  PreventivelistUsecase(this.repository);
  Repository repository;

  Future<List<InventoryCategoryModel?>?> getInventoryCategoryList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getInventoryCategoryList(auth, facilityId, isLoading, 0);
  Future<List<PreventiveCheckListModel?>?> getPreventiveCheckList({
    int? type,
    int? facilityId,
    bool? isLoading,
    bool? isExport,
  }) async =>
      await repository.getPreventiveCheckList(
          type: type,
          facilityId: facilityId,
          isLoading: isLoading,
          isExport: isExport);
  Future<List<FrequencyModel?>?> getFrequencyList({
    bool? isLoading,
  }) async =>
      await repository.getFrequencyList(
        isLoading,
      );
  Future<bool> createChecklistNumber({
    checklistJsonString,
    bool? isLoading,
  }) async =>
      await repository.createCheckListNumber(
          isLoading: isLoading, checklistJsonString: checklistJsonString);
  deleteCkecklist(
          {required Object checklist_id, required bool isLoading}) async =>
      await repository.deleteCkecklist(
        checklist_id,
        isLoading,
      );
  Future<bool> updateChecklistNumber({
    checklistJsonString,
    bool? isLoading,
  }) async =>
      await repository.updateChecklistNumber(
        isLoading: isLoading,
        checklistJsonString: checklistJsonString,
      );
  void saveValue({String? type}) async =>
      repository.saveValue(LocalKeys.type, type);
  Future<String?> getValue() async =>
      await repository.getStringValue(LocalKeys.type);
}
