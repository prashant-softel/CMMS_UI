
import '../../domain/models/frequency_model.dart';
import '../../domain/models/inventory_category_model.dart';
import '../../domain/models/unit_of_measurement_model.dart';
import '../../domain/usecases/unit_of_measurement_usecase.dart';

class UnitOfMeasurementPresenter {
  UnitOfMeasurementPresenter(this.unitOfMeasurementUsecase);
  UnitOfMeasurementUsecase unitOfMeasurementUsecase;

  Future<List<InventoryCategoryModel?>?> getInventoryCategoryList({
    bool? isLoading,
  }) async =>
      await unitOfMeasurementUsecase.getInventoryCategoryList(
        isLoading: isLoading ?? false,
      );
  Future<List<UnitOfMeasurementModel?>?> getUnitOfMeasurementList({
    int? facilityId,
    int? type,
    bool? isLoading,
  }) async =>
      await unitOfMeasurementUsecase.getUnitOfMeasurementList(
        facilityId: facilityId ?? 0,
        type: type,
        isLoading: isLoading ?? false,
      );
  Future<List<FrequencyModel?>?> getFrequencyList({
    bool? isLoading,
  }) async =>
      await unitOfMeasurementUsecase.getFrequencyList(
        isLoading: isLoading ?? false,
      );
  Future<bool> createUnitOfMeasurement({
    modulelistJsonString,
    required bool isLoading,
  }) async {
     print("For API testing presenter entry");
  
    // print("presenter");
    unitOfMeasurementUsecase.createUnitOfMeasurement(
      modulelistJsonString: modulelistJsonString,
      isLoading: isLoading,
     );
    print("For API testing presenter exit");
    return true;
  }

  // deleteModulelist(String? module_id, {required bool isLoading}) async =>
  //     await unitOfMeasurementUsecase.deleteChecklist(
  //       module_id: module_id ?? 0,
  //       isLoading: isLoading,
  //     );
  // Future<bool> updateModulelistNumber(
  //     {modulelistJsonString, required bool isLoading, moduleId}) async {
  //   print("presenter");
  //   unitOfMeasurementUsecase.updateModulelistNumber(
  //     modulelistJsonString: modulelistJsonString,
  //     isLoading: isLoading,
  //   );
  //   return true;
  // }
}
