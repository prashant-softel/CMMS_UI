import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/job_details_model.dart';
import 'package:cmms/domain/models/mrs_list_by_jobId.dart';
import 'package:cmms/domain/usecases/job_card_details_usecase.dart';

import '../../domain/models/employee_model.dart';
import '../../domain/models/job_card_details_model.dart';
import '../../domain/models/permit_details_model.dart';

class JobCardDetailsPresenter {
  JobCardDetailsPresenter(this.jobCardDetailsUsecase);
  JobCardDetailsUsecase jobCardDetailsUsecase;

  ///
  Future<List<JobDetailsModel?>?> getJobDetails({
    String? auth,
    int? jobId,
    required int facilityId,
    int? userId,
    bool? isLoading,
  }) async =>
      await jobCardDetailsUsecase.getJobDetails(
        auth: auth ?? "",
        jobId: jobId ?? 0,
        facilityId: facilityId,
        userId: userId,
        isLoading: isLoading,
      );
  Future<List<EmployeeModel?>?> getAssignedToList({
    String? auth,
    int? facilityId,
    int? featureId,
    bool? isLoading,
  }) async =>
      await jobCardDetailsUsecase.getAssignedToList(
        auth: auth ?? "",
        facilityId: facilityId,
        featureId: featureId,
        isLoading: isLoading,
      );

  ///
  Future<Map<String, dynamic>?> createJobCard({
    String? auth,
    int? jobId,
    bool? isLoading,
  }) async =>
      await jobCardDetailsUsecase.createJobCard(
        auth: auth,
        jobId: jobId,
        isLoading: isLoading,
      );
  Future<Map<String, dynamic>?> startJobCard({
    String? auth,
    int? jcCard,
    jobCard,
    bool? isLoading,
  }) async =>
      await jobCardDetailsUsecase.startJobCard(
        auth: auth,
        jcCard: jcCard,
        jobCard: jobCard,
        isLoading: isLoading,
      );

  ///
  Future<List<JobCardDetailsModel?>?> getJobCardDetails({
    int? jobCardId,
    bool? isLoading,
  }) async =>
      await jobCardDetailsUsecase.getJobCardDetails(
        jobCardId: jobCardId,
        isLoading: isLoading,
      );
  Future<bool> transferItem({
    transferItemJsonString,
    required bool isLoading,
  }) async {
    return jobCardDetailsUsecase.transferItem(
      transferItemJsonString: transferItemJsonString,
      isLoading: isLoading,
    );
  }

  Future<List<MRSListByJobIdModel>?> getMrsListByModule(
    jobId,
    int facilityId,
    isLoading,
  ) async =>
      await jobCardDetailsUsecase.getMrsListByModule(
        jobId: jobId,
        facilityId: facilityId,
        isLoading: isLoading,
      );

  ///
  Future<PermitDetailsModel?> getPermitDetails({
    int? permitId,
    required int facilityId,
    bool? isLoading,
  }) async =>
      await jobCardDetailsUsecase.getPermitDetails(
        permitId: permitId,
        facilityId: facilityId,
        isLoading: isLoading,
      );

  ///
  Future<Map<String, dynamic>?> updateJobCard(
    jobCard,
    isLoading,
  ) async =>
      await jobCardDetailsUsecase.updateJobCard(
        jobCard: jobCard,
        isLoading: isLoading,
      );
  Future<Map<String, dynamic>?> carryForwardJob(
    jobCard,
    isLoading,closePtwJsonString
  ) async =>
      await jobCardDetailsUsecase.carryForwardJob(
        jobCard: jobCard,
        isLoading: isLoading,        closePtwJsonString: closePtwJsonString,

      );
  Future<Map<String, dynamic>?> closeJob(
    jobCard,
    isLoading,
    closePtwJsonString,
  ) async =>
      await jobCardDetailsUsecase.closeJob(
        jobCard: jobCard,
        isLoading: isLoading,
        closePtwJsonString: closePtwJsonString,
      );

  ///
  Future<List<HistoryModel>?> getJobCardHistory(
    moduleType,
    jobCardId,
    facilityId,
    isLoading,
  ) async =>
      await jobCardDetailsUsecase.getJobCardHistory(
        moduleType: moduleType,
        jobCardId: jobCardId,
        facilityId: facilityId,
        isLoading: isLoading,
      );

  ///
  // Future<Map<String, dynamic>?> approveJobCard({
  //   int? jobCardId,
  //   String? comment,
  //   bool? isLoading,
  // }) async =>
  //     await jobCardDetailsUsecase.approveJobCard(
  //       jobCardId: jobCardId,
  //       comment: comment,
  //       isLoading: isLoading,
  //     );
  Future<bool> approveJobCards({
    approveJsonString,
    required bool isLoading,
  }) async {
    return jobCardDetailsUsecase.approveJobCards(
      approveJsonString: approveJsonString,
      isLoading: isLoading,
    );
  }

  ///
  Future<bool> rejectJobCard({
    rejectJsonString,
    required bool isLoading,
  }) async {
    return jobCardDetailsUsecase.rejectJobCard(
      rejectJsonString: rejectJsonString,
      isLoading: isLoading,
    );
  }

  Future<bool> approvecloseJob({
    approveJsonString,
    closePtwJsonString,
    required bool isLoading,
  }) async {
    return jobCardDetailsUsecase.approvecloseJob(
      approveJsonString: approveJsonString,
      closePtwJsonString: closePtwJsonString,
      isLoading: isLoading,
    );
  }

  ///
  Future<bool> rejectcloseJob({
    rejectJsonString,
    required bool isLoading,
  }) async {
    return jobCardDetailsUsecase.rejectcloseJob(
      rejectJsonString: rejectJsonString,
      isLoading: isLoading,
    );
  }

  void clearStoreData() async => jobCardDetailsUsecase.clearStoreData();
  void clearTypeValue() async => jobCardDetailsUsecase.clearTypeValue();
  void clearisCheckedValue() async =>
      jobCardDetailsUsecase.clearisCheckedValue();
  void clearjobmodelValue() async => jobCardDetailsUsecase.clearjobmodelValue();
  void clearpmTaskValue() async => jobCardDetailsUsecase.clearpmTaskValue();

  void saveValue({String? jobCardId}) async {
    return jobCardDetailsUsecase.saveValue(jobCardId: jobCardId);
  }

  Future<String?> getValue() async => await jobCardDetailsUsecase.getValue();

  void clearStoreTaskData() {
    jobCardDetailsUsecase.clearStoreTaskData();
  }

  void clearMrsIdStoreData() async =>
      jobCardDetailsUsecase.clearMrsIdStoreData();
  void clearJobIdStoreData() async =>
      jobCardDetailsUsecase.clearJobIdStoreData();

  void clearStoreDataTaskId() {
    jobCardDetailsUsecase.clearStoreDataTaskId();
  }

  void clearStoreTaskActivityData() {
    jobCardDetailsUsecase.clearStoreTaskActivityData();
  }

  void clearStoreTaskfromActorData() {
    jobCardDetailsUsecase.clearStoreTaskfromActorData();
  }

  void clearStoreTasktoActorData() {
    jobCardDetailsUsecase.clearStoreTasktoActorData();
  }

  void clearStoreTaskWhereUsedData() {
    jobCardDetailsUsecase.clearStoreTaskWhereUsedData();
  }
}
