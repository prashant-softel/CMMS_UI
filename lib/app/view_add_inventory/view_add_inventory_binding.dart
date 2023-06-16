import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/home_presenter.dart';
import 'package:cmms/app/view_add_inventory/view_add_inventory_controller.dart';
import 'package:cmms/app/view_add_inventory/view_add_inventory_presenter.dart';

import 'package:cmms/domain/usecases/home_usecase.dart';
import 'package:cmms/domain/usecases/view_add_inventory_usecase.dart';
import 'package:get/get.dart';

class ViewAddInventoryBinding extends Bindings {
  @override
  void dependencies() {
    // Get.find<AddInventoryController>();
    Get.lazyPut(
      () => ViewAddInventoryController(
        Get.put(
          ViewAddInventoryPresenter(
            ViewAddInventoryUsecase(
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
