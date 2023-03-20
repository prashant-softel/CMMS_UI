import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/models/preventive_checklist_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

class PreventivelistUsecase {
  PreventivelistUsecase(this.repository);
  Repository repository;

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
}
