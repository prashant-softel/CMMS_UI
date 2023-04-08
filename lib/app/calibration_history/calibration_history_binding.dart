import 'package:get/get.dart';

import '../../domain/usecases/calibration_history_usecase.dart';
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
  }
}
