
import '../../domain/models/InsuranceProviderModel.dart';
import '../../domain/usecases/insurance_provider_usecase.dart';

class InsuranceProviderPresenter {
  InsuranceProviderPresenter(this.facilityTypeListUsecase);
  InsuranceProviderUsecase facilityTypeListUsecase;



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

  // Future<List<IncidentRiskTypeModel?>?> getIncidentRiskTypeList({
  //   required int ListType,
  //   required bool isLoading,
  // }) async {
  //   return facilityTypeListUsecase.getIncidentRiskTypeList(
  //       type: ListType, isLoading: isLoading);
  // }

  Future<List<InsuranceProviderModel?>?> getInsuranceProvider({
    required bool isLoading,
  }) async {
    return facilityTypeListUsecase.getInsuranceProvider(isLoading: isLoading);
  }

  // Future<List<CityModel?>?> getCityList({
  //   required bool isLoading,
  //   required int country_code,
  // }) async {
  //   return facilityTypeListUsecase.getCityList(
  //       isLoading: isLoading, countryCode: country_code);
  // }

  Future<bool> createRiskType({
    riskTypeJsonString,
    required bool isLoading,
  }) async {
    print("presenter Create Facility type function.");
    facilityTypeListUsecase.createRiskType(
      riskTypeJsonString: riskTypeJsonString,
      isLoading: isLoading,
    );
    return true;
  }

  deleteRiskType(String? business_id, {required bool isLoading}) async =>
      await facilityTypeListUsecase.deleteRiskType(
        business_id: business_id ?? 0,
        isLoading: isLoading,
      );
  Future<bool> updateRiskType(
      {riskTypeJsonString, required bool isLoading}) async {
    print("presenter");
    facilityTypeListUsecase.updateRiskType(
      riskTypeJsonString: riskTypeJsonString,
      isLoading: isLoading,
    );
    return true;
  }

}
