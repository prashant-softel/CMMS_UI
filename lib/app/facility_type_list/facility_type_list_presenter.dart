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
    required int? job_type_id,
  }) async {
    return facilityTypeListUsecase.getFacilityTypeList(
        isLoading: isLoading, job_type_id: job_type_id);
  }

  Future<List<CountryModel?>?> getCountryList({
    required bool isLoading,
  }) async {
    return facilityTypeListUsecase.getCountryList(isLoading: isLoading);
  }

  Future<List<CountryState?>?> getStateList({
    required int country_code,
  }) async {
    return facilityTypeListUsecase.getStateList(countryCode: country_code);
  }

  Future<List<BusinessListModel?>?> getBusinessList({
    required int ListType,
    required bool isLoading,
  }) async {
    return facilityTypeListUsecase.getBusinessList(
        type: ListType, isLoading: isLoading);
  }

  Future<List<SPVListModel?>?> getSpvList({
    required bool isLoading,
  }) async {
    return facilityTypeListUsecase.getSpvList(isLoading: isLoading);
  }

  Future<List<CityModel?>?> getCityList({
    required bool isLoading,
    required int country_code,
  }) async {
    return facilityTypeListUsecase.getCityList(
        isLoading: isLoading, countryCode: country_code);
  }

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
}
