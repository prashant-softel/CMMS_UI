import 'package:cmms/domain/models/water_data_month.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:cmms/domain/repositories/repository.dart';

class ViewWaterDataUsecase {
  Repository repository;

  ViewWaterDataUsecase(this.repository);

   Future<List<WaterDataMonth?>?> getWaterDataMonthDetail({
    required int month,
    required int year,
    required int facilityId,
    bool? isLoading,
  }) async =>
      await repository.getWaterDataMonthDetail(
        month: month,
        year: year,
        facilityId: facilityId,
        isLoading: isLoading ?? false,
      );

  void saveYearValue({String? year}) async =>
      repository.saveValue(LocalKeys.year, year);
  void saveMonthValue({String? monthId}) async =>
      repository.saveValue(LocalKeys.monthId, monthId);
  Future<String?> getYearValue() async =>
      await repository.getStringValue(LocalKeys.year);
  Future<String?> getMonthValue() async =>
      await repository.getStringValue(LocalKeys.monthId);
  void clearMonthValue() async => repository.clearData(LocalKeys.monthId);
  void clearYearValue() async => repository.clearData(LocalKeys.year);
}
