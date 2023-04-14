import 'package:cmms/domain/models/calibration_list_model.dart';

import '../../domain/models/business_list_model.dart';
import '../../domain/usecases/calibration_list_usecase.dart';

class CalibrationListPresenter {
  CalibrationListPresenter(this.calibrationListUsecase);
  CalibrationListUsecase calibrationListUsecase;
  Future<List<BusinessListModel>> getVenderNameList({
    required bool isLoading,
    required int? businessType,
    int? blockId,
  }) async {
    return calibrationListUsecase.getVenderNameList(
      isLoading: isLoading,
      businessType: businessType,
    );
  }

  Future<List<CalibrationListModel?>?> getCalibrationList({
    int? facilityId,
    bool? isLoading,
  }) async =>
      await calibrationListUsecase.getCalibrationList(
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );
  Future<void> StartCalibration({
    startcalibration,
    required bool isLoading,
  }) async {
    return calibrationListUsecase.StartCalibration(
      startcalibration: startcalibration,
      isLoading: isLoading,
    );
  }
}
