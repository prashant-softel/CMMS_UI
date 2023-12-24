import 'package:cmms/app/app.dart';
import 'package:cmms/app/checklist_mis_plan/checklist_mis_plan_controller.dart';
import 'package:cmms/app/checklist_mis_plan/checklist_mis_plan_presenter.dart';
import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/usecases/checklist_mis_plan_usecase.dart';

import 'package:get/get.dart';

class ChecklistMisPlanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ChecklistMisPlanController(
        Get.put(
          ChecklistMisPlanPresenter(
            ChecklistMisPlanUsecase(
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
