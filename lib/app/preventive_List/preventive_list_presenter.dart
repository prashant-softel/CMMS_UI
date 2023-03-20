import 'package:cmms/domain/models/preventive_checklist_model.dart';

import '../../domain/models/inventory_category_model.dart';
import '../../domain/usecases/preventive_list_usecase.dart';

class PreventiveListPresenter {
  PreventiveListPresenter(this.preventivelistUsecase);
  PreventivelistUsecase preventivelistUsecase;

  Future<List<InventoryCategoryModel?>?> getInventoryCategoryList({
    bool? isLoading,
  }) async =>
      await preventivelistUsecase.getInventoryCategoryList(
        isLoading: isLoading ?? false,
      );
  Future<List<PreventiveCheckListModel?>?> getPreventiveCheckList({
    int? facilityId,
    int? type,
    bool? isLoading,
  }) async =>
      await preventivelistUsecase.getPreventiveCheckList(
        facilityId: facilityId ?? 0,
        type: type,
        isLoading: isLoading ?? false,
      );
}
