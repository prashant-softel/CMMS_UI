import 'package:cmms/app/preventive_maintenance_execution/preventive_maintenance_execution_controller.dart';
import 'package:cmms/app/preventive_maintenance_execution/preventive_maintenance_execution_presenter.dart';
import 'package:get/get.dart';

import '../../domain/usecases/home_usecase.dart';
import '../../domain/usecases/preventive_maintenance_execution_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';

class PreventiveMaintenanceExecutionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PreventiveMaintenanceExecutionController>(
      () => PreventiveMaintenanceExecutionController(
        PreventiveMaintenanceExecutionPresenter(
          PreventiveMaintenanceExecutionUsecase(
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
