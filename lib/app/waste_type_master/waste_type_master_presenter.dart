import 'package:cmms/domain/models/waste_type_master_model.dart';
import 'package:cmms/domain/usecases/waste_type_master_usecase.dart';

class WasteTypeMasterPresenter {
  WasteTypeMasterPresenter(this.wasteTypeMasterUsecase);

  WasteTypeMasterUsecase wasteTypeMasterUsecase;

  // Future<List<WasteSource>> getTypeOfWasteList({
  //   required bool isLoading,
  //   required int? facilityId,
  // }) async {
  //   return wasteTypeMasterUsecase.getTypeOfWasteList(
  //     facilityId: facilityId,
  //     isLoading: isLoading,
  //   );
  // }

  // Future<WasteSource?> getWaterTypeById({
  //   int? waterTypeId,
  //   bool? isLoading,
  // }) async {
  //   return wasteTypeMasterUsecase.getWaterTypeById(
  //     waterTypeId: waterTypeId,
  //     isLoading: isLoading,
  //   );
  // }

  // Future<bool> createWasteType({
  //   wasteTypeJson,
  //   bool? isLoading,
  // }) async {
  //   wasteTypeMasterUsecase.createWasteType(
  //     wasteTypeJson: wasteTypeJson,
  //     isLoading: isLoading,
  //   );
  //   return true;
  // }

  // Future<bool> updateWasteType({
  //   wasteTypeJson,
  //   bool? isLoading,
  // }) async {
  //   wasteTypeMasterUsecase.updateWasteType(
  //     wasteTypeJson: wasteTypeJson,
  //     isLoading: isLoading,
  //   );
  //   return true;
  // }

  // Future<void> deleteWasteType({
  //   int? wasteTypeId,
  //   bool? isLoading,
  // }) async =>
  //     await wasteTypeMasterUsecase.deleteWasteType(
  //       wasteTypeId: wasteTypeId,
  //       isLoading: isLoading,
  //     );
}
