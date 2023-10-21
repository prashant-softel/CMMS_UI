import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/home_presenter.dart';
import 'package:cmms/app/view_audit_detail/view_audit_detail_controller.dart';
import 'package:cmms/app/view_audit_detail/view_audit_detail_presenter.dart';
import 'package:cmms/domain/usecases/home_usecase.dart';
import 'package:cmms/domain/usecases/view_audit_detail_usecase.dart';
import 'package:get/get.dart';

class ViewAuditDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ViewAuditDetailController(
        Get.put(
          ViewAuditDetailPresenter(
            ViewAuditDetailUsecase(
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
