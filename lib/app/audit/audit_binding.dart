import 'package:cmms/app/audit/audit_controller.dart';
import 'package:cmms/app/audit/audit_presenter.dart';
import 'package:cmms/domain/usecases/audit_usecase.dart';
import 'package:get/get.dart';

import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';

class AuditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => AuditController(
        Get.put(
          AuditPresenter(
            AuditUsecase(
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
