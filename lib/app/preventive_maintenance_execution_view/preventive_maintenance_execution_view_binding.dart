import 'package:cmms/app/preventive_maintenance_execution_view/preventive_maintenance_execution_view_controller.dart';
import 'package:cmms/app/preventive_maintenance_execution_view/preventive_maintenance_execution_view_presenter.dart';
import 'package:get/get.dart';
import '../../domain/usecases/home_usecase.dart';
import '../../domain/usecases/preventive_maintenance_execution_view_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';

class PreventiveMaintenanceExecutionViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PreventiveMaintenanceExecutionViewController>(
      () => PreventiveMaintenanceExecutionViewController(
        PreventiveMaintenanceExecutionViewPresenter(
          PreventiveMaintenanceExecutionViewUsecase(
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
