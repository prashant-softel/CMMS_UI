import 'package:cmms/app/change_password/change_password_controller.dart';
import 'package:cmms/app/change_password/change_password_presenter.dart';
import 'package:cmms/domain/usecases/change_password_usecase.dart';
import 'package:get/get.dart';
import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';

class ChangePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChangePasswordController>(
      () => ChangePasswordController(
        ChangePasswordPresenter(
          ChangePasswordUsecase(
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
