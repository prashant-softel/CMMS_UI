import 'package:cmms/domain/models/get_asset_data_list_model.dart';
import 'package:cmms/domain/models/get_plant_Stock_list.dart';
import 'package:cmms/domain/models/job_details_model.dart';
import 'package:cmms/domain/models/pm_task_view_list_model.dart';

import '../../domain/usecases/create_mrs_return_usecase.dart';

class CreateMrsReturnPresenter {
  CreateMrsReturnPresenter(this.craetemrsReturnUsecase);
  CreateMrsReturnUsecase craetemrsReturnUsecase;
  Future<List<PlantStockListModel?>?> getCmmsItemList(
          {int? facilityId, bool? isLoading, int? mrsId}) async =>
      await craetemrsReturnUsecase.getCmmsItemList(
          facilityId: facilityId ?? 0,
          isLoading: isLoading ?? false,
          mrsId: mrsId);
  Future<Map<String, dynamic>?> createReturnMrs({
    createReturnMrsJsonString,
    required bool isLoading,
  }) async {
    return craetemrsReturnUsecase.createReturnMrs(
      createReturnMrsJsonString: createReturnMrsJsonString,
      isLoading: isLoading,
    );
  }

  Future<PmtaskViewModel?> getPmtaskViewList({
    int? scheduleId,
    required int facilityId,
    bool? isloading,
  }) async =>
      await craetemrsReturnUsecase.getPmtaskViewList(
          scheduleId: scheduleId, isLoading: isloading, facilityId: facilityId);

  Future<List<GetAssetDataModel?>?> getAssetList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await craetemrsReturnUsecase.getAssetList(
        auth: auth ?? "",
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );
  void saveValue({String? whereUsedTypeId}) async {
    return craetemrsReturnUsecase.saveValue(whereUsedTypeId: whereUsedTypeId);
  }

  void saveValuee({String? type}) async {
    return craetemrsReturnUsecase.saveValuee(type: type);
  }

  Future<String?> getValue() async => await craetemrsReturnUsecase.getValue();
  Future<String?> getValuee() async => await craetemrsReturnUsecase.getValuee();
  void saveactivityValue({String? activity}) async {
    return craetemrsReturnUsecase.saveactivityValue(activity: activity);
  }

  Future<List<JobDetailsModel?>?> getJobDetails({
    String? auth,
    int? jobId,
    required int facilityId,
    int? userId,
    bool? isLoading,
  }) async =>
      await craetemrsReturnUsecase.getJobDetails(
        auth: auth ?? "",
        jobId: jobId ?? 0,
        facilityId: facilityId,
        userId: userId,
        isLoading: isLoading,
      );
  // void saveJobId({String? jobid}) async {
  //   return craetemrsReturnUsecase.saveJobId(jobid: jobid);
  // }

  Future<String?> getactivityValue() async =>
      await craetemrsReturnUsecase.getactivityValue();

  void saveUsedTypeIdValue({String? whereUsedTypeId}) async {
    return craetemrsReturnUsecase.saveUsedTypeIdValue(
        whereUsedTypeId: whereUsedTypeId);
  }

  Future<String?> getUsedTypeIdValue() async =>
      await craetemrsReturnUsecase.getUsedTypeIdValue();
  void savewhereUsedValue({String? whereUsed}) async {
    return craetemrsReturnUsecase.savewhereUsedValue(whereUsed: whereUsed);
  }

  Future<String?> getwhereUsedValue() async =>
      await craetemrsReturnUsecase.getwhereUsedValue();
  void saveToActortypeValue({String? to_actor_type_id}) async {
    return craetemrsReturnUsecase.saveToActortypeValue(
        to_actor_type_id: to_actor_type_id);
  }

  Future<String?> getToActortypeValue() async =>
      await craetemrsReturnUsecase.getToActortypeValue();
  void saveTypeValue({String? type}) async {
    return craetemrsReturnUsecase.saveTypeValue(type: type);
  }

  Future<String?> getTypeValue() async =>
      await craetemrsReturnUsecase.getTypeValue();
  void saveFromActorIdValue({String? fromActorTypeId}) async {
    return craetemrsReturnUsecase.saveFromActorIdValue(
        fromActorTypeId: fromActorTypeId);
  }

  Future<String?> getFromActorIdValue() async =>
      await craetemrsReturnUsecase.getFromActorIdValue();
  void saveActivityValue({String? activityCtrlr}) async {
    return craetemrsReturnUsecase.saveActivityValue(
        activityCtrlr: activityCtrlr);
  }

  Future<String?> getActivityValue() async =>
      await craetemrsReturnUsecase.getActivityValue(); 

      void saveMrsIdValue({String? mrsId}) async {
    return craetemrsReturnUsecase.saveMrsIdValue(
        mrsId: mrsId);
  }

  Future<String?> getMrsIdValue() async =>
      await craetemrsReturnUsecase.getMrsIdValue();


       void saveJobIdValue({String? jobid}) async {
    return craetemrsReturnUsecase.saveJobIdValue(
        jobid: jobid);
  }

  Future<String?> getJobIdValue() async =>
      await craetemrsReturnUsecase.getJobIdValue();
}
