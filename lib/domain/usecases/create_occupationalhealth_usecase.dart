import 'package:cmms/domain/models/get_occupational_list_model.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:cmms/domain/repositories/repository.dart';

class CreateOccupationalhealthUsecase {
  CreateOccupationalhealthUsecase(this.repository);
  Repository repository;

  Future<Map<String, dynamic>> createoccupational({
    createoccupational,
    bool? isLoading,
  }) async =>
      await repository.createoccupational(
        createoccupational,
        isLoading,
      );

  Future<Map<String, dynamic>> updateHealthData({
    updateHealthData,
    bool? isLoading,
  }) async =>
      await repository.updateHealthData(
        updateHealthData,
        isLoading,
      );


        Future<List<GetOccupationalList?>?> getHealthDatalist(isLoading) async =>
      await repository.getHealthDatalist(isLoading: isLoading);

        void saveValue({String? healthId}) async =>
      repository.saveValue(LocalKeys.healthId, healthId);

        Future<String?> getValue() async =>
      await repository.getStringValue(LocalKeys.healthId);

        void clearValue() async => repository.clearData(LocalKeys.healthId);
}
