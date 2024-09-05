// ignore: unused_import
import 'package:cmms/domain/models/get_plantation_list_model.dart';
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
    // update Api updatePlantationDetails


  Future<Map<String, dynamic>?> updatePlantationDetails({
    updatePlantation,
    required bool isLoading,
  }) async {
    return createplantationdataUsecase.updatePlantationDetails(
      updatePlantation: updatePlantation,
      isLoading: isLoading,
    );
  }
  void saveValue({String? plantationId}) async {
    return createplantationdataUsecase.saveValue(plantationId: plantationId);
  }

  Future<String?> getValue() async =>
      await createplantationdataUsecase.getValue();

  void clearValue() async => createplantationdataUsecase.clearValue();
}
