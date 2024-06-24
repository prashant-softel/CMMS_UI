import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/home_presenter.dart';
import 'package:cmms/app/veg_execution_screen/veg_execution_screen_controller.dart';
import 'package:cmms/app/veg_execution_screen/veg_execution_screen_presenter.dart';
import 'package:cmms/domain/usecases/home_usecase.dart';
import 'package:cmms/domain/usecases/veg_execution_screen_usecase.dart';
import 'package:get/get.dart';

class VegExecutionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VegExecutionController>(
      () => VegExecutionController(
        VegExecutionPresenter(
          VegExecutionUsecase(
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
