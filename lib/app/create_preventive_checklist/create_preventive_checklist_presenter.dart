import 'package:cmms/domain/usecases/create_preventivechecklist_usecase.dart';

import '../../domain/models/inventory_category_model.dart';

class CreateCheckListPresenter {
  CreateCheckListPresenter(this.createPreventiveChecklistUsecase);
  CreatePreventiveChecklistUsecase createPreventiveChecklistUsecase;

  Future<List<InventoryCategoryModel?>?> getInventoryCategoryList({
    bool? isLoading,
  }) async =>
      await createPreventiveChecklistUsecase.getInventoryCategoryList(
        isLoading: isLoading ?? false,
      );
}
