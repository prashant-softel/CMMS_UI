import 'package:cmms/app/app.dart';
import 'package:cmms/app/module_cleaning_list_plan/module_cleaning_list_plan_controller.dart';
import 'package:cmms/app/module_cleaning_list_plan/module_cleaning_list_plan_presenter.dart';
import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/usecases/module_cleaning_list_plan_usecase.dart';

import 'package:get/get.dart';

class ModuleCleaningListPlanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ModuleCleaningListPlanController(
        Get.put(
          ModuleCleaningListPlanPresenter(
            ModuleCleaningListPlanUsecase(
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
