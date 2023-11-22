import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/home_presenter.dart';
import 'package:cmms/app/view_mis_plan/view_mis_plan_controller.dart';
import 'package:cmms/app/view_mis_plan/view_mis_plan_presenter.dart';
import 'package:cmms/domain/usecases/home_usecase.dart';
import 'package:cmms/domain/usecases/view_mis_plan_usecase.dart';
import 'package:get/get.dart';

class ViewMisPlanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ViewMisPlanController(
        Get.put(
          ViewMisPlanPresenter(
            ViewMisPlanUsecase(
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
