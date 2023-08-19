import 'package:cmms/domain/models/get_return_mrs_list.dart';

import '../../domain/usecases/purchase_goods_order_view_usecase.dart';
import '../../domain/usecases/return_mrs_usecase.dart';

class PurchaseGoodsorderViewPresenter {
  PurchaseGoodsorderViewPresenter(this.purchaseGoodsorderViewUsecase);
  PurchaseGoodsorderViewUsecase purchaseGoodsorderViewUsecase;
}
