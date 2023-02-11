import 'package:cmms/domain/domain.dart';

import '../../domain/models/inventory_category_model.dart';

class AddJobPresenter {
  AddJobPresenter(this.addJobUsecase);
  AddJobUsecase addJobUsecase;

  ///

  Future<List<BlockModel?>?> getBlocksList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await addJobUsecase.getBlocksList(
        auth: auth ?? "",
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );
  Future<List<InventoryCategoryModel?>?> getInventoryCategoryList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await addJobUsecase.getInventoryCategoryList(
        auth: auth ?? "",
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );

  ///
}
