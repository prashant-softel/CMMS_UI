import 'package:cmms/domain/usecases/module_cleaning_dashboard_usecase.dart';

class ModuleCleaningDashboardPresenter {
  ModuleCleaningDashboardPresenter(this.moduleCleaningDashboardUsecase);
  ModuleCleaningDashboardUsecase moduleCleaningDashboardUsecase;
  void clearValueMcId() async =>
      moduleCleaningDashboardUsecase.clearValueMcId();
  void clearValuePlanId() async =>
      moduleCleaningDashboardUsecase.clearValuePlanId();
}
