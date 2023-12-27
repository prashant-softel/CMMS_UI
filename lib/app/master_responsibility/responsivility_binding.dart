import 'package:cmms/app/master_responsibility/responsivility_controller.dart';
import 'package:cmms/app/master_responsibility/responsivility_presenter.dart';
import 'package:get/get.dart';

import '../../domain/usecases/home_usecase.dart';
import '../../domain/usecases/responsibility_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';

class ResponsibilityListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ResponsibilityListController(
        Get.put(
          ResponsibilityListPresenter(
            ResponsibilitylistUsecase(
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
