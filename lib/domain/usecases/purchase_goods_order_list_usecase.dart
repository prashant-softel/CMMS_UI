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
      await repository.getUserList(facilityId, isLoading, false);
  deleteGoodsOrders(
          {required Object id,
          int? facility_id,
          required bool isLoading}) async =>
      await repository.deleteGoodsOrders(id, isLoading, facility_id);
  Future<List<GetRequestOrderListModel>> getRequestOrderList({
    required bool isLoading,
    bool? isExport,
    required int? facility_id,
    String? start_date,
    required String end_date,
  }) async {
    return repository.getRequestOrderList(
        isLoading: isLoading,
        facility_id: facility_id,
        start_date: start_date,
        end_date: end_date,
        isExport: isExport);
  }

  void clearValue() async => repository.clearData(LocalKeys.roId);
  void clearTypeValue() async => repository.clearData(LocalKeys.roType);
}
