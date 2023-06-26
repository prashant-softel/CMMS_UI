import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/home_presenter.dart';
import 'package:cmms/app/mrs_view/mrs_view_controller.dart';
import 'package:cmms/app/mrs_view/mrs_view_presenter.dart';
import 'package:cmms/domain/usecases/home_usecase.dart';
import 'package:cmms/domain/usecases/mrs_view_usercase.dart';
import 'package:get/get.dart';

class MrsViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => MrsViewController(
        Get.put(
          MrsViewPresenter(
            MrsViewUsecase(
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
