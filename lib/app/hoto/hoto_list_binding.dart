import 'package:cmms/app/app.dart';
import 'package:cmms/app/hoto/hoto_list_controller.dart';
import 'package:cmms/app/hoto/hoto_list_presenter.dart';
import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/usecases/hoto_list_screen_usecase.dart';

import 'package:get/get.dart';

class HotoListScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HotoListScreenController(
        Get.put(
          HotoListScreenPresenter(
            HotoListScreenUsecase(
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
