import '../../domain/models/history_model.dart';
import '../../domain/usecases/calibration_history_usecase.dart';

class CalibrationHistoryPresenter {
  CalibrationHistoryPresenter(this.calibrationHistoryUsecase);
  CalibrationHistoryUsecase calibrationHistoryUsecase;
  Future<List<HistoryModel>?> getJobCardHistory(
    moduleType,
    Id,
    isLoading,
  ) async =>
      await calibrationHistoryUsecase.getJobCardHistory(
        moduleType: moduleType,
        Id: Id,
        isLoading: isLoading,
      );
}
