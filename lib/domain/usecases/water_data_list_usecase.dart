import 'package:cmms/domain/models/type_of_water_model.dart';
import 'package:cmms/domain/models/water_data_list_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

class WaterDataListUsecase {
  Repository repository;

  WaterDataListUsecase(this.repository);
  Future<Map<String, dynamic>> createWaterData({
    createWaterData,
    bool? isLoading,
  }) async =>
      await repository.createWaterData(
        createWaterData,
        isLoading,
      );
  Future<Map<String, dynamic>> updateWaterData({
    updateWaterData,
    bool? isLoading,
  }) async =>
      await repository.updateWaterData(
        updateWaterData,
        isLoading,
      );

  Future<List<WaterSource>> getTypeOfWaterList(
      {required bool isLoading, required int? facilityId}) async {
    return repository.getTypeOfWaterList(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }

  Future<List<WaterDataList>> getWaterDataList({
    required bool isLoading,
    required int? facility_id,
    String? start_date,
    bool? isExport,
    required String end_date,
  }) async {
    return repository.getWaterDataList(
        isLoading: isLoading,
        facility_id: facility_id,
        start_date: start_date,
        end_date: end_date,
        isExport: isExport);
  }
}
