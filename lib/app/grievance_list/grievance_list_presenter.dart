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
    required bool isLoading,
    required bool self_view,
    String? start_date,
    required String end_date,
  }) async =>
      await grievanceUsecase.getGrievanceList(
        auth: auth ?? "",
        facilityId: facilityId,
        isLoading: isLoading,
        self_view: self_view,
        start_date: start_date,
        end_date: end_date,
      );

  Future<String?> getValue() async => await grievanceUsecase.getValue();

  void saveValue({String? grievanceId}) async {
    return grievanceUsecase.saveValue(grievanceId: grievanceId);
  }

  void clearValue() async => grievanceUsecase.clearValue();

  deleteGrievanceDetails({
    int? Id,
    bool? isLoading,
  }) async =>
      await grievanceUsecase.deleteGrievanceDetails(
        Id: Id,
        isLoading: isLoading,
      );

  
}
