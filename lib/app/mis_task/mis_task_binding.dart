import 'package:cmms/app/app.dart';
import 'package:cmms/app/mis_task/mis_task_controller.dart';
import 'package:cmms/app/mis_task/mis_task_presenter.dart';
import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/usecases/mis_task_usecase.dart';

import 'package:get/get.dart';

class MisTaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => MisTaskController(
        Get.put(
          MisTaskPresenter(
            MisTaskUsecase(
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
