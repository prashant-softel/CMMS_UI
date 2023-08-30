import '../../domain/models/get_plant_Stock_list.dart';
import '../../domain/usecases/faulty_material_report_usecase.dart';

class FaultyMaterialReportPresenter {
  FaultyMaterialReportPresenter(this.faultyMaterialReportUsecase);
  FaultyMaterialReportUsecase faultyMaterialReportUsecase;
  Future<List<PlantStockListModel?>?> getPlantStockList(
          {int? facilityId,
          bool? isLoading,
          dynamic endDate,
          dynamic startDate}) async =>
      await faultyMaterialReportUsecase.getPlantStockList(
          facilityId: facilityId ?? 0,
          isLoading: isLoading ?? false,
          endDate: endDate,
          startDate: startDate);
}
