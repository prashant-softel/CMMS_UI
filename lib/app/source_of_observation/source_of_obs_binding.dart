import 'package:cmms/app/preventive_List/preventive_list_controller.dart';
import 'package:cmms/app/preventive_List/preventive_list_presenter.dart';
import 'package:cmms/app/source_of_observation/source_of_obs_controller.dart';
import 'package:cmms/app/source_of_observation/source_of_obs_presenter.dart';
import 'package:cmms/app/type_of_observation/type_of_obs_controller.dart';
import 'package:cmms/app/type_of_observation/type_of_obs_presenter.dart';
import 'package:get/get.dart';
import '../../domain/usecases/module_list_usecase.dart';

import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';

class SourceOfObsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => SourceOfObsController(

        Get.put(
          SourceOfObsPresenter(
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
