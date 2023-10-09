import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/home_presenter.dart';
import 'package:cmms/app/view_mc_plan/view_mc_planning_controller.dart';
import 'package:cmms/app/view_mc_plan/view_mc_planning_presenter.dart';
import 'package:cmms/domain/usecases/home_usecase.dart';
import 'package:cmms/domain/usecases/view_mc_planing_usecase.dart';
import 'package:get/get.dart';

class ViewMcPlaningBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViewMcPlaningController>(
      () => ViewMcPlaningController(
        ViewMcPlaningPresenter(
          ViewMcPlaningUsecase(
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
