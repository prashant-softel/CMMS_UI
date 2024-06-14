import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/get_statutory_list_model.dart';
import 'package:cmms/domain/usecases/statutory_usecase.dart';

class StatutoryPresenter {
  StatutoryPresenter(this.statutoryUsecase);
  StatutoryUsecase statutoryUsecase;

  ///

  Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await statutoryUsecase.getFacilityList(isLoading: isLoading);
  Future<List<GetStatutoryList>> getStatutoryDataList({
    required bool isLoading,
    bool? isExport,
    required int? facility_id,
    String? start_date,
    required String end_date,
  }) async {
    return statutoryUsecase.getStatutoryDataList(
      isLoading: isLoading,
      facility_id: facility_id,
      isExport: isExport,
      start_date: start_date,
      end_date: end_date,
    );
  }

  void clearValue() async => statutoryUsecase.clearValue();
  void clearComplianceValue() async => statutoryUsecase.clearComplianceValue();
}
