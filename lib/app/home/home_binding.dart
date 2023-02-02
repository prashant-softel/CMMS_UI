import 'package:cmms/app/app.dart';
import 'package:cmms/domain/domain.dart';
import 'package:get/get.dart';

/// A list of bindings which will be used in the route of [HomeScreen].
class HomeBinding extends Bindings {
  @override
  void dependencies() {
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
