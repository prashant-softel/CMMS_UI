import 'package:cmms/domain/repositories/repository.dart';

class CreateKaizensdataUsecase {
  CreateKaizensdataUsecase(this.repository);
  Repository repository;

  

Future<Map<String, dynamic>> createkaizensdata({
    createkaizensdata,
    bool? isLoading,
  }) async =>
      await repository.createkaizensdata(
        createkaizensdata,
        isLoading,
      );

}
