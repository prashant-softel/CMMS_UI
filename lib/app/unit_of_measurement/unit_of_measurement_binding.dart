import 'package:cmms/app/unit_Of_measurement/unit_of_measurement_controller.dart';
import 'package:cmms/app/unit_Of_measurement/unit_of_measurement_presenter.dart';
import 'package:get/get.dart';

import '../../domain/usecases/home_usecase.dart';
import '../../domain/usecases/unit_of_measurement_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';


class UnitOfMeasurementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => UnitOfMeasurementController(
        Get.put(
          UnitOfMeasurementPresenter(
            UnitOfMeasurementUsecase(
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
