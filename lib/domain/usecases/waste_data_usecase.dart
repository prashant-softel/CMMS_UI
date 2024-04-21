import 'package:cmms/domain/models/facility_model.dart';
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
  Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await repository.getFacilityList(isLoading);
}
