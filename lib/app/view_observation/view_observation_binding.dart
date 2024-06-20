import 'package:cmms/app/view_observation/view_observation_controller.dart';
import 'package:cmms/domain/usecases/view_observation_usecase.dart';
import 'package:get/get.dart';

import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';
import 'view_observation_presenter.dart';

class ViewObservationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViewObservationController>(
      () => ViewObservationController(
        ViewObservationPresenter(
          ViewObservationUsecase(
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
