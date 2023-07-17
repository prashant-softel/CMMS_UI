import 'package:cmms/app/inventory_status_list/inventory_status_list_controller.dart';
import 'package:cmms/app/inventory_status_list/inventory_status_list_presenter.dart';
import 'package:get/get.dart';

import '../../domain/usecases/home_usecase.dart';
import '../../domain/usecases/inventory_category_list_usecase.dart';
import '../../domain/usecases/inventory_status_list_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';
import 'inventory_category_list_controller.dart';
import 'inventory_category_list_presenter.dart';


class InventoryCategoryListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => InventoryCategoryListController(
        Get.put(
          InventoryCategoryListPresenter(
            InventoryCategoryListUsecase(
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
