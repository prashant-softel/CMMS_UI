import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/type_of_waste_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

class WasteDataUsecase {
  WasteDataUsecase(this.repository);
  Repository repository;

  Future<Map<String, dynamic>> createWasteData({
    createWasteData,
    bool? isLoading,
  }) async =>
      await repository.createWasteData(
        createWasteData,
        isLoading,
      );
  Future<Map<String, dynamic>> createWasteDataDisposed({
    createWasteData,
    bool? isLoading,
  }) async =>
      await repository.createWasteData(
        createWasteData,
        isLoading,
      );

  Future<List<WasteSource>> getTypeOfWasteList(
      {required bool isLoading, required int? facilityId}) async {
    return repository.getTypeOfWasteList(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }

  Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await repository.getFacilityList(isLoading);
}
