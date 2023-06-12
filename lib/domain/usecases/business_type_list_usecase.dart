import 'package:cmms/domain/models/business_type_model.dart';
import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/repositories/repository.dart';
import '../models/business_list_model.dart';
import '../models/frequency_model.dart';
import '../models/modulelist_model.dart';

class BusinessTypeListUsecase {
  BusinessTypeListUsecase(this.repository);
  Repository repository;

  Future<List<InventoryCategoryModel?>?> getInventoryCategoryList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getInventoryCategoryList(
        auth,
        facilityId,
        isLoading,
      );


  Future<List<BusinessTypeModel>> getBusinessTypeList({
    required int? businessType,
    // int? blockId,
    // required String categoryIds,
    // int? blockId,
    // String? categoryIds,
    required bool isLoading,
  }) async =>
      await repository.getBusinessTypeList(
        // blockId : blockId,
        // categoryIds,
        businessType: businessType,
        isLoading : isLoading,
      );


  Future<List<BusinessListModel?>?> getBusinessList({
    required int? businessType,
    // int? blockId,
    // required String categoryIds,
    // int? blockId,
    // String? categoryIds,
    required bool isLoading,
  }) async =>
      await repository.getBusinessList(
        // blockId : blockId,
        // categoryIds,
        businessType: businessType,
        isLoading : isLoading,
      );
  Future<List<FrequencyModel?>?> getFrequencyList({
    bool? isLoading,
  }) async =>
      await repository.getFrequencyList(
        isLoading,
      );
  Future<bool> createBusinesslistNumber({
    businesslistJsonString,
    bool? isLoading,
  }) async =>
      await repository.createBusinessListNumber(
          isLoading: isLoading, businesslistJsonString: businesslistJsonString);
  // deleteBusinesslist(
  //         {required Object module_id, required bool isLoading}) async =>
  //     await repository.deleteBusinesslist(
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
