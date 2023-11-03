import 'package:cmms/app/type_of_observation/type_of_obs_controller.dart';
import 'package:cmms/app/type_of_observation/type_of_obs_presenter.dart';
import 'package:get/get.dart';
import '../../domain/usecases/module_list_usecase.dart';

import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';

class TypeOfObsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => TypeOfObsController(
        Get.put(
          TypeOfObsPresenter(
            ModulelistUsecase(
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
