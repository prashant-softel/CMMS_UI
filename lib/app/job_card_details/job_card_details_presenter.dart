import 'package:cmms/domain/models/history_model.dart';

import '../../domain/models/employee_model.dart';
import '../../domain/models/job_card_details_model.dart';
import '../../domain/models/permit_details_model.dart';
import '../../domain/usecases/job_card_usecase.dart';

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
    bool? isLoading,
  }) async =>
      await jobCardDetailsUsecase.getPermitDetails(
        permitId: permitId,
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

  ///
  Future<List<HistoryModel>?> getJobCardHistory(
    moduleType,
    jobCardId,
    isLoading,
  ) async =>
      await jobCardDetailsUsecase.getJobCardHistory(
        moduleType: moduleType,
        jobCardId: jobCardId,
        isLoading: isLoading,
      );

  ///
  Future<dynamic> approveJobCard({
    int? jobCardId,
    String? comment,
    bool? isLoading,
  }) async =>
      await jobCardDetailsUsecase.approveJobCard(
        jobCardId: jobCardId,
        comment: comment,
        isLoading: isLoading,
      );

  ///
  Future<dynamic> rejectJobCard(
    jobCardId,
    comment,
    isLoading,
  ) async =>
      await jobCardDetailsUsecase.approveJobCard(
        jobCardId: jobCardId,
        comment: comment,
        isLoading: isLoading,
      );

  ///
}
