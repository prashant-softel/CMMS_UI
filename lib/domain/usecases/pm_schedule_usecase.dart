import 'package:cmms/domain/repositories/repository.dart';

import '../models/inventory_category_model.dart';

class PmScheduleUsecase {
  PmScheduleUsecase(this.repository);
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
}
