import 'package:cmms/domain/models/get_fueldata_list_model.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:cmms/domain/repositories/repository.dart';

class FuelDataListUsecase {
  FuelDataListUsecase(this.repository);
  Repository repository;


  ///getFuelConsumption

 Future<List<GetFuelDataList>> getFuelConsumption({
    required bool isLoading,
    bool? isExport,

  }) async {
    return repository.getFuelConsumption(
      isLoading: isLoading,
      isExport: isExport,
    
    );
  }
  void clearValue() async => repository.clearData(LocalKeys.oHid);

}
