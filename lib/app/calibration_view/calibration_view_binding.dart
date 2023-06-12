import 'package:cmms/app/calibration_View/calibration_View_controller.dart';
import 'package:cmms/app/calibration_view/calibration_view_presenter.dart';
import 'package:cmms/domain/usecases/calibration_view_usecase.dart';
import 'package:get/get.dart';
import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';

class CalibrationViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CalibrationViewController>(
      () => CalibrationViewController(
        CalibrationViewPresenter(
          CalibrationViewUsecase(
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
