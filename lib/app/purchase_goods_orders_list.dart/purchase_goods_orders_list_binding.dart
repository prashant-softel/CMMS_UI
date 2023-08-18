import 'package:cmms/app/app.dart';
import 'package:cmms/app/purchase_goods_orders_list.dart/purchase_goods_orders_list_controller.dart';
import 'package:cmms/app/purchase_goods_orders_list.dart/purchase_goods_orders_list_presenter.dart';
import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/usecases/stock_management_goods_orders_usecase.dart';

import 'package:get/get.dart';

import '../../domain/usecases/purchase_goods_order_list_usecase.dart';

class PurchaseGoodsorderListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => PurchaseGoodsorderListController(
        Get.put(
          PurchaseGoodsorderListPresenter(
            PurchaseGoodsorderListUsecase(
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
