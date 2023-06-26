import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/home_presenter.dart';
import 'package:cmms/app/mrs_return/mrs_return_controller.dart';
import 'package:cmms/app/mrs_return/mrs_return_presenter.dart';
import 'package:cmms/domain/usecases/home_usecase.dart';
import 'package:cmms/domain/usecases/mrs_return_usecase.dart';
import 'package:get/get.dart';

class MrsReturnBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => MrsReturnController(
        Get.put(
          MrsReturnPresenter(
            MrsReturnUsecase(
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
