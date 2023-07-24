import 'package:cmms/app/role_notification/role_notification_controller.dart';
import 'package:cmms/app/role_notification/role_notification_presenter.dart';
import 'package:get/get.dart';

import '../../domain/usecases/home_usecase.dart';
import '../../domain/usecases/role_notification_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';

class RoleNotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => RoleNotificationController(
        Get.put(
          RoleNotificationPresenter(
            RoleNotificationUsecase(
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
