import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/home_presenter.dart';
import 'package:cmms/app/module_cleaning_planning/module_cleaning_planning_controller.dart';
import 'package:cmms/app/module_cleaning_planning/module_cleaning_planning_presenter.dart';
import 'package:cmms/domain/usecases/home_usecase.dart';
import 'package:cmms/domain/usecases/module_cleaning_planning_usecase.dart';
import 'package:get/get.dart';

class ModuleCleaningPlanningBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ModuleCleaningPlanningController>(
      () => ModuleCleaningPlanningController(
        ModuleCleaningPlanningPresenter(
          ModuleCleaningPlanningUsecase(
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
