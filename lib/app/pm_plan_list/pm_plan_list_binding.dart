import 'package:cmms/app/pm_plan_list/pm_plan_list_controller.dart';
import 'package:cmms/app/pm_plan_list/pm_plan_list_presenter.dart';
import 'package:get/get.dart';

import '../../domain/usecases/home_usecase.dart';
import '../../domain/usecases/pm_plan_list_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';

class PmPlanListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PmPlanListController>(
      () => PmPlanListController(
        PmPlanListPresenter(
          PmPlanListUsecase(
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
