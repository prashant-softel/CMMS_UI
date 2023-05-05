import 'package:get/get.dart';

import '../../domain/import_inventory_usecase.dart';
import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';
import 'import_inventory_controller.dart';
import 'import_inventory_presenter.dart';

class ImportInventoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ImportInventoryController>(
      () => ImportInventoryController(
        ImportInventoryPresenter(
          ImportInventoryUsecase(
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
