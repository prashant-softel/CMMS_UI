import 'package:cmms/app/add_module_cleaning_execution/add_module_cleaning_execution_controller.dart';
import 'package:cmms/app/add_module_cleaning_execution/add_module_cleaning_execution_presenter.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/domain/usecases/add_module_cleaning_execution_usecase.dart';
import 'package:get/get.dart';
import '../../domain/usecases/home_usecase.dart';

/// A list of bindings which will be used in the route of [HomeScreen].
class AddModuleCleaningExecutionBinding extends Bindings {
  @override
  void dependencies() {
    // Get.find<IncidentReportListController>();
    Get.lazyPut(
      () => AddModuleCleaningExecutionController(
        Get.put(
          AddModuleCleaningExecutionPresenter(
           AddModuleCleaningExecutionUsecase(
            Get.find()
           )
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
