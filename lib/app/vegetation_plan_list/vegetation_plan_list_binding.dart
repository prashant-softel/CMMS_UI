import 'package:cmms/app/app.dart';
import 'package:cmms/app/vegetation_plan_list/vegetation_plan_list_controller.dart';
import 'package:cmms/app/vegetation_plan_list/vegetation_plan_list_presenter.dart';
import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/usecases/vegetation_list_usecase.dart';
import 'package:get/get.dart';

class VegetationPlanListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => VegetationPlanListController(
        Get.put(
          VegetationPlanListPresenter(
            VegetationlistUsecase(
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
