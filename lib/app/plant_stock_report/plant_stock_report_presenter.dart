import '../../domain/models/get_plant_Stock_list.dart';
import '../../domain/usecases/plant_stock_report_usecase.dart';

class PlantStockReportPresenter {
  PlantStockReportPresenter(this.plantStockReportUsecase);
  PlantStockReportUsecase plantStockReportUsecase;
  Future<List<PlantStockListModel?>?> getPlantStockList(
          {int? facilityId,
          bool? isLoading,
          dynamic endDate,
          dynamic startDate}) async =>
      await plantStockReportUsecase.getPlantStockList(
          facilityId: facilityId ?? 0,
          isLoading: isLoading ?? false,
          endDate: endDate,
          startDate: startDate);
}
