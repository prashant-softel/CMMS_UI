import 'package:cmms/app/app.dart';
import 'package:cmms/domain/domain.dart';
import 'package:get/get.dart';

/// A list of bindings which will be used in the route of [SplashScreen].
class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => SplashController(
        Get.put(
          SplashPresenter(
            SplasUsecase(
              Get.find(),
            ),
          ),
        ),
      ),
    );
  }
}
