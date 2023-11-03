import 'package:cmms/app/risk_type/risk_type_controller.dart';
import 'package:cmms/app/risk_type/risk_type_presenter.dart';
import 'package:get/get.dart';
import '../../domain/usecases/module_list_usecase.dart';

import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';

class RiskTypeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => RiskTypeController(
        Get.put(
          RiskTypePresenter(
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
