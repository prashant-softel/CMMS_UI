import 'package:cmms/app/purchase_goods_orders_view/purchase_goods_orders_view_presenter.dart';
import 'package:cmms/app/return_mrs/return_mrs_presenter.dart';
import 'package:get/get.dart';

class PurchaseGoodsorderViewController extends GetxController {
  ///
  PurchaseGoodsorderViewController(
    this.purchaseGoodsorderViewPresenter,
  );
  PurchaseGoodsorderViewPresenter purchaseGoodsorderViewPresenter;

  @override
  void onInit() async {
    super.onInit();
  }
}
