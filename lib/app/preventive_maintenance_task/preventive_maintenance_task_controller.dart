import 'package:cmms/app/preventive_maintenance_task/preventive_maintenance_task_presenter.dart';
import 'package:get/get.dart';

class PreventiveMaintenanceTaskController extends GetxController {
  ///
  PreventiveMaintenanceTaskController(
    this.preventiveMaintenanceTaskPresenter,
  );
  PreventiveMaintenanceTaskPresenter preventiveMaintenanceTaskPresenter;

  @override
  void onInit() async {
    super.onInit();
  }
}
