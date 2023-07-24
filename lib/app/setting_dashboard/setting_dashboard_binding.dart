import 'package:cmms/app/setting_dashboard/setting_dashboard_controller.dart';
import 'package:get/get.dart';

import '../../domain/usecases/home_usecase.dart';
import '../../domain/usecases/setting_dashboard_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';
import 'setting_dashboard_presenter.dart';

class SettingDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => SettingDashboardController(
        Get.put(
          SettingDashboardPresenter(
            SettingDashboardUsecase(
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
