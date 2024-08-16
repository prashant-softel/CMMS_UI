import 'package:cmms/domain/models/get_asset_data_list_model.dart';
import 'package:cmms/domain/models/get_plant_Stock_list.dart';
import 'package:cmms/domain/models/get_return_mrs_detail.dart';
import 'package:cmms/domain/models/job_card_details_model.dart';
import 'package:cmms/domain/models/job_details_model.dart';
import 'package:cmms/domain/models/pm_task_view_list_model.dart';

import '../../domain/usecases/edit_return_mrs_usecase.dart';

class EditMrsReturnPresenter {
  EditMrsReturnPresenter(this.editmrsReturnUsecase);
  EditMrsReturnUsecase editmrsReturnUsecase;
  Future<List<PlantStockListModel?>?> getCmmsItemList(
          {int? facilityId, bool? isLoading, int? mrsId}) async =>
      await editmrsReturnUsecase.getCmmsItemList(
          facilityId: facilityId ?? 0,
          isLoading: isLoading ?? false,
          mrsId: mrsId);
  Future<Map<String, dynamic>?> updateReturnMrs({
    createReturnMrsJsonString,
    required bool isLoading,
  }) async {
    return editmrsReturnUsecase.updateReturnMrs(
      createReturnMrsJsonString: createReturnMrsJsonString,
      isLoading: isLoading,
    );
  }

  Future<List<JobCardDetailsModel?>?> getJobCardDetails({
    int? jobCardId,
    bool? isLoading,
  }) async =>
      await editmrsReturnUsecase.getJobCardDetails(
        jobCardId: jobCardId,
        isLoading: isLoading,
      );
  Future<List<JobDetailsModel?>?> getJobDetails({
    String? auth,
    int? jobId,
    required int facilityId,
    int? userId,
    bool? isLoading,
  }) async =>
      await editmrsReturnUsecase.getJobDetails(
        auth: auth ?? "",
        jobId: jobId ?? 0,
        facilityId: facilityId,
        userId: userId,
        isLoading: isLoading,
      );
  void saveValue({String? mrsId}) async {
    return editmrsReturnUsecase.saveValue(mrsId: mrsId);
  }

  Future<String?> getValue() async => await editmrsReturnUsecase.getValue();

  Future<PmtaskViewModel?> getPmtaskViewList({
    int? scheduleId,
    required int facilityId,
    bool? isloading,
  }) async =>
      await editmrsReturnUsecase.getPmtaskViewList(
          scheduleId: scheduleId, isLoading: isloading, facilityId: facilityId);

  Future<List<GetAssetDataModel?>?> getAssetList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await editmrsReturnUsecase.getAssetList(
        auth: auth ?? "",
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );
  Future<ReturnMrsDetailsModel?> getReturnMrsDetails({
    int? mrsId,
    required int facilityId,
    bool? isLoading,
  }) async =>
      await editmrsReturnUsecase.getReturnMrsDetails(
        mrsId: mrsId,
        facilityId: facilityId,
        isLoading: isLoading,
      );
}
