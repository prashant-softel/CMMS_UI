import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/type_permit_model.dart';
import 'package:cmms/domain/usecases/permit_type_usecase.dart';


class PermitTypePresenter {
  PermitTypePresenter(this.permitTypeUsecase);
  PermitTypeUsecase permitTypeUsecase;

   Future<List<FacilityModel?>?> getFacilityList() async =>
      await permitTypeUsecase.getFacilityList();
  Future<String?> getUserAccessList() async =>
      await permitTypeUsecase.getUserAccessList();


  Future<List<TypePermitModel?>?> getTypePermitList(
    {required bool isLoading, required int facility_id}
  ) async =>
      await permitTypeUsecase.getTypePermitList(
        true,
        facility_id
        );


  Future<bool> createPermitType({
    checklistJsonString,
    required bool isLoading,
  }) async {
    print("presenter");
    permitTypeUsecase.createPermitType(
      checklistJsonString: checklistJsonString,
      isLoading: isLoading,
    );
    return true;
  }

  deletePermitType(String? permit_id, {required bool isLoading}) async =>
      await permitTypeUsecase.deletePermitType(
        permit_id: permit_id ?? 0,
        isLoading: isLoading,
      );
  Future<bool> updatePermitType(
      {checklistJsonString, required bool isLoading, checklistId}) async {
    print("presenter");
    permitTypeUsecase.updatePermitType(
      checklistJsonString: checklistJsonString,
      isLoading: isLoading,
    );
    return true;
  }
}
