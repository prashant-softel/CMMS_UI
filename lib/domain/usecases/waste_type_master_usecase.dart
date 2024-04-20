import 'package:cmms/domain/models/waste_type_master_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

class WasteTypeMasterUsecase {
  WasteTypeMasterUsecase(this.repository);
  Repository repository;

  // Future<List<WasteSource>> getTypeOfWasteList(
  //     {required bool isLoading, required int? facilityId}) async {
  //   return repository.getTypeOfWasteList(
  //     facilityId: facilityId,
  //     isLoading: isLoading,
  //   );
  // }

  // Future<WasteSource?> getWaterTypeById(
  //     {int? waterTypeId, bool? isLoading}) async {
  //   return await repository.getWaterTypeById(
  //     waterTypeId: waterTypeId,
  //     isLoading: isLoading,
  //   );
  // }

  // Future<bool> createWasteType({
  //   wasteTypeJson,
  //   bool? isLoading,
  // }) async =>
  //     await repository.createWasteType(
  //       wasteTypeJson: wasteTypeJson,
  //       isLoading: isLoading,
  //     );

  // Future<bool> updateWasteType({
  //   wasteTypeJson,
  //   bool? isLoading,
  // }) async =>
  //     await repository.updateWasteType(
  //       wasteTypeJson: wasteTypeJson,
  //       isLoading: isLoading,
  //     );

  // Future<void> deleteWasteType({
  //   int? wasteTypeId,
  //   bool? isLoading,
  // }) async =>
  //     await repository.deleteWasteType(
  //       wasteTypeId: wasteTypeId,
  //       isLoading: isLoading,
  //     );
}
