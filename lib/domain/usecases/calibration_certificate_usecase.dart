import 'package:cmms/domain/repositories/repository.dart';
import '../models/calibration_certificate_model.dart';

class CalibrationCertificateUsecase {
  CalibrationCertificateUsecase(this.repository);
  Repository repository;

 

  Future<List<CalibrationCertificateModel?>?> getCalibrationCertificate({
    int? type,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getCalibrationCertificate(
        type,
        facilityId,
        isLoading,
      );
 
  // Future<bool> createModulelistNumber({
  //   modulelistJsonString,
  //   bool? isLoading,
  // }) async =>
  //     await repository.createModuleListNumber(
  //         isLoading: isLoading, modulelistJsonString: modulelistJsonString);
  // deleteModulelist(
  //         {required Object module_id, required bool isLoading}) async =>
  //     await repository.deleteModulelist(
  //       module_id,
  //       isLoading,
  //     );
  // Future<bool> updateModulelistNumber({
  //   modulelistJsonString,
  //   bool? isLoading,
  // }) async =>
  //     await repository.updateModulelistNumber(
  //       isLoading: isLoading,
  //       modulelistJsonString: modulelistJsonString,
  //     );

}
