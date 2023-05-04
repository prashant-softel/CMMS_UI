import 'package:cmms/app/pm_task_view/pm_task_view_controller.dart';
import 'package:cmms/app/pm_task_view/pm_task_view_presenter.dart';
import 'package:get/get.dart';
import '../../domain/usecases/home_usecase.dart';
import '../../domain/usecases/pm_task_view_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';

class PreventiveMaintenanceTaskViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PreventiveMaintenanceTaskViewController>(
      () => PreventiveMaintenanceTaskViewController(
        PreventiveMaintenanceTaskViewPresenter(
          PreventiveMaintenanceTaskViewUsecase(
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
