import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/business_type_model.dart';
import 'package:cmms/domain/models/calibration_list_model.dart';

import '../models/business_list_model.dart';

class CalibrationListUsecase {
  final Repository _repository;

  CalibrationListUsecase(this._repository);
  Future<List<BusinessListModel>> getVenderNameList({
    required bool isLoading,
    required int facilityId,
    required int? businessType,
  }) async {
    return _repository.getBusinessList(
      isLoading: isLoading,
      facilityId: facilityId,
      businessType: businessType,
    );
  }

  Future<List<BusinessTypeModel>> getBusinessTypeList({
    required int? businessType,
    // int? blockId,
    // required String categoryIds,
    // int? blockId,
    // String? categoryIds,
    required bool isLoading,
  }) async =>
      await _repository.getBusinessTypeList(
        // blockId : blockId,
        // categoryIds,
        businessType: businessType,
        isLoading: isLoading,
      );
  Future<List<CalibrationListModel?>?> getCalibrationList({
    int? facilityId,
    bool? isLoading,
  }) async =>
      await _repository.getCalibrationList(
        facilityId,
        isLoading,
      );
  Future<bool> requestCalibration({
    requestCalibration,
    bool? isLoading,
  }) async =>
      await _repository.requestCalibration(
          requestCalibration: requestCalibration, isLoading: isLoading);
  Future<bool> rejectRequestCalibration({
    rejectCalibrationtoJsonString,
    bool? isLoading,
  }) async =>
      await _repository.rejectRequestCalibration(
          rejectCalibrationtoJsonString: rejectCalibrationtoJsonString,
          isLoading: isLoading);
  Future<bool> skipCalibration({
    skipCalibrationtoJsonString,
    bool? isLoading,
  }) async =>
      await _repository.skipCalibration(
          skipCalibrationtoJsonString: skipCalibrationtoJsonString,
          isLoading: isLoading);
  Future<bool> approveRequestCalibration({
    approveCalibrationtoJsonString,
    bool? isLoading,
  }) async =>
      await _repository.approveRequestCalibration(
          approveCalibrationtoJsonString: approveCalibrationtoJsonString,
          isLoading: isLoading);
  //
  Future<bool> approveCloseCalibration({
    approveCalibrationtoJsonString,
    bool? isLoading,
  }) async =>
      await _repository.approveCloseCalibration(
          approveCalibrationtoJsonString: approveCalibrationtoJsonString,
          isLoading: isLoading);
  Future<bool> rejectCloseCalibration({
    rejectCalibrationtoJsonString,
    bool? isLoading,
  }) async =>
      await _repository.rejectCloseCalibration(
          rejectCalibrationtoJsonString: rejectCalibrationtoJsonString,
          isLoading: isLoading);
  Future<bool> closeCalibration({
    closeCalibrationtoJsonString,
    bool? isLoading,
  }) async =>
      await _repository.closeCalibration(
          closeCalibrationtoJsonString: closeCalibrationtoJsonString,
          isLoading: isLoading);
  // Future<bool> completeCalibration({
  //   completeCalibrationtoJsonString,
  //   bool? isLoading,
  // }) async =>
  //     await _repository.completeCalibration(
  //         completeCalibrationtoJsonString: completeCalibrationtoJsonString,
  //         isLoading: isLoading);
  Future<bool> startCalibration(
          {required Object calibrationId, required bool isLoading}) async =>
      await _repository.startCalibration(
        calibrationId,
        isLoading,
      );
  void clearValue() async => _repository.clearData(LocalKeys.calibrationId);
}
