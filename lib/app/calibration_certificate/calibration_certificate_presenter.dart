import 'package:cmms/domain/models/preventive_checklist_model.dart';

import '../../domain/models/calibration_certificate_model.dart';
import '../../domain/models/frequency_model.dart';
import '../../domain/models/inventory_category_model.dart';
import '../../domain/models/modulelist_model.dart';
import '../../domain/usecases/calibration_certificate_usecase.dart';
import '../../domain/usecases/module_list_usecase.dart';

class CalibrationCertificatePresenter {
  CalibrationCertificatePresenter(this.calibrationCertificateusecase);
  CalibrationCertificateUsecase calibrationCertificateusecase;


  Future<List<CalibrationCertificateModel?>?> getCalibrationList({
    int? facilityId,
    int? type,
    bool? isLoading,
  }) async =>
      await calibrationCertificateusecase.getCalibrationCertificate(
        facilityId: facilityId ?? 0,
        type: type,
        isLoading: isLoading ?? false,
      );
  
  // Future<bool> createModulelistNumber({
  //   modulelistJsonString,
  //   required bool isLoading,
  // }) async {
  //   print("presenter");
  //   calibrationCertificateusecase.createModulelistNumber(
  //     modulelistJsonString: modulelistJsonString,
  //     isLoading: isLoading,
  //   );
  //   return true;
  // }
  //
  // deleteModulelist(String? module_id, {required bool isLoading}) async =>
  //     await calibrationCertificateusecase.deleteModulelist(
  //       module_id: module_id ?? 0,
  //       isLoading: isLoading,
  //     );
  // Future<bool> updateModulelistNumber(
  //     {modulelistJsonString, required bool isLoading, moduleId}) async {
  //   print("presenter");
  //   calibrationCertificateusecase.updateModulelistNumber(
  //     modulelistJsonString: modulelistJsonString,
  //     isLoading: isLoading,
  //   );
  //   return true;
  // }
}
