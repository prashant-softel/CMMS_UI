import 'package:cmms/app/administration_dashboard_screen/admin_dash_controller.dart';
import 'package:cmms/app/administration_dashboard_screen/admin_dash_presenter.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/home_presenter.dart';
import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/usecases/admin_dash_usercase.dart';
import 'package:get/get.dart';
import '../../domain/usecases/home_usecase.dart';

/// A list of bindings which will be used in the route of [HomeScreen].
class AdminDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminDashboardController>(
      () => AdminDashboardController(
        Get.put(
          AdminDashboardPresenter(
            AdminDashboardUsecase(
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
