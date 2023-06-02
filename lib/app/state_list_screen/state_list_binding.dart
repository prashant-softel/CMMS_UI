import 'package:cmms/app/pm_schedule/pm_schedule_controller.dart';
import 'package:cmms/app/pm_schedule/pm_schedule_presenter.dart';
import 'package:cmms/app/state_list_screen/state_list_controller.dart';
import 'package:cmms/app/state_list_screen/state_list_presenter.dart';
import 'package:get/get.dart';
import '../../../domain/usecases/state_list_usecase.dart';
import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';

class StateListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => StateListController(
        Get.put(
          StateListPresenter(
            StatelistUsecase(
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
