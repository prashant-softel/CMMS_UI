import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/new_permit_list_model.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:cmms/domain/repositories/repository.dart';

class NewPermitListUsecase {
  NewPermitListUsecase(this.repository);
  Repository repository;

  ///

  Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await repository.getFacilityList(isLoading);

  Future<List<NewPermitModel?>?> getNewPermitList({
    required String auth,
    int? facilityId,
    int? userId,
    bool? isLoading,
    bool? self_view,
    bool? non_expired,
    bool? isExport,
    String? start_date,
    required String end_date,
  }) async =>
      await repository.getNewPermitList(auth, facilityId, isLoading, isExport, self_view,
          non_expired, start_date, end_date);

  Future<void> permitIssueButton({
    String? comment,
    String? id,
    bool? isLoading,
  }) async {
    await repository.permitIssueButton(
      comment,
      id,
      isLoading,
    );
  }

  // Future<void> permitApprovedButton({
  //   String? comment,
  //   String? id,
  //   String? ptwStatus,
  //   bool? isLoading,
  // }) async {
  //   await repository.permitApprovedButton(
  //     comment,
  //     id,
  //     ptwStatus,
  //     isLoading,
  //   );
  // }

  Future<void> permitCancelByIssuerButton({
    String? comment,
    String? id,
    bool? isLoading,
  }) async {
    await repository.permitCancelByIssuerButton(
      comment,
      id,
      isLoading,
    );
  }

  void clearValue() async => repository.clearData(LocalKeys.permitId);
  void clearTypeValue() async => repository.clearData(LocalKeys.types);
  void clearisCheckedValue() async => repository.clearData(LocalKeys.isChecked);
  void clearjobmodelValue() async => repository.clearData(LocalKeys.jobModel);
  void clearpmTaskValue() async => repository.clearData(LocalKeys.pmTaskModel);
}
