
import 'package:cmms/domain/models/business_type_model.dart';
import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/repositories/repository.dart';
import '../models/business_list_model.dart';
import '../models/city_model.dart';
import '../models/country_model.dart';
import '../models/frequency_model.dart';
import '../models/state.dart';

class BusinessListUsecase {
  BusinessListUsecase(this.repository);
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
  Future<List<CountryModel?>?> getCountryList({
    bool? isLoading,
  }) async =>
      await repository.getCountryList(
        isLoading,
      );

  Future<List<CountryState?>?> getStateList({

    int? selectedCountryId
    // bool? isLoading,

  }) async =>
      await repository.getStateList(
        // true,
        selectedCountryId!,
      );


  Future<List<CityModel?>?> getCityList({
    int? selectedStateId

  }) async =>
      await repository.getCityList(
        true,
        selectedStateId!,
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
    required int facilityId,
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
        facilityId: facilityId
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
  deleteBusiness(
      {required Object business_id, required bool isLoading}) async =>
      await repository.deleteBusinessList(
        business_id,
        isLoading,
      );
  Future<bool> updateBusinesslist({
    modulelistJsonString,
    bool? isLoading,
  }) async =>
      await repository.updateBusinesslist(
        isLoading: isLoading,
        modulelistJsonString: modulelistJsonString,
      );

}
