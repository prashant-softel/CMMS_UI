import 'package:cmms/domain/usecases/calibration_detail_usecase.dart';

import '../../domain/models/inventory_category_model.dart';

class CalibrationDetailPresenter {
  CalibrationDetailPresenter(this.calibrationDetailUsecase);
  CalibrationDetailUsecase calibrationDetailUsecase;

  Future<List<InventoryCategoryModel?>?> getInventoryCategoryList({
    bool? isLoading,
  }) async =>
      await calibrationDetailUsecase.getInventoryCategoryList(
        isLoading: isLoading ?? false,
      );
}
