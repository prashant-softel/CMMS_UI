import 'package:get/get.dart';

import '../../domain/usecases/calibration_list_usecase.dart';
import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';
import 'calibration_list_controller.dart';
import 'calibration_list_presenter.dart';

class CalibrationListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CalibrationListController>(
      () => CalibrationListController(
        CalibrationListPresenter(
          CalibrationListUsecase(
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
