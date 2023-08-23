import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/get_plant_Stock_list.dart';

class PlantStockReportUsecase {
  final Repository _repository;

  PlantStockReportUsecase(this._repository);
  Future<List<PlantStockListModel?>?> getPlantStockList(
          {int? facilityId,
          bool? isLoading,
          dynamic endDate,
          dynamic startDate}) async =>
      await _repository.getPlantStockList(
          facilityId, isLoading, startDate, endDate);
}
