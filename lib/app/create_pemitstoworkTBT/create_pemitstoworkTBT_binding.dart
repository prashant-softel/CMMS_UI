

import 'package:cmms/app/create_pemitstoworkTBT/create_pemitstoworkTBT_controller.dart';
import 'package:cmms/app/create_pemitstoworkTBT/create_pemitstoworkTBT_presenter.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/home_presenter.dart';
import 'package:cmms/domain/usecases/create_permittoworkTBT_usecase.dart';
import 'package:cmms/domain/usecases/home_usecase.dart';
import 'package:get/get.dart';

class PermitsTBTBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreatePemitstoworkTBTController>(
      () => CreatePemitstoworkTBTController(
        CreatePemitstoworkTBTPresenter(
          CreatePermittoworkTBTUsecase(
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
