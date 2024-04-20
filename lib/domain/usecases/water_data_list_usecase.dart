import 'package:cmms/domain/models/type_of_water_model.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:cmms/domain/models/audit_plan_list_model.dart';
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

  Future<List<WaterSource>> getTypeOfWaterList(
      {required bool isLoading, required int? facilityId}) async {
    return repository.getTypeOfWaterList(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }
}
