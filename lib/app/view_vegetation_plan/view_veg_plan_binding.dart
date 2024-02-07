import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/home_presenter.dart';
import 'package:cmms/app/view_vegetation_plan/view_veg_plan_controller.dart';
import 'package:cmms/app/view_vegetation_plan/view_veg_plan_presenter.dart';
import 'package:cmms/domain/usecases/home_usecase.dart';
import 'package:cmms/domain/usecases/view_veg_plan_usercase.dart';
import 'package:get/get.dart';

class ViewVegPlanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViewVegPlanController>(
      () => ViewVegPlanController(
        ViewVegPlanPresenter(
          ViewVegPlanUsecase(
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
