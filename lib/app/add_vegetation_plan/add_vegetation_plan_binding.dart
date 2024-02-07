import 'package:cmms/app/add_vegetation_plan/add_vegetation_plan_controller.dart';
import 'package:cmms/app/add_vegetation_plan/add_vegetation_plan_presenter.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/home_presenter.dart';
import 'package:cmms/domain/usecases/home_usecase.dart';
import 'package:cmms/domain/usecases/vegetation_list_usecase.dart';
import 'package:get/get.dart';

class AddVegetationPlanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddVegetationPlanController>(
      () => AddVegetationPlanController(
        AddVegetationPresenter(
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