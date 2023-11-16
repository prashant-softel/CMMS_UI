import 'package:cmms/app/create_observation/create_observation_controller.dart';
import 'package:cmms/domain/usecases/create_observation_usecase%20copy.dart';
import 'package:get/get.dart';

import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';
import 'create_observation_presenter.dart';

class CreateObservationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateObservationController>(
      () => CreateObservationController(
        CreateObservationPresenter(
          CreateObservationUsecase(
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
