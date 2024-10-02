import 'package:cmms/domain/models/cumulative_report_model.dart';
import 'package:cmms/domain/models/end_mc_execution_detail_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/models/job_model.dart';
import 'package:cmms/domain/models/mc_task_list_model.dart';
import 'package:cmms/domain/models/module_model.dart';
import 'package:cmms/domain/models/pm_task_model.dart';
import 'package:cmms/domain/models/pm_task_view_list_model.dart';
import 'package:cmms/domain/models/veg_task_equipment_model.dart';
import 'package:cmms/domain/models/veg_task_list_model.dart';
import 'package:cmms/domain/usecases/cumulative_report_usecase.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../domain/models/veg_execution_details_model.dart';

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
  Future<List<InventoryCategoryModel?>?> getInventoryCategoryList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await cumulativeReportUsecase.getInventoryCategoryList(
        auth: auth ?? "",
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );
  Future<List<JobModel?>?> getJobList({
    // String? auth,
    dynamic facilityId,
    // int? userId,
    bool? isLoading,
    bool? isExport,
    required bool self_view,
  }) async =>
      await cumulativeReportUsecase.getJobList(
        // auth: auth ?? "",
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
        isExport: isExport, self_view: self_view,
      );
  Future<List<PmTaskListModel?>?> getPmTaskList(
          {dynamic facilityId,
          bool? isLoading,
          dynamic endDate,
          dynamic startDate,
          bool? isExport}) async =>
      await cumulativeReportUsecase.getPmTaskList(
          facilityId: facilityId,
          isLoading: isLoading ?? false,
          endDate: endDate,
          startDate: startDate,
          isExport: isExport);
  Future<List<VegTaskListModel>> getVegTaskList(
      {required bool isLoading,
      required dynamic? facility_id,
      dynamic endDate,
      dynamic startDate,
      bool? isExport
      // String? start_date,
      // required String end_date,
      }) async {
    return cumulativeReportUsecase.getVegTaskList(
        isLoading: isLoading,
        facility_id: facility_id,
        endDate: endDate,
        startDate: startDate,
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
    return cumulativeReportUsecase.getMCTaskList(
      isLoading: isLoading,
      isExport: isExport,
      facility_id: facility_id,
      start_date: start_date,
      end_date: end_date,
    );
  }

  Future<PmtaskViewModel?> getPmtaskViewList({
    int? scheduleId,
    required int facilityId,
    bool? isloading,
  }) async =>
      await cumulativeReportUsecase.getPmtaskViewList(
        scheduleId: scheduleId,
        facilityId: facilityId,
        isLoading: isloading,
      );
  Future<List<HistoryModel>?> getHistory(
    moduleType,
    id,
    facilityId,
    isLoading,
  ) async =>
      await cumulativeReportUsecase.getHistory(
        moduleType: moduleType,
        id: id,
        facilityId: facilityId,
        isLoading: isLoading,
      );
  Future<EndMCExecutionDetailsModel?> getMCExecutionDetail({
    bool? isLoading,
    required int executionId,
    required int facilityId,
  }) async {
    return cumulativeReportUsecase.getMCExecutionDetail(
      executionId: executionId,
      facilityId: facilityId,
      isLoading: isLoading ?? false,
    );
  }

  Future<VegExecutionDetailsModel?> getVegExecutionDetail({
    bool? isLoading,
    required int facilityId,
    required int executionId,
  }) async {
    return cumulativeReportUsecase.getVegExecutionDetail(
      executionId: executionId,
      facilityId: facilityId,
      isLoading: isLoading ?? false,
    );
  }

  Future<List<VegTaskEquipmentList?>> getVegTaskEquipmentList({
    required bool isLoading,
    required int facilityId,
    required int executionId,
  }) async {
    return cumulativeReportUsecase.getVegTaskEquipmentList(
      isLoading: isLoading,
      executionId: executionId,
      facilityId: facilityId,
    );
  }
}
