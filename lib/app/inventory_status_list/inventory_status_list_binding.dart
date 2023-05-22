import 'package:cmms/app/inventory_status_list/inventory_status_list_controller.dart';
import 'package:cmms/app/inventory_status_list/inventory_status_list_presenter.dart';
import 'package:get/get.dart';

import '../../domain/usecases/home_usecase.dart';
import '../../domain/usecases/inventory_status_list_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';

class InventoryStatusListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => InventoryStatusListController(
        Get.put(
          InventoryStatusListPresenter(
            InventoryStatusListUsecase(
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
