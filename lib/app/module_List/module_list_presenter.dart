import 'package:cmms/domain/models/preventive_checklist_model.dart';

import '../../domain/models/frequency_model.dart';
import '../../domain/models/inventory_category_model.dart';
import '../../domain/models/modulelist_model.dart';
import '../../domain/usecases/module_list_usecase.dart';

class ModuleListPresenter {
  ModuleListPresenter(this.moduleUsecase);
  ModulelistUsecase moduleUsecase;

  Future<List<InventoryCategoryModel?>?> getInventoryCategoryList({
    bool? isLoading,
  }) async =>
      await moduleUsecase.getInventoryCategoryList(
        isLoading: isLoading ?? false,
      );
  Future<List<ModuleListModel?>?> getModuleList({
    int? facilityId,
    int? type,
    bool? isLoading,
  }) async =>
      await moduleUsecase.getModuleList(
        facilityId: facilityId ?? 0,
        type: type,
        isLoading: isLoading ?? false,
      );
  Future<List<FrequencyModel?>?> getFrequencyList({
    bool? isLoading,
  }) async =>
      await moduleUsecase.getFrequencyList(
        isLoading: isLoading ?? false,
      );
  Future<bool> createChecklistNumber({
    checklistJsonString,
    required bool isLoading,
  }) async {
    print("presenter");
    moduleUsecase.createChecklistNumber(
      checklistJsonString: checklistJsonString,
      isLoading: isLoading,
    );
    return true;
  }

  deleteCkecklist(String? checklist_id, {required bool isLoading}) async =>
      await moduleUsecase.deleteCkecklist(
        checklist_id: checklist_id ?? 0,
        isLoading: isLoading,
      );
  Future<bool> updateChecklistNumber(
      {checklistJsonString, required bool isLoading, checklistId}) async {
    print("presenter");
    moduleUsecase.updateChecklistNumber(
      checklistJsonString: checklistJsonString,
      isLoading: isLoading,
    );
    return true;
  }
}
