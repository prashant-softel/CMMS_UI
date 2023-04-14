import 'package:cmms/domain/domain.dart';

import '../models/inventory_category_model.dart';

class CalibrationDetailUsecase {
  final Repository repository;

  CalibrationDetailUsecase(this.repository);
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
