import 'package:cmms/domain/usecases/stock_management_update_goods_orders_details_usecase.dart';
import 'package:get/get.dart';

import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';
import 'stock_management_update_goods_orders_details_controller.dart';
import 'stock_management_update_goods_orders_details_presenter.dart';

class StockManagementGoodsOrdersDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StockManagementUpdateGoodsOrdersDetailsController>(
      () => StockManagementUpdateGoodsOrdersDetailsController(
        StockManagementUpdateGoodsOrdersDetailsPresenter(
          StockManagementUpdateGoodsOrdersDetailsUsecase(
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
