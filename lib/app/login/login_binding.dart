import 'package:get/get.dart';

import '../../domain/usecases/login_usecase.dart';
import 'login_controller.dart';
import 'login_presenter.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(
        LoginPresenter(
          LoginUsecase(
            Get.find(),
          ),
        ),
      ),
    );
  }
}
