import 'package:get/get.dart';

import '../../domain/usecases/calibration_history_usecase.dart';
import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';
import 'calibration_history_controller.dart';
import 'calibration_history_presenter.dart';

class CalibrationHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CalibrationHistoryController>(
      () => CalibrationHistoryController(
        CalibrationHistoryPresenter(
          CalibrationHistoryUsecase(
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
