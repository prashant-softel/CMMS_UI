import 'package:cmms/app/app.dart';
import 'package:cmms/app/audit_list/audit_list_controller.dart';
import 'package:cmms/app/audit_list/audit_list_presenter.dart';
import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/usecases/audit_list_screen_usecase.dart';

import 'package:get/get.dart';

class AuditListScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => AuditListScreenController(
        Get.put(
          AuditListScreenPresenter(
            AuditListScreenUsecase(
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
