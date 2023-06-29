import 'package:cmms/app/role_access/rele_access_controller.dart';
import 'package:cmms/app/role_access/role_access_presenter.dart';
import 'package:get/get.dart';

import '../../domain/usecases/home_usecase.dart';
import '../../domain/usecases/role_access_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';

class RoleAccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => RoleAccessController(
        Get.put(
          RoleAccessPresenter(
            RoleAccessUsecase(
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
