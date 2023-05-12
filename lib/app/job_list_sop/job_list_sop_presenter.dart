import 'package:cmms/domain/models/sop_list_model.dart';
import 'package:cmms/domain/usecases/job_list_sop_usecase.dart';
import 'package:cmms/domain/usecases/job_type_list_usecase.dart';

class JobSOPListPresenter {
  JobSOPListPresenter(this.jobSOPListUsecase);
  JobSOPListUsecase jobSOPListUsecase;

  // Future<List<FacilityModel?>?> getFacilityList() async =>
  //     await jobTypeListUsecase.getFacilityList();
  // Future<String?> getUserAccessList() async =>
  //     await jobTypeListUsecase.getUserAccessList();

  Future<List<SOPListModel>> getSopPermitList({
    required bool isLoading,
    required int? job_type_id,
  }) async {
    return jobSOPListUsecase.getSopPermitList(
      isLoading: isLoading,
      job_type_id: job_type_id,
    );
  }
}
