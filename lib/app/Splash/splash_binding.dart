import 'package:cmms/domain/domain.dart';
import 'package:get/get.dart';

import 'splash_controller.dart';
import 'splash_presenter.dart';

/// A list of bindings which will be used in the route of [SplashScreen].
class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => SplashController(
        Get.put(
          SplashPresenter(
            SplashUsecase(
              Get.find(),
            ),
          ),
        ),
      ),
    );
  }
}
