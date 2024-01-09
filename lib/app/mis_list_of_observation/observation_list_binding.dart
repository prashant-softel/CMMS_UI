import 'package:cmms/app/mis_list_of_observation/observation_list_controller.dart';
import 'package:cmms/domain/usecases/observation_list_usecase.dart';
import 'package:get/get.dart';

import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';
import 'observation_list_presenter.dart';

class ObservationListBinding extends Bindings {
  @override
  void dependencies() {
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
    Get.lazyPut(
      () => ObservationListController(
        Get.put(
          ObservationListPresenter(
            Get.put(ObservationListUsecase(Get.find())),
          ),
          permanent: true,
        ),
      ),
      // permanent: true,
    );
  }
}
