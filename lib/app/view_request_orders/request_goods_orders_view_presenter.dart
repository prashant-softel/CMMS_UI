import 'package:cmms/domain/models/currency_list_model.dart';
import 'package:cmms/domain/models/get_asset_data_list_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/req_order_details_by_id_model.dart';

import '../../domain/usecases/purchase_goods_order_view_usecase.dart';

class PurchaseGoodsorderViewPresenter {
  PurchaseGoodsorderViewPresenter(this.purchaseGoodsorderViewUsecase);
  PurchaseGoodsorderViewUsecase purchaseGoodsorderViewUsecase;
  Future<List<GetRODetailsByIDModel?>?> getRoDetailsByID(
      {bool? isLoading,
      required int requestID,
      required int facilityId}) async {
    return purchaseGoodsorderViewUsecase.getRoDetailsByID(
      requestID: requestID,
      facilityId: facilityId,
      isLoading: isLoading ?? false,
    );
  }

  Future<List<HistoryModel>?> getHistory(
    moduleType,
    id,
    facilityId,
    isLoading,
  ) async =>
      await purchaseGoodsorderViewUsecase.getHistory(
        moduleType: moduleType,
        id: id,
          facilityId: facilityId,
        isLoading: isLoading,
      );
  Future<List<CurrencyListModel>> getUnitCurrencyList({
    required bool isLoading,
    required int? facilityId,
  }) async {
    return purchaseGoodsorderViewUsecase.getUnitCurrencyList(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }

  Future<List<GetAssetDataModel?>?> getAssetList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await purchaseGoodsorderViewUsecase.getAssetList(
        auth: auth ?? "",
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );
  Future<Map<String, dynamic>?> approveGoodsOrder({
    goodsOrderApproveJsonString,
    required bool isLoading,
  }) async {
    return purchaseGoodsorderViewUsecase.approveGoodsOrder(
      goodsOrderApproveJsonString: goodsOrderApproveJsonString,
      isLoading: isLoading,
    );
  }
  // Future<bool> approveGoodsOrder({
  //   approvetoJsonString,
  //   required bool isLoading,
  // }) async {
  //   return purchaseGoodsorderViewUsecase.approveGoodsOrder(
  //     approvetoJsonString: approvetoJsonString,
  //     isLoading: isLoading,
  //   );
  // }

  // Future<bool> rejectGoodsOrder({
  //   rejecttoJsonString,
  //   required bool isLoading,
  // }) async {
  //   return purchaseGoodsorderViewUsecase.rejectGoodsOrder(
  //     rejecttoJsonString: rejecttoJsonString,
  //     isLoading: isLoading,
  //   );
  // }
  Future<Map<String, dynamic>?> rejectGoodsOrder({
    goodsOrderRejectJsonString,
    required bool isLoading,
  }) async {
    return purchaseGoodsorderViewUsecase.rejectGoodsOrder(
      goodsOrderRejectJsonString: goodsOrderRejectJsonString,
      isLoading: isLoading,
    );
  }

  void saveValue({String? roId}) async {
    return purchaseGoodsorderViewUsecase.saveValue(roId: roId);
  }

  Future<String?> getValue() async =>
      await purchaseGoodsorderViewUsecase.getValue();
}
