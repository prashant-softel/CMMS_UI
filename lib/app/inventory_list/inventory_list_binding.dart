import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/home_presenter.dart';
import 'package:cmms/app/inventory_list/inventory_list_controller.dart';
import 'package:cmms/app/inventory_list/inventory_list_presenter.dart';
import 'package:cmms/domain/usecases/home_usecase.dart';
import 'package:cmms/domain/usecases/inventory_list_usecase.dart';
import 'package:get/get.dart';

class InventoryListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => InventoryListController(
        Get.put(
          InventoryListPresenter(
            InventoryListUsecase(
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
