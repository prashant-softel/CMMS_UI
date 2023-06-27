import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/calibration_list_model.dart';

import '../models/business_list_model.dart';

class CalibrationListUsecase {
  final Repository _repository;

  CalibrationListUsecase(this._repository);
  Future<List<BusinessListModel>> getVenderNameList({
    required bool isLoading,
    required int? businessType,
  }) async {
    return _repository.getBusinessList(
      isLoading: isLoading,
      businessType: businessType,
    );
  }

  Future<List<CalibrationListModel?>?> getCalibrationList({
    int? facilityId,
    bool? isLoading,
  }) async =>
      await _repository.getCalibrationList(
        facilityId,
        isLoading,
      );
  Future<void> requestCalibration({
    requestCalibration,
    bool? isLoading,
  }) async =>
      await _repository.requestCalibration(
          requestCalibration: requestCalibration, isLoading: isLoading);
  Future<void> rejectCalibration({
    rejectCalibrationtoJsonString,
    bool? isLoading,
  }) async =>
      await _repository.rejectCalibration(
          rejectCalibrationtoJsonString: rejectCalibrationtoJsonString,
          isLoading: isLoading);
  startCalibration(
          {required Object calibrationId, required bool isLoading}) async =>
      await _repository.startCalibration(
        calibrationId,
        isLoading,
      );
}
