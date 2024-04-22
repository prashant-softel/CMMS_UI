import 'package:cmms/domain/models/type_of_water_model.dart';
import 'package:cmms/domain/usecases/water_type_master_usecase.dart';

class WaterTypeMasterPresenter {
  WaterTypeMasterPresenter(this.waterTypeMasterUsecase);

  WaterTypeMasterUsecase waterTypeMasterUsecase;

  Future<List<WaterSource>> getTypeOfWaterList({
    required bool isLoading,
    required int? facilityId,
  }) async {
    return waterTypeMasterUsecase.getTypeOfWaterList(
      facilityId: facilityId,
      isLoading: isLoading,
    );
  }

  Future<WaterSource?> getWaterTypeById({
    int? waterTypeId,
    bool? isLoading,
  }) async {
    return waterTypeMasterUsecase.getWaterTypeById(
      waterTypeId: waterTypeId,
      isLoading: isLoading,
    );
  }

  Future<bool> createWaterType({
    waterTypeJson,
    bool? isLoading,
  }) async {
    waterTypeMasterUsecase.createWaterType(
      waterTypeJson: waterTypeJson,
      isLoading: isLoading,
    );
    return true;
  }

  Future<bool> updateWaterType({
    waterTypeJson,
    bool? isLoading,
  }) async {
    waterTypeMasterUsecase.updateWaterType(
      waterTypeJson: waterTypeJson,
      isLoading: isLoading,
    );
    return true;
  }

  Future<void> deleteWaterType({
    int? waterTypeId,
    bool? isLoading,
  }) async =>
      await waterTypeMasterUsecase.deleteWaterType(
        waterTypeId: waterTypeId,
        isLoading: isLoading,
      );
}
