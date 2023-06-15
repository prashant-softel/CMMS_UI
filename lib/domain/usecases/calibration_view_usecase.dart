import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/calibration_detail_model.dart';

class CalibrationViewUsecase {
  final Repository repository;

  CalibrationViewUsecase(this.repository);
  Future<CalibrationDetailModel?> getCalibrationView({
    int? calibrationId,
    bool? isLoading,
  }) async =>
      await repository.getCalibrationView(
        calibrationId,
        isLoading,
      );
}
