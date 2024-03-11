import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/new_permit_list_model.dart';
import 'package:cmms/domain/usecases/new_permit_list_usecase.dart';

class NewPermitListPresenter {
  NewPermitListPresenter(this.newPermitListUsecase);
  NewPermitListUsecase newPermitListUsecase;

  ///

  Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await newPermitListUsecase.getFacilityList(isLoading: isLoading);

  Future<List<NewPermitModel?>?> getNewPermitList({
    String? auth,
    int? facilityId,
    int? userId,
    required bool isLoading,
    required bool self_view,
    required bool non_expired,
    String? start_date,
    required String end_date,
    bool? isExport
  }) async =>
      await newPermitListUsecase.getNewPermitList(
        auth: auth ?? "",
        facilityId: facilityId,
        isLoading: isLoading,
        self_view: self_view,
        non_expired: non_expired,
        start_date: start_date,
        end_date: end_date,
        isExport : isExport
      );

  Future<void> permitIssueButton({
    String? comment,
    String? id,
    bool? isLoading,
  }) async =>
      await newPermitListUsecase.permitIssueButton(
        comment: comment,
        id: id,
        isLoading: isLoading ?? false,
      );

  // Future<void> permitApprovedButton({
  //   String? comment,
  //   String? id,
  //   String? ptwStatus,
  //   bool? isLoading,
  // }) async =>
  //     await newPermitListUsecase.permitApprovedButton(
  //       comment: comment,
  //       id: id,
  //       ptwStatus: ptwStatus,
  //       isLoading: isLoading ?? false,
  //     );

  Future<void> permitCancelByIssuerButton({
    String? comment,
    String? id,
    bool? isLoading,
  }) async =>
      await newPermitListUsecase.permitCancelByIssuerButton(
        comment: comment,
        id: id,
        isLoading: isLoading ?? false,
      );

  void clearValue() async => newPermitListUsecase.clearValue();
  void clearTypeValue() async => newPermitListUsecase.clearTypeValue();
  void clearisCheckedValue() async =>
      newPermitListUsecase.clearisCheckedValue();
  void clearjobmodelValue() async => newPermitListUsecase.clearjobmodelValue();
  void clearpmTaskValue() async => newPermitListUsecase.clearpmTaskValue();
}
