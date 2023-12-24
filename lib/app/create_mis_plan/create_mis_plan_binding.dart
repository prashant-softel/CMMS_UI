import 'package:cmms/app/app.dart';
import 'package:cmms/app/create_mis_plan/create_mis_plan_controller.dart';
import 'package:cmms/app/create_mis_plan/create_mis_plan_presenter.dart';
import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/usecases/create_mis_plan_usecase.dart';

import 'package:get/get.dart';

class CreateMisPlanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => CreateMisPlanController(
        Get.put(
          CreateMisPlanPresenter(
            CreateMisPlanUsecase(
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
