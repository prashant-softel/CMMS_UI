import 'package:get/get.dart';
import '../../domain/usecases/body_injured_usecase.dart';
import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';
import 'body_injured_controller.dart';
import 'body_injured_presenter.dart';

class BodyInjuredBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => BodyInjuredController(
        Get.put(
          BodyInjuredPresenter(
            BodyInjuredUsecase(
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
