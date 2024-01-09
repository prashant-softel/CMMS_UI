import 'package:cmms/app/audit_task_view/audit_task_view_controller.dart';
import 'package:cmms/app/audit_task_view/audit_task_view_presenter.dart';
import 'package:cmms/domain/usecases/audit_task_view_usecase.dart';
import 'package:get/get.dart';
import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';

class AuditTaskViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuditTaskViewController>(
      () => AuditTaskViewController(
        AuditTaskViewPresenter(
          AuditTaskViewUsecase(
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
