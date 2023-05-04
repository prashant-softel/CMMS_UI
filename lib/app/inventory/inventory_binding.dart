import 'package:get/get.dart';

import '../../domain/usecases/home_usecase.dart';
import '../../domain/usecases/inventory_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';
import 'inventory_controller.dart';
import 'inventory_presenter.dart';

class InventoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => InventoryController(
        Get.put(
          InventoryPresenter(
            InventoryUsecase(
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
