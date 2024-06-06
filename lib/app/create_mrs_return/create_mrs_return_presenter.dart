import 'package:cmms/domain/models/get_asset_data_list_model.dart';
import 'package:cmms/domain/models/get_plant_Stock_list.dart';

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

  Future<String?> getValue() async => await craetemrsReturnUsecase.getValue();
  void saveactivityValue({String? activity}) async {
    return craetemrsReturnUsecase.saveactivityValue(activity: activity);
  }

  Future<String?> getactivityValue() async =>
      await craetemrsReturnUsecase.getactivityValue();
}
