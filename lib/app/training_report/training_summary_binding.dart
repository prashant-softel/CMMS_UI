import 'package:cmms/app/app.dart';
import 'package:cmms/app/training_report/training_summary_controller.dart';
import 'package:cmms/app/training_report/training_summary_presenter.dart';
import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/usecases/training_summary_usecase.dart';

import 'package:get/get.dart';

class TrainingSummaryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => TrainingSummaryController(
        Get.put(
          TrainingSummaryPresenter(
            TrainingSummaryUseCase(
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
