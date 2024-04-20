import 'package:cmms/domain/models/type_of_water_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

class WaterTypeMasterUsecase {
  WaterTypeMasterUsecase(this.repository);
  Repository repository;

  Future<List<WaterSource>> getTypeOfWaterList(
      {required bool isLoading, required int? facilityId}) async {
    return repository.getTypeOfWaterList(
      facilityId: facilityId,
      isLoading: isLoading,
    );
  }

  Future<WaterSource?> getWaterTypeById(
      {int? waterTypeId, bool? isLoading}) async {
    return await repository.getWaterTypeById(
      waterTypeId: waterTypeId,
      isLoading: isLoading,
    );
  }

  Future<bool> createWaterType({
    waterTypeJson,
    bool? isLoading,
  }) async =>
      await repository.createWaterType(
        waterTypeJson: waterTypeJson,
        isLoading: isLoading,
      );

  Future<bool> updateWaterType({
    waterTypeJson,
    bool? isLoading,
  }) async =>
      await repository.updateWaterType(
        waterTypeJson: waterTypeJson,
        isLoading: isLoading,
      );

  Future<void> deleteWaterType({
    int? waterTypeId,
    bool? isLoading,
  }) async =>
      await repository.deleteWaterType(
        waterTypeId: waterTypeId,
        isLoading: isLoading,
      );
}