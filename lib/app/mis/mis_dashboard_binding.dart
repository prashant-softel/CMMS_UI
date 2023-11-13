import 'package:cmms/app/app.dart';
import 'package:cmms/app/mis/mis_dashboard_controller.dart';
import 'package:cmms/app/mis/mis_dashboard_presenter.dart';
import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/usecases/mis_dashboard_usecase.dart';
import 'package:get/get.dart';
import '../../domain/usecases/home_usecase.dart';

/// A list of bindings which will be used in the route of [HomeScreen].
class MisDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => MisDashboardController(
        Get.put(
          MisDashboardPresenter(
            MisDashboardUsecase(
              Get.find(),
            ),
          ),
        ),
      ),
    );
    Get.lazyPut<HomeController>(
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
