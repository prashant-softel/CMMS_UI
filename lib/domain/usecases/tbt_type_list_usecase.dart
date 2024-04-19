
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/job_type_list_model.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:cmms/domain/repositories/repository.dart';


class TBTTypeListUsecase {
  TBTTypeListUsecase(this.repository);
  Repository repository;

 Future<List<JobTypeListModel>> getJobTypePermitList({
    required bool isLoading,
   
  }) async {
    return repository.getJobTypePermitList(
      isLoading: isLoading,
  
    );
  }

  Future<List<FacilityModel?>?> getFacilityList() async =>
      await repository.getFacilityList(true);
  Future<String?> getUserAccessList() async =>
      await repository.getUserAccessData(LocalKeys.userAccess);


  Future<bool> createJobType({
    jobTypeJsonString,
    bool? isLoading,
  }) async =>
      await repository.createJobType(
          isLoading: isLoading, jobTypeJsonString: jobTypeJsonString);
  deleteJobType(
      {required Object checklist_id, required bool isLoading}) async =>
      await repository.deleteJobType(
        checklist_id,
        isLoading,
      );
  Future<bool> updateTbt({
    tbtJsonString,
    bool? isLoading,
  }) async =>
      await repository.updateTbt(
        isLoading: isLoading,
        tbtJsonString: tbtJsonString,
      );

  
       
}
