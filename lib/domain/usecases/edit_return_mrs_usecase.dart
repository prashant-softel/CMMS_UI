import 'package:cmms/domain/models/get_asset_data_list_model.dart';
import 'package:cmms/domain/models/get_plant_Stock_list.dart';
import 'package:cmms/domain/models/get_return_mrs_detail.dart';
import 'package:cmms/domain/repositories/repository.dart';

import '../models/employe_stock_model.dart';

class EditMrsReturnUsecase {
  EditMrsReturnUsecase(this.repository);
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
  Future<ReturnMrsDetailsModel?> getReturnMrsDetails({
    int? mrsId,
    required int facilityId,
    bool? isLoading,
  }) async =>
      await repository.getReturnMrsDetails(
        mrsId,
        facilityId,
        isLoading,
      );
}
