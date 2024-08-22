// ignore: unused_import
import 'package:cmms/domain/usecases/create_regulataryvisits_usecase.dart';

class CreateRegulataryVisitsPresenter {
  CreateRegulataryVisitsPresenter(this.createregulataryvisitsUsecase);
  CreateRegulataryVisitsUsecase createregulataryvisitsUsecase;

  ///

  Future<Map<String, dynamic>?> createvisitsandnotices(
      {createvisitsandnotices, required bool isLoading}) async {
    return createregulataryvisitsUsecase.createvisitsandnotices(
      createvisitsandnotices: createvisitsandnotices,
      isLoading: isLoading,
    );
  }
}
