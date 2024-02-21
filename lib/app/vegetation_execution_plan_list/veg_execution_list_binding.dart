import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/home_presenter.dart';
import 'package:cmms/app/vegetation_execution_plan_list/veg_execution_list_controller.dart';
import 'package:cmms/app/vegetation_execution_plan_list/veg_execution_list_presenter.dart';
import 'package:cmms/domain/usecases/home_usecase.dart';
import 'package:cmms/domain/usecases/veg_execution_list_usecase.dart';
import 'package:get/get.dart';

class VegExecutionListBinding extends Bindings{
  void dependencies() {
    Get.lazyPut(
      () => VegExecutionListController(
        Get.put(
          VegExecutionListPresenter(
            VegExecutionListUsecase(
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