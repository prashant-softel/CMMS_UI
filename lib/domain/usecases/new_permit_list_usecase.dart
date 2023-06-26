import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/new_permit_list_model.dart';
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
  }) async =>
      await repository.getNewPermitList(
        auth,
        facilityId,
        isLoading,
      );

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

  Future<void> permitApprovedButton({
    String? comment,
    String? id,
    String? ptwStatus,
    bool? isLoading,
  }) async {
    await repository.permitApprovedButton(
      comment,
      id,
      ptwStatus,
      isLoading,
    );
  }


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

   Future<void> permitCancelRequestButton({
    String? comment,
    String? id,
    bool? isLoading,
  }) async {
    await repository.permitCancelRequestButton(
      comment,
      id,
      isLoading,
    );
  }

  Future<void> permitCancelByApproverButton({
    String? comment,
    String? id,
    String? ptwStatus,
    bool? isLoading,
  }) async {
    await repository.permitCancelByApproverButton(
      comment,
      id,
      ptwStatus,
      isLoading,
    );
  }

   Future<void> permitExtendButton({
    String? comment,
    String? Time,
    String? id,
    bool? isLoading,
  }) async {
    await repository.permitExtendButton(
      comment,
      Time,
      id,
      isLoading,
    );
  }

  Future<void> permitCloseButton({
    String? comment,
    String? id,
    bool? isLoading,
  }) async {
    await repository.permitCloseButton(
      comment,
      id,
      isLoading,
    );
  }


   Future<void> permitRejectButton({
    String? comment,
    String? id,
    bool? isLoading,
  }) async {
    await repository.permitRejectButton(
      comment,
      id,
      isLoading,
    );
  }

  // Future<List<NewPermitListModel>> getNewPermitList({
  //   required bool isLoading,
  //   required int? facilityId,
  //   required int? userId,
  //   // int? blockId,
  //   // required String categoryIds,
  // }) async {
  //   return repository.getNewPermitList(
  //     isLoading: isLoading,
  //     facilityId: facilityId,
  //     userId: 33
  //     // blockId: blockId,
  //     // categoryIds: categoryIds,
  //   );
  // }
}
