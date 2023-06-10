import 'package:cmms/domain/models/facility_type_list_model.dart';
import 'package:cmms/domain/models/job_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

import '../models/SPV_list_model.dart';
import '../models/business_list_model.dart';
import '../models/city_model.dart';
import '../models/country_model.dart';
import '../models/state.dart';

// class AssetTypeListUsecase {
//   AssetTypeListUsecase(this.repository);
//   Repository repository;

//   ///

//   Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
//       await repository.getFacilityList(isLoading);

//   Future<List<JobModel?>?> getJobList({
//     required String auth,
//     int? facilityId,
//     bool? isLoading,
//   }) async =>
//       await repository.getJobList(
//         auth,
//         facilityId,
//         isLoading,
//       );
// }

class FacilityTypeListUsecase {
  FacilityTypeListUsecase(this.repository);
  Repository repository;

  Future<List<FacilityTypeListModel>> getFacilityTypeList(
      {required bool isLoading, required int? job_type_id}) async {
    return repository.getFacilityTypeList(
      isLoading: isLoading,
      job_type_id: job_type_id,
    );
  }

  Future<List<CountryModel?>?> getCountryList({
    bool? isLoading,
  }) async =>
      await repository.getCountryList(
        isLoading,
      );
  Future<List<CountryState?>?> getStateList({
    int countryCode = 0,
  }) async =>
      await repository.getStateList(
        countryCode,
      );
  Future<List<CityModel?>?> getCityList({
    bool? isLoading,
    int countryCode = 0,
  }) async =>
      await repository.getCityList(
        isLoading,
        countryCode,
      );
  Future<List<BusinessListModel?>?> getBusinessList({
    required int type,
    bool isLoading = true,
  }) async =>
      await repository.getBusinessList(
        businessType: type,
        isLoading: isLoading,
      );

  Future<List<SPVListModel?>?> getSpvList({
    bool isLoading = true,
  }) async =>
      await repository.getSPVList(
        isLoading: isLoading,
      );

  Future<bool> createFacilityType({
    facilitylistJsonString,
    bool? isLoading,
  }) async =>
      await repository.createFacilityType(
          isLoading: isLoading, facilitylistJsonString: facilitylistJsonString);

  // Future<List<FacilityModel?>?> getFacilityList() async =>
  //     await repository.getFacilityList(true);
  // Future<String?> getUserAccessList() async =>
  //     await repository.getUserAccessData(LocalKeys.userAccess);
}
