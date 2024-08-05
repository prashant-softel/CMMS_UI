import 'package:cmms/domain/domain.dart';

class ModuleCleaningDashboardUsecase {
  final Repository _repository;

  ModuleCleaningDashboardUsecase(this._repository);
  void clearValueMcId() async => _repository.clearData(LocalKeys.mcid);
  void clearValuePlanId() async => _repository.clearData(LocalKeys.planId);
}
