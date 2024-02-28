import 'package:cmms/app/edit_vegetation_plan/edit_vegetation_plan_controller.dart';
import 'package:cmms/app/edit_vegetation_plan/edit_vegetation_plan_presenter.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/home_presenter.dart';
import 'package:cmms/domain/usecases/home_usecase.dart';
import 'package:cmms/domain/usecases/vegetation_list_usecase.dart';
import 'package:get/get.dart';

class EditVegetationPlanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditVegetationPlanController>(
      () => EditVegetationPlanController(
        EditVegetationPresenter(
          VegetationlistUsecase(
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
