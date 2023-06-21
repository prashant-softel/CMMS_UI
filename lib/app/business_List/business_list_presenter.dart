import 'package:cmms/domain/models/business_type_model.dart';
import 'package:cmms/domain/models/preventive_checklist_model.dart';

import '../../domain/models/business_list_model.dart';
import '../../domain/models/city_model.dart';
import '../../domain/models/country_model.dart';
import '../../domain/models/frequency_model.dart';
import '../../domain/models/inventory_category_model.dart';
import '../../domain/models/modulelist_model.dart';
import '../../domain/models/state.dart';
import '../../domain/models/state_model.dart';
import '../../domain/usecases/business_list_usecase.dart';
import '../../domain/usecases/module_list_usecase.dart';

class BusinessListPresenter {
  BusinessListPresenter(this.businessUsecase);
  BusinessListUsecase businessUsecase;


  Future<List<CountryModel?>?> getCountryList({
    bool? isLoading,
  }) async =>
      await businessUsecase.getCountryList(
        isLoading: isLoading ?? false,
      );


  Future<List<CountryState?>?> getStateList({
    // int? facilityId,
    int? selectedCountryId,
    // bool? isLoading,
  }) async =>
      await businessUsecase.getStateList(
        selectedCountryId: selectedCountryId,
      );


  Future<List<CityModel?>?> getCityList({
    // int? facilityId,
    int? selectedStateId,
    // bool? isLoading,
  }) async =>
      await businessUsecase.getCityList(
        selectedStateId: selectedStateId,
      );

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

  deleteBusiness(String? business_id, {required bool isLoading}) async =>
      await businessUsecase.deleteBusiness(
        business_id: business_id ?? 0,
        isLoading: isLoading,
      );
  Future<bool> updateBusinesslist(
      {modulelistJsonString, required bool isLoading, moduleId}) async {
    print("presenter");
    businessUsecase.updateBusinesslist(
      modulelistJsonString: modulelistJsonString,
      isLoading: isLoading,
    );
    return true;
  }
}
