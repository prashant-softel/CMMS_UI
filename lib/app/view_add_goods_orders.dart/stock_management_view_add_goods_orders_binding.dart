import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/home_presenter.dart';
import 'package:cmms/app/view_add_goods_orders.dart/stock_management_view_add_goods_orders_controller.dart';
import 'package:cmms/app/view_add_goods_orders.dart/stock_management_view_add_goods_orders_presenter.dart';

import 'package:cmms/domain/usecases/home_usecase.dart';
import 'package:cmms/domain/usecases/stock_management_view_add_goods_orders_usecase.dart';

import 'package:get/get.dart';

class ViewAddGoodsOrdersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViewAddGoodsOrdersController>(
      () => ViewAddGoodsOrdersController(
        ViewAddGoodsOrdersPresenter(
          ViewAddGoodsOrdersUsecase(
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
