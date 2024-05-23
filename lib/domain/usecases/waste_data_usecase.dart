import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/type_of_waste_model.dart';
import 'package:cmms/domain/models/waste_data_list_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

class WasteDataUsecase {
  WasteDataUsecase(this.repository);
  Repository repository;

  Future<List<WasteDataList>> getWasteDataList({
    required bool isLoading,
    required int? facility_id,
    String? start_date,
    bool? isExport,
    required String end_date,
  }) async {
    return repository.getWasteDataList(
        isLoading: isLoading,
        facility_id: facility_id,
        start_date: start_date,
        end_date: end_date,
        isExport: isExport);
  }

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
