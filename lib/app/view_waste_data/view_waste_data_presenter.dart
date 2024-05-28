import 'package:cmms/domain/models/waste_data_month_model.dart';
import 'package:cmms/domain/usecases/view_waste_data_usecase.dart';

class ViewWasteDataPresenter {
  ViewWasteDataPresenter(this.viewWasteDataUsecase);
  ViewWasteDataUsecase viewWasteDataUsecase;

  Future<List<WasteDataMonthModel?>?> getWasteDataMonthDetail({
    required int month,
    required int year,
    required int facilityId,
    required int hazardous,
    bool? isLoading,
  }) async {
    return viewWasteDataUsecase.getWasteDataMonthDetail(
      month: month,
      year: year,
      facilityId: facilityId,
      hazardous: hazardous,
      isLoading: isLoading ?? false,
    );
  }

  void saveMonthValue({String? monthId}) async {
    return viewWasteDataUsecase.saveMonthValue(monthId: monthId);
  }

  Future<String?> getMonthValue() async =>
      await viewWasteDataUsecase.getMonthValue();
  void clearMonthValue() async => viewWasteDataUsecase.clearMonthValue();

  void saveYearValue({String? year}) async {
    return viewWasteDataUsecase.saveYearValue(year: year);
  }

  Future<String?> getYearValue() async =>
      await viewWasteDataUsecase.getYearValue();
  void clearYearValue() async => viewWasteDataUsecase.clearYearValue();

  void saveHazardousValue({String? hazardous}) async {
    return viewWasteDataUsecase.saveHazardousValue(hazardous: hazardous);
  }

  Future<String?> getHazardousValue() async =>
      await viewWasteDataUsecase.getHazardousValue();
  void clearHazardousValue() async =>
      viewWasteDataUsecase.clearHazardousValue();
}
