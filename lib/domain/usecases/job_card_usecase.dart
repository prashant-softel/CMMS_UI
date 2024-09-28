import 'package:cmms/domain/models/employee_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/job_card_model.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:cmms/domain/repositories/repository.dart';

import '../models/job_card_details_model.dart';
import '../models/permit_details_model.dart';

class JobCardUsecase {
  JobCardUsecase(this.repository);
  Repository repository;

  ///
  Future<List<EmployeeModel?>?> getAssignedToList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getAssignedToList(
        auth,
        facilityId,
        isLoading,
      );
  Future<List<JobCardModel?>?> jobCardList(
          {int? facilityId, bool? isLoading, bool? isExport,bool? self_view,}) async =>
      await repository.jobCardList(facilityId, isLoading, isExport,self_view);

  ///
  Future<Map<String, dynamic>?> createJobCard({
    String? auth,
    int? jobId,
    bool? isLoading,
  }) async =>
      await repository.createJobCard(
        auth,
        jobId,
        isLoading,
      );

  ///
  Future<List<JobCardDetailsModel?>?> getJobCardDetails({
    int? jobCardId,
    bool? isLoading,
  }) async =>
      await repository.getJobCardDetails(
        jobCardId,
        isLoading,
      );

  ///
  Future<PermitDetailsModel?> getPermitDetails({
    int? permitId,
    required int facilityId,
    bool? isLoading,
  }) async =>
      await repository.getPermitDetails(
        permitId,
        facilityId,
        isLoading,
      );

  ///
  Future<Map<String, dynamic>?> updateJobCard({
    jobCard,
    bool? isLoading,
  }) async =>
      await repository.updateJobCard(
        jobCard,
        isLoading,
      );

  ///
  Future<List<HistoryModel>?> getJobCardHistory({
    moduleType,
    jobCardId,
    facilityId,
    bool? isLoading,
  }) async =>
      await repository.getJobCardHistory(
        moduleType,
        jobCardId,
        facilityId,
        isLoading,
      );
  void clearValue() async => repository.clearData(LocalKeys.jobCardId);

  ///
  // Future<dynamic> approveJobCard({
  //   jobCardId,
  //   comment,
  //   bool? isLoading,
  // }) async =>
  //     await repository.approveJobCard(
  //       jobCardId,
  //       comment,
  //       isLoading,
  //     );

  ///

  ///
}
