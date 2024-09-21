import 'package:cmms/domain/models/cumulative_report_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/module_model.dart';
import 'package:cmms/domain/usecases/cumulative_report_usecase.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

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
  Future<List<Cumulativereport?>?> getCumulativeReportList({
    bool? isLoading,
    required dynamic selectedFacilityIdList,
    required dynamic module_id,
    dynamic endDate,
    dynamic startDate,
  }) async =>
      await cumulativeReportUsecase.getCumulativeReportList(
        isLoading: isLoading ?? false,
        selectedFacilityIdList: selectedFacilityIdList,
        module_id: module_id,
        endDate: endDate,
        startDate: startDate,
      );
}
