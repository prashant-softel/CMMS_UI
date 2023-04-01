import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/new_permit_list_model.dart';
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
        facilityId: 45,
        // facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );
}
