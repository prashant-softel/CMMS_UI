import 'package:cmms/app/create_mrs/create_mrs_controller.dart';
import 'package:cmms/app/create_mrs/create_mrs_presenter.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/home_presenter.dart';
import 'package:cmms/domain/usecases/create_mrs_usecase.dart';
import 'package:cmms/domain/usecases/home_usecase.dart';
import 'package:get/get.dart';

class CreateMrsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => CreateMrsController(
        Get.put(
          CreateMrsPresenter(
            CreateMrsUsecase(
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
