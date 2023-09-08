import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/home_presenter.dart';
import 'package:cmms/domain/usecases/home_usecase.dart';
import 'package:cmms/domain/usecases/view_pm_plan_usecase.dart';
import 'package:get/get.dart';

import '../../domain/usecases/create_pm_plan_usecase.dart';
import 'view_pm_plan_controller.dart';
import 'view_pm_plan_presenter.dart';

class ViewPmPlanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ViewPmPlanController(
        Get.put(
          ViewPmPlanPresenter(
            ViewPmPlanUsecase(
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
