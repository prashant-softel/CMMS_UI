import 'package:cmms/app/create_audit/create_audit_controller.dart';
import 'package:cmms/app/create_audit/create_audit_presenter.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/home_presenter.dart';
import 'package:cmms/domain/usecases/create_audit_usecase.dart';
import 'package:cmms/domain/usecases/home_usecase.dart';
import 'package:get/get.dart';

class CreateAuditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => CreateAuditController(
        Get.put(
          CreateAuditPresenter(
            CreateAuditUsecase(
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
