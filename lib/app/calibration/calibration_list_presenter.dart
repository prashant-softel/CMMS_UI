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
  Future<bool> requestCalibration({
    requestCalibration,
    required bool isLoading,
  }) async {
    return calibrationListUsecase.requestCalibration(
      requestCalibration: requestCalibration,
      isLoading: isLoading,
    );
  }

  Future<bool> rejectRequestCalibration({
    rejectCalibrationtoJsonString,
    required bool isLoading,
  }) async {
    return calibrationListUsecase.rejectRequestCalibration(
      rejectCalibrationtoJsonString: rejectCalibrationtoJsonString,
      isLoading: isLoading,
    );
  }

  Future<bool> approveRequestCalibration({
    approveCalibrationtoJsonString,
    required bool isLoading,
  }) async {
    return calibrationListUsecase.approveRequestCalibration(
      approveCalibrationtoJsonString: approveCalibrationtoJsonString,
      isLoading: isLoading,
    );
  }

  Future<bool> startCalibration(String? calibrationId,
          {required bool isLoading}) async =>
      await calibrationListUsecase.startCalibration(
        calibrationId: calibrationId ?? 0,
        isLoading: isLoading,
      );
}
