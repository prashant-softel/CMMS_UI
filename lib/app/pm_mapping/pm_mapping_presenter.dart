import '../../domain/models/inventory_category_model.dart';
import '../../domain/models/pm_mapping_list_model.dart';
import '../../domain/models/preventive_checklist_model.dart';
import '../../domain/usecases/pm_mapping_usecase.dart';

class PmMappingPresenter {
  PmMappingPresenter(this.pmMappingUsecase);
  PmMappingUsecase pmMappingUsecase;
  Future<List<PmMappingListModel?>?> getPmMappingList({
    int? facilityId,
    bool? isLoading,
  }) async =>
      await pmMappingUsecase.getPmMappingList(
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );
  Future<List<InventoryCategoryModel?>?> getInventoryCategoryList({
    bool? isLoading,
  }) async =>
      await pmMappingUsecase.getInventoryCategoryList(
        isLoading: isLoading ?? false,
      );
  //
  Future<List<PreventiveCheckListModel?>?> getPreventiveCheckList({
    int? facilityId,
    int? type,
    bool? isLoading,
  }) async =>
      await pmMappingUsecase.getPreventiveCheckList(
        facilityId: facilityId ?? 0,
        type: type,
        isLoading: false,
      );
  //
  Future<Map<String, dynamic>> savePmMapping({
    pmJsonString,
    required bool isLoading,
  }) async {
    return pmMappingUsecase.savePmMapping(
      pmJsonString: pmJsonString,
      isLoading: isLoading,
    );
  }
}
