import 'package:cmms/domain/models/get_plantation_list_model.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:cmms/domain/repositories/repository.dart';

class PlantationListUsecase {
  PlantationListUsecase(this.repository);
  Repository repository;


  ///getFuelConsumption

 Future<List<GetPlantationList>> getplantationdata({
    required bool isLoading,
    bool? isExport,

  }) async {
    return repository.getplantationdata(
      isLoading: isLoading,
      isExport: isExport,
    
    );
  }
  void clearValue() async => repository.clearData(LocalKeys.oHid);
  //deletePlantation

Future<void> deletePlantation({
    int? Id,
    bool? isLoading,
  }) async =>
      await repository.deletePlantation(
        Id: Id,
        isLoading: isLoading,
      );
}
