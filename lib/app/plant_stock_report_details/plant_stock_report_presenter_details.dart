import 'package:cmms/domain/usecases/plant_stock_report_usecase_details.dart';

import '../../domain/models/get_asset_data_list_model.dart';
import '../../domain/models/get_plant_Stock_list.dart';

class PlantStockReportDetailsPresenter {
  PlantStockReportDetailsPresenter(this.plantStockReportDetailsUsecase);
  PlantStockReportDetailsUsecase plantStockReportDetailsUsecase;
  Future<List<PlantStockListModel?>?> getPlantStockList(
          {int? facilityId,
          bool? isLoading,
          bool? isExport,
          dynamic endDate,
          dynamic startDate,
          List<int>? selectedAssetsNameIdList}) async =>
      await plantStockReportDetailsUsecase.getPlantStockList(
          facilityId: facilityId ?? 0,
          isLoading: isLoading ?? false,
          isExport: isExport,
          endDate: endDate,
          startDate: startDate,
          selectedAssetsNameIdList: selectedAssetsNameIdList);
  Future<List<GetAssetDataModel?>?> getAssetList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await plantStockReportDetailsUsecase.getAssetList(
        auth: auth ?? "",
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );
}
