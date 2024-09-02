

import 'package:cmms/domain/models/get_fueldata_list_model.dart';
import 'package:cmms/domain/usecases/fueldata_list_usecase.dart';

class FuelDataListPresenter {
  FuelDataListPresenter(this.fueldatalistUsecase);

  final FuelDataListUsecase fueldatalistUsecase;

  Future<List<GetFuelDataList>> getFuelConsumption({
    required bool isLoading,
    bool? isExport,
  }) async {
    return fueldatalistUsecase.getFuelConsumption(
      isLoading: isLoading,
      isExport: isExport,
    );
  }
   void clearValue() async => fueldatalistUsecase.clearValue();
   //deleteFuel
    deleteFuel({
    int? Id,
    bool? isLoading,
  }) async =>
      await fueldatalistUsecase.deleteFuel(
        Id: Id,
        isLoading: isLoading,
      );
}
