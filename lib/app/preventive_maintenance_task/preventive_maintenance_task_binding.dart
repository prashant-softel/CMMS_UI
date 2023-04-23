import 'package:cmms/app/preventive_maintenance_task/preventive_maintenance_task_controller.dart';
import 'package:cmms/app/preventive_maintenance_task/preventive_maintenance_task_presenter.dart';
import 'package:cmms/domain/usecases/pm_task_usecase.dart';
import 'package:get/get.dart';

import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';

class PreventiveMaintenanceTaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PreventiveMaintenanceTaskController>(
      () => PreventiveMaintenanceTaskController(
        PreventiveMaintenanceTaskPresenter(
          PreventiveMaintenanceTaskUsecase(
            Get.find(),
          ),
        ),
      ),
    );
    Get.lazyPut(
      () => HomeController(
        Get.put(
          HomePresenter(
            HomeUsecase(
              Get.find(),
            ),
          ),
        ),
      ),
    );
  }
}
