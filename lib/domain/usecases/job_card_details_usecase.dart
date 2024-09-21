import 'package:cmms/domain/models/employee_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/job_details_model.dart';
import 'package:cmms/domain/models/mrs_list_by_jobId.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:cmms/domain/repositories/repository.dart';

import '../models/job_card_details_model.dart';
import '../models/permit_details_model.dart';

class JobCardDetailsUsecase {
  JobCardDetailsUsecase(this.repository);
  Repository repository;

  ///
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
  Future<List<EmployeeModel?>?> getAssignedToList({
    String? auth,
    int? facilityId,
    int? featureId,
    bool? isLoading,
  }) async =>
      await repository.getAssignedToEmployee(
        auth,
        facilityId,
        featureId,
        isLoading,
      );

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
  Future<Map<String, dynamic>?> startJobCard({
    String? auth,
    int? jcCard,
    jobCard,
    bool? isLoading,
  }) async =>
      await repository.startJobCard(
        auth,
        jcCard,
        jobCard,
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
  Future<bool> transferItem({
    transferItemJsonString,
    bool? isLoading,
  }) async =>
      await repository.transferItem(
        isLoading: isLoading,
        transferItemJsonString: transferItemJsonString,
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
  Future<Map<String, dynamic>?> carryForwardJob(
          {jobCard, bool? isLoading, closePtwJsonString}) async =>
      await repository.carryForwardJob(jobCard, isLoading, closePtwJsonString);
  Future<Map<String, dynamic>?> closeJob(
          {jobCard, bool? isLoading, closePtwJsonString}) async =>
      await repository.closeJob(jobCard, isLoading, closePtwJsonString);

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

  Future<bool> approveJobCards({
    approveJsonString,
    bool? isLoading,
  }) async =>
      await repository.approveJobCards(
          approveJsonString: approveJsonString, isLoading: isLoading);

  ///
  Future<bool> rejectJobCard({
    rejectJsonString,
    bool? isLoading,
  }) async =>
      await repository.rejectJobCard(
          rejectJsonString: rejectJsonString, isLoading: isLoading);
  Future<bool> approvecloseJob({
    approveJsonString,
    closePtwJsonString,
    bool? isLoading,
  }) async =>
      await repository.approvecloseJob(
          approveJsonString: approveJsonString,
          closePtwJsonString: closePtwJsonString,
          isLoading: isLoading);

  ///
  Future<bool> rejectcloseJob({
    rejectJsonString,
    bool? isLoading,
  }) async =>
      await repository.rejectcloseJob(
          rejectJsonString: rejectJsonString, isLoading: isLoading);

  void saveValue({String? jobCardId}) async =>
      repository.saveValue(LocalKeys.jobCardId, jobCardId);
  Future<String?> getValue() async =>
      await repository.getStringValue(LocalKeys.jobCardId);

  void clearStoreData() async => repository.clearData(LocalKeys.permitId);
  void clearTypeValue() async => repository.clearData(LocalKeys.types);
  void clearisCheckedValue() async => repository.clearData(LocalKeys.isChecked);
  void clearjobmodelValue() async => repository.clearData(LocalKeys.jobModel);
  void clearpmTaskValue() async => repository.clearData(LocalKeys.pmTaskModel);

  void clearStoreTaskData() async => repository.clearData(LocalKeys.pmTaskId);
  void clearStoreTaskActivityData() async =>
      repository.clearData(LocalKeys.activity);
  void clearStoreDataTaskId() async => repository.clearData(LocalKeys.pmTaskId);
  void clearMrsIdStoreData() async => repository.clearData(LocalKeys.mrsId);
  void clearJobIdStoreData() async => repository.clearData(LocalKeys.jobId);

  void clearStoreTaskfromActorData() async =>
      repository.clearData(LocalKeys.fromActorTypeId);
  void clearStoreTasktoActorData() async =>
      repository.clearData(LocalKeys.toactortypeid);
  void clearStoreTaskWhereUsedData() async =>
      repository.clearData(LocalKeys.whereUsed);
}
