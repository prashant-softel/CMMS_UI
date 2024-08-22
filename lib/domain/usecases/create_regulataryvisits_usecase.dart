import 'package:cmms/domain/repositories/repository.dart';

class CreateRegulataryVisitsUsecase {
  CreateRegulataryVisitsUsecase(this.repository);
  Repository repository;

Future<Map<String, dynamic>> createvisitsandnotices({
    createvisitsandnotices,
    bool? isLoading,
  }) async =>
      await repository.createvisitsandnotices(
        createvisitsandnotices,
        isLoading,
      );

  
}
