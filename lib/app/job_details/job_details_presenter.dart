import 'package:cmms/domain/models/mrs_list_by_jobId.dart';

import '../../domain/models/job_details_model.dart';
import '../../domain/models/new_permit_list_model.dart';
import '../../domain/usecases/job_details_usecase.dart';

class JobDetailsPresenter {
  ///
  JobDetailsPresenter(this.jobDetailsUsecase);
  JobDetailsUsecase jobDetailsUsecase;

  ///
  Future<List<JobDetailsModel?>?> getJobDetails({
    String? auth,
    int? jobId,
    required int facilityId,
    int? userId,
    bool? isLoading,
  }) async =>
      await jobDetailsUsecase.getJobDetails(
        auth: auth ?? "",
        jobId: jobId ?? 0,
        facilityId: facilityId,
        userId: userId,
        isLoading: isLoading,
      );
  Future<List<JobAssociatedModel?>?> getjobDetailsModel({
    String? auth,
    required int jobId,
    required int facilityId,
    int? userId,
    bool? isLoading,
  }) async =>
      await jobDetailsUsecase.getjobDetailsModel(
        auth: auth ?? "",
        jobId: jobId,
        userId: userId,
        facilityId: facilityId,
        isLoading: isLoading,
      );

  ///
  Future<List<NewPermitModel?>?> getPermitList({
    int? facilityId,
    bool? selfView,
    bool? isLoading,
  }) async =>
      await jobDetailsUsecase.getPermitList(
        facilityId: facilityId,
        selfView: selfView,
        isLoading: isLoading,
      );

  Future<List<MRSListByJobIdModel>?> getMrsListByModule(
    jobId,
    int facilityId,
    isLoading,
  ) async =>
      await jobDetailsUsecase.getMrsListByModule(
        jobId: jobId,
        facilityId: facilityId,
        isLoading: isLoading,
      );

  ///
  Future<Map<String, dynamic>?> linkToPermit({
    int? jobId,
    int? permitId,
    bool? isLoading,
  }) async =>
      await jobDetailsUsecase.linkToPermit(
        jobId: jobId,
        permitId: permitId,
        isLoading: isLoading,
      );
  void clearStoreDataType() async => jobDetailsUsecase.clearStoreDataType();

  Future<Map<String, dynamic>?> createJobCard({
    String? auth,
    int? jobId,
    bool? isLoading,
  }) async =>
      await jobDetailsUsecase.createJobCard(
        auth: auth,
        jobId: jobId,
        isLoading: isLoading,
      );
  void saveValue({String? jobId}) async {
    return jobDetailsUsecase.saveValue(jobId: jobId);
  }

  Future<String?> getValue() async => await jobDetailsUsecase.getValue();
  void clearValue() async => jobDetailsUsecase.clearValue();
  void clearValueJobId() async => jobDetailsUsecase.clearValueJobId();

  void clearMrsIdStoreData() async => jobDetailsUsecase.clearMrsIdStoreData();

  void clearPermitStoreData() async => jobDetailsUsecase.clearPermitStoreData();
  void clearJobDetailStoreData() async =>
      jobDetailsUsecase.clearJobDetailStoreData();
  void clearTypeValue() async => jobDetailsUsecase.clearTypeValue();
  void clearisCheckedValue() async => jobDetailsUsecase.clearisCheckedValue();
  void clearpmTaskValue() async => jobDetailsUsecase.clearpmTaskValue();
  void clearStoreTaskData() {
    jobDetailsUsecase.clearStoreTaskData();
  }

  void clearStoreDataTaskId() {
    jobDetailsUsecase.clearStoreDataTaskId();
  }

  void clearStoreTaskActivityData() {
    jobDetailsUsecase.clearStoreTaskActivityData();
  }

  void clearStoreTaskfromActorData() {
    jobDetailsUsecase.clearStoreTaskfromActorData();
  }

  void clearStoreTasktoActorData() {
    jobDetailsUsecase.clearStoreTasktoActorData();
  }

  void clearStoreTaskWhereUsedData() {
    jobDetailsUsecase.clearStoreTaskWhereUsedData();
  }

  void clearStoreDataJobId() async => jobDetailsUsecase.clearStoreDataJobId();
}
