import 'package:cmms/domain/models/grievance_List_model.dart';
import 'package:cmms/domain/models/grievance_model.dart';
import 'package:cmms/domain/usecases/grievance_list_usecase.dart';

class GrievanceListPresenter {
  GrievanceListPresenter(this.grievanceUsecase);
  GrievanceListUsecase grievanceUsecase;

  ///

  Future<List<GrievanceListModel?>?> getGrievanceList({
    String? auth,
    int? facilityId,
    // int? userId,
    required bool self_view,
    bool? isLoading,
  }) async =>
      await grievanceUsecase.getGrievance(
        auth: auth ?? "",
        facilityId: facilityId ?? 0,
        self_view: self_view,
        isLoading: isLoading ?? false,
      );
  void clearValue() async => grievanceUsecase.clearValue();
}
