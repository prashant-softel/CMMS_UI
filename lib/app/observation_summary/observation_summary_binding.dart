import 'package:cmms/app/app.dart';
import 'package:cmms/app/observation_summary/observation_summary_controller.dart';
import 'package:cmms/app/observation_summary/observation_summary_presenter.dart';
import 'package:cmms/app/water_data_list/water_data_list_controller.dart';
import 'package:cmms/app/water_data_list/water_data_list_presenter.dart';
import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/usecases/observation_summary_usecase.dart';
import 'package:cmms/domain/usecases/water_data_list_usecase.dart';

import 'package:get/get.dart';

class ObservationSummaryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ObservationSummaryController(
        Get.put(
          ObservationSummaryPresenter(
            ObservationSummaryUseCase(
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
