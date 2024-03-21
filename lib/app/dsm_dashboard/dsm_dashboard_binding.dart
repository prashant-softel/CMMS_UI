import 'package:cmms/app/app.dart';
import 'package:cmms/app/dsm_dashboard/dsm_dashboard_controller.dart';
import 'package:cmms/app/dsm_dashboard/dsm_dashboard_presenter.dart';
import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/usecases/dsm_dashboard_usecase.dart';
import 'package:get/get.dart';

/// A list of bindings which will be used in the route of [HomeScreen].
class DsmDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => DsmDashboardController(
        Get.put(
          DsmDashboardPresenter(
            DsmDashboardUsecase(
              Get.find(),
            ),
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
