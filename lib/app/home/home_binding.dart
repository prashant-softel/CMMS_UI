import 'package:cmms/app/app.dart';
import 'package:cmms/app/home/dashboard_controller.dart';
import 'package:get/get.dart';

import '../../domain/usecases/home_usecase.dart';

/// A list of bindings which will be used in the route of [HomeScreen].
class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
      () => DashboardController(
        HomePresenter(
          HomeUsecase(
            Get.find(),
          ),
        ),
      ),
    );
    // Get.find<HomeController>();
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
      fenix: true,
    );
  }
}
