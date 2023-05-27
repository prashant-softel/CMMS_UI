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
}
