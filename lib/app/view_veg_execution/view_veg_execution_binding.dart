import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/home_presenter.dart';
import 'package:cmms/app/view_veg_execution/view_veg_execution_controller.dart';
import 'package:cmms/app/view_veg_execution/view_veg_execution_presenter.dart';
import 'package:cmms/domain/usecases/home_usecase.dart';
import 'package:cmms/domain/usecases/view_veg_execution_usecase.dart';
import 'package:get/get.dart';

class ViewVegPlanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViewVegExecutionController>(
      () => ViewVegExecutionController(
        ViewVegExecutionPresenter(
          ViewVegExecutionUsecase(
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
