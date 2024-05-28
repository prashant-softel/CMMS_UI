import 'package:cmms/domain/models/waste_data_month_model.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:cmms/domain/repositories/repository.dart';

class ViewWasteDataUsecase {
  Repository repository;

  ViewWasteDataUsecase(this.repository);

  Future<List<WasteDataMonthModel?>?> getWasteDataMonthDetail({
    required int month,
    required int year,
    required int facilityId,
    required int hazardous,
    bool? isLoading,
  }) async =>
      await repository.getWasteDataMonthDetail(
        month: month,
        year: year,
        facilityId: facilityId,
        hazardous: hazardous,
        isLoading: isLoading ?? false,
      );

  void saveYearValue({String? year}) async =>
      repository.saveValue(LocalKeys.year, year);
  Future<String?> getYearValue() async =>
      await repository.getStringValue(LocalKeys.year);
  void clearYearValue() async => repository.clearData(LocalKeys.year);

  void saveMonthValue({String? monthId}) async =>
      repository.saveValue(LocalKeys.monthId, monthId);
  Future<String?> getMonthValue() async =>
      await repository.getStringValue(LocalKeys.monthId);
  void clearMonthValue() async => repository.clearData(LocalKeys.monthId);

  void saveHazardousValue({String? hazardous}) async =>
      repository.saveValue(LocalKeys.hazardous, hazardous);
  Future<String?> getHazardousValue() async =>
      await repository.getStringValue(LocalKeys.hazardous);
  void clearHazardousValue() async => repository.clearData(LocalKeys.hazardous);
}
