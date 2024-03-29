import 'package:cmms/app/app.dart';
import 'package:cmms/app/water_data/water_data_controller.dart';
import 'package:cmms/app/water_data/water_data_presenter.dart';
import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/usecases/water_data_usecase.dart';

import 'package:get/get.dart';

class WaterDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => WaterDataController(
        Get.put(
          WaterDataPresenter(
            WaterDataUsecase(
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
