import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/usecases/waste_data_usecase.dart';

class WasteDataPresenter {
  WasteDataPresenter(this.wasteDataUsecase);
  WasteDataUsecase wasteDataUsecase;

  ///

  Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await wasteDataUsecase.getFacilityList(isLoading: isLoading);
}
