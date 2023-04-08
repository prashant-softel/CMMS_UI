import 'package:cmms/domain/usecases/preventive_usecase.dart';
import 'package:get/get.dart';

import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';
import 'preventive_maintenance_controller.dart';
import 'preventive_maintenance_presenter.dart';

class PreventiveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => PreventiveController(
        Get.put(
          PreventivePresenter(
            PreventiveUsecase(
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
