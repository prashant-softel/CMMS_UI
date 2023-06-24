import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

import '../models/frequency_model.dart';
import '../models/unit_of_measurement_model.dart';

class UnitOfMeasurementUsecase {
  UnitOfMeasurementUsecase(this.repository);
  Repository repository;

  Future<List<InventoryCategoryModel?>?> getInventoryCategoryList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getInventoryCategoryList(
        auth,
        facilityId,
        isLoading,
      );
  Future<List<UnitOfMeasurementModel?>?> getUnitOfMeasurementList({
    int? type,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getUnitMeasurementList(
        type,
        facilityId,
        isLoading,
      );
  Future<List<FrequencyModel?>?> getFrequencyList({
    bool? isLoading,
  }) async =>
      await repository.getFrequencyList(
        isLoading,
      );
  Future<bool> createUnitOfMeasurement({
    checklistJsonString,
    bool? isLoading, required modulelistJsonString,
  }) async =>
      await repository.createUnitOfMeasurement(
          isLoading: isLoading, checklistJsonString: checklistJsonString);
  // deleteChecklist(
  //         {required Object checklist_id, required bool isLoading}) async =>
  //     await repository.deleteCkecklist(
  //       checklist_id,
  //       isLoading,
  //     );
  // Future<bool> updateChecklistNumber({
  //   checklistJsonString,
  //   bool? isLoading,
  // }) async =>
  //     await repository.updateChecklistNumber(
  //       isLoading: isLoading,
  //       checklistJsonString: checklistJsonString,
  //     );
}
