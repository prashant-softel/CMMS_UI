import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/type_permit_model.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:cmms/domain/repositories/repository.dart';


class PermitTypeUsecase {
  PermitTypeUsecase(this.repository);
  Repository repository;

   Future<List<FacilityModel?>?> getFacilityList() async =>
      await repository.getFacilityList(true);
  Future<String?> getUserAccessList() async =>
      await repository.getUserAccessData(LocalKeys.userAccess);

  Future<List<TypePermitModel?>?> getTypePermitList(
    bool? isLoading,
    int? facility_id
    ) async =>
      await repository.getTypePermitList(
        isLoading,
        facility_id
        );

  Future<bool> createPermitType({
    checklistJsonString,
    bool? isLoading,
  }) async =>
      await repository.createPermitType(
          isLoading: isLoading, checklistJsonString: checklistJsonString);

  deletePermitType(
      {required Object permit_id, required bool isLoading}) async =>
      await repository.deletePermitType(
        permit_id,
        isLoading,
      );
  Future<bool> updatePermitType({
    checklistJsonString,
    bool? isLoading,
  }) async =>
      await repository.updatePermitType(
        isLoading: isLoading,
        checklistJsonString: checklistJsonString,
      );
}
