import 'package:cmms/domain/models/currency_list_model.dart';
import 'package:cmms/domain/models/get_asset_data_list_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/req_order_details_by_id_model.dart';

import 'package:cmms/domain/usecases/stock_managment_goods_order_req_details_usecase.dart';

class GoodsOrdersReqDetailPresenter {
  GoodsOrdersReqDetailPresenter(this.goodsOrdersReqDetailUsecase);
  GoodsOrdersReqDetailUsecase goodsOrdersReqDetailUsecase;
  Future<List<GetAssetDataModel?>?> getAssetList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await goodsOrdersReqDetailUsecase.getAssetList(
        auth: auth ?? "",
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );
  Future<List<CurrencyListModel>> getUnitCurrencyList({
    required bool isLoading,
    required int? facilityId,
  }) async {
    return goodsOrdersReqDetailUsecase.getUnitCurrencyList(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }

  Future<List<GetRODetailsByIDModel?>?> getRoDetailsByID(
      {bool? isLoading,
      required int requestID,
      required int facilityId}) async {
    return goodsOrdersReqDetailUsecase.getRoDetailsByID(
      requestID: requestID,
      facilityId: facilityId,
      isLoading: isLoading ?? false,
    );
  }

 
  Future<Map<String, dynamic>?> submitPurchaseOrderData({
    createGoReq,
    required bool isLoading,
  }) async {
    return goodsOrdersReqDetailUsecase.submitPurchaseOrderData(
      createGoReq: createGoReq,
      isLoading: isLoading,
    );
  }

  Future<Map<String, dynamic>?> updatePurchaseOrderData({
    createGoReq,
    required bool isLoading,
  }) async {
    return goodsOrdersReqDetailUsecase.updatePurchaseOrderData(
      createGoReq: createGoReq,
      isLoading: isLoading,
    );
  }

  void saveValue({String? roId}) async {
    return goodsOrdersReqDetailUsecase.saveValue(roId: roId);
  }

  Future<String?> getValue() async =>
      await goodsOrdersReqDetailUsecase.getValue();
}
