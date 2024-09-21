import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/cumulative_report_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/module_model.dart';

class CumulativeReportUsecase {
  final Repository repository;

  CumulativeReportUsecase(this.repository);

  Future<List<FacilityModel?>?> getFacilityList() async =>
      await repository.getFacilityList(true);
  Future<List<ModuleModel?>?> getModuleList({
    bool? isLoading,
  }) async =>
      await repository.getModule(
        isLoading,
      );
  Future<List<Cumulativereport?>?> getCumulativeReportList({
    bool? isLoading,
    required selectedFacilityIdList,
    required module_id,
    dynamic endDate,
    dynamic startDate,
  }) async =>
      await repository.getCumulativeReportList(
        isLoading,
        selectedFacilityIdList,
        module_id,
        startDate,
        endDate,
      );
}
