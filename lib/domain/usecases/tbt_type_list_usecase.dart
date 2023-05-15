
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/job_type_list_model.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:cmms/domain/repositories/repository.dart';


class TBTTypeListUsecase {
  TBTTypeListUsecase(this.repository);
  Repository repository;

 Future<List<JobTypeListModel>> getJobTypePermitList({
    required bool isLoading,
    required int? facility_id
   
  }) async {
    return repository.getJobTypePermitList(
      isLoading: isLoading,
      facility_id: facility_id,
  
    );
  }

  Future<List<FacilityModel?>?> getFacilityList() async =>
      await repository.getFacilityList(true);
  Future<String?> getUserAccessList() async =>
      await repository.getUserAccessData(LocalKeys.userAccess);



  
       
}
