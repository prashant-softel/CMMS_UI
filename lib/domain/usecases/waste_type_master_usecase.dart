import 'package:cmms/domain/repositories/repository.dart';
import 'package:cmms/domain/models/type_of_waste_model.dart';

class WasteTypeMasterUsecase {
  WasteTypeMasterUsecase(this.repository);
  Repository repository;

  Future<List<WasteSource>> getWasteTypeList(
      {required bool isLoading}) async {
    return repository.getWasteTypeList(
      isLoading: isLoading,
    );
  }

  // Future<WasteSource?> getWaterTypeById(
  //     {int? waterTypeId, bool? isLoading}) async {
  //   return await repository.getWaterTypeById(
  //     waterTypeId: waterTypeId,
  //     isLoading: isLoading,
  //   );
  // }

  Future<bool> createWasteType({
    wasteTypeJson,
    bool? isLoading,
  }) async =>
      await repository.createWasteType(
        wasteTypeJson: wasteTypeJson,
        isLoading: isLoading,
      );

  Future<bool> updateWasteType({
    wasteTypeJson,
    bool? isLoading,
  }) async =>
      await repository.updateWasteType(
        wasteTypeJson: wasteTypeJson,
        isLoading: isLoading,
      );

  Future<void> deleteWasteType({
   required int? wasteTypeId,
    bool? isLoading,
  }) async =>
      await repository.deleteWasteType(
        wasteTypeId: wasteTypeId,
        isLoading: isLoading,
      );
}
