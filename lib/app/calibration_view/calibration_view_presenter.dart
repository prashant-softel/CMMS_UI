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
        facilityId: facilityId,
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
  void saveValue({String? calibrationId}) async {
    return calibrationViewUsecase.saveValue(calibrationId: calibrationId);
  }

  Future<String?> getValue() async => await calibrationViewUsecase.getValue();

  Future<void> completeCalibration({
    completeCalibrationtoJsonString,
    required bool isLoading,
  }) async {
    return calibrationViewUsecase.completeCalibration(
      completeCalibrationtoJsonString: completeCalibrationtoJsonString,
      isLoading: isLoading,
    );
  }

  Future<void> rejectRequestCalibration({
    rejectCalibrationtoJsonString,
    required bool isLoading,
  }) async {
    return calibrationViewUsecase.rejectRequestCalibration(
      rejectCalibrationtoJsonString: rejectCalibrationtoJsonString,
      isLoading: isLoading,
    );
  }

  Future<void> approveRequestCalibration({
    approveCalibrationtoJsonString,
    required bool isLoading,
  }) async {
    return calibrationViewUsecase.approveRequestCalibration(
      approveCalibrationtoJsonString: approveCalibrationtoJsonString,
      isLoading: isLoading,
    );
  }

  Future<void> startCalibration(String? calibrationId,
          {required bool isLoading}) async =>
      await calibrationViewUsecase.startCalibration(
        calibrationId: calibrationId ?? 0,
        isLoading: isLoading,
      );
  Future<bool> approveCloseCalibration({
    approveCalibrationtoJsonString,
    required bool isLoading,
  }) async {
    return calibrationViewUsecase.approveCloseCalibration(
      approveCalibrationtoJsonString: approveCalibrationtoJsonString,
      isLoading: isLoading,
    );
  }

  Future<bool> rejectCloseCalibration({
    rejectCalibrationtoJsonString,
    required bool isLoading,
  }) async {
    return calibrationViewUsecase.rejectCloseCalibration(
      rejectCalibrationtoJsonString: rejectCalibrationtoJsonString,
      isLoading: isLoading,
    );
  }

  Future<bool> closeCalibration({
    closeCalibrationtoJsonString,
    required bool isLoading,
  }) async {
    return calibrationViewUsecase.closeCalibration(
      closeCalibrationtoJsonString: closeCalibrationtoJsonString,
      isLoading: isLoading,
    );
  }
}
