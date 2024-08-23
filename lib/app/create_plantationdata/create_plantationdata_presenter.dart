// ignore: unused_import
import 'package:cmms/domain/usecases/create_plantationdata_usecase.dart';

class CreatePlantationDataPresenter {
  CreatePlantationDataPresenter(this.createplantationdataUsecase);
  CreatePlantationDataUsecase createplantationdataUsecase;

  ///createplantationdata
  Future<Map<String, dynamic>?> createplantationdata(
      {createplantationdata, required bool isLoading}) async {
    return createplantationdataUsecase.createplantationdata(
      createplantationdata: createplantationdata,
      isLoading: isLoading,
    );
  }
  
}
