import 'package:cmms/domain/usecases/waste_type_master_usecase.dart';
import 'package:cmms/domain/models/type_of_waste_model.dart';

class WasteTypeMasterPresenter {
  WasteTypeMasterPresenter(this.wasteTypeMasterUsecase);

  WasteTypeMasterUsecase wasteTypeMasterUsecase;

  Future<List<WasteSource>> getWasteTypeList({
    required bool isLoading,
  }) async {
    return wasteTypeMasterUsecase.getWasteTypeList(
      isLoading: isLoading,
    );
  }

  // Future<WasteSource?> getWasteTypeById({
  //   int? wasteTypeId,
  //   bool? isLoading,
  // }) async {
  //   return wasteTypeMasterUsecase.getWasteTypeById(
  //     wasteTypeId: wasteTypeId,
  //     isLoading: isLoading,
  //   );
  // }

  Future<bool> createWasteType({
    wasteTypeJson,
    bool? isLoading,
  }) async {
    wasteTypeMasterUsecase.createWasteType(
      wasteTypeJson: wasteTypeJson,
      isLoading: isLoading,
    );
    return true;
  }

  Future<bool> updateWasteType({
    wasteTypeJson,
    bool? isLoading,
  }) async {
    wasteTypeMasterUsecase.updateWasteType(
      wasteTypeJson: wasteTypeJson,
      isLoading: isLoading,
    );
    return true;
  }

  Future<void> deleteWasteType({
   required int? wasteTypeId,
    bool? isLoading,
  }) async =>
      await wasteTypeMasterUsecase.deleteWasteType(
        wasteTypeId: wasteTypeId ?? 0,
        isLoading: isLoading,
      );
}
