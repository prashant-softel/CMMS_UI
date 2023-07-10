import 'package:cmms/domain/models/SPV_list_model.dart';
import 'package:cmms/domain/usecases/SPV_list_usecase.dart';

class SPVListPresenter {
  SPVListPresenter(this.sPVListUsecase);
  SPVListUsecase sPVListUsecase;

  // Future<List<FacilityModel?>?> getFacilityList() async =>
  //     await jobTypeListUsecase.getFacilityList();
  // Future<String?> getUserAccessList() async =>
  //     await jobTypeListUsecase.getUserAccessList();

  Future<List<SPVListModel>> getSPVList({
    required bool isLoading,
    required int? job_type_id,
  }) async {
    return sPVListUsecase.getSPVList(
        isLoading: isLoading, job_type_id: job_type_id);
  }

  Future<bool> createSPVlist({
    facilitylistJsonString,
    required bool isLoading,
  }) async {
    print("presenter Create Facility type function.");
    sPVListUsecase.createSPVlist(
      facilitylistJsonString: facilitylistJsonString,
      isLoading: isLoading,
    );
    return true;
  }


  deleteFacility(String? business_id, {required bool isLoading}) async =>
      await sPVListUsecase.deleteSPV(
        business_id: business_id ?? 0,
        isLoading: isLoading,
      );
  Future<bool> updateSPV(
      {modulelistJsonString, required bool isLoading}) async {
    print("presenter");
    sPVListUsecase.updateSPV(
      modulelistJsonString: modulelistJsonString,
      isLoading: isLoading,
    );
    return true;
  }
}
