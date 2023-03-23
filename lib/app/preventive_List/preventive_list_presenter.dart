import 'package:cmms/domain/models/preventive_checklist_model.dart';

import '../../domain/models/frequency_model.dart';
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
  Future<List<FrequencyModel?>?> getFrequencyList({
    bool? isLoading,
  }) async =>
      await preventivelistUsecase.getFrequencyList(
        isLoading: isLoading ?? false,
      );
  Future<void> createChecklistNumber({
    auth,
    required bool isLoading,
  }) async {
    print("presenter");
    return preventivelistUsecase.createChecklistNumber(
      isLoading: isLoading,
    );
  }
}
