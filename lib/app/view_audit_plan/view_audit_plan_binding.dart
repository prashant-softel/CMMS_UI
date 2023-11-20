import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/home_presenter.dart';
import 'package:cmms/app/view_audit_plan/view_audit_plan_controller.dart';
import 'package:cmms/app/view_audit_plan/view_audit_plan_presenter.dart';
import 'package:cmms/domain/usecases/home_usecase.dart';
import 'package:get/get.dart';

import '../../domain/usecases/view_audit_plan_usecase.dart';

class ViewAuditPlanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ViewAuditPlanController(
        Get.put(
          ViewAuditPlanPresenter(
            ViewAuditPlanUsecase(
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
