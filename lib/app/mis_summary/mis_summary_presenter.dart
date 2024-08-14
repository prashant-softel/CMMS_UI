import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/get_statutory_list_model.dart';
import 'package:cmms/domain/usecases/mis_summary_usecase.dart';

class MisSummaryPresenter {
  MisSummaryPresenter(this.misSummaryUseCase);
  MisSummaryUseCase misSummaryUseCase;

  Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await misSummaryUseCase.getFacilityList(isLoading: isLoading);
  Future<List<GetStatutoryList>> getStatutoryDataList({
    required bool isLoading,
    bool? isExport,
    required int? facility_id,
    String? start_date,
    required String end_date,
  }) async {
    return misSummaryUseCase.getStatutoryDataList(
      isLoading: isLoading,
      facility_id: facility_id,
      isExport: isExport,
      start_date: start_date,
      end_date: end_date,
    );
  }

  void clearValue() async => misSummaryUseCase.clearValue();
  void clearComplianceValue() async => misSummaryUseCase.clearComplianceValue();
}
