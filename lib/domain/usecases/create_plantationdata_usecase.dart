import 'package:cmms/domain/models/get_plantation_list_model.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:cmms/domain/repositories/repository.dart';

class CreatePlantationDataUsecase {
  CreatePlantationDataUsecase(this.repository);
  Repository repository;
//createplantationdata
Future<Map<String, dynamic>> createplantationdata({
    createplantationdata,
    bool? isLoading,
  }) async =>
      await repository.createplantationdata(
        createplantationdata,
        isLoading,
      );

  // update Api updatePlantationDetails

  Future<Map<String, dynamic>> updatePlantationDetails({
    updatePlantation,
    bool? isLoading,
  }) async =>
      await repository.updatePlantationDetails(
        updatePlantation,
        isLoading,
      );
  Future<List<GetPlantationList?>?> getplantationdata(
          isLoading) async =>
      await repository.getplantationdata(isLoading: isLoading);
  void saveValue({String? plantationId}) async =>
      repository.saveValue(LocalKeys.plantationId, plantationId);
  Future<String?> getValue() async =>
      await repository.getStringValue(LocalKeys.plantationId);

  void clearValue() async => repository.clearData(LocalKeys.plantationId);
}
  

 