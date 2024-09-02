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
  Future<List<JobAssociatedModel?>?> getjobDetailsModel({
    required String auth,
    required int jobId,
    required int facilityId,
    int? userId,
    bool? isLoading,
  }) async =>
      await repository.getjobDetailsModel(
        auth,
        jobId,
        facilityId,
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
    required int facilityId,
    bool? isLoading,
  }) async =>
      await repository.getMrsListByModule(
        jobId,
        facilityId,
        isLoading,
      );
  void clearStoreDataType() async => repository.clearData(LocalKeys.typeEdit);

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
  void clearValueJobId() async => repository.clearData(LocalKeys.jobId);

  void clearMrsIdStoreData() async => repository.clearData(LocalKeys.mrsId);

  void clearPermitStoreData() async => repository.clearData(LocalKeys.permitId);
  void clearJobDetailStoreData() async =>
      repository.clearData(LocalKeys.jobModel);
  void clearTypeValue() async => repository.clearData(LocalKeys.types);
  void clearisCheckedValue() async => repository.clearData(LocalKeys.isChecked);
  void clearpmTaskValue() async => repository.clearData(LocalKeys.pmTaskModel);
  void clearStoreTaskData() async => repository.clearData(LocalKeys.pmTaskId);
  void clearStoreTaskActivityData() async =>
      repository.clearData(LocalKeys.activity);
  void clearStoreDataTaskId() async => repository.clearData(LocalKeys.pmTaskId);

  void clearStoreTaskfromActorData() async =>
      repository.clearData(LocalKeys.fromActorTypeId);
  void clearStoreTasktoActorData() async =>
      repository.clearData(LocalKeys.toactortypeid);
  void clearStoreTaskWhereUsedData() async =>
      repository.clearData(LocalKeys.whereUsed);
  void clearStoreDataJobId() async => repository.clearData(LocalKeys.jobId);
}
