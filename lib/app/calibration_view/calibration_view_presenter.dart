// ignore: unused_import
import 'package:cmms/domain/models/calibration_detail_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/usecases/calibration_view_usecase.dart';

class CalibrationViewPresenter {
  CalibrationViewPresenter(this.calibrationViewUsecase);
  CalibrationViewUsecase calibrationViewUsecase;
  Future<CalibrationDetailModel?> getCalibrationView({
    int? calibrationId,
    required int facilityId,
    bool? isloading,
  }) async =>
      await calibrationViewUsecase.getCalibrationView(
        calibrationId: calibrationId,
        facilityId:facilityId,
        isLoading: isloading,
      );
  Future<List<HistoryModel>?> getHistory(
    moduleType,
    calibrationId,
    isLoading,
  ) async =>
      await calibrationViewUsecase.getHistory(
        moduleType: moduleType,
        calibrationId: calibrationId,
        isLoading: isLoading,
      );
}
