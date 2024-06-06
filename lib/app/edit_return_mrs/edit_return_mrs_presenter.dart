import 'package:cmms/domain/models/get_asset_data_list_model.dart';
import 'package:cmms/domain/models/get_plant_Stock_list.dart';
import 'package:cmms/domain/models/get_return_mrs_detail.dart';

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
  Future<Map<String, dynamic>?> createReturnMrs({
    createReturnMrsJsonString,
    required bool isLoading,
  }) async {
    return editmrsReturnUsecase.createReturnMrs(
      createReturnMrsJsonString: createReturnMrsJsonString,
      isLoading: isLoading,
    );
  }

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
