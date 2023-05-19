import 'package:cmms/domain/models/facility_type_list_model.dart';
import 'package:cmms/domain/usecases/facility_type_list_usecase.dart';

class FacilityTypeListPresenter {
  FacilityTypeListPresenter(this.facilityTypeListUsecase);
  FacilityTypeListUsecase facilityTypeListUsecase;

  // Future<List<FacilityModel?>?> getFacilityList() async =>
  //     await jobTypeListUsecase.getFacilityList();
  // Future<String?> getUserAccessList() async =>
  //     await jobTypeListUsecase.getUserAccessList();

  Future<List<FacilityTypeListModel>> getFacilityTypeList({
    required bool isLoading,
    required int? job_type_id,
  }) async {
    return facilityTypeListUsecase.getFacilityTypeList(
        isLoading: isLoading, job_type_id: job_type_id);
  }
}
