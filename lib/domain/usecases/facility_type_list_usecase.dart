import 'package:cmms/domain/models/facility_type_list_model.dart';
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
      {required bool isLoading}) async {
    return repository.getFacilityTypeList(
      isLoading: isLoading,
      // job_type_id: job_type_id,
    );
  }
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

  // Future<List<CountryModel?>?> getCountryList({
  //   bool? isLoading,
  // }) async =>
  //     await repository.getCountryList(
  //       isLoading,
  //     );
  // Future<List<CountryState?>?> getStateList({
  //   int countryCode = 0,
  // }) async =>
  //     await repository.getStateList(
  //       countryCode,
  //     );
  // Future<List<CityModel?>?> getCityList({
  //   bool? isLoading,
  //   int countryCode = 0,
  // }) async =>
  //     await repository.getCityList(
  //       isLoading,
  //       countryCode,
  //     );
  Future<List<BusinessListModel?>?> getBusinessList({
    required int type,
    required int facilityId,
    bool isLoading = true,
  }) async =>
      await repository.getBusinessList(
        businessType: type,
        facilityId:facilityId,
        isLoading: isLoading,
      );

  Future<List<SPVListModel?>?> getSpvList({
    bool isLoading = true,
  }) async =>
      await repository.getSPVList(
        isLoading: isLoading,
      );
  deleteFacility(
      {required Object business_id, required bool isLoading}) async =>
      await repository.deleteFacility(
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

  Future<bool> updateFacilityList({
    modulelistJsonString,
    bool? isLoading,
  }) async =>
      await repository.updateFacilityList(
        isLoading: isLoading,
        modulelistJsonString: modulelistJsonString,
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
