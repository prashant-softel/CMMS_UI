import 'package:cmms/app/calibration_detail/calibration_detail_controller.dart';
import 'package:cmms/domain/usecases/calibration_detail_usecase.dart';
import 'package:get/get.dart';
import '../home/home_controller.dart';
import 'caliobration_detail_presenter.dart';

class CalibrationDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.find<HomeController>();

    Get.lazyPut<CalibrationDetailController>(
      () => CalibrationDetailController(
        CalibrationDetailPresenter(
          CalibrationDetailUsecase(
            Get.find(),
          ),
        ),
      ),
    );
  }
}
