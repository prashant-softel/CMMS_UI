import 'package:cmms/app/app.dart';
import 'package:cmms/app/view_request_orders/request_goods_orders_view_controller.dart';
import 'package:cmms/app/view_request_orders/request_goods_orders_view_presenter.dart';
import 'package:cmms/domain/domain.dart';

import 'package:get/get.dart';

import '../../domain/usecases/purchase_goods_order_view_usecase.dart';

class PurchaseGoodsorderViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => PurchaseGoodsorderViewController(
        Get.put(
          PurchaseGoodsorderViewPresenter(
            PurchaseGoodsorderViewUsecase(
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
