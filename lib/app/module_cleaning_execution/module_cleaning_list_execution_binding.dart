import 'package:cmms/app/app.dart';
import 'package:cmms/app/module_cleaning_execution/module_cleaning_list_execution_controller.dart';
import 'package:cmms/app/module_cleaning_execution/module_cleaning_list_execution_presenter.dart';

import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/usecases/module_cleaning_list_execution_usecase.dart';

import 'package:get/get.dart';

class ModuleCleaningListExecutionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ModuleCleaningListExecutionController(
        Get.put(
          ModuleCleaningListExecutionPresenter(
            ModuleCleaningListExecutionUsecase(
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
