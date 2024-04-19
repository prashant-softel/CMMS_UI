import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/job_type_list_model.dart';
import 'package:cmms/domain/usecases/tbt_type_list_usecase.dart';


class TBTTypeListPresenter {
  TBTTypeListPresenter(this.tbtTypeListUsecase);
  TBTTypeListUsecase tbtTypeListUsecase;

  Future<List<JobTypeListModel>> getJobTypePermitList({
    required bool isLoading,
  }) async {
    return tbtTypeListUsecase.getJobTypePermitList(
      isLoading: isLoading,
    );
  }

  Future<List<FacilityModel?>?> getFacilityList() async =>
      await tbtTypeListUsecase.getFacilityList();
  Future<String?> getUserAccessList() async =>
      await tbtTypeListUsecase.getUserAccessList();

  Future<bool> createJobType({
    facilitylistJsonString,
    required bool isLoading,
  }) async {
    print("presenter Create Facility type function.");
    tbtTypeListUsecase.createJobType(
      jobTypeJsonString: facilitylistJsonString,
      isLoading: isLoading,
    );
    return true;
  }

  deleteJobType(String? business_id, {required bool isLoading}) async =>
      await tbtTypeListUsecase.deleteJobType(
        checklist_id: business_id ?? 0,
        isLoading: isLoading,
      );

  Future<bool> updateTbt(
      {tbtJsonString, required bool isLoading}) async {
    print("presenter");
    tbtTypeListUsecase.updateTbt(
      tbtJsonString: tbtJsonString,
      isLoading: isLoading,
    );
    return true;
  }
}
