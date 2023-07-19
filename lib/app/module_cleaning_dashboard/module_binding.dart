import 'package:cmms/app/module_cleaning_dashboard/module_controller.dart';
import 'package:cmms/app/module_cleaning_dashboard/module_presenter.dart';
import 'package:cmms/domain/usecases/module_cleaning_dashboard_usecase.dart';
import 'package:get/get.dart';

import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';

class ModuleCleaningDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ModuleCleaningDashboardController>(
      () => ModuleCleaningDashboardController(
        ModuleCleaningDashboardPresenter(
          ModuleCleaningDashboardUsecase(
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
