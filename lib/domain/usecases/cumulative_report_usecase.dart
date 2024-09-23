import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/cumulative_report_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/mc_task_list_model.dart';
import 'package:cmms/domain/models/module_model.dart';
import 'package:cmms/domain/models/pm_task_model.dart';
import 'package:cmms/domain/models/veg_task_list_model.dart';

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
  Future<List<JobModel?>?> getJobList({
    // required String auth,
    dynamic facilityId,
    bool? self_view,
    bool? isExport,
    bool? isLoading,
  }) async =>
      await repository.getJobList(
        "",
        facilityId,
        isLoading,
        isExport,
        self_view,
      );
  Future<List<PmTaskListModel?>?> getPmTaskList(
          {dynamic facilityId,
          bool? isLoading,
          dynamic endDate,
          dynamic startDate,
          bool? isExport}) async =>
      await repository.getPmTaskList(
          facilityId, isLoading, startDate, endDate, isExport);
  Future<List<VegTaskListModel>> getVegTaskList(
      {required bool isLoading,
      required dynamic? facility_id,
      dynamic endDate,
      dynamic startDate,
      bool? isExport
      // String? start_date,
      // required String end_date,
      }) async {
    return repository.getVegTaskList(
        isLoading: isLoading,
        facility_id: facility_id,
        startDate: startDate,
        endDate: endDate,
        isExport: isExport
        // start_date: start_date,
        // end_date: end_date,
        );
  }

  Future<List<MCTaskListModel>> getMCTaskList({
    required bool isLoading,
    bool? isExport,
    required dynamic facility_id,
    String? start_date,
    required String end_date,
  }) async {
    return repository.getMCTaskList(
      isLoading: isLoading,
      isExport: isExport,
      facility_id: facility_id,
      start_date: start_date,
      end_date: end_date,
    );
  }
}
