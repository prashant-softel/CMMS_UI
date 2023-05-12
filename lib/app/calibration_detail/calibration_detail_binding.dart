import 'package:cmms/app/calibration_detail/calibration_detail_controller.dart';
import 'package:cmms/domain/usecases/calibration_detail_usecase.dart';
import 'package:get/get.dart';
import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';
import 'caliobration_detail_presenter.dart';

class CalibrationDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CalibrationDetailController>(
      () => CalibrationDetailController(
        CalibrationDetailPresenter(
          CalibrationDetailUsecase(
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
