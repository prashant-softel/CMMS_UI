import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/home_presenter.dart';
import 'package:cmms/domain/usecases/home_usecase.dart';
import 'package:get/get.dart';

import '../../domain/usecases/approve_return_mrs_usecase.dart';
import 'approve_return_mrs_controller.dart';
import 'approve_return_mrs_presenter.dart';

class ApproveReturnMrsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ApproveReturnMrsController(
        Get.put(
          ApproveReturnMrsPresenter(
            ApproveReturnMrsUsecase(
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
