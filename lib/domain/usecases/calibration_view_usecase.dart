import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/calibration_detail_model.dart';
import 'package:cmms/domain/models/history_model.dart';

class CalibrationViewUsecase {
  final Repository repository;

  CalibrationViewUsecase(this.repository);
  Future<CalibrationDetailModel?> getCalibrationView({
    int? calibrationId,
    required int facilityId,
    bool? isLoading,
  }) async =>
      await repository.getCalibrationView(
        calibrationId,
        facilityId,
        isLoading,
      );
  Future<List<HistoryModel>?> getHistory({
    moduleType,
    facilityId,
    calibrationId,
    bool? isLoading,
  }) async =>
      await repository.getHistory(
        moduleType,
        calibrationId,
        facilityId,
        isLoading,
      );
  void saveValue({String? calibrationId}) async =>
      repository.saveValue(LocalKeys.calibrationId, calibrationId);
  Future<String?> getValue() async =>
      await repository.getStringValue(LocalKeys.calibrationId);

  Future<void> completeCalibration({
    completeCalibrationtoJsonString,
    bool? isLoading,
  }) async =>
      await repository.completeCalibration(
          completeCalibrationtoJsonString: completeCalibrationtoJsonString,
          isLoading: isLoading);
  Future<void> rejectRequestCalibration({
    rejectCalibrationtoJsonString,
    bool? isLoading,
  }) async =>
      await repository.rejectRequestCalibration(
          rejectCalibrationtoJsonString: rejectCalibrationtoJsonString,
          isLoading: isLoading);

  Future<void> approveRequestCalibration({
    approveCalibrationtoJsonString,
    bool? isLoading,
  }) async =>
      await repository.approveRequestCalibration(
          approveCalibrationtoJsonString: approveCalibrationtoJsonString,
          isLoading: isLoading);
  //
  Future<void> startCalibration(
          {required Object calibrationId, required bool isLoading}) async =>
      await repository.startCalibration(
        calibrationId,
        isLoading,
      );
  Future<bool> approveCloseCalibration({
    approveCalibrationtoJsonString,
    bool? isLoading,
  }) async =>
      await repository.approveCloseCalibration(
          approveCalibrationtoJsonString: approveCalibrationtoJsonString,
          isLoading: isLoading);
  Future<bool> rejectCloseCalibration({
    rejectCalibrationtoJsonString,
    bool? isLoading,
  }) async =>
      await repository.rejectCloseCalibration(
          rejectCalibrationtoJsonString: rejectCalibrationtoJsonString,
          isLoading: isLoading);
  Future<bool> closeCalibration({
    closeCalibrationtoJsonString,
    bool? isLoading,
  }) async =>
      await repository.closeCalibration(
          closeCalibrationtoJsonString: closeCalibrationtoJsonString,
          isLoading: isLoading);
}
