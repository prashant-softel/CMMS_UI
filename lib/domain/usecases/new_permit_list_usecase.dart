import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/job_model.dart';
import 'package:cmms/domain/models/new_permit_list_model.dart';
import 'package:cmms/domain/models/permit_issue_model.dart';
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
    String? employee_id,
    String? id,
    bool? isLoading,
  }) async {
      await repository.permitIssueButton(
        comment,
        employee_id,
        id,
        isLoading,
        
      );
      }
      

  Future<void> permitApprovedButton({
    String? comment,
    String? employee_id,
    String? id,
    bool? isLoading,
  }) async {
      await repository.permitApprovedButton(
        comment,
        employee_id,
        id,
        isLoading,
        
      );}
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
