import 'package:cmms/domain/models/get_asset_data_list_model.dart';
import 'package:cmms/domain/models/get_plant_Stock_list.dart';
import 'package:cmms/domain/models/job_details_model.dart';
import 'package:cmms/domain/models/pm_task_view_list_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

import '../repositories/local_storage_keys.dart';

class CreateMrsReturnUsecase {
  CreateMrsReturnUsecase(this.repository);
  Repository repository;
  Future<List<PlantStockListModel?>?> getCmmsItemList({
    int? facilityId,
    bool? isLoading,
    int? mrsId,
  }) async =>
      await repository.getPlantStockListReturn(facilityId, isLoading, mrsId);
  Future<Map<String, dynamic>> createReturnMrs({
    createReturnMrsJsonString,
    bool? isLoading,
  }) async =>
      await repository.createReturnMrs(
        createReturnMrsJsonString,
        isLoading,
      );
  Future<PmtaskViewModel?> getPmtaskViewList(
          {int? scheduleId, bool? isLoading, required int facilityId}) async =>
      await repository.getPmtaskViewList(scheduleId, isLoading, facilityId);

  Future<List<GetAssetDataModel?>?> getAssetList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getAssetList(
        auth,
        facilityId,
        isLoading,
      );

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
  void saveValue({String? whereUsedTypeId}) async =>
      repository.saveValue(LocalKeys.pmTaskId, whereUsedTypeId);
  void saveValuee({String? type}) async =>
      repository.saveValue(LocalKeys.type, type);
  Future<String?> getValue() async =>
      await repository.getStringValue(LocalKeys.pmTaskId);
  Future<String?> getValuee() async =>
      await repository.getStringValue(LocalKeys.type);
  void saveactivityValue({String? activity}) async =>
      repository.saveValue(LocalKeys.activity, activity);
  Future<String?> getactivityValue() async =>
      await repository.getStringValue(LocalKeys.activity);

  void saveUsedTypeIdValue({String? whereUsedTypeId}) async =>
      repository.saveValue(LocalKeys.pmTaskId, whereUsedTypeId);
  Future<String?> getUsedTypeIdValue() async =>
      await repository.getStringValue(LocalKeys.pmTaskId);
  void savewhereUsedValue({String? whereUsed}) async =>
      repository.saveValue(LocalKeys.whereUsed, whereUsed);
  Future<String?> getwhereUsedValue() async =>
      await repository.getStringValue(LocalKeys.whereUsed);
  void saveToActortypeValue({String? to_actor_type_id}) async =>
      repository.saveValue(LocalKeys.toactortypeid, to_actor_type_id);
  Future<String?> getToActortypeValue() async =>
      await repository.getStringValue(LocalKeys.toactortypeid);
  void saveTypeValue({String? type}) async =>
      repository.saveValue(LocalKeys.type, type);
  Future<String?> getTypeValue() async =>
      await repository.getStringValue(LocalKeys.type);
  void saveFromActorIdValue({String? fromActorTypeId}) async =>
      repository.saveValue(LocalKeys.fromActorTypeId, fromActorTypeId);
  Future<String?> getFromActorIdValue() async =>
      await repository.getStringValue(LocalKeys.fromActorTypeId);
  void saveActivityValue({String? activityCtrlr}) async =>
      repository.saveValue(LocalKeys.activity, activityCtrlr);
  Future<String?> getActivityValue() async =>
      await repository.getStringValue(LocalKeys.activity);

  void saveMrsIdValue({String? mrsId}) async =>
      repository.saveValue(LocalKeys.mrsId, mrsId);
  Future<String?> getMrsIdValue() async =>
      await repository.getStringValue(LocalKeys.mrsId);

  void saveJobIdValue({String? jobid}) async =>
      repository.saveValue(LocalKeys.jobId, jobid);
  Future<String?> getJobIdValue() async =>
      await repository.getStringValue(LocalKeys.jobId);
}
