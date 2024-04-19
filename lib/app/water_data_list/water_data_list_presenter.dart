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
}
