import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/home_presenter.dart';
import 'package:cmms/app/mrs_approve/mrs_approve_controller.dart';
import 'package:cmms/app/mrs_approve/mrs_approve_presenter.dart';
import 'package:cmms/domain/usecases/home_usecase.dart';
import 'package:cmms/domain/usecases/mrs_approve_usecase.dart';
import 'package:get/get.dart';

class MrsApproveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => MrsApproveController(
        Get.put(
          MrsApprovePresenter(
            MrsApproveUsecase(
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
