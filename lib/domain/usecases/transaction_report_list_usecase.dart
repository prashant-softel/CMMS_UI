import 'package:cmms/domain/models/business_list_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/job_model.dart';
import 'package:cmms/domain/models/pm_task_model.dart';
import 'package:cmms/domain/models/transaction_report_list_model.dart';
import 'package:cmms/domain/models/user_list_model.dart';
import 'package:cmms/domain/models/inventory_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

class TransactionReportListUsecase {
  Repository repository;

  TransactionReportListUsecase(this.repository);

  Future<List<UserListModel?>?> getUserList({
    int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getUserList(facilityId, isLoading, false);

  Future<List<TransactionReportListModel>> transactionReport({
    required bool isLoading,
    required int? facility_id,
    String? start_date,
    required String end_date,
    int? actorID,
    int? actorType,
  }) async {
    return repository.transactionReport(
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
    return repository.getFacilityList(isLoading);
  }

  Future<List<PmTaskListModel?>?> getPmTaskList(
          {int? facilityId,
          bool? isLoading,
          dynamic endDate,
          dynamic startDate,
          bool? self_view,
          bool? isExport}) async =>
      await repository.getPmTaskList(
          facilityId, isLoading, startDate, endDate, isExport,self_view);
  Future<List<JobModel?>?> getJobList({
    required String auth,
    int? facilityId,
    bool? self_view,
    bool? isLoading,
    bool? isExport
  }) async =>
      await repository.getJobList(
        auth,
        facilityId,
        self_view,
        isLoading,
        isExport
      );
  Future<List<InventoryModel?>?> inventoryList({
    required bool isLoading,
    int? facilityId,
  }) async {
    return repository.inventoryList(
        isLoading: isLoading, facilityId: facilityId, categoryId: 0);
  }

  Future<List<BusinessListModel?>?> getBusinessList(int facilityId) async =>
      await repository.getBusinessList(
        facilityId:facilityId,
        isLoading: true,
      );
}
