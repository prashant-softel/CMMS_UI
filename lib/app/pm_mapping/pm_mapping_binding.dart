import 'package:cmms/app/pm_mapping/pm_mapping_controller.dart';
import 'package:cmms/app/pm_mapping/pm_mapping_presenter.dart';
import 'package:get/get.dart';

import '../../domain/usecases/home_usecase.dart';
import '../../domain/usecases/pm_mapping_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';

class PmMappingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => PmMappingController(
        Get.put(
          PmMappingPresenter(
            PmMappingUsecase(
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
