import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/home_presenter.dart';
import 'package:cmms/app/view_audit_task/view_audit_task_controller.dart';
import 'package:cmms/app/view_audit_task/view_audit_task_presenter.dart';
import 'package:cmms/domain/usecases/home_usecase.dart';
import 'package:get/get.dart';

import '../../domain/usecases/view_audit_task_usecase.dart';

class ViewAuditTaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ViewAuditTaskController(
        Get.put(
          ViewAuditTaskPresenter(
            ViewAuditTaskUsecase(
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
