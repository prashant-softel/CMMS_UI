import 'package:cmms/app/preventive_List/preventive_list_controller.dart';
import 'package:cmms/app/preventive_List/preventive_list_presenter.dart';
import 'package:get/get.dart';
import '../../domain/usecases/module_list_usecase.dart';

import '../../domain/usecases/home_usecase.dart';
import '../../domain/usecases/role_list_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';
import 'role_list_controller.dart';
import 'role_list_presenter.dart';

class RoleListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => RoleListController(
        Get.put(
          RoleListPresenter(
            RolelistUsecase(
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
