import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/new_permit_list_model.dart';
import 'package:cmms/domain/models/permit_issue_model.dart';
import 'package:cmms/domain/usecases/new_permit_list_usecase.dart';
import 'package:flutter/material.dart';

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
    bool? isLoading,
  }) async =>
      await newPermitListUsecase.getNewPermitList(
        auth: auth ?? "",
        facilityId: facilityId,
        // facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
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

  Future<void> permitApprovedButton({
    String? comment,
    String? id,
    String? ptwStatus,
    bool? isLoading,
  }) async =>
      await newPermitListUsecase.permitApprovedButton(
        comment: comment,
        id: id,
        ptwStatus: ptwStatus,
        isLoading: isLoading ?? false,
      );

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

  Future<void> permitCancelRequestButton({
    String? comment,
    String? id,
    bool? isLoading,
  }) async =>
      await newPermitListUsecase.permitCancelRequestButton(
        comment: comment,
        id: id,
        isLoading: isLoading ?? false,
      );

  Future<void> permitCancelByApproverButton({
    String? comment,
    String? id,
    String? ptwStatus,
    bool? isLoading,
  }) async =>
      await newPermitListUsecase.permitCancelByApproverButton(
        comment: comment,
        id: id,
        ptwStatus: ptwStatus,
        isLoading: isLoading ?? false,
      );

Future<void> permitExtendButton({
    String? comment,
    String? Time,
    String? id,
    bool? isLoading,
  }) async =>
      await newPermitListUsecase.permitExtendButton(
        comment: comment,
        Time: Time,
        id: id,
        isLoading: isLoading ?? false,
      );


  Future<void> permitCloseButton({
    String? comment,
    String? id,
    bool? isLoading,
  }) async =>
      await newPermitListUsecase.permitCloseButton(
        comment: comment,
        id: id,
        isLoading: isLoading ?? false,
      );

   Future<void> permitRejectButton({
    String? comment,
    String? id,
    bool? isLoading,
  }) async =>
      await newPermitListUsecase.permitRejectButton(
        comment: comment,
        id: id,
        isLoading: isLoading ?? false,
      );


  // Future<List<NewPermitListModel>>getNewPermitList({
  //   required bool isLoading,
  //   required int? facilityId,
  //   required int? userId,
  //   // int? blockId,
  //   // required String categoryIds,
  // }) async {
  //   return newPermitListUsecase.getNewPermitList(
  //     isLoading: isLoading,
  //     facilityId: facilityId,
  //     userId: 33,
  //     // blockId: blockId,
  //     // categoryIds: categoryIds,
  //   );
  // }
}
