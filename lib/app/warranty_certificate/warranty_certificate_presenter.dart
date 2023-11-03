
import '../../domain/models/warranty_certificate_model.dart';
import '../../domain/usecases/warranty_certificate_usecase.dart';

class WarrantyCertificatePresenter {
  WarrantyCertificatePresenter(this.warrantyUsecase);
  WarrantyCertificateUsecase warrantyUsecase;


  Future<List<WarrantyCertificateModel?>?> getWarrantyCertificate({
    // int? facilityId,
    int? type,
    bool? isLoading,
  }) async =>
      await warrantyUsecase.getWarrantyCertificate(
        // facilityId: facilityId ?? 0,
        type: type,
        isLoading: isLoading ?? false,
      );
  // Future<bool> createModulelistNumber({
  //   modulelistJsonString,
  //   required bool isLoading,
  // }) async {
  //   print("presenter");
  //   warrantyUsecase.createModulelistNumber(
  //     modulelistJsonString: modulelistJsonString,
  //     isLoading: isLoading,
  //   );
  //   return true;
  // }
  //
  // deleteModulelist(String? module_id, {required bool isLoading}) async =>
  //     await warrantyUsecase.deleteModulelist(
  //       module_id: module_id ?? 0,
  //       isLoading: isLoading,
  //     );
  // Future<bool> updateModulelistNumber(
  //     {modulelistJsonString, required bool isLoading, moduleId}) async {
  //   print("presenter");
  //   warrantyUsecase.updateModulelistNumber(
  //     modulelistJsonString: modulelistJsonString,
  //     isLoading: isLoading,
  //   );
  //   return true;
  // }
}
