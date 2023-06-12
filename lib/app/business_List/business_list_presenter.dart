import 'package:cmms/domain/models/business_type_model.dart';
import 'package:cmms/domain/models/preventive_checklist_model.dart';

import '../../domain/models/business_list_model.dart';
import '../../domain/models/frequency_model.dart';
import '../../domain/models/inventory_category_model.dart';
import '../../domain/models/modulelist_model.dart';
import '../../domain/usecases/business_list_usecase.dart';
import '../../domain/usecases/module_list_usecase.dart';

class BusinessListPresenter {
  BusinessListPresenter(this.businessUsecase);
  BusinessListUsecase businessUsecase;

  Future<List<BusinessTypeModel>> getBusinessTypeList({
    int? businessType,
    bool? isLoading,
  }) async =>
      await businessUsecase.getBusinessTypeList(
        isLoading: isLoading ?? false, businessType: businessType,
      );
  Future<List<BusinessListModel?>?> getBusinessList({
    int? blockId,
    // int? type,
    int? businessType,
    String? categoryIds,
    bool? isLoading,
  }) async =>
      await businessUsecase.getBusinessList(
        isLoading: isLoading ?? false,
        businessType: businessType,
      );
  Future<List<FrequencyModel?>?> getFrequencyList({
    bool? isLoading,
  }) async =>
      await businessUsecase.getFrequencyList(
        isLoading: isLoading ?? false,
      );
  Future<bool> createBusinesslistNumber({
    businesslistJsonString,
    required bool isLoading,
  }) async {
    print("presenter");
    businessUsecase.createBusinesslistNumber(
      businesslistJsonString: businesslistJsonString,
      isLoading: isLoading,
    );
    return true;
  }

  deleteModulelist(String? module_id, {required bool isLoading}) async =>
      await businessUsecase.deleteModulelist(
        module_id: module_id ?? 0,
        isLoading: isLoading,
      );
  Future<bool> updateModulelistNumber(
      {modulelistJsonString, required bool isLoading, moduleId}) async {
    print("presenter");
    businessUsecase.updateModulelistNumber(
      modulelistJsonString: modulelistJsonString,
      isLoading: isLoading,
    );
    return true;
  }
}
