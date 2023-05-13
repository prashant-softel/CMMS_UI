
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/job_type_list_model.dart';
import 'package:cmms/domain/models/sop_list_model.dart';
import 'package:cmms/domain/repositories/repository.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';


class JobSOPListUsecase {
  JobSOPListUsecase(this.repository);
  Repository repository;

 Future<List<SOPListModel>> getSopPermitList({
    required bool isLoading,
    required int? job_type_id
   
  }) async {
    return repository.getSopPermitList(
      isLoading: isLoading,
      job_type_id: job_type_id,
  
    );
  }

  // Future<List<FacilityModel?>?> getFacilityList() async =>
  //     await repository.getFacilityList(true);
  // Future<String?> getUserAccessList() async =>
  //     await repository.getUserAccessData(LocalKeys.userAccess);



  
       
}
