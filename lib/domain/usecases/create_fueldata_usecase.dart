import 'package:cmms/domain/models/get_fueldata_list_model.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:cmms/domain/repositories/repository.dart';

class CreateFuelDataUsecase {
  CreateFuelDataUsecase(this.repository);
  Repository repository;

  
// CreateKaizensModel
Future<Map<String, dynamic>> createfuledata({
    createfuledata,
    bool? isLoading,
  }) async =>
      await repository.createfuledata(
        createfuledata,
        isLoading,
      );
// update Api getVisitAndNoticelist

  Future<Map<String, dynamic>> updateFuelConsumption({
    updateFueldata,
    bool? isLoading,
  }) async =>
      await repository.updateFuelConsumption(
        updateFueldata,
        isLoading,
      );
  void saveValue({String? fuelId}) async =>
      repository.saveValue(LocalKeys.fuelId, fuelId);
  Future<String?> getValue() async =>
      await repository.getStringValue(LocalKeys.fuelId);

  void clearValue() async => repository.clearData(LocalKeys.fuelId);
}
