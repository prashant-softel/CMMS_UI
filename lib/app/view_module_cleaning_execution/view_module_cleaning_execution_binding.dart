import 'package:cmms/app/app.dart';
import 'package:cmms/domain/usecases/view_module_cleaning_execution_usecase.dart';
import 'package:get/get.dart';
import '../../domain/usecases/home_usecase.dart';
import 'view_module_cleaning_execution_controller.dart';
import 'view_module_cleaning_execution_presenter.dart';

/// A list of bindings which will be used in the route of [HomeScreen].
class ViewModuleCleaningExecutionBinding extends Bindings {
  @override
  void dependencies() {
    // Get.find<IncidentReportListController>();
    Get.lazyPut(
      () => viewModuleCleaningExecutionController(
        Get.put(
          ViewModuleCleaningExecutionPresenter(
           ViewModuleCleaningExecutionUsecase(
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
