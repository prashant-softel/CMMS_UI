import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/models/preventive_checklist_model.dart';
import 'package:cmms/domain/repositories/repository.dart';
import '../models/frequency_model.dart';
import '../models/modulelist_model.dart';
import '../models/warranty_certificate_model.dart';

class WarrantyCertificateUsecase {
  WarrantyCertificateUsecase(this.repository);
  Repository repository;


  Future<List<WarrantyCertificateModel?>?> getWarrantyCertificate({
    int? type,
    bool? isLoading,
  }) async =>
      await repository.getWarrantyCertificate(
        type,
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
