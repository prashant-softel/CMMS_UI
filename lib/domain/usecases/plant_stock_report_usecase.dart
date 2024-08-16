import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/get_asset_data_list_model.dart';
import 'package:cmms/domain/models/get_plant_Stock_list.dart';

class PlantStockReportUsecase {
  final Repository _repository;

  PlantStockReportUsecase(this._repository);
  Future<List<PlantStockListModel?>?> getPlantStockList(
          {int? facilityId,
          bool? isExport,
          bool? isLoading,
          dynamic endDate,
          dynamic startDate,
          List<int>? selectedAssetsNameIdList}) async =>
      await _repository.getPlantStockList(
          facilityId, isLoading,isExport, startDate, endDate, selectedAssetsNameIdList);
  Future<List<GetAssetDataModel?>?> getAssetList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await _repository.getAssetList(
        auth,
        facilityId,
        isLoading,
      );
      void clearValue() async => _repository.clearData(
        LocalKeys.assetId,
      );
       void clearstartValue() async => _repository.clearData(
        LocalKeys.startdate,
      );
       void clearendValue() async => _repository.clearData(
        LocalKeys.enddate,
      );
}
