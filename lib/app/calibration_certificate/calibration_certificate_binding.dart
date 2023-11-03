import 'package:get/get.dart';
import '../../domain/usecases/calibration_certificate_usecase.dart';

import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';
import 'calibration_certificate_controller.dart';
import 'calibration_certificate_presenter.dart';

class CalibrationCertificateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => CalibrationCertificateController(
        Get.put(
          CalibrationCertificatePresenter(
            CalibrationCertificateUsecase(
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
