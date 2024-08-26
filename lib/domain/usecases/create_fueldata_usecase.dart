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

}
