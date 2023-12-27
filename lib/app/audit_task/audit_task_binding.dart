import 'package:cmms/app/audit_task/audit_task_controller.dart';
import 'package:cmms/app/audit_task/audit_task_presenter.dart';
import 'package:cmms/domain/usecases/audit_task_usecase.dart';
import 'package:get/get.dart';

import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';

class AuditTaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuditTaskController>(
      () => AuditTaskController(
        AuditTaskPresenter(
          AuditTaskUsecase(
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
