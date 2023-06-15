import 'package:get/get.dart';
import '../home/home_controller.dart';
import 'stock_management_update_goods_orders_details_presenter.dart';

class StockManagementUpdateGoodsOrdersDetailsController extends GetxController {
  ///
  StockManagementUpdateGoodsOrdersDetailsController(
    this.stockManagementUpdateGoodsOrdersDetailsPresenter,
  );
  StockManagementUpdateGoodsOrdersDetailsPresenter
      stockManagementUpdateGoodsOrdersDetailsPresenter;
  final HomeController homecontroller = Get.find();

  ///
  @override
  void onInit() async {
    super.onInit();
  }
}
