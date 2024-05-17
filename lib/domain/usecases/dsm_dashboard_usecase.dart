import 'package:cmms/domain/domain.dart';

class DsmDashboardUsecase {
  final Repository _repository;

  DsmDashboardUsecase(this._repository);

  void clearValue() async => _repository.clearData(
        LocalKeys.importType,
      );
}
