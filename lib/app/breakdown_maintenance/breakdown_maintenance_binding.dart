import 'package:cmms/app/app.dart';
import 'package:cmms/domain/domain.dart';
import 'package:get/get.dart';
import '../../domain/usecases/breakdown_usecase.dart';
import '../../domain/usecases/home_usecase.dart';
import 'breakdown_maintenance_controller.dart';
import 'breakdown_presenter.dart';

/// A list of bindings which will be used in the route of [HomeScreen].
class BreakdownMaintenanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => BreakdownMaintenanceController(
        Get.put(
          BreakdownMaintenancePresenter(
            BreakdownMaintenanceUsecase(
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
