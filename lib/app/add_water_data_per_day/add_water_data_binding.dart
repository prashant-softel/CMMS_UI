import 'package:cmms/app/add_water_data_per_day/add_water_data_controller.dart';
import 'package:cmms/app/add_water_data_per_day/add_water_data_presenter.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/usecases/add_water_data_usecase.dart';

import 'package:get/get.dart';

class AddWaterDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => AddWaterDataController(
        Get.put(
          AddWaterDataPresenter(
            AddWaterDataUsecase(
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
