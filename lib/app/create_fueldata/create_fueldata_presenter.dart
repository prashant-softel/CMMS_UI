// ignore: unused_import
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
  
}
