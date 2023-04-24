import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/new_permit_list_model.dart';
import 'package:cmms/domain/models/permit_issue_model.dart';
import 'package:cmms/domain/usecases/new_permit_list_usecase.dart';

class NewPermitListPresenter {
  NewPermitListPresenter(this.newPermitListUsecase);
  NewPermitListUsecase newPermitListUsecase;

  ///

  Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await newPermitListUsecase.getFacilityList(isLoading: isLoading);

  Future<List<NewPermitListModel?>?> getNewPermitList({
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

   Future<List<PermitIssueModel?>?> getPermitIssueButton({
    String? auth,
    String? comment,
    int? employee_id,
    int? id,
    bool? isLoading,
  }) async =>
      await newPermitListUsecase.getPermitIssueButton(
        auth: auth ?? "",
        comment: comment,
        employee_id: employee_id,
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

