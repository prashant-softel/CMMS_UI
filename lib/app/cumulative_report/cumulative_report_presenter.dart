import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/module_model.dart';
import 'package:cmms/domain/usecases/cumulative_report_usecase.dart';

class CumulativeReportPresenter {
  CumulativeReportPresenter(this.cumulativeReportUsecase);
  CumulativeReportUsecase cumulativeReportUsecase;

  Future<List<FacilityModel?>?> getFacilityList() async =>
      await cumulativeReportUsecase.getFacilityList();
  Future<List<ModuleModel?>?> getModuleList({
    bool? isLoading,
  }) async =>
      await cumulativeReportUsecase.getModuleList(
        isLoading: isLoading ?? false,
      );
}
