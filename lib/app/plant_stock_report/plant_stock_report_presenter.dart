import '../../domain/models/get_asset_data_list_model.dart';
import '../../domain/models/get_plant_Stock_list.dart';
import '../../domain/usecases/plant_stock_report_usecase.dart';

class PlantStockReportPresenter {
  PlantStockReportPresenter(this.plantStockReportUsecase);
  PlantStockReportUsecase plantStockReportUsecase;
  Future<List<PlantStockListModel?>?> getPlantStockList(
          {int? facilityId,
          bool? isLoading,
          bool? isExport,
          dynamic endDate,
          dynamic startDate,
          List<int>? selectedAssetsNameIdList}) async =>
      await plantStockReportUsecase.getPlantStockList(
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
      await plantStockReportUsecase.getAssetList(
        auth: auth ?? "",
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );
       void clearValue() async => plantStockReportUsecase.clearValue();
         void clearstartValue() async => plantStockReportUsecase.clearstartValue();
           void clearendValue() async => plantStockReportUsecase.clearendValue();
}
