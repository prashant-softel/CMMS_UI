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
  Future<void> StartCalibration({
    startcalibration,
    bool? isLoading,
  }) async =>
      await _repository.StartCalibration(
          startcalibration: startcalibration, isLoading: isLoading);
}
