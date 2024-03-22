import 'package:cmms/domain/models/city_model.dart';
import 'package:cmms/domain/models/facility_type_list_model.dart';
import 'package:cmms/domain/usecases/facility_type_list_usecase.dart';

import '../../domain/models/SPV_list_model.dart';
import '../../domain/models/business_list_model.dart';
import '../../domain/models/country_model.dart';
import '../../domain/models/state.dart';

class FacilityTypeListPresenter {
  FacilityTypeListPresenter(this.facilityTypeListUsecase);
  FacilityTypeListUsecase facilityTypeListUsecase;

  Future<List<FacilityTypeListModel>> getFacilityTypeList({
    required bool isLoading,
    // required int? job_type_id,
  }) async {
    return facilityTypeListUsecase.getFacilityTypeList(
        isLoading: isLoading);
  }

  Future<List<CountryModel?>?> getCountryList({
    bool? isLoading,
  }) async =>
      await facilityTypeListUsecase.getCountryList(
        isLoading: isLoading ?? false,
      );


  Future<List<CountryState?>?> getStateList({
    // int? facilityId,
    int? selectedCountryId,
    // bool? isLoading,
  }) async =>
      await facilityTypeListUsecase.getStateList(
        selectedCountryId: selectedCountryId,
      );


  Future<List<CityModel?>?> getCityList({
    // int? facilityId,
    int? selectedStateId,
    // bool? isLoading,
  }) async =>
      await facilityTypeListUsecase.getCityList(
        selectedStateId: selectedStateId,
      );

  // Future<List<CountryModel?>?> getCountryList({
  //   required bool isLoading,
  // }) async {
  //   return facilityTypeListUsecase.getCountryList(isLoading: isLoading);
  // }
  //
  // Future<List<CountryState?>?> getStateList({
  //   required int country_code,
  // }) async {
  //   return facilityTypeListUsecase.getStateList(countryCode: country_code);
  // }

  Future<List<BusinessListModel?>?> getBusinessList({
    required int ListType,
    required int facilityId,
    required bool isLoading,
  }) async {
    return facilityTypeListUsecase.getBusinessList(
        type: ListType, isLoading: isLoading,facilityId: facilityId);
  }

  Future<List<SPVListModel?>?> getSpvList({
    required bool isLoading,
  }) async {
    return facilityTypeListUsecase.getSpvList(isLoading: isLoading);
  }

  // Future<List<CityModel?>?> getCityList({
  //   required bool isLoading,
  //   required int country_code,
  // }) async {
  //   return facilityTypeListUsecase.getCityList(
  //       isLoading: isLoading, countryCode: country_code);
  // }

  Future<bool> createFacilityType({
    facilitylistJsonString,
    required bool isLoading,
  }) async {
    print("presenter Create Facility type function.");
    facilityTypeListUsecase.createFacilityType(
      facilitylistJsonString: facilitylistJsonString,
      isLoading: isLoading,
    );
    return true;
  }

  deleteFacility(String? business_id, {required bool isLoading}) async =>
      await facilityTypeListUsecase.deleteFacility(
        business_id: business_id ?? 0,
        isLoading: isLoading,
      );
  Future<bool> updateFacilityList(
      {modulelistJsonString, required bool isLoading}) async {
    print("presenter");
    facilityTypeListUsecase.updateFacilityList(
      modulelistJsonString: modulelistJsonString,
      isLoading: isLoading,
    );
    return true;
  }

}
