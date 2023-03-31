import '../../domain/models/inventory_category_model.dart';
import '../../domain/usecases/pm_schedule_usecase.dart';

class PmSchedulePresenter {
  PmSchedulePresenter(this.pmScheduleUsecase);
  PmScheduleUsecase pmScheduleUsecase;
  Future<List<InventoryCategoryModel?>?> getInventoryCategoryList({
    bool? isLoading,
  }) async =>
      await pmScheduleUsecase.getInventoryCategoryList(
        isLoading: isLoading ?? false,
      );
}
