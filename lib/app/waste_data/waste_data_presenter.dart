import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/type_of_waste_model.dart';
import 'package:cmms/domain/models/waste_data_list_model.dart';
import 'package:cmms/domain/usecases/waste_data_usecase.dart';

class WasteDataPresenter {
  WasteDataPresenter(this.wasteDataUsecase);
  WasteDataUsecase wasteDataUsecase;

  Future<List<WasteDataList>> getWasteDataList({
    required bool isLoading,
    bool? isExport,
    required int? facility_id,
    String? start_date,
    required String end_date,
  }) async {
    return wasteDataUsecase.getWasteDataList(
      isLoading: isLoading,
      facility_id: facility_id,
      isExport: isExport,
      start_date: start_date,
      end_date: end_date,
    );
  }

  Future<Map<String, dynamic>?> createWasteData({
    createWasteData,
    required bool isLoading,
  }) async {
    return wasteDataUsecase.createWasteData(
      createWasteData: createWasteData,
      isLoading: isLoading,
    );
  }
  Future<Map<String, dynamic>?> updateWasteData({
    createWasteData,
    required bool isLoading,
  }) async {
    return wasteDataUsecase.updateWasteData(
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
  Future<Map<String, dynamic>?> updateWasteDataDisposed({
    createWasteData,
    required bool isLoading,
  }) async {
    return wasteDataUsecase.updateWasteDataDisposed(
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
