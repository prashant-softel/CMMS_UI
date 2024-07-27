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
}
