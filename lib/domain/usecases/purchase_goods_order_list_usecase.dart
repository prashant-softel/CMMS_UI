import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/request_order_list.model.dart';
import 'package:cmms/domain/models/user_list_model.dart';

class PurchaseGoodsorderListUsecase {
  Repository repository;

  PurchaseGoodsorderListUsecase(this.repository);

  Future<List<UserListModel?>?> getUserList({
    int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getUserList(
        facilityId,
        isLoading,
      );
  deleteGoodsOrders({required Object id, required bool isLoading}) async =>
      await repository.deleteGoodsOrders(
        id,
        isLoading,
      );
  Future<List<GetRequestOrderListModel>> getRequestOrderList({
    required bool isLoading,
    required int? facility_id,
    String? start_date,
    required String end_date,
  }) async {
    return repository.getRequestOrderList(
      isLoading: isLoading,
      facility_id: facility_id,
      start_date: start_date,
      end_date: end_date,
    );
  }
}
