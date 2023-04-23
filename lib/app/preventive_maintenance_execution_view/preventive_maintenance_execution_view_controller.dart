import 'package:cmms/app/preventive_maintenance_execution_view/preventive_maintenance_execution_view_presenter.dart';
import 'package:get/get.dart';

class PreventiveMaintenanceExecutionViewController extends GetxController {
  ///
  PreventiveMaintenanceExecutionViewController(
    this.preventiveMaintenanceExecutionViewPresenter,
  );
  PreventiveMaintenanceExecutionViewPresenter
      preventiveMaintenanceExecutionViewPresenter;

  @override
  void onInit() async {
    super.onInit();
  }
}
