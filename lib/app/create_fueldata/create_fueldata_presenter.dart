// ignore: unused_import
import 'package:cmms/domain/models/get_fueldata_list_model.dart';
import 'package:cmms/domain/usecases/create_fueldata_usecase.dart';

class CreateFuelDataPresenter {
  CreateFuelDataPresenter(this.createfueldataUsecase);
  CreateFuelDataUsecase createfueldataUsecase;


  /// createfuledata
  Future<Map<String, dynamic>?> createfuledata(
      {createfuledata, required bool isLoading}) async {
    return createfueldataUsecase.createfuledata(
      createfuledata: createfuledata,
      isLoading: isLoading,
    );
  }
  //update updateFuelConsumption

  Future<Map<String, dynamic>?> updateFuelConsumption({
    updateFueldata,
    required bool isLoading,
  }) async {
    return createfueldataUsecase.updateFuelConsumption(
      updateFueldata: updateFueldata,
      isLoading: isLoading,
    );
  
  }

  void saveValue({String? fuelId}) async {
    return createfueldataUsecase.saveValue(fuelId: fuelId);
  }

  Future<String?> getValue() async =>
      await createfueldataUsecase.getValue();

  void clearValue() async => createfueldataUsecase.clearValue();
}
