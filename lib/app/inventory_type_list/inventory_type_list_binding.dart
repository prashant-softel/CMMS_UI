import 'package:cmms/app/inventory_type_list/inventory_type_list_controller.dart';
import 'package:cmms/app/inventory_type_list/inventory_type_list_presenter.dart';
import 'package:get/get.dart';

import '../../domain/usecases/home_usecase.dart';
import '../../domain/usecases/inventory_type_list_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';

class InventoryTypeListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => InventoryTypeListController(
        Get.put(
          InventoryTypeListPresenter(
            InventoryTypeListUsecase(
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
