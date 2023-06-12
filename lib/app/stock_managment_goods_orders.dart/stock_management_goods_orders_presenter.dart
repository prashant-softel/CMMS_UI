import 'package:cmms/domain/usecases/stock_management_goods_orders_usecase.dart';

import '../../domain/models/facility_model.dart';
import '../../domain/models/user_list_model.dart';

class StockManagementGoodsOrdersPresenter {
  StockManagementGoodsOrdersPresenter(this.stockManagementGoodsOrdersUsecase);
  StockManagementGoodsOrdersUsecase stockManagementGoodsOrdersUsecase;
  Future<List<UserListModel?>?> getUserList({
    int? facilityId,
    bool? isLoading,
  }) async =>
      await stockManagementGoodsOrdersUsecase.getUserList(
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );
}
