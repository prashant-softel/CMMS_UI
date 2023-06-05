import 'package:cmms/domain/models/preventive_checklist_model.dart';

import '../../domain/models/frequency_model.dart';
import '../../domain/models/inventory_category_model.dart';
import '../../domain/models/modulelist_model.dart';
import '../../domain/models/warranty_model.dart';
import '../../domain/usecases/module_list_usecase.dart';
import '../../domain/usecases/warranty_type_usecase.dart';

class WarrantyListPresenter {
  WarrantyListPresenter(this.warrantyUsecase);
  WarrantyTypeUsecase warrantyUsecase;

  Future<List<InventoryCategoryModel?>?> getInventoryCategoryList({
    bool? isLoading,
  }) async =>
      await warrantyUsecase.getInventoryCategoryList(
        isLoading: isLoading ?? false,
      );
  Future<List<WarrantyModel?>?> getWarrantyList({
    int? facilityId,
    int? type,
    bool? isLoading,
  }) async =>
      await warrantyUsecase.getWarrantyList(
        facilityId: facilityId ?? 0,
        type: type,
        isLoading: isLoading ?? false,
      );
  // Future<List<FrequencyModel?>?> getFrequencyList({
  //   bool? isLoading,
  // }) async =>
  //     await warrantyUsecase.getFrequencyList(
  //       isLoading: isLoading ?? false,
  //     );
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
