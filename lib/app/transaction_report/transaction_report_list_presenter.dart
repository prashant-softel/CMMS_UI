import 'package:cmms/domain/models/business_list_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/inventory_model.dart';
import 'package:cmms/domain/models/job_model.dart';
import 'package:cmms/domain/models/pm_task_model.dart';
import 'package:cmms/domain/models/transaction_report_list_model.dart';
import '../../domain/models/user_list_model.dart';
import '../../domain/usecases/transaction_report_list_usecase.dart';

class TransactionReportListPresenter {
  TransactionReportListPresenter(this.transactionReportListUsecase);
  TransactionReportListUsecase transactionReportListUsecase;
  Future<List<UserListModel?>?> getUserList({
    int? facilityId,
    bool? isLoading,
  }) async =>
      await transactionReportListUsecase.getUserList(
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );

  Future<List<TransactionReportListModel>> transactionReport({
    required bool isLoading,
    required int? facility_id,
    String? start_date,
    required String end_date,
    int? actorID,
    int? actorType,
  }) async {
    return transactionReportListUsecase.transactionReport(
      isLoading: isLoading,
      facility_id: facility_id,
      start_date: start_date,
      end_date: end_date,
      actorID: actorID,
      actorType: actorType,
    );
  }

  Future<List<FacilityModel?>?> getFacilityList({
    required bool isLoading,
  }) async {
    return transactionReportListUsecase.getFacilityList(
      isLoading: isLoading,
    );
  }

  Future<List<PmTaskListModel?>?> getPmTaskList(
          {int? facilityId,
          bool? isLoading,
          dynamic endDate,
          dynamic startDate}) async =>
      await transactionReportListUsecase.getPmTaskList(
          facilityId: facilityId ?? 0,
          isLoading: isLoading ?? false,
          endDate: endDate,
          startDate: startDate);
  Future<List<JobModel?>?> getJobList({
    String? auth,
    int? facilityId,
    // int? userId,
    required bool self_view,
    bool? isLoading,
    dynamic endDate,
    dynamic startDate,
  }) async =>
      await transactionReportListUsecase.getJobList(
          auth: auth ?? "",
          facilityId: facilityId ?? 0,
          self_view: self_view,
          isLoading: isLoading ?? false,
          endDate: endDate,
          startDate: startDate);
  Future<List<InventoryModel?>?> inventoryList({
    required bool isLoading,
    int? facilityId,
  }) async {
    return transactionReportListUsecase.inventoryList(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }

  Future<List<BusinessListModel?>?> getBusinessList(int facilityId) async =>
      await transactionReportListUsecase.getBusinessList(facilityId);
}
