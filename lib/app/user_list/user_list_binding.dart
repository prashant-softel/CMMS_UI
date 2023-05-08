import 'package:cmms/app/user_list/user_list_controller.dart';
import 'package:cmms/app/user_list/user_list_presenter.dart';
import 'package:get/get.dart';

import '../../domain/usecases/calibration_history_usecase.dart';
import '../../domain/usecases/home_usecase.dart';
import '../../domain/usecases/user_list_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';

class UserListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserListController>(
      () => UserListController(
        UserListPresenter(
          UserListUsecase(
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
