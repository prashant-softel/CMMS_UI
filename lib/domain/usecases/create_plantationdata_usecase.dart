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
  
}
 