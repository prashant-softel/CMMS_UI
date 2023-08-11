import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/home_presenter.dart';
import 'package:cmms/app/receive_goods_order/receive_goods_order_controller.dart';
import 'package:cmms/app/receive_goods_order/receive_goods_order_presenter.dart';
import 'package:cmms/domain/usecases/home_usecase.dart';
import 'package:cmms/domain/usecases/stock_management_receive_goods_orders_usecase.dart';
import 'package:get/get.dart';

class ReceiveGoodsOrdersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ReceiveGoodsOrdersController(
        Get.put(
          ReceiveGoodsOrdersPresenter(
            ReceiveGoodsOrdersUsecase(
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
