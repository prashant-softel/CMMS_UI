import 'package:cmms/domain/models/water_data_month.dart';
import 'package:cmms/domain/usecases/view_water_data_usecase%20copy%202.dart';

class ViewWaterDataPresenter {
  ViewWaterDataPresenter(this.viewWaterDataUsecase);
  ViewWaterDataUsecase viewWaterDataUsecase;

   Future<List<WaterDataMonth?>?> getWaterDataMonthDetail({
    required int month,
    required int year, 
    required int facilityId,
    bool? isLoading,
  }) async {
    return viewWaterDataUsecase.getWaterDataMonthDetail(
      month: month,
      year: year,
      facilityId: facilityId,
      isLoading: isLoading ?? false,
    );
  }

          
  void saveMonthValue({String? monthId}) async {
    return viewWaterDataUsecase.saveMonthValue(monthId: monthId);
  }
  void saveYearValue({String? year}) async {
    return viewWaterDataUsecase.saveYearValue(year: year);
  }

  Future<String?> getMonthValue() async => await viewWaterDataUsecase.getMonthValue();
  Future<String?> getYearValue() async => await viewWaterDataUsecase.getYearValue();
  void clearYearValue() async => viewWaterDataUsecase.clearYearValue();
  void clearMonthValue() async => viewWaterDataUsecase.clearMonthValue();
}
