import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/home_presenter.dart';
import 'package:cmms/domain/usecases/home_usecase.dart';
import 'package:get/get.dart';

import '../../domain/usecases/create_pm_plan_usecase.dart';
import 'create_pm_plan_controller.dart';
import 'create_pm_plan_presenter.dart';

class CreatePmPlanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => CreatePmPlanController(
        Get.put(
          CreatePmPlanPresenter(
            CreatePmPlanUsecase(
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
