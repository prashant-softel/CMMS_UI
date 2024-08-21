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
}
