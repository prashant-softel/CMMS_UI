import 'package:cmms/domain/repositories/repository.dart';

import '../models/inventory_category_model.dart';
import '../models/pm_mapping_list_model.dart';
import '../models/preventive_checklist_model.dart';

class PmMappingUsecase {
  PmMappingUsecase(this.repository);
  Repository repository;
  Future<List<PmMappingListModel?>?> getPmMappingList({
    int? type,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getPmMappingList(
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
  Future<List<PreventiveCheckListModel?>?> getPreventiveCheckList({
    int? type,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getPreventiveCheckList(
        type,
        facilityId,
        isLoading,
      );
  Future<Map<String, dynamic>> savePmMapping({
    pmJsonString,
    bool? isLoading,
  }) async =>
      await repository.savePmMapping(
        pmJsonString,
        isLoading,
      );
}
