import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/job_model.dart';
import 'package:cmms/domain/models/new_permit_list_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

class NewPermitListUsecase {
  NewPermitListUsecase(this.repository);
  Repository repository;

  ///

  Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await repository.getFacilityList(isLoading);

  Future<List<NewPermitListModel?>?> getNewPermitList({
    required String auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getNewPermitList(
        auth,
        facilityId,
        isLoading,
      );
}
