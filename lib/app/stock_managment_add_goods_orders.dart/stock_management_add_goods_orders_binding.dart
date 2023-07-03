import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/home_presenter.dart';
import 'package:cmms/app/stock_managment_add_goods_orders.dart/stock_management_add_goods_orders_controller.dart';
import 'package:cmms/domain/usecases/home_usecase.dart';
import 'package:cmms/domain/usecases/stock_management_add_goods_orders_usecase.dart';
import 'package:get/get.dart';

import 'stock_management_add_goods_orders_presenter.dart';

class StockManagementAddGoodsOrdersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StockManagementAddGoodsOrdersController>(
      () => StockManagementAddGoodsOrdersController(
        StockManagementAddGoodsOrdersPresenter(
          StockManagementAddGoodsOrdersUsecase(
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
