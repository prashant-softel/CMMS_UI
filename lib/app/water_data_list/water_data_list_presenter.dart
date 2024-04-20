import 'package:cmms/domain/models/type_of_water_model.dart';
import 'package:cmms/domain/usecases/water_data_list_usecase.dart';

class WaterDataListPresenter {
  WaterDataListPresenter(this.waterDataListUsecase);
  WaterDataListUsecase waterDataListUsecase;

  Future<Map<String, dynamic>?> createWaterData({
    createWaterData,
    required bool isLoading,
  }) async {
    return waterDataListUsecase.createWaterData(
      createWaterData: createWaterData,
      isLoading: isLoading,
    );
  }

  Future<Map<String, dynamic>?> createWaterDataConsumption({
    createWaterData,
    required bool isLoading,
  }) async {
    return waterDataListUsecase.createWaterData(
      createWaterData: createWaterData,
      isLoading: isLoading,
    );
  }

  Future<List<WaterSource>> getTypeOfWaterList({
    required bool isLoading,
    required int? facilityId,
  }) async {
    return waterDataListUsecase.getTypeOfWaterList(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }
}
