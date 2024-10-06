import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/cumulative_report_model.dart';
import 'package:cmms/domain/models/end_mc_execution_detail_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/models/mc_task_list_model.dart';
import 'package:cmms/domain/models/module_model.dart';
import 'package:cmms/domain/models/mrs_list_by_jobId.dart';
import 'package:cmms/domain/models/pm_task_model.dart';
import 'package:cmms/domain/models/pm_task_view_list_model.dart';
import 'package:cmms/domain/models/veg_task_list_model.dart';

import '../models/veg_execution_details_model.dart';
import '../models/veg_task_equipment_model.dart';

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
  Future<List<JobModel?>?> getJobList(
          {
          // required String auth,
          dynamic facilityId,
          bool? self_view,
          bool? isExport,
          bool? isLoading,
          dynamic categoryid}) async =>
      await repository.getJobList(
          "", facilityId, isLoading, isExport, self_view, categoryid);
  Future<List<InventoryCategoryModel?>?> getInventoryCategoryList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getInventoryCategoryList(
        auth,
        facilityId,
        isLoading,
      );
  Future<List<PmTaskListModel?>?> getPmTaskList(
          {dynamic facilityId,
          bool? isLoading,
          dynamic endDate,
          dynamic startDate,
          bool? self_view,
          bool? isExport,
          dynamic categoryIds}) async =>
      await repository.getPmTaskList(facilityId, isLoading, startDate, endDate,
          isExport, self_view, categoryIds);
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

  Future<List<HistoryModel>?> getHistory({
    moduleType,
    id,
    facilityId,
    bool? isLoading,
  }) async =>
      await repository.getHistory(
        moduleType,
        id,
        facilityId,
        isLoading,
      );
  Future<PmtaskViewModel?> getPmtaskViewList(
          {int? scheduleId, bool? isLoading, required int facilityId}) async =>
      await repository.getPmtaskViewList(
        scheduleId,
        isLoading,
        facilityId,
      );
  Future<EndMCExecutionDetailsModel?> getMCExecutionDetail({
    bool? isLoading,
    required int executionId,
    required int facilityId,
  }) async =>
      await repository.getMCExecutionDetail(
        executionId: executionId,
        facilityId: facilityId,
        isLoading: isLoading ?? false,
      );
  Future<List<VegTaskEquipmentList?>> getVegTaskEquipmentList({
    required bool isLoading,
    required int facilityId,
    required int executionId,
  }) async =>
      await repository.getVegTaskEquipmentList(
        isLoading: isLoading,
        executionId: executionId,
        facilityId: facilityId,
      );
  Future<VegExecutionDetailsModel?> getVegExecutionDetail({
    bool? isLoading,
    required int facilityId,
    required int executionId,
  }) async =>
      await repository.getVegExecutionDetail(
        executionId: executionId,
        facilityId: facilityId,
        isLoading: isLoading ?? false,
      );
  Future<List<JobDetailsModel?>?> getJobDetails({
    required String auth,
    required int jobId,
    required int facilityId,
    int? userId,
    bool? isLoading,
  }) async =>
      await repository.getJobDetails(
        auth,
        jobId,
        facilityId,
        userId,
        isLoading,
      );
  Future<List<JobAssociatedModel?>?> getjobDetailsModel({
    required String auth,
    required int jobId,
    required int facilityId,
    int? userId,
    bool? isLoading,
  }) async =>
      await repository.getjobDetailsModel(
        auth,
        jobId,
        facilityId,
        userId,
        isLoading,
      );
  Future<List<MRSListByJobIdModel>?> getMrsListByModule({
    jobId,
    required int facilityId,
    bool? isLoading,
  }) async =>
      await repository.getMrsListByModule(
        jobId,
        facilityId,
        isLoading,
      );
}
