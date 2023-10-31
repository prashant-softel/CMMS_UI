import 'package:cmms/domain/models/mrs_list_by_jobId.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:cmms/domain/repositories/repository.dart';

import '../models/job_details_model.dart';
import '../models/new_permit_list_model.dart';

class JobDetailsUsecase {
  JobDetailsUsecase(this.repository);
  Repository repository;

  ///

  Future<List<JobDetailsModel?>?> getJobDetails({
    required String auth,
    required int jobId,
    int? userId,
    bool? isLoading,
  }) async =>
      await repository.getJobDetails(
        auth,
        jobId,
        userId,
        isLoading,
      );
  Future<List<JobAssociatedModel?>?> getjobDetailsModel({
    required String auth,
    required int jobId,
    int? userId,
    bool? isLoading,
  }) async =>
      await repository.getjobDetailsModel(
        auth,
        jobId,
        userId,
        isLoading,
      );

  ///
  Future<List<NewPermitModel?>?> getPermitList({
    int? facilityId,
    bool? selfView,
    bool? isLoading,
  }) async =>
      await repository.getPermitList(
        facilityId,
        selfView,
        isLoading,
      );

  Future<List<MRSListByJobIdModel>?> getMrsListByModule({
    jobId,
    bool? isLoading,
  }) async =>
      await repository.getMrsListByModule(
        jobId,
        isLoading,
      );

  ///
  Future<Map<String, dynamic>?> linkToPermit({
    int? jobId,
    int? permitId,
    bool? isLoading,
  }) async =>
      await repository.linkToPermit(
        jobId,
        permitId,
        isLoading,
      );
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
  void saveValue({String? jobId}) async =>
      repository.saveValue(LocalKeys.jobId, jobId);
  Future<String?> getValue() async =>
      await repository.getStringValue(LocalKeys.jobId);
  void clearValue() async => repository.clearData(LocalKeys.jobCardId);
}
