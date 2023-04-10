import '../../domain/models/business_list_model.dart';
import '../../domain/usecases/calibration_list_usecase.dart';

class CalibrationListPresenter {
  CalibrationListPresenter(this.calibrationListUsecase);
  CalibrationListUsecase calibrationListUsecase;
  Future<List<BusinessListModel>> getBusinessList({
    required bool isLoading,
    required int? businessType,
    int? blockId,
  }) async {
    return calibrationListUsecase.getBusinessList(
      isLoading: isLoading,
      businessType: businessType,
    );
  }
}
