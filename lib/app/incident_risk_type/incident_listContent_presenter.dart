import 'package:cmms/domain/models/city_model.dart';
import 'package:cmms/domain/models/facility_type_list_model.dart';
import 'package:cmms/domain/usecases/incident_riskType_usecase.dart';

import '../../domain/models/IncidentRiskTypeModel.dart';
import '../../domain/models/SPV_list_model.dart';
import '../../domain/models/business_list_model.dart';
import '../../domain/models/country_model.dart';
import '../../domain/models/state.dart';

class IncidentRiskTypePresenter {
  IncidentRiskTypePresenter(this.facilityTypeListUsecase);
  IncidentRiskTypeUsecase facilityTypeListUsecase;



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

  Future<List<IncidentRiskTypeModel?>?> getIncidentRiskTypeList({
    required bool isLoading,
  }) async {
    return facilityTypeListUsecase.getIncidentRiskTypeList(isLoading: isLoading);
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
