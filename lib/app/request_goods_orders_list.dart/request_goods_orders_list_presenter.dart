import 'package:cmms/domain/models/request_order_list.model.dart';
import 'package:cmms/domain/usecases/purchase_goods_order_list_usecase.dart';

import '../../domain/models/user_list_model.dart';

class PurchaseGoodsorderListPresenter {
  PurchaseGoodsorderListPresenter(this.purchaseGoodsorderListUsecase);
  PurchaseGoodsorderListUsecase purchaseGoodsorderListUsecase;
  Future<List<UserListModel?>?> getUserList({
    int? facilityId,
    bool? isLoading,
  }) async =>
      await purchaseGoodsorderListUsecase.getUserList(
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );
  deleteFacility(String? id, int? facility_id,
          {required bool isLoading}) async =>
      await purchaseGoodsorderListUsecase.deleteGoodsOrders(
          id: id ?? 0, isLoading: isLoading, facility_id: facility_id);
  Future<List<GetRequestOrderListModel>> getRequestOrderList({
    required bool isLoading,
    bool? isExport,
    required int? facility_id,
    String? start_date,
    required String end_date,
  }) async {
    return purchaseGoodsorderListUsecase.getRequestOrderList(
        isLoading: isLoading,
        facility_id: facility_id,
        start_date: start_date,
        end_date: end_date,
        isExport: isExport);
  }

  void clearValue() async => purchaseGoodsorderListUsecase.clearValue();
  void clearTypeValue() async => purchaseGoodsorderListUsecase.clearTypeValue();
}
