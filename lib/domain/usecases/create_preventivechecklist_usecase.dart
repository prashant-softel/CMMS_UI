import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

class CreatePreventiveChecklistUsecase {
  CreatePreventiveChecklistUsecase(this.repository);
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
  Future<void> createCheckList({
    bool? isLoading,
  }) async =>
      await repository.createCheckList(isLoading: isLoading);
}
