import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/get_plant_Stock_list.dart';

class FaultyMaterialReportUsecase {
  final Repository _repository;

  FaultyMaterialReportUsecase(this._repository);
  Future<List<PlantStockListModel?>?> getPlantStockList(
          {int? facilityId,
          bool? isLoading,
          dynamic endDate,
          dynamic startDate}) async =>
      await _repository.getPlantStockList(
          facilityId, isLoading, startDate, endDate);
}
