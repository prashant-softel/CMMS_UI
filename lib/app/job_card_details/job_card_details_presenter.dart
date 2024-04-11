import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/usecases/job_card_details_usecase.dart';

import '../../domain/models/employee_model.dart';
import '../../domain/models/job_card_details_model.dart';
import '../../domain/models/permit_details_model.dart';

class JobCardDetailsPresenter {
  JobCardDetailsPresenter(this.jobCardDetailsUsecase);
  JobCardDetailsUsecase jobCardDetailsUsecase;

  ///
  Future<List<EmployeeModel?>?> getAssignedToList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await jobCardDetailsUsecase.getAssignedToList(
        auth: auth ?? "",
        facilityId: facilityId,
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
    files,
    bool? isLoading,
  }) async =>
      await jobCardDetailsUsecase.startJobCard(
        auth: auth,
        jcCard: jcCard,
        files: files,
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

  ///
  Future<PermitDetailsModel?> getPermitDetails({
    int? permitId,
    required int facilityId,
    bool? isLoading,
  }) async =>
      await jobCardDetailsUsecase.getPermitDetails(
        permitId: permitId,
        facilityId:facilityId,
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
    isLoading,
  ) async =>
      await jobCardDetailsUsecase.carryForwardJob(
        jobCard: jobCard,
        isLoading: isLoading,
      );
  Future<Map<String, dynamic>?> closeJob(
    jobCard,
    isLoading,
  ) async =>
      await jobCardDetailsUsecase.closeJob(
        jobCard: jobCard,
        isLoading: isLoading,
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
        facilityId:facilityId,
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
    required bool isLoading,
  }) async {
    return jobCardDetailsUsecase.approvecloseJob(
      approveJsonString: approveJsonString,
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

  void saveValue({String? jobCardId}) async {
    return jobCardDetailsUsecase.saveValue(jobCardId: jobCardId);
  }

  Future<String?> getValue() async => await jobCardDetailsUsecase.getValue();
}
