import 'package:cmms/app/app.dart';
import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/usecases/stock_management_goods_orders_usecase.dart';

import 'package:get/get.dart';

import 'stock_management_goods_orders_controller.dart';
import 'stock_management_goods_orders_presenter.dart';

class StockManagementGoodsOrdersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => StockManagementGoodsOrdersController(
        Get.put(
          StockManagementGoodsOrdersPresenter(
            StockManagementGoodsOrdersUsecase(
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
