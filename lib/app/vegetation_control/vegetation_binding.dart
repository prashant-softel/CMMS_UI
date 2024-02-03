import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/home_presenter.dart';
import 'package:cmms/app/vegetation_control/vegetation_controller.dart';
import 'package:cmms/app/vegetation_control/vegetation_presenter.dart';
import 'package:cmms/domain/usecases/home_usecase.dart';
import 'package:cmms/domain/usecases/vegetation_control_dashboard.dart';
import 'package:get/get.dart';

class VegetationDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VegetationDashboardController>(
      () => VegetationDashboardController(
        VegetationDashboardPresenter(
          VegetationControlDashboardUsecase(
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
