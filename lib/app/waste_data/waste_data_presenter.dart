import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/type_of_waste_model.dart';
import 'package:cmms/domain/usecases/waste_data_usecase.dart';

class WasteDataPresenter {
  WasteDataPresenter(this.wasteDataUsecase);
  WasteDataUsecase wasteDataUsecase;

  Future<Map<String, dynamic>?> createWasteData({
    createWasteData,
    required bool isLoading,
  }) async {
    return wasteDataUsecase.createWasteData(
      createWasteData: createWasteData,
      isLoading: isLoading,
    );
  }

  Future<Map<String, dynamic>?> createWasteDataDisposed({
    createWasteData,
    required bool isLoading,
  }) async {
    return wasteDataUsecase.createWasteDataDisposed(
      createWasteData: createWasteData,
      isLoading: isLoading,
    );
  }

  Future<List<WasteSource>> getTypeOfWasteList({
    required bool isLoading,
    required int? facilityId,
  }) async {
    return wasteDataUsecase.getTypeOfWasteList(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }

  Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await wasteDataUsecase.getFacilityList(isLoading: isLoading);
}
