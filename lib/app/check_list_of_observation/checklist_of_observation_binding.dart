import 'package:cmms/app/check_list_of_observation/checklist_of_observation_controller.dart';
import 'package:cmms/app/check_list_of_observation/checklist_of_observation_presenter.dart';
import 'package:cmms/domain/usecases/check_list_of_observation_usecase.dart';
import 'package:get/get.dart';

import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';

class CheckListOfObservationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckListOfObservationController>(
      () => CheckListOfObservationController(
        CheckListOfObservationPresenter(
          CheckListOfObservationUsecase(
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
