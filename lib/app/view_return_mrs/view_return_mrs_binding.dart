import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/home_presenter.dart';
import 'package:cmms/app/view_return_mrs/view_return_mrs_controller.dart';
import 'package:cmms/app/view_return_mrs/view_return_mrs_presenter.dart';
import 'package:cmms/domain/usecases/home_usecase.dart';
import 'package:get/get.dart';

import '../../domain/usecases/view_return_mrs_usecase.dart';

class MrsReturnViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => MrsReturnViewController(
        Get.put(
          MrsReturnViewPresenter(
            MrsReturnViewUsecase(
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
