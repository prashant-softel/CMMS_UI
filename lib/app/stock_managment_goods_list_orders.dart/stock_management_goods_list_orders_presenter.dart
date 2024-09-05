import 'package:cmms/domain/models/stock_management_update_goods_orders_model.dart';
import 'package:cmms/domain/usecases/stock_management_goods_orders_usecase.dart';

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
  deleteFacility(String? id, int? facility_id,
          {required bool isLoading}) async =>
      await stockManagementGoodsOrdersUsecase.deleteGoodsOrders(
          id: id ?? 0, isLoading: isLoading, facility_id: facility_id);
  Future<List<GoodsOrdersListModel>> getGoodsOrdersList({
    required bool isLoading,
    bool? isExport,
    required int? facility_id,
    String? start_date,
    required String end_date,
  }) async {
    return stockManagementGoodsOrdersUsecase.getGoodsOrdersList(
      isLoading: isLoading,
      facility_id: facility_id,
      isExport: isExport,
      start_date: start_date,
      end_date: end_date,
    );
  }

  void clearValue() async => stockManagementGoodsOrdersUsecase.clearValue();
  void clearTypeValue() async =>
      stockManagementGoodsOrdersUsecase.clearTypeValue();
}
